import 'dart:async';
import 'dart:io';
import 'package:aeyrium_sensor/aeyrium_sensor.dart';
import 'package:bloc/bloc.dart';
import 'package:camera/camera.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_native_image/flutter_native_image.dart';
import 'package:get/get.dart';
import 'package:abs_customer_sites/application/core/utils/utils.dart';
import 'package:abs_customer_sites/application/dealership_panel/camera_view/camera_mode.dart';
import 'package:abs_customer_sites/application/dealership_panel/camera_view/flash_state.dart';
import 'package:abs_customer_sites/application/dealership_panel/camera_view/video_recording_state.dart';
import 'package:abs_customer_sites/application/services/ticker.dart';
import 'package:meta/meta.dart';

import 'package:video_player/video_player.dart';

part 'camera_view_event.dart';
part 'camera_view_state.dart';

class CameraViewBloc extends Bloc<CameraViewEvent, CameraViewState> {
  final Ticker ticker;
  StreamSubscription _orientationSubscribtion;
  StreamSubscription _tickerSubscription;
  CameraController _cameraController;
  bool _isLandscape;
  CameraViewBloc({@required this.ticker}) : super(CameraViewInitial()) {
    _isLandscape = false;
    _orientationSubscribtion = AeyriumSensor.sensorEvents.listen(
      (event) {
        if (event.roll.toInt() == 1 || event.roll.toInt() == -1) {
          if (_isLandscape) {
            _isLandscape = false;
            add(CameraViewOrientationChanged(
                orientation: Orientation.portrait));
          }
        } else {
          if (!_isLandscape) {
            _isLandscape = true;
            add(CameraViewOrientationChanged(
                orientation: Orientation.landscape));
          }
        }
      },
    );
  }

  @override
  Stream<CameraViewState> mapEventToState(
    CameraViewEvent event,
  ) async* {
    if (event is CameraViewInitialized) {
      List<CameraDescription> cameras = await _getAvailableCamera();
      _cameraController = CameraController(cameras[0], ResolutionPreset.high,
          imageFormatGroup: ImageFormatGroup.jpeg, enableAudio: false);

      await _cameraController.initialize();
      await _cameraController
          .lockCaptureOrientation(DeviceOrientation.landscapeRight);

      yield CameraViewLivePreview(
        cameraController: _cameraController,
        cameraMode: CameraMode.picture,
        isFlashModeSelectorOpen: false,
        flashState: FlashState.auto,
        orientation:
            _isLandscape ? Orientation.landscape : Orientation.portrait,
      );
    } else if (event is CameraViewTogglePressed) {
      if (state is CameraViewLivePreview) {
        final currentState = state as CameraViewLivePreview;
        // if (event.cameraMode == CameraMode.video) {
        //   _cameraController.prepareForVideoRecording();
        // }
        yield currentState.copyWith(cameraMode: event.cameraMode);
      }
    } else if (event is CameraViewTakePicturePressed) {
      yield CameraViewLoading();
      XFile image = await _takePicture();
      if (image != null) {
        File compressedFile =
            await FlutterNativeImage.compressImage(image.path, quality: 85);
        File file = await moveFileToAppDir(
          compressedFile,
        );
        yield CameraPictureView(imageFile: file);
      }
    } else if (event is CameraViewImageDiscarded) {
      final currentState = state as CameraPictureView;
      await currentState.imageFile.delete();
      yield CameraViewLivePreview(
        cameraController: _cameraController,
        cameraMode: CameraMode.picture,
        isFlashModeSelectorOpen: false,
        flashState: FlashState.auto,
        orientation:
            _isLandscape ? Orientation.landscape : Orientation.portrait,
      );
    } else if (event is CameraViewImageAccepted) {
      final currentState = state as CameraPictureView;
      await SystemChrome.setPreferredOrientations(
        [
          DeviceOrientation.portraitUp,
        ],
      );
      Get.back(result: currentState.imageFile);
    } else if (event is CameraViewFlashButtonPressed) {
      final currentState = state as CameraViewLivePreview;
      yield currentState.copyWith(
          isFlashModeSelectorOpen: !currentState.isFlashModeSelectorOpen);
    } else if (event is CameraViewFlashStateChanged) {
      final currentState = state as CameraViewLivePreview;
      await _cameraController.setFlashMode(event.flashState.toFlashMode());

      yield currentState.copyWith(
        flashState: event.flashState,
        isFlashModeSelectorOpen: false,
      );
    } else if (event is CameraViewOrientationChanged) {
      if (state is CameraViewLivePreview) {
        final currentState = state as CameraViewLivePreview;
        yield currentState.copyWith(orientation: event.orientation);
      }
    } else if (event is CameraViewStartedVideoRecording) {
      await _cameraController?.startVideoRecording();
      await _tickerSubscription?.cancel();
      _tickerSubscription = ticker.tick(ticks: 0).listen((durationInSeconds) {
        add(
          CameraViewTickedVideoRecording(
            duration: Duration(seconds: durationInSeconds),
          ),
        );
      });
      yield CameraViewIsRecording(
        cameraController: _cameraController,
        videoRecordingState: VideoRecordingState.started,
        elapsedTime: Duration(),
      );
    } else if (event is CameraViewTickedVideoRecording) {
      if (state is CameraViewIsRecording) {
        final currentState = state as CameraViewIsRecording;
        if (event.duration.inSeconds <= 59) {
          yield currentState.copyWith(elapsedTime: event.duration);
        } else {
          add(CameraViewStoppedVideoRecording());
        }
      }
    } else if (event is CameraViewStoppedVideoRecording) {
      XFile xFile = await _cameraController.stopVideoRecording();
      await _tickerSubscription?.cancel();
      if (xFile != null) {
        File video = File(xFile.path);
        File file = await moveFileToAppDir(video);
        yield CameraVideoPlayBack(
          videoPlayerController: VideoPlayerController.file(video),
          file: file,
        );
      }
    } else if (event is CameraViewPausedVideoRecording) {
      final currentState = state as CameraViewIsRecording;
      await _cameraController.pauseVideoRecording();
      _tickerSubscription?.pause();
      yield currentState.copyWith(
        videoRecordingState: VideoRecordingState.paused,
      );
    } else if (event is CameraViewResumedVideoRecording) {
      final currentState = state as CameraViewIsRecording;
      await _cameraController.resumeVideoRecording();
      _tickerSubscription?.resume();
      yield currentState.copyWith(
        videoRecordingState: VideoRecordingState.resumed,
      );
    } else if (event is CameraViewVideoAccepted) {
      await SystemChrome.setPreferredOrientations(
        [
          DeviceOrientation.portraitUp,
        ],
      );
      final currentState = state as CameraVideoPlayBack;
      Get.back(result: currentState.file);
    } else if (event is CameraViewVideoDiscarded) {
      final currentState = state as CameraVideoPlayBack;
      await currentState.file.delete();
      yield CameraViewLivePreview(
        cameraController: _cameraController,
        cameraMode: CameraMode.video,
        isFlashModeSelectorOpen: false,
        flashState: FlashState.auto,
        orientation:
            _isLandscape ? Orientation.landscape : Orientation.portrait,
      );
    }
  }

  Future<XFile> _takePicture() async {
    if (_cameraController == null || !_cameraController.value.isInitialized) {
      return null;
    }
    if (_cameraController.value.isTakingPicture) {
      return null;
    }
    XFile file = await _cameraController.takePicture();
    return file;
  }

  Future<List<CameraDescription>> _getAvailableCamera() async {
    return await availableCameras();
  }

  @override
  Future<void> close() {
    _cameraController?.dispose();
    _orientationSubscribtion?.cancel();
    _tickerSubscription?.cancel();
    _cameraController?.dispose();
    return super.close();
  }
}

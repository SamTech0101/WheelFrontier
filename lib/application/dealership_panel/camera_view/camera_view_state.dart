part of 'camera_view_bloc.dart';

@immutable
abstract class CameraViewState {}

class CameraViewInitial extends CameraViewState {}

class CameraViewLivePreview extends CameraViewState {
  final CameraController cameraController;
  final CameraMode cameraMode;
  final bool isFlashModeSelectorOpen;
  final FlashState flashState;
  final Orientation orientation;
  CameraViewLivePreview({
    @required this.cameraController,
    @required this.cameraMode,
    @required this.isFlashModeSelectorOpen,
    @required this.flashState,
    @required this.orientation,
  });

  CameraViewLivePreview copyWith({
    CameraController cameraController,
    CameraMode cameraMode,
    bool isFlashModeSelectorOpen,
    FlashState flashState,
    Orientation orientation,
  }) {
    return CameraViewLivePreview(
      cameraController: cameraController ?? this.cameraController,
      cameraMode: cameraMode ?? this.cameraMode,
      isFlashModeSelectorOpen:
          isFlashModeSelectorOpen ?? this.isFlashModeSelectorOpen,
      flashState: flashState ?? this.flashState,
      orientation: orientation ?? this.orientation,
    );
  }
}

class CameraViewIsRecording extends CameraViewState {
  final CameraController cameraController;
  final VideoRecordingState videoRecordingState;
  final Duration elapsedTime;

  CameraViewIsRecording({
    @required this.cameraController,
    @required this.videoRecordingState,
    @required this.elapsedTime,
  });

  CameraViewIsRecording copyWith({
    CameraController cameraController,
    VideoRecordingState videoRecordingState,
    Duration elapsedTime,
  }) {
    return CameraViewIsRecording(
      cameraController: cameraController ?? this.cameraController,
      videoRecordingState: videoRecordingState ?? this.videoRecordingState,
      elapsedTime: elapsedTime ?? this.elapsedTime,
    );
  }
}

class CameraViewLoading extends CameraViewState {}

class CameraPictureView extends CameraViewState {
  final File imageFile;
  CameraPictureView({@required this.imageFile});
}

class CameraVideoPlayBack extends CameraViewState {
  final VideoPlayerController videoPlayerController;
  final File file;

  CameraVideoPlayBack({
    @required this.videoPlayerController,
    @required this.file,
  });
}

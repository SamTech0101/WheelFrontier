import 'dart:math';
import 'package:better_player/better_player.dart';
import 'package:camera/camera.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:abs_customer_sites/application/dealership_panel/camera_view/camera_mode.dart';
import 'package:abs_customer_sites/application/dealership_panel/camera_view/camera_view_bloc.dart';
import 'package:abs_customer_sites/application/dealership_panel/camera_view/video_recording_state.dart';
import 'package:abs_customer_sites/core/service_locator.dart';
import 'package:abs_customer_sites/presentation/dealership_panel/camera_view/widgets/flash_mode_selector.dart';
import 'package:abs_customer_sites/presentation/dealership_panel/camera_view/widgets/media_accept_button.dart';
import 'package:abs_customer_sites/presentation/dealership_panel/camera_view/widgets/media_discard_button.dart';
import 'package:abs_customer_sites/presentation/dealership_panel/camera_view/widgets/record_video_button.dart';
import 'package:abs_customer_sites/presentation/dealership_panel/camera_view/widgets/recording_elapsed_time.dart';
import 'package:abs_customer_sites/presentation/dealership_panel/camera_view/widgets/take_picture_button.dart';

class CameraView extends StatefulWidget {
  final CameraMode cameraMode;

  CameraView({@required this.cameraMode});

  @override
  _CameraViewState createState() => _CameraViewState();
}

class _CameraViewState extends State<CameraView> {
  @override
  void initState() {
    super.initState();
    SystemChrome.setPreferredOrientations(
      [
        DeviceOrientation.landscapeLeft,
      ],
    );
  }

  Future<bool> _willPopCallback() async {
    await SystemChrome.setPreferredOrientations(
      [DeviceOrientation.portraitUp],
    );
    return true;
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final camerMode = widget.cameraMode;
    return WillPopScope(
      onWillPop: () => _willPopCallback(),
      child: BlocProvider(
        create: (context) =>
            getIt<CameraViewBloc>()..add(CameraViewInitialized()),
        child: Scaffold(
          backgroundColor: Colors.black,
          body: BlocBuilder<CameraViewBloc, CameraViewState>(
            builder: (context, state) {
              Widget widget;
              if (state is CameraViewInitial) {
                widget = Container();
              } else if (state is CameraViewLivePreview) {
                widget = Stack(
                  children: [
                    Container(
                      child: Transform.scale(
                        scale: size.aspectRatio /
                            state.cameraController.value.aspectRatio,
                        child: Center(
                          child: AspectRatio(
                            aspectRatio:
                                state.cameraController.value.aspectRatio,
                            child: CameraPreview(state.cameraController),
                          ),
                        ),
                      ),
                    ),
                    state.orientation == Orientation.landscape
                        ? Align(
                            alignment: Alignment.center,
                            child: Opacity(
                              opacity: 0.25,
                              child: Image.asset(
                                'assets/car-preview.png',
                                width: MediaQuery.of(context).size.width,
                                height: MediaQuery.of(context).size.height,
                              ),
                            ),
                          )
                        : Container(),
                    Positioned(
                      right: MediaQuery.of(context).size.width / 10,
                      bottom: MediaQuery.of(context).size.height / 2 - 35,
                      child: camerMode == CameraMode.picture
                          ? TakePictureButton()
                          : RecordVideoButton(),
                    ),
                    Positioned(
                      left: MediaQuery.of(context).size.width / 12,
                      bottom: MediaQuery.of(context).size.height / 2 - 35,
                      child: Transform.rotate(
                        angle: -pi / 2,
                        child: GestureDetector(
                          onTap: () {
                            context.read<CameraViewBloc>().add(
                                  CameraViewFlashButtonPressed(),
                                );
                          },
                          child: Container(
                            width: 60,
                            height: 60,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(60),
                              color: Colors.white38,
                            ),
                            child: Icon(state.flashState.modeIconData()),
                          ),
                        ),
                      ),
                    ),
                    state.isFlashModeSelectorOpen
                        ? Positioned(
                            left: MediaQuery.of(context).size.width / 12 - 20,
                            bottom: MediaQuery.of(context).size.height / 2 - 35,
                            child: Transform.rotate(
                              angle: -pi / 2,
                              child: FlashModeSelector(
                                currentFlashState: state.flashState,
                              ),
                            ),
                          )
                        : Container(),
                    state.orientation == Orientation.portrait
                        ? Positioned(
                            right: MediaQuery.of(context).size.width / 15,
                            bottom: MediaQuery.of(context).size.height / 2 - 35,
                            child: Transform.rotate(
                              angle: -pi / 2,
                              child: Center(
                                child: Container(
                                  height: 50,
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(60),
                                    color: Colors.white38,
                                  ),
                                  child: Padding(
                                    padding: EdgeInsets.only(
                                        top: 8, bottom: 8, left: 15, right: 15),
                                    child: Center(
                                      child: Text(
                                        'Device should be in landscape mode',
                                        style: TextStyle(fontSize: 17),
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          )
                        : Container(),
                  ],
                );
              } else if (state is CameraPictureView) {
                widget = Center(
                  child: Stack(
                    children: [
                      Image.file(
                        state.imageFile,
                        width: MediaQuery.of(context).size.width,
                        height: MediaQuery.of(context).size.height,
                      ),
                      Align(
                        alignment: Alignment.topLeft,
                        child: Padding(
                          padding: const EdgeInsets.only(top: 40, left: 75),
                          child: MediaDiscardButton(
                            onPressed: () {
                              context.read<CameraViewBloc>().add(
                                    CameraViewImageDiscarded(),
                                  );
                            },
                          ),
                        ),
                      ),
                      Align(
                        alignment: Alignment.topRight,
                        child: Padding(
                          padding: const EdgeInsets.only(right: 75, top: 40),
                          child: Transform.rotate(
                            angle: -pi / 2,
                            child: MediaAcceptButton(
                              onPressed: () {
                                context.read<CameraViewBloc>().add(
                                      CameraViewImageAccepted(),
                                    );
                              },
                            ),
                          ),
                        ),
                      )
                    ],
                  ),
                );
              } else if (state is CameraViewIsRecording) {
                widget = Stack(
                  children: [
                    Container(
                      child: Transform.scale(
                        scale: size.aspectRatio /
                            state.cameraController.value.aspectRatio,
                        child: Center(
                          child: AspectRatio(
                            aspectRatio:
                                state.cameraController.value.aspectRatio,
                            child: CameraPreview(state.cameraController),
                          ),
                        ),
                      ),
                    ),
                    Positioned(
                      right: MediaQuery.of(context).size.width / 10,
                      bottom: MediaQuery.of(context).size.height / 2 - 35,
                      child: GestureDetector(
                        onTap: () {
                          context
                              .read<CameraViewBloc>()
                              .add(CameraViewStoppedVideoRecording());
                        },
                        child: Container(
                          width: 70,
                          height: 70,
                          decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            color: Colors.white38,
                          ),
                          child: Center(
                            child: Icon(
                              Icons.stop,
                              color: Colors.red,
                              size: 40,
                            ),
                          ),
                        ),
                      ),
                    ),
                    Positioned(
                      left: MediaQuery.of(context).size.width / 15 - 20,
                      bottom: MediaQuery.of(context).size.height / 2 - 35,
                      child: Transform.rotate(
                        angle: -pi / 2,
                        child: RecordingElapsedTime(
                          elapsedTime: state.elapsedTime,
                        ),
                      ),
                    ),
                    Positioned(
                      right: MediaQuery.of(context).size.width / 10,
                      bottom: MediaQuery.of(context).size.height / 5 - 20,
                      child: GestureDetector(
                        onTap: () {
                          if (state.videoRecordingState ==
                              VideoRecordingState.resumed) {
                            context
                                .read<CameraViewBloc>()
                                .add(CameraViewPausedVideoRecording());
                          } else {
                            context
                                .read<CameraViewBloc>()
                                .add(CameraViewResumedVideoRecording());
                          }
                        },
                        child: Container(
                          width: 70,
                          height: 70,
                          decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            color: Colors.white38,
                          ),
                          child: Center(
                            child: Icon(
                              state.videoRecordingState.stateIconData(),
                              color: Colors.white,
                              size: 40,
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                );
              } else if (state is CameraVideoPlayBack) {
                widget = Stack(
                  children: [
                    BetterPlayer.file(
                      state.file.path,
                      betterPlayerConfiguration: BetterPlayerConfiguration(
                        deviceOrientationsOnFullScreen: [
                          DeviceOrientation.landscapeLeft,
                        ],
                        fit: BoxFit.cover,
                      ),
                    ),
                    Align(
                      alignment: Alignment.topLeft,
                      child: Padding(
                        padding: const EdgeInsets.only(top: 40, left: 75),
                        child: MediaDiscardButton(
                          onPressed: () {
                            context.read<CameraViewBloc>().add(
                                  CameraViewVideoDiscarded(),
                                );
                          },
                        ),
                      ),
                    ),
                    Align(
                      alignment: Alignment.topRight,
                      child: Padding(
                        padding: const EdgeInsets.only(right: 75, top: 40),
                        child: Transform.rotate(
                          angle: -pi / 2,
                          child: MediaAcceptButton(
                            onPressed: () {
                              context.read<CameraViewBloc>().add(
                                    CameraViewVideoAccepted(),
                                  );
                            },
                          ),
                        ),
                      ),
                    )
                  ],
                );
              } else if (state is CameraViewLoading) {
                widget = Center(
                  child: CircularProgressIndicator(),
                );
              }
              return widget;
            },
          ),
        ),
      ),
    );
  }
}

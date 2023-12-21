part of 'camera_view_bloc.dart';

@immutable
abstract class CameraViewEvent {}

class CameraViewInitialized extends CameraViewEvent {}

class CameraViewTogglePressed extends CameraViewEvent {
  final CameraMode cameraMode;
  CameraViewTogglePressed({@required this.cameraMode});
}

class CameraViewFlashButtonPressed extends CameraViewEvent {}

class CameraViewFlashStateChanged extends CameraViewEvent {
  final FlashState flashState;

  CameraViewFlashStateChanged({@required this.flashState});
}

class CameraViewOrientationChanged extends CameraViewEvent {
  final Orientation orientation;

  CameraViewOrientationChanged({@required this.orientation});
}

class CameraViewTakePicturePressed extends CameraViewEvent {}

class CameraViewImageDiscarded extends CameraViewEvent {}

class CameraViewImageAccepted extends CameraViewEvent {}

class CameraViewVideoDiscarded extends CameraViewEvent {}

class CameraViewVideoAccepted extends CameraViewEvent {}

class CameraViewStartedVideoRecording extends CameraViewEvent {}

class CameraViewPausedVideoRecording extends CameraViewEvent {}

class CameraViewResumedVideoRecording extends CameraViewEvent {}

class CameraViewStoppedVideoRecording extends CameraViewEvent {}

class CameraViewTickedVideoRecording extends CameraViewEvent {
  final Duration duration;
  CameraViewTickedVideoRecording({@required this.duration});
}

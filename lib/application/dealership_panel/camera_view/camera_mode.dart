class CameraMode {
  final String mode;

  CameraMode._(this.mode);

  String toString() => 'CameraMode.$mode';

  static CameraMode picture = CameraMode._('picture');
  static CameraMode video = CameraMode._('video');

  static List<CameraMode> values = [picture, video];

  factory CameraMode.from(String mode) {
    return values
        .firstWhere((camermode) => camermode.mode == mode.toLowerCase());
  }
}

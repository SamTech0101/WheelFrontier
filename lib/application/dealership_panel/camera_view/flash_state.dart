import 'package:camera/camera.dart';
import 'package:flutter/material.dart';

class FlashState {
  final String mode;

  FlashState._(this.mode);

  String toString() => 'FlashMode.$mode';

  static FlashState auto = FlashState._('auto');
  static FlashState isOff = FlashState._('isOff');
  static FlashState isOn = FlashState._('isOn');
  static FlashState torch = FlashState._('torch');

  static List<FlashState> values = [auto, isOff, isOn, torch];

  factory FlashState.from(IconData iconData) {
    return values
        .firstWhere((flashMode) => flashMode.modeIconData() == iconData);
  }

  IconData modeIconData() {
    IconData iconData;
    if (mode == 'auto') {
      iconData = Icons.flash_auto;
    } else if (mode == 'isOff') {
      iconData = Icons.flash_off;
    } else if (mode == 'isOn') {
      iconData = Icons.flash_on;
    } else if (mode == 'torch') {
      iconData = Icons.highlight;
    }
    return iconData;
  }

  FlashMode toFlashMode() {
    FlashMode flashMode;
    if (mode == 'auto') {
      flashMode = FlashMode.auto;
    } else if (mode == 'isOff') {
      flashMode = FlashMode.off;
    } else if (mode == 'isOn') {
      flashMode = FlashMode.always;
    } else if (mode == 'torch') {
      flashMode = FlashMode.torch;
    }
    return flashMode;
  }
}

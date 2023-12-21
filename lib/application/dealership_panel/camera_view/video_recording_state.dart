import 'package:flutter/material.dart';

class VideoRecordingState {
  final String state;

  VideoRecordingState._(this.state);

  String toString() => 'RecordingState.$state';

  static VideoRecordingState started = VideoRecordingState._('started');
  static VideoRecordingState resumed = VideoRecordingState._('resumed');
  static VideoRecordingState paused = VideoRecordingState._('paused');
  static VideoRecordingState done = VideoRecordingState._('done');

  static List<VideoRecordingState> values = [started, resumed, paused, done];

  IconData stateIconData() {
    IconData iconData;
    if (state == 'resumed') {
      iconData = Icons.pause;
    } else if (state == 'started') {
      iconData = Icons.pause;
    } else if (state == 'paused') {
      iconData = Icons.play_arrow;
    }
    return iconData;
  }
}

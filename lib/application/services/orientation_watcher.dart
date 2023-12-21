import 'dart:async';

import 'package:flutter/material.dart';

// for getting real time updates of orinetation opf the device

class OrientationWatcher {
  final StreamController<Orientation> events;

  const OrientationWatcher._(this.events);

  factory OrientationWatcher() =>
      OrientationWatcher._(StreamController<Orientation>.broadcast());
}

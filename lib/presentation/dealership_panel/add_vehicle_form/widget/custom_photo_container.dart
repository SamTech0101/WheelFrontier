import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class CustomPhotoContainer extends StatelessWidget {
  final File file;

  CustomPhotoContainer({this.file});
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 85,
      width: 85,
      color: Colors.grey[300],
      child: Image.file(
        file,
        fit: BoxFit.fill,
      ),
    );
  }
}

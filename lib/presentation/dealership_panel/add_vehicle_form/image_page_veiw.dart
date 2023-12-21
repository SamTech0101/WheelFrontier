import 'dart:io';

import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ImageViewPage extends StatelessWidget {
  final File file;
  ImageViewPage({@required this.file});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.transparent,
          elevation: 0,
          leading: IconButton(
            color: Colors.black,
            icon: Icon(Icons.arrow_back),
            onPressed: () {
              Get.back();
            },
          ),
        ),
        body: RotatedBox(
          quarterTurns: 1,
          child: Center(
            child: Container(
              child: Image.file(
                file,
                fit: BoxFit.cover,
              ),
            ),
          ),
        ));
  }
}

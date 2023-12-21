import 'dart:io';

import 'package:flutter/material.dart';
import 'package:kt_dart/kt.dart';

class CounterOfPicturesWidget extends StatelessWidget {
  final KtList<File> listOfPictures;
  CounterOfPicturesWidget({this.listOfPictures});
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: listOfPictures.size > 0
          ? Container(
              height: 25,
              width: 25,
              child: Center(
                child: Text(
                  listOfPictures.size.toString(),
                  style: TextStyle(color: Colors.white),
                ),
              ),
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: Colors.black,
              ),
            )
          : Container(),
    );
  }
}

import 'dart:io';

import 'package:flutter/material.dart';

class ShowImagePage extends StatelessWidget {
  final File imagefile;
  ShowImagePage({this.imagefile});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                InkWell(
                  child: Icon(Icons.close),
                  onTap: () {},
                ),
                InkWell(
                  child: Icon(Icons.check),
                  onTap: () {},
                )
              ],
            ),
            Container(
              child: Image.file(imagefile),
            ),
          ],
        ),
      ),
    );
  }
}

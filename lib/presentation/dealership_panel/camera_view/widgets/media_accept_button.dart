import 'dart:math';

import 'package:flutter/material.dart';

class MediaAcceptButton extends StatelessWidget {
  final VoidCallback onPressed;

  MediaAcceptButton({@required this.onPressed});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onPressed,
      child: Container(
        width: 70,
        height: 70,
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          color: Colors.white38,
        ),
        child: Center(
          child: Transform.rotate(
            angle: pi / 2,
            child: Icon(
              Icons.check,
              size: 35,
            ),
          ),
        ),
      ),
    );
  }
}

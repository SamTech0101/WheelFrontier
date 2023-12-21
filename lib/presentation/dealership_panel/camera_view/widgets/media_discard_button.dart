import 'package:flutter/material.dart';

class MediaDiscardButton extends StatelessWidget {
  final VoidCallback onPressed;

  MediaDiscardButton({@required this.onPressed});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onPressed,
      child: Container(
        width: 70,
        height: 70,
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          color: Colors.white30,
        ),
        child: Center(
          child: Icon(
            Icons.close,
            size: 35,
          ),
        ),
      ),
    );
  }
}

import 'package:flutter/material.dart';

class AddPictureButton extends StatelessWidget {
  final VoidCallback onPeresed;
  AddPictureButton({this.onPeresed});
  @override
  Widget build(BuildContext context) {
    return InkWell(
      child: Center(
        child: Container(
          height: 85,
          width: 85,
          color: Colors.grey[300],
          child: Icon(Icons.add_a_photo_outlined),
        ),
      ),
      onTap: onPeresed,
    );
  }
}

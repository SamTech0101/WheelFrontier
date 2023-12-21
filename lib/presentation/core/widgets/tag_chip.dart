import 'package:flutter/material.dart';

class TagChip extends StatelessWidget {
  final String text;
  final int colorIndex;

  TagChip({@required this.text, @required this.colorIndex});
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.primaries[colorIndex].shade50,
        borderRadius: BorderRadius.circular(60),
      ),
      child: FittedBox(
        child: Center(
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text(
              text,
              style: TextStyle(
                color: Colors.primaries[colorIndex].shade900,
                fontSize: 14,
              ),
            ),
          ),
        ),
      ),
    );
  }
}

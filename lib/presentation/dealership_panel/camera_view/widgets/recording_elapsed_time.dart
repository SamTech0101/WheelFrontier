import 'package:flutter/material.dart';

class RecordingElapsedTime extends StatelessWidget {
  final Duration elapsedTime;

  RecordingElapsedTime({@required this.elapsedTime});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 100,
      height: 40,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(60),
        color: Colors.white38,
      ),
      child: Center(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Icon(
              Icons.circle,
              color: Colors.red,
              size: 15,
            ),
            _timerLayout(elapsedTime),
          ],
        ),
      ),
    );
  }

  Text _timerLayout(Duration duration) {
    Text text;
    final String minuteStr =
        (duration.inMinutes % 60).toString().padLeft(2, '0');
    final String secondStr =
        (duration.inSeconds % 60).toString().padLeft(2, '0');
    text = Text(
      '$minuteStr:$secondStr',
      style: TextStyle(
        fontSize: 20,
        color: Colors.black,
      ),
    );
    return text;
  }
}

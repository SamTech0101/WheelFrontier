import 'dart:io';

import 'package:better_player/better_player.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';

class VideoPlaybackView extends StatefulWidget {
  final File video;

  VideoPlaybackView({@required this.video});

  @override
  _VideoPlaybackViewState createState() => _VideoPlaybackViewState();
}

class _VideoPlaybackViewState extends State<VideoPlaybackView> {
  @override
  void initState() {
    super.initState();
    SystemChrome.setPreferredOrientations(
      [
        DeviceOrientation.landscapeLeft,
      ],
    );
  }

  Future<bool> _willPopCallback() async {
    await SystemChrome.setPreferredOrientations(
      [DeviceOrientation.portraitUp],
    );
    return true;
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () => _willPopCallback(),
      child: Stack(
        children: [
          BetterPlayer.file(
            widget.video.path,
            betterPlayerConfiguration: BetterPlayerConfiguration(
              deviceOrientationsOnFullScreen: [
                DeviceOrientation.landscapeLeft,
              ],
              autoPlay: true,
              fit: BoxFit.cover,
            ),
          ),
          Positioned(
            top: 40,
            left: 25,
            child: GestureDetector(
              onTap: () {
                SystemChrome.setPreferredOrientations(
                  [DeviceOrientation.portraitUp],
                );
                Get.back();
              },
              child: Container(
                width: 70,
                height: 70,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: Colors.white38,
                ),
                child: Icon(
                  Icons.arrow_back,
                  size: 35,
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}

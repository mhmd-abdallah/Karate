// ignore_for_file: file_names, unused_import, library_private_types_in_public_api, prefer_const_constructors, unnecessary_null_comparison, avoid_unnecessary_containers, prefer_initializing_formals, depend_on_referenced_packages

import 'package:flutter/material.dart';
import 'package:video_player/video_player.dart';

class OverlayWidget extends StatelessWidget {
  final VideoPlayerController controller;
  const OverlayWidget({Key? key, required VideoPlayerController controller})
      : controller = controller,
        super(key: key);

  // final asset = "asset/video1.mp4";
  @override
  Widget build(BuildContext context) => GestureDetector(
        behavior: HitTestBehavior.opaque,
        onTap: () =>
            controller.value.isPlaying ? controller.pause() : controller.play(),
        child: Stack(
          children: <Widget>[
            buildPlay(),
            Positioned(
              bottom: 0,
              left: 0,
              right: 0,
              child: buildIndicator(),
            ),
          ],
        ),
      );

  Widget buildIndicator() => VideoProgressIndicator(
        controller,
        allowScrubbing: true,
      );

  Widget buildPlay() => controller.value.isPlaying
      ? Container()
      : Container(
          alignment: Alignment.center,
          color: Colors.black26,
          child: Icon(Icons.play_arrow, color: Colors.white, size: 80),
        );
}
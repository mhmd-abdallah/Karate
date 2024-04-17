// ignore_for_file: file_names, unused_import, library_private_types_in_public_api, prefer_const_constructors, unnecessary_null_comparison, avoid_unnecessary_containers, prefer_initializing_formals, sized_box_for_whitespace, depend_on_referenced_packages

import 'package:flutter/material.dart';
import 'package:karate/OverLay.dart';
import 'package:video_player/video_player.dart';

class VideoApp extends StatelessWidget {
  final VideoPlayerController controller;
  const VideoApp({Key? key, required VideoPlayerController controller})
      : controller = controller,
        super(key: key);

  @override
  Widget build(BuildContext context) =>
      controller != null && controller.value.isInitialized
          ? Container(alignment: Alignment.topCenter, child: buildVideo())
          : Container(
              height: 200,
              child: Center(child: CircularProgressIndicator()),
            );

  Widget buildVideo() => Stack(
        children: <Widget>[
          buildVideoPlayer(),
          Positioned.fill(child: OverlayWidget(controller: controller)),
        ],
      );

  Widget buildVideoPlayer() => AspectRatio(
        aspectRatio: controller.value.aspectRatio,
        child: VideoPlayer(controller),
      );
}
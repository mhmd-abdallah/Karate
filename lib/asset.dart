// ignore_for_file: file_names, unused_import, library_private_types_in_public_api, prefer_const_constructors, unused_local_variable, unnecessary_null_comparison, depend_on_referenced_packages

import 'package:flutter/material.dart';
import 'package:karate/Video.dart';
import 'package:video_player/video_player.dart';

class Asset extends StatefulWidget {
  const Asset({super.key});

  @override
  _AssetState createState() => _AssetState();
}

class _AssetState extends State<Asset> {
  final asset = "asset/video1.mp4";
  late VideoPlayerController controller;
  bool isPlaying = true;

  @override
  void initState() {
    super.initState();
    controller = VideoPlayerController.asset("asset/video1.mp4")
      ..addListener(() => setState(() {}))
      ..setLooping(true)
      ..initialize().then((_) => controller.play());
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

   @override
  Widget build(BuildContext context) {
    final isMuted = controller.value.volume == 0;

    return Column(
      children: [
        VideoApp(controller: controller),
        const SizedBox(height: 32),
        if (controller != null && controller.value.isInitialized)
          CircleAvatar(
            radius: 30,
            backgroundColor: Colors.red,
            child: IconButton(
              icon: Icon(
                isMuted ? Icons.volume_mute : Icons.volume_up,
                color: Colors.white,
              ),
              onPressed: () => controller.setVolume(isMuted ? 1 : 0),
            ),
          )
      ],
    );
  }
}
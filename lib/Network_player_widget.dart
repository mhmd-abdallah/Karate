// ignore_for_file: file_names, unused_import, library_private_types_in_public_api, prefer_const_constructors, unused_local_variable, unnecessary_null_comparison, camel_case_types, curly_braces_in_flow_control_structures, use_key_in_widget_constructors, deprecated_member_use, depend_on_referenced_packages

import 'package:flutter/material.dart';
import 'package:youtube_player_flutter/youtube_player_flutter.dart';

class NetworkPlayer extends StatefulWidget {
  const NetworkPlayer({Key? key});

  @override
  _NetworkPlayerState createState() => _NetworkPlayerState();
}

class _NetworkPlayerState extends State<NetworkPlayer> {
  final textController = TextEditingController();

  late YoutubePlayerController _controller;

  @override
  void initState() {
    super.initState();
    _controller = YoutubePlayerController(
      initialVideoId: '',
      flags: YoutubePlayerFlags(
        autoPlay: true,
        mute: false,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("YouTube Video Player")),
      body: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            TextFormField(
              controller: textController,
              decoration: InputDecoration(labelText: 'Paste YouTube Video URL'),
            ),
            SizedBox(height: 16),
            FloatingActionButton(
              onPressed: () {
                if (textController.text.trim().isEmpty) return;

                _controller.load(YoutubePlayer.convertUrlToId(textController.text) ?? '');
                _controller.play();

                setState(() {});
              },
              child: Icon(Icons.play_arrow),
            ),
            SizedBox(height: 16),
            if (_controller.initialVideoId.isNotEmpty)
              YoutubePlayer(
                controller: _controller,
                showVideoProgressIndicator: true,
                onReady: () {
                  // Do something when the player is ready.
                },
              ),
          ],
        ),
      ),
    );
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }
}

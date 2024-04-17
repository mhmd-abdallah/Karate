// ignore_for_file: file_names, unused_import, library_private_types_in_public_api, prefer_const_constructors, unused_local_variable, unnecessary_null_comparison, camel_case_types, curly_braces_in_flow_control_structures, use_key_in_widget_constructors, depend_on_referenced_packages

import 'dart:io';

import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:karate/Video.dart';
import 'package:video_player/video_player.dart';

class filePlayer extends StatefulWidget {
  const filePlayer({Key? key});

  @override
  _filePlayerState createState() => _filePlayerState();
}

class _filePlayerState extends State<filePlayer> {
  VideoPlayerController? controller;
  bool isPlaying = false;

  @override
  void dispose() {
    controller?.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final isMuted = controller?.value.volume == 0;

    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            if (controller != null)
              Column(
                children: [
                  VideoApp(controller: controller!),
                  //buildAddButton(),
                ],
              ),
            buildAddButton(),
          ],
        ),
      ),
    );
  }

  Widget buildAddButton() {
    return Container(
      padding: EdgeInsets.all(32),
      child: FloatingActionButton(
        onPressed: () async {
          final file = await pickVideoFile();
          if (file == null) {
            return;
          } else {
            controller?.dispose(); // Dispose existing controller if any
            controller = VideoPlayerController.file(file)
              ..addListener(() => setState(() {}))
              ..setLooping(true)
              ..initialize().then((_) {
                setState(() {});
              });
          }
        },
        
      ),
    );
  }

  Future<File?> pickVideoFile() async {
    final result = await FilePicker.platform.pickFiles(type: FileType.video);
    if (result == null) return null;
    return File(result.files.single.path.toString());
  }
}

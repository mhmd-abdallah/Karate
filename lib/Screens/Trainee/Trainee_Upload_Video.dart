// ignore_for_file: camel_case_types, prefer_const_constructors, file_names, unused_import, non_constant_identifier_names, unused_element, sized_box_for_whitespace, prefer_const_literals_to_create_immutables, sort_child_properties_last, depend_on_referenced_packages

import 'dart:io';

import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:karate/Widgets/Trainee_nav_bar_widget.dart';
import 'package:karate/Widgets/Trainee_Appbar.dart';
import 'package:karate/Video.dart';
import 'package:video_player/video_player.dart';

class UploadVideo extends StatefulWidget {
  const UploadVideo({super.key});

  @override
  State<UploadVideo> createState() => _UploadVideoState();
}

class _UploadVideoState extends State<UploadVideo> {
  VideoPlayerController? controller;
  bool isPlaying = false;
  final textController = TextEditingController();

  @override
  void dispose() {
    controller?.dispose();
    textController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: TraineeAppbar(),
      bottomNavigationBar: Trainee_Navbar_Widget(),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(28.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Align(
                alignment: Alignment.topRight,
                child: FloatingActionButton(
                  onPressed: () => {},
                  child: Icon(Icons.refresh, size: 40),
                  elevation: 0,
                  backgroundColor: Colors.transparent,
                ),
              ),
              Text(
                'Choose Category\n',
                style: TextStyle(
                  color: Color(0xFF1F1C1C),
                  fontSize: 32,
                  fontStyle: FontStyle.italic,
                  fontWeight: FontWeight.w300,
                ),
              ),
              CategoryDrop(),
              SizedBox(
                height: 20,
              ),
              Container(
                width: 220,
                height: 210,
                decoration: ShapeDecoration(
                  image: DecorationImage(
                    opacity: 0.50,
                    image: AssetImage("assets/icons/uploadImg.png"),
                  ),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(213.5),
                  ),
                ),
                child: Center(
                  child: Align(
                    alignment: Alignment.center,
                    child: Container(
                      width: 49,
                      height: 49,
                      decoration: ShapeDecoration(
                        color: Colors.white,
                        shape: const CircleBorder(
                          side: BorderSide(
                            style: BorderStyle.none,
                          ),
                        ),
                      ),
                      child: IconButton(
                        onPressed: () async {
                          await showOptionsBottomSheet(context);
                        },
                        icon: Icon(Icons.camera_alt_outlined),
                      ),
                      
                    ),
                    
                  ),
                ),
              ),
              SizedBox(
                height: 20,
              ),
              MaterialButton(
                onPressed: () => {},
                child: Text(
                  "Add Video",
                  style: TextStyle(color: Colors.white),
                ),
                color: Color(0xff858585),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10.0),
                ),
                height: 50.0,
                minWidth: 50.0,
              ),
          // VideoApp(controller: controller!)
            ],
          ),
        ),
      ),
    );
  }

  Future<void> showOptionsBottomSheet(BuildContext context) async {
    showModalBottomSheet(
      context: context,
      builder: (BuildContext context) {
        return Column(
          mainAxisSize: MainAxisSize.min,
          children: <Widget>[
            ListTile(
              leading: Icon(Icons.videocam),
              title: Text('Record Video'),
              onTap: () {
                Navigator.pop(context);
                _recordVideo();
              },
            ),
            ListTile(
              leading: Icon(Icons.folder),
              title: Text('Choose from File'),
              onTap: () async {
                Navigator.pop(context);
                final file = await pickVideoFile();
                if (file != null) {
                  controller?.dispose();
                  controller = VideoPlayerController.file(file)
                    ..addListener(() => setState(() {}))
                    ..setLooping(true)
                    ..initialize().then((_) {
                      setState(() {});
                    });
                    
                }
              },
            ),
          ],
        );
      },
    );
  }

  Future<void> _recordVideo() async {
   
  }

  Widget _UploadCard(String URL) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          IconButton(onPressed: () => {}, icon: Icon(Icons.camera)),
          Container(
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              image: DecorationImage(
                image: AssetImage("assets/icons/weighing-machine.png"),
                fit: BoxFit.cover,
              ),
            ),
            child: Center(
              child: Icon(
                Icons.upload,
              ),
            ),
          )
        ],
      ),
    );
  }

  Widget _Card(String URL, String text) {
    return Card(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(32.0),
      ),
      margin: const EdgeInsets.all(15),
      elevation: 3,
      color: Colors.white,
      child: Padding(
        padding: const EdgeInsets.all(12.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                Image.asset(
                  URL,
                  height: 60,
                  width: 60,
                ),
                const SizedBox(
                  width: 20,
                ),
                Text(
                  text,
                  style:
                      const TextStyle(fontWeight: FontWeight.bold, fontSize: 22),
                )
              ],
            ),
            Row(
              children: [
                Image.asset(
                  URL,
                  height: 60,
                  width: 60,
                ),
                const SizedBox(
                  width: 20,
                ),
                Text(
                  text,
                  style:
                      const TextStyle(fontWeight: FontWeight.bold, fontSize: 22),
                )
              ],
            ),
            Row(
              children: [
                Image.asset(
                  URL,
                  height: 60,
                  width: 60,
                ),
                const SizedBox(
                  width: 20,
                ),
                Text(
                  text,
                  style:
                      const TextStyle(fontWeight: FontWeight.bold, fontSize: 22),
                )
              ],
            ),
          ],
        ),
      ),
    );
  }

  Widget CategoryDrop() {
    return DropdownButtonFormField<String>(
      decoration: InputDecoration(
        hintText: "Name",
        contentPadding: EdgeInsets.symmetric(horizontal: 16, vertical: 14),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8),
          borderSide:
              const BorderSide(color: Color.fromARGB(247, 92, 92, 92)),
        ),
      ),
      items: [
        "Kata",
        "Physical Strength Exercises",
        "Techniques"
      ].map((String value) {
        return DropdownMenuItem<String>(
          value: value,
          child: Text(value),
        );
      }).toList(),
      onChanged: (String? value) {
        // Handle dropdown value change
      },
      icon: Icon(Icons.keyboard_arrow_down_sharp),
      iconSize: 24,
      isExpanded: true,
      style: const TextStyle(color: Color.fromARGB(255, 0, 0, 0)),
    );
  }

  Future<File?> pickVideoFile() async {
    final result = await FilePicker.platform.pickFiles(type: FileType.video);
    if (result == null) return null;
    return File(result.files.single.path.toString());
  }
}

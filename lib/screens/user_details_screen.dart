import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_sound_lite/flutter_sound.dart';
import 'package:namqi_project/widgets/user_component.dart';

class UserDetailsScreen extends StatefulWidget {
  final String name;
  final String audioPath;
  final String reason;
  final String position;
  final String imagePath;
  const UserDetailsScreen(
      {this.audioPath = '',
      this.position = '',
      this.reason = '',
      this.name = '',
      this.imagePath = '',
      Key? key})
      : super(key: key);

  @override
  State<UserDetailsScreen> createState() => _UserDetailsScreenState();
}

class _UserDetailsScreenState extends State<UserDetailsScreen> {
  late FlutterSoundPlayer player;
  @override
  void initState() {
    player = FlutterSoundPlayer();
    super.initState();
  }

  @override
  void dispose() {
    player.dispositionStream();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Padding(
          padding: const EdgeInsets.symmetric(vertical: 20),
          child: SingleChildScrollView(
            child: Column(
              children: [
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20),
                  child: Row(
                    children: [
                      Expanded(
                        flex: 2,
                        child: Container(
                          height: 200,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(12),
                            border: Border.all(color: Colors.blueGrey),
                          ),
                          child: ClipRRect(
                            borderRadius: BorderRadius.circular(12),
                            child: Image.file(
                              File(widget.imagePath),
                              fit: BoxFit.cover,
                            ),
                          ),
                        ),
                      ),
                      Expanded(
                          flex: 10,
                          child: Column(
                            children: [
                              Text(
                                widget.name,
                                style: const TextStyle(
                                    color: Colors.black, fontSize: 20),
                              ),
                              const SizedBox(height: 10),
                              Text(
                                widget.position,
                                style: const TextStyle(
                                    color: Colors.black, fontSize: 20),
                              ),
                            ],
                          ))
                    ],
                  ),
                ),
                const SizedBox(height: 20),
                Text(
                  widget.reason,
                  style: const TextStyle(color: Colors.black, fontSize: 20),
                ),
                const SizedBox(height: 20),
                GestureDetector(
                  onTap: () {
                    if (player.isPlaying) {
                      player.stopPlayer();
                    } else {
                      player.startPlayer(fromURI: widget.audioPath);
                    }
                  },
                  child: Container(
                    width: 60,
                    height: 60,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(8),
                      color: Colors.blueAccent,
                    ),
                    child: const Center(
                      child: Icon(
                        Icons.play_arrow,
                        color: Colors.white,
                        size: 40,
                      ),
                    ),
                  ),
                ),
                const SizedBox(height: 20),
                Row(
                  children: [
                    Expanded(
                      child: UserComponent(
                        onTap: () {
                          Navigator.of(context).pop();
                        },
                        text: 'Taxrirlash',
                        textColor: Colors.white,
                        color: Colors.blueAccent,
                      ),
                    ),
                    Expanded(
                      child: UserComponent(
                        onTap: () async {
                          ScaffoldMessenger.of(context)
                              .showMaterialBanner(const MaterialBanner(
                                  content: Center(
                                    child: Text('Muvoffaqiyatli yuborildi'),
                                  ),
                                  actions: [Text('')]));
                          await Future.delayed(Duration(seconds: 1))
                              .then((value) {
                            ScaffoldMessenger.of(context)
                                .clearMaterialBanners();
                            Navigator.of(context)
                                .popUntil((route) => route.isFirst);
                          });
                        },
                        text: 'Tasdiqlash',
                        textColor: Colors.white,
                        color: Colors.blueAccent,
                      ),
                    ),
                  ],
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}

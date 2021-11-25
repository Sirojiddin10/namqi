import 'dart:math' as math;

import 'package:camera/camera.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:namqi_project/screens/user.dart';

class HomeScreen extends StatefulWidget {
  final List<CameraDescription> cameras;
  const HomeScreen({required this.cameras, Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  late CameraController controller;

  @override
  void initState() {
    super.initState();
    controller = CameraController(
        widget.cameras.firstWhere(
            (element) => element.lensDirection == CameraLensDirection.front),
        ResolutionPreset.max);
    controller.initialize().then((_) {
      if (!mounted) {
        return;
      }
      setState(() {});
    });
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final double mirror = math.pi;
    final width = MediaQuery.of(context).size.width;
    final height = MediaQuery.of(context).size.height;
    return Scaffold(
      body: Stack(
        children: [
          Transform.scale(
            scale: 1.0,
            child: AspectRatio(
              aspectRatio: MediaQuery.of(context).size.aspectRatio,
              child: OverflowBox(
                alignment: Alignment.center,
                child: FittedBox(
                  fit: BoxFit.fitHeight,
                  child: SizedBox(
                    width: width,
                    height: height,
                    child: Stack(
                      fit: StackFit.expand,
                      children: <Widget>[
                        CameraPreview(controller),
                      ],
                    ),
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
      floatingActionButton: GestureDetector(
        onTap: () async {
          XFile file = await controller.takePicture();
          ScaffoldMessenger.of(context).showMaterialBanner(const MaterialBanner(
              content: Center(child: Text('Xush Kelibsiz')),
              actions: [Text('')]));

          await Future.delayed(const Duration(seconds: 2)).then(
              (value) => ScaffoldMessenger.of(context).clearMaterialBanners());
          Navigator.of(context).push(
            MaterialPageRoute(
              builder: (context) => UserScreen(
                imagePath: file.path,
              ),
            ),
          );
        },
        child: Container(
          height: 40,
          width: MediaQuery.of(context).size.width,
          margin: const EdgeInsets.symmetric(horizontal: 80),
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(12),
              color: Colors.blueAccent),
          child: const Center(
            child: Text(
              'Tasdiqlash',
              style: TextStyle(fontSize: 20, color: Colors.white),
            ),
          ),
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
    );
  }
}

import 'dart:io';

import 'package:flutter/material.dart';
import 'package:camera/camera.dart';
import 'account.dart';
import 'home.dart';

class ScanPage extends StatefulWidget {
 final List<CameraDescription> cameras;

  ScanPage({required this.cameras});
  

  static Future<ScanPage> withDefaultCameras() async {
    final cameras = await availableCameras(); // This needs to be awaited in async setup
    return ScanPage(cameras: cameras);
  }
  
  @override
  _ScanPageState createState() => _ScanPageState();
}

class _ScanPageState extends State<ScanPage> {
  int _selectedIndex = 1;
  late CameraController controller;
  bool isCapturing = false;
  bool isFrontCamera = false;

  // for focusing
 // Offset? _focusPoint;
  // for zoom
 // double _zoom = 1.0;
  File? _capturedImage;

  void _takePicture() async {
    if (!controller.value.isInitialized || isCapturing) {
      return;
    }

    setState(() {
      isCapturing = true;
    });

    try {
      final image = await controller.takePicture();
      setState(() {
        _capturedImage = File(image.path);
      });
    } catch (e) {
      print('Error capturing image: $e');
    } finally {
      setState(() {
        isCapturing = false;
      });
    }
  }

  late final List<Widget> _pages = [
    HomePage(cameras: widget.cameras),
    LayoutBuilder(builder: (BuildContext context, BoxConstraints constraints) {
      return Stack(
        children: [
          Positioned(
           bottom: 0,
            left: 0,
            right: 0,
            child: Container(
              height: constraints.maxHeight * 0.8,
              decoration: BoxDecoration(
                color: Colors.black,
              ),
              child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Padding(
                        padding: const EdgeInsets.all(10),
                        child: GestureDetector(
                          onTap: () {
                            // take photo
                            _takePicture();
                          },
                          child: Icon(Icons.camera_alt),
                        )
                      ),
                  Positioned.fill(
                    top: 50,
                    bottom:  isFrontCamera == false ? 0 : 150,
                    child: AspectRatio(
                      aspectRatio: controller.value.aspectRatio,
                      child: CameraPreview(controller), 
                    )
                  )
                  ]),
            ),
          )
        ],
      );
    }),
    AccountPage(cameras: widget.cameras),
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  String _getTitleForPage(int index) {
    const titles = ["Hello User", "Scan", "Account"];
    return titles[index];
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _pages[_selectedIndex],
    );
  }
}

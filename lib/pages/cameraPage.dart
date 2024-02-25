// ignore_for_file: prefer_const_constructors
import 'dart:async';
import 'dart:io';
import 'package:flutter/material.dart';
import 'package:camera/camera.dart';
import 'package:flutter_home/pages/graph.dart';
import 'package:flutter_home/pages/maps.dart';
import 'package:image/image.dart' as img;
import 'package:http/http.dart' as http;
import 'package:file_picker/file_picker.dart';
import 'package:flutter_home/pages/profilePage.dart';

List<CameraDescription> cameras = [];

class TextDetectionPage extends StatefulWidget {

  @override
  _TextDetectionPageState createState() => _TextDetectionPageState();
}

class _TextDetectionPageState extends State<TextDetectionPage> {
  late CameraController _controller;
  bool _isInitialized = false;

  @override
  void initState() {
    super.initState();
    _initializeCamera();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  Future<void> _initializeCamera() async {
    cameras = await availableCameras();
    _controller = CameraController(cameras[0], ResolutionPreset.high);
    await _controller.initialize();
    if (!mounted) return;
    setState(() {
      _isInitialized = true;
    });
  }

  Future<void> _takePictureAndProcess() async {
    try {
      //image processing logic
      
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => NextPage()), 
      );
    } catch (e) {
      print('Error: $e');
    }
  }

 @override
@override
Widget build(BuildContext context) {
  if (!_isInitialized) {
    return Scaffold(
      body: Center(
        child: CircularProgressIndicator(),
      ),
    );
  }

  return Scaffold(
    body: Container(
      decoration: BoxDecoration(
        color: Color.fromARGB(92, 137, 212, 247),
        borderRadius: BorderRadius.circular(40),
      ),
      child: Stack(
        children: <Widget>[
          Positioned(
            top: 30,
            left: 10,
            child: IconButton(
              icon: Icon(Icons.arrow_back),
              onPressed: () {
                Navigator.pop(context);
              },
              color: const Color.fromARGB(255, 56, 54, 54),
              iconSize: 36,
            ),
          ),
          Positioned(
            top: 60,
            left: 0,
            right: 0,
            child: Center(
              child: Container(
                padding: EdgeInsets.symmetric(vertical: 8, horizontal: 20),
                decoration: BoxDecoration(
                  color: Color.fromARGB(100, 153, 221, 253),
                  borderRadius: BorderRadius.circular(20),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black.withOpacity(0.2),
                      spreadRadius: 5,
                      blurRadius: 7,
                      offset: Offset(0, 3),
                    ),
                  ],
                ),
                child: Text(
                  'Scan TimeTable',
                  style: TextStyle(
                    color: Color.fromARGB(255, 56, 56, 56),
                    fontSize: 30,
                  ),
                ),
              ),
            ),
          ),
          Positioned(
            bottom: 80,
            left: 0,
            right: 0,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: <Widget>[
                IconButton(
                  icon: Icon(Icons.camera),
                  onPressed: _takePictureAndProcess,
                  color: const Color.fromARGB(255, 56, 55, 55),
                  iconSize: 55,
                ),
                ElevatedButton(
                  onPressed: () async {
                    FilePickerResult? result = await FilePicker.platform.pickFiles();

                    if (result != null) {
                      PlatformFile file = result.files.first;

                      // Handle the picked file
                      print('File picked: ${file.name}');
                    } else {
                      // cancel file picker
                      print('File picker canceled');
                    }
                  },         
  child: Text('Upload',
    	style: TextStyle(
                    fontSize: 30,),
),
            )],
            ),
          ),
          Center(
            child: Container(
              width: MediaQuery.of(context).size.width * 0.89, 
              height: MediaQuery.of(context).size.height * 0.6,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(70), 
              ),
              child: CameraPreview(_controller),
            ),
          ),
         Positioned(
      bottom: 0,
      left: 0,
      right: 0,
      child: BottomNavigationBar(
          items: <BottomNavigationBarItem>[
            BottomNavigationBarItem(
              icon: Icon(Icons.home, size: 35),
              label: 'Home',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.search, size: 35),
              label: 'Search',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.favorite, size: 35),
              label: 'Favorites',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.account_circle, size: 35),
              label: 'Profile',
            ),
          ],
          currentIndex: 0,
          onTap: (int index) {
            switch (index) {
              case 0:
                // Navigate to Home page
                break;
              case 1:
                // Navigate to Search page
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => SearchPage()),
                );
                break;
              case 2:
                // Navigate to Favorites page
                break; 
                case 3: 
                Navigator.push(
  context,
  MaterialPageRoute(builder: (context) => ProfilePage()),
);

                break; 
                default: 
                //Do Nothing 
            }
          }, 
          unselectedItemColor: Colors.black,
          selectedItemColor: Colors.blue[900],
        ),
         ), 
        ], 
      ),
    ),
  );
}
}










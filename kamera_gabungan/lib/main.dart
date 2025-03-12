import 'package:flutter/material.dart';
import 'package:camera/camera.dart';
import 'package:kamera_gabungan/widget/takepicture_screen.dart';

void main() async {
  // Ensure that plugin services are initialized so that availableCameras()
  // can be called before runApp()
  WidgetsFlutterBinding.ensureInitialized();

  // Obtain a list of the available cameras on the device.
  final cameras = await availableCameras();

  // Get a specific camera from the list of available cameras.

  runApp(MyApp(cameras: cameras));
}

class MyApp extends StatelessWidget {
  final List<CameraDescription> cameras;

  const MyApp({super.key, required this.cameras});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Dark Camera App',
      theme: ThemeData.dark(), // Menggunakan tema dark bawaan Flutter
      home: TakePictureScreen(cameras: cameras), // Langsung ke kamera saat aplikasi dibuka
    );
  }
}

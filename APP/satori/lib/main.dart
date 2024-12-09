import 'package:flutter/material.dart';
import 'pages/splash.dart';
import 'pages/welcome.dart';
import 'pages/login.dart';
import 'pages/signup.dart';
import 'pages/home.dart';
import 'pages/account.dart';
import 'pages/scan.dart';
import 'package:camera/camera.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  // Initialize the available cameras
  final cameras = await availableCameras();

  runApp(MyApp(cameras: cameras));
}

class MyApp extends StatelessWidget {
  final List<CameraDescription> cameras;

  const MyApp({required this.cameras});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: '"Project Satori"',
      theme: ThemeData(
        scaffoldBackgroundColor: Color.fromRGBO(217, 208, 222, 1),
      ),
      initialRoute: '/',
      routes: {
        '/': (context) => Splash(),
        '/welcome': (context) => Welcome(),
        '/login': (context) => LoginPage(),
        '/signup': (context) => SignupPage(),
        '/home': (context) => HomePage(cameras: cameras),
        '/account': (context) => AccountPage(cameras: cameras),
        '/scan': (context) => ScanPage(cameras: cameras),
      },
    );
  }
}
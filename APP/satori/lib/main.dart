import 'package:flutter/material.dart';
import 'pages/splash.dart';
import 'pages/welcome.dart';
import 'pages/login.dart';
import 'pages/signup.dart';
import 'pages/home.dart';

void main() {
  runApp(MyApp());
}
 
class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: '"Project Satori"',
      theme:
          ThemeData(scaffoldBackgroundColor: Color.fromRGBO(217, 208, 222, 1)),
      initialRoute: '/',
      routes: {
        '/': (context) => Splash(),
        '/welcome': (context) => Welcome(),
        '/login': (context) => LoginPage(),
        '/signup': (context) => SignupPage(),
        '/home': (context) => HomePage(),
      },
    );
  }
}

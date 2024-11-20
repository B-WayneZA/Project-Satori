import 'package:flutter/material.dart';
import 'welcome.dart';

class Splash extends StatefulWidget {
  @override
  _SplashPageState createState() => _SplashPageState();
}

class _SplashPageState extends State<Splash> {
  @override
  void initState() {
    super.initState();
    _navigateToWelcomePage();
  }

  _navigateToWelcomePage() async {
    await Future.delayed(Duration(seconds: 2), () {});
    Navigator.pushReplacement(
      context,
      MaterialPageRoute(builder: (context) => Welcome()),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Text('Project Satori', style: TextStyle(fontSize: 24)),
      ),
    );
  }
}

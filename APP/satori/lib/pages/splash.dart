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
    await Future.delayed(Duration(seconds: 3), () {});
    Navigator.pushReplacement(
      context,
      MaterialPageRoute(builder: (context) => Welcome()),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromRGBO(217, 208, 222, 1), // Background color
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween, // Spread elements
        children: [
          Padding(
            padding: const EdgeInsets.only(top: 50.0), // Space from the top
            child: Text(
              '"Project Satori"', // Title text
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
                color: Colors.black, // Title color
                fontFamily: "Roboto"
              ),
            ),
          ),
          Expanded(
            child: Center(
              child: Text(
                'Scan, Style, Shop',
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 28,
                  fontWeight: FontWeight.bold,
                  color: Colors.black,
                ),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(bottom: 30.0), // Space at bottom
            child: LinearProgressIndicator(
              color: Color.fromRGBO(171, 73, 103, 1),
            ),
          ),
        ],
      ),
    );
  }
}

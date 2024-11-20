import 'package:flutter/material.dart';

class Welcome extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromRGBO(217, 208, 222, 1),
      body: Center(
      
        child: Padding(
          
          padding: const EdgeInsets.all(16.0), // Add padding for better layout
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Text(
                'Welcome to Project Satori',
                style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                textAlign: TextAlign.center,
              ),
              SizedBox(height: 20),
              Text(
                'Your ultimate fashion companion.',
                style: TextStyle(fontSize: 16),
                textAlign: TextAlign.center,
              ),
              SizedBox(height: 40),
              SizedBox(
                width: double.infinity, // Make the button fill the width of its parent
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                  backgroundColor:  Color.fromRGBO(171, 73, 103, 1),
                  padding: EdgeInsets.symmetric(horizontal: 50, vertical: 20),
                  textStyle: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold)),
                  onPressed: () {
                    Navigator.pushNamed(context, '/login');
                  },
                  child: Text('Login'),
                ),
              ),
              SizedBox(height: 10),
              SizedBox(  
                width: double.infinity, // Make the button fill the width of its parent
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                  backgroundColor: Color.fromRGBO(171, 73, 103, 1),
                  padding: EdgeInsets.symmetric(horizontal: 50, vertical: 20),
                  textStyle: TextStyle(
                  fontSize: 20,
                  color: Color.fromRGBO(14, 0, 4, 1),
                  fontWeight: FontWeight.bold)),
                  onPressed: () {
                    Navigator.pushNamed(context, '/signup');
                  },
                  child: Text('Sign Up'),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

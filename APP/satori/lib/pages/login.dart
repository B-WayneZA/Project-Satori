import 'package:flutter/material.dart';
import 'package:flutter_signin_button/flutter_signin_button.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:sign_in_with_apple/sign_in_with_apple.dart';

class LoginPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color.fromRGBO(217, 208, 222, 1),
          title: Text(
            'Login',
            textAlign: TextAlign.center,
            style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
                color: Colors.black,
                fontFamily: "Roboto"),
          )
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
           Padding(
              padding:
                  const EdgeInsets.symmetric(horizontal: 20.0, vertical: 5),
              child: TextField(
                decoration: InputDecoration(
                  labelText: 'Email',
                  labelStyle: TextStyle(fontSize: 11, fontFamily: "Roboto"),
                  border: OutlineInputBorder(),
                ),
              ),
            ),
 Padding(
              padding:
                  const EdgeInsets.symmetric(horizontal: 20.0, vertical: 5),
              child: StatefulBuilder(
                builder: (BuildContext context, StateSetter setState) {
                  bool _obscureText = true;
                  return StatefulBuilder(
                    builder: (BuildContext context, StateSetter setState) {
                      return TextField(
                        decoration: InputDecoration(
                          labelText: 'Password',
                          labelStyle:
                              TextStyle(fontSize: 11, fontFamily: "Roboto"),
                          border: OutlineInputBorder(),
                          suffixIcon: IconButton(
                            icon: Icon(
                              _obscureText
                                  ? Icons.visibility
                                  : Icons.visibility_off,
                            ),
                            onPressed: () {
                              setState(() {
                                _obscureText = !_obscureText;
                              });
                            },
                          ),
                        ),
                        obscureText: _obscureText,
                      );
                    },
                  );
                },
              ),
            ),
            SizedBox(height: 20),
            ElevatedButton(
               style: ElevatedButton.styleFrom(
                  backgroundColor: Color.fromRGBO(171, 73, 102, 0.466),
                  shape: RoundedRectangleBorder(
                      //to set border radius to button
                      borderRadius: BorderRadius.circular(10)),
                  padding: EdgeInsets.symmetric(horizontal: 100, vertical: 20),
                  textStyle:
                      TextStyle(fontSize: 15, fontWeight: FontWeight.bold)),
              onPressed: () {
                // Implement sign up functionality
                // TODO
              },
              child: Text(
                'Login',
                style: TextStyle(
                  fontSize: 12,
                  color: Colors.black, // Title color
                ),
              ),
            ),
            GestureDetector(
              onTap: () {
                // Implement forgot password functionality
                // TODO
              },
              child: Text(
                "Forgot password?",
                style: TextStyle(
                  fontSize: 11,
                  fontWeight: FontWeight.bold,
                  color: Color.fromARGB(255, 223, 78, 78), // Title color
                  decoration:
                      TextDecoration.underline, // Underline to indicate link
                ),
              ),
            ),
              Padding(
              padding:
                  const EdgeInsets.symmetric(horizontal: 25, vertical: 15),
              child: SignInButton(
                Buttons.Google,
                onPressed: () {
                  // Add the onPressed code for Google Sign-In
                },
                text: "Sign in with Google",
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
              ),
            ),
            Padding(
              padding:
                  const EdgeInsets.symmetric(horizontal: 25, vertical: 15),
              child: SignInButton(
                Buttons.Apple,
                onPressed: () {
                  // Add the onPressed code for iCloud Sign-In
                },
                text: "Sign in with Apple",
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}

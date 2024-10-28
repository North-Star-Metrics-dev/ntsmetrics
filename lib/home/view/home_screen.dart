import 'package:flutter/material.dart';
import 'package:ntsmetrics/login/view/login_screen.dart';
import 'package:ntsmetrics/signup/view/singup_screen.dart';

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Stack( // Use Stack to overlay the footer image
        children: [
          // Main content
          Center(
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start, // Align children to the left
                children: [
                  Padding(
                    padding: const EdgeInsets.only(left: 10.0, top: 80), // Add left padding
                    child: Text(
                      'Welcome',
                      style: TextStyle(
                        fontSize: 42,
                        color: Color(0xFF00D1FF),
                        fontWeight: FontWeight.bold,
                        fontFamily: 'Alata',
                      ),
                      textAlign: TextAlign.left, // Left-align the text
                    ),
                  ),
                  SizedBox(height: 10), // Space between texts
                  Padding(
                    padding: const EdgeInsets.only(left: 10.0, top: 5),
                    child: Text(
                      'Let\'s Get Started',
                      style: TextStyle(fontSize: 16, fontFamily: 'Alata'),
                      textAlign: TextAlign.center, // Center-align this text
                    ),
                  ),
                  SizedBox(height: 40),
                  Padding(
                    padding: const EdgeInsets.only(left: 10.0, top: 200),
                    child: Text(
                      'Existing customer / Get Started',
                      style: TextStyle(fontSize: 16, fontFamily: 'Alata'),
                      textAlign: TextAlign.center, // Center-align this text
                    ),
                  ),
                  SizedBox(height: 10), // Add space between image and buttons
                  ElevatedButton(
                    onPressed: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => LoginScreen(),
                          ));
                    },
                    child: Text('Sign in'),
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Color(0xFF00D1FF),
                      minimumSize: Size(double.infinity, 50),
                      textStyle: TextStyle(fontSize: 16, fontFamily: 'Alata'),
                    ),
                  ),
                  SizedBox(height: 10),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start, // Aligns the content in the center
                    children: [
                      Text(
                        'New Customer?',
                        style: TextStyle(
                          fontSize: 16,
                          fontFamily: 'Alata',
                        ),
                      ),
                      SizedBox(width: 8), // Adds space between the Text and TextButton
                      TextButton(
                        onPressed: () => showLoginOptions(context),
                        child: Text(
                          'Create Account',
                          style: TextStyle(
                            fontSize: 16,
                            fontFamily: 'Alata',
                            color: Color(0xFF00D1FF),
                          ),
                        ),
                        style: TextButton.styleFrom(
                          padding: EdgeInsets.zero, // Remove default padding
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
          // Footer image
          Positioned(
            bottom: 0, // Position at the bottom
            left: 0,
            right: 0,
            child: Image.asset(
              'assets/bgb.png',
              height: MediaQuery.of(context).size.height * 0.3, // Limit height to 30% of the screen
              width: double.infinity,
              fit: BoxFit.contain,
            ),
          ),
        ],
      ),
    );
  }

  void showLoginOptions(BuildContext context) {
    showModalBottomSheet(
      context: context,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
      ),
      builder: (BuildContext context) {
        return Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            mainAxisSize: MainAxisSize.min, // Set size to fit content
            children: [
              ElevatedButton.icon(
                onPressed: () {
                  // Handle login with Google
                },
                label: Text('Login with Google'),
                icon: Image.asset(
                  'assets/google_logo.png', // Use your actual asset path
                  height: 24, // Set the height of the image
                  width: 24, // Set the width of the image
                ),
                style: ElevatedButton.styleFrom(
                  minimumSize: Size(double.infinity, 50),
                ),
              ),
              SizedBox(height: 10), // Add space between buttons
              ElevatedButton.icon(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) =>
                            SingUpScreen()), // Correct spelling of SignUpScreen
                  );
                },
                label: Text('Continue with Email'),
                icon: Icon(Icons.email),
                style: ElevatedButton.styleFrom(
                  minimumSize: Size(double.infinity, 50),
                ),
              ),
              SizedBox(height: 10),
            ],
          ),
        );
      },
    );
  }
}

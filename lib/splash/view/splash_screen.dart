import 'package:flutter/material.dart';
import 'package:ntsmetrics/account/view/account_screen.dart';
import 'package:ntsmetrics/dashboard/view/dashboard_screen.dart';
import 'package:ntsmetrics/forgotpasswprd/view/forgot_password_screen.dart';
import 'dart:async';

import 'package:ntsmetrics/home/view/home_screen.dart';
import 'package:ntsmetrics/venmo_payment_screen/view/venmo_payment.dart';

class SplashScreen extends StatefulWidget {
  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    // Optional: Navigate to HomeScreen after 5 seconds
    Timer(Duration(seconds: 5), () {
      // Uncomment to navigate to HomeScreen
      Navigator.pushReplacement(
        context,
        // MaterialPageRoute(builder: (context) => HomeScreen()),
         MaterialPageRoute(builder: (context) => DashboardScreen()),
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white, // Customize background color
      body: Stack(
        children: [
          // Background image positioned from the top

          Positioned(
            top: 0,
            left: 0,
            right: 0, // Align to the top-left of the screen
            child: Image.asset(
              'assets/bg.png', // Replace with your actual background image asset path
              // Set specific dimensions
              height: MediaQuery.of(context).size.height *
                  0.55, // Limit height to 30% of the screen
              width: double.infinity,
              fit: BoxFit.contain, // Adjust to cover the area
            ),
          ),
          // Content on top of the background
          Center(
            child: Column(
              mainAxisAlignment:
                  MainAxisAlignment.start, // Align items from the top
              children: [
                // Adding 20 dp spacing from the top of the screen
                SizedBox(height: 100),
                // Display an image inside a container with a white background
                Container(
                  width: 140.71,
                  height: 140.71,
                  decoration: BoxDecoration(
                    color: Colors.white, // Set background color to white
                    borderRadius:
                        BorderRadius.circular(10), // Optional: Rounded corners
                  ),
                  child: Center(
                    child: Image.asset(
                      'assets/logo.png', // Use your actual asset path here
                      width: 117,
                      height: 51.25, // Adjust size as needed
                    ),
                  ),
                ),
                SizedBox(height: 250),
                // Text(
                //   'Welcome to North Star Metric',
                //   style: TextStyle(
                //     fontSize: 24,
                //     fontWeight: FontWeight.bold,
                //     color: Colors.white,
                //   ),
                // ),

                Column(
                  mainAxisAlignment:
                      MainAxisAlignment.start, // Align items from the top
                  children: [
                    Text(
                      'North Metrics',
                      style: TextStyle(
                        fontSize: 28,
                        fontWeight: FontWeight.bold,
                        fontFamily: 'Alata',
                      ),
                    ),
                    SizedBox(height: 60),

                    Text(
                      'The Vision Where Your Trading Mindset',
                      style: TextStyle(
                          fontSize: 15,
                          fontWeight: FontWeight.bold,
                          fontFamily: 'Alata'),
                    ),
                    // SizedBox(height: 15),

                    Text(
                      'Is Valued And Trained!!',
                      style: TextStyle(
                          fontSize: 15,
                          fontWeight: FontWeight.bold,
                          fontFamily: 'Alata'),
                    ),

                    SizedBox(height: 150),

                    Text(
                      '@ Copyright 2024',
                      style:
                          TextStyle(fontSize: 15, fontWeight: FontWeight.bold),
                    ),
//  SizedBox(height: 10),

                    Text(
                      'All rights reserved',
                      style:
                          TextStyle(fontSize: 15, fontWeight: FontWeight.bold),
                    )
                  ],
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}

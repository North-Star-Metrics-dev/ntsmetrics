import 'package:flutter/material.dart';
import 'package:ntsmetrics/otp/view/otp_screen.dart';
import 'package:ntsmetrics/splash/view/splash_screen.dart';
import 'package:ntsmetrics/verification_success/view/verification_success_screen.dart';

void main() {
  runApp( MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: VerificationSuccessScreen(),
    );
  }
}
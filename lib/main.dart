import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ntsmetrics/Depositsuccess/view/deposit_success_screen.dart';
import 'package:ntsmetrics/Iphone52depositfromcreditcard/view/deposit_from_credit_card_screen.dart';
import 'package:ntsmetrics/otp/view/otp_screen.dart';
import 'package:ntsmetrics/signup/view/singup_screen.dart';



void main() {
  runApp( MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      home: SingUpScreen() ,
    );
  }
}
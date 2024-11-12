import 'package:flutter/material.dart';
import 'Iphone52deposit/view/Iphone52_deposit_screen.dart';




void main() {
  runApp( MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Iphone52DepositScreen() ,
    );
  }
}

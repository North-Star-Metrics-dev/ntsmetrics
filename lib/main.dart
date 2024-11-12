import 'package:flutter/material.dart';
import 'package:ntsmetrics/algorandsubscription/view/algorand_subscription_screen.dart';
import 'Iphone52deposit/view/Iphone52_deposit_screen.dart';




void main() {
  runApp( MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: AlgorandSubscriptionScreen() ,
    );
  }
}

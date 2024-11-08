import 'package:flutter/material.dart';
import 'package:ntsmetrics/earnsearch/view/earn_search_screen.dart';
import 'package:ntsmetrics/wallet/view/wallet_screen.dart';




void main() {
  runApp( MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: EarnSearchScreen() ,
    );
  }
}

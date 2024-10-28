import 'package:flutter/material.dart';
import 'market/view/market_screen.dart';



void main() {
  runApp( MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: MarketScreen(),
    );
  }
}
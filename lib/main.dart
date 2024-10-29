import 'package:flutter/material.dart';
import 'package:ntsmetrics/trade/view/trade_screen.dart';
import 'addcard/view/add_card_screen.dart';
import 'choosebank/view/choose_bank_screen.dart';
import 'market/view/market_screen.dart';



void main() {
  runApp( MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: ChooseBankScreen(),
    );
  }
}
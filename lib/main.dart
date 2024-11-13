import 'package:flutter/material.dart';
import 'package:ntsmetrics/Iphone52depositbanktransfer/view/Iphone51_deposit_bank_transfer_screen.dart';



void main() {
  runApp( MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Iphone51DepositBankTransferScreen() ,
    );
  }
}

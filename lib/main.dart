import 'package:flutter/material.dart';
import 'package:ntsmetrics/selectpaymentmethod/view/payment_method_screen.dart';

import 'banktransfer/view/bank_transfer_screen.dart';


void main() {
  runApp( MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: BankTransferScreen(),
    );
  }
}
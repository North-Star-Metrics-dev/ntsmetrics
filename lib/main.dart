import 'package:flutter/material.dart';
import 'package:ntsmetrics/2FA/view/2FA_screen.dart';
import 'package:ntsmetrics/earntransactionlist/view/earntransactionlist_screen.dart';
import 'package:ntsmetrics/signup/view/singup_screen.dart';
import 'package:ntsmetrics/transactiondetails/view/transaction_details_screen.dart';
import 'package:ntsmetrics/transactionlist/view/transaction_list_screen.dart';
import 'earn/view/earn_screen.dart';




void main() {
  runApp( MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: TwoFactorAuthenticationScreen() ,
    );
  }
}

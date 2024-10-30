import 'package:flutter/material.dart';
import 'package:ntsmetrics/selectpaymentmethod/view/payment_method_screen.dart';
import 'package:ntsmetrics/signup/view/singup_screen.dart';
import 'package:ntsmetrics/steps/view/steps_screen.dart';
import 'package:ntsmetrics/trade/view/trade_screen.dart';
import 'package:ntsmetrics/transactiondetails/view/transaction_details_screen.dart';
import 'package:ntsmetrics/transactionlist/view/transaction_list_screen.dart';
import 'package:ntsmetrics/verification_success/view/verification_success_screen.dart';
import 'account/view/account_screen.dart';
import 'addcard/view/add_card_screen.dart';
import 'banktransfer/view/bank_transfer_screen.dart';
import 'choosebank/view/choose_bank_screen.dart';
import 'login/view/login_screen.dart';
import 'market/view/market_screen.dart';
import 'marketsearch/view/market_search_screen.dart';
import 'otp/view/otp_screen.dart';



void main() {
  runApp( MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: TransactionDetailsScreen() ,
    );
  }
}
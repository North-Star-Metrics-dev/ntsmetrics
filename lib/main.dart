import 'package:flutter/material.dart';
import 'package:ntsmetrics/walletlog/view/wallet_log_screen.dart';




void main() {
  runApp( MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: WalletLogScreen() ,
    );
  }
}

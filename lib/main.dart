import 'package:flutter/material.dart';

import 'Iphone51transactiondetails/view/transactiondetails_screen.dart';




void main() {
  runApp( MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Iphone51TransactiondetailsScreen() ,
    );
  }
}

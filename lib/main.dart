import 'package:flutter/material.dart';

import 'Iphone51transactiondetails/view/transactiondetails_screen.dart';
import 'iphone52earnlog/view/iphone51earnlog_screen.dart';




void main() {
  runApp( MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Iphone51earnlogScreen() ,
    );
  }
}

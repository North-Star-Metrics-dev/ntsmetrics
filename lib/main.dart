// // import 'package:flutter/material.dart';
// // import 'package:get/get.dart';
// // import 'package:ntsmetrics/Depositsuccess/view/deposit_success_screen.dart';
// // import 'package:ntsmetrics/Iphone52depositfromcreditcard/view/deposit_from_credit_card_screen.dart';
// // import 'package:ntsmetrics/createpinscreen/view/create_pin_screen.dart';
// // import 'package:ntsmetrics/login/view/login_screen.dart';
// // import 'package:ntsmetrics/otp/view/otp_screen.dart';
// // import 'package:ntsmetrics/signup/view/singup_screen.dart';
// //
// //
// //
// // void main() {
// //   runApp( MyApp());
// // }
// //
// // class MyApp extends StatelessWidget {
// //   @override
// //   Widget build(BuildContext context) {
// //     return GetMaterialApp(
// //       debugShowCheckedModeBanner: false,
// //       home: SingUpScreen() ,
// //     );
// //   }
// // }
//
//
//
//
// import 'package:flutter/material.dart';
// import 'package:get/get.dart';
// import 'package:ntsmetrics/Depositsuccess/view/deposit_success_screen.dart';
// import 'package:ntsmetrics/Iphone52depositfromcreditcard/view/deposit_from_credit_card_screen.dart';
// import 'package:ntsmetrics/createpinscreen/view/create_pin_screen.dart';
// import 'package:ntsmetrics/login/view/login_screen.dart';
// import 'package:ntsmetrics/otp/view/otp_screen.dart';
// import 'package:ntsmetrics/signup/view/singup_screen.dart';
//
//
//
// void main() {
//   runApp( MyApp());
// }
//
// class MyApp extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return GetMaterialApp(
//       debugShowCheckedModeBanner: false,
//       home: SingUpScreen() ,
//     );
//   }
// }


// import 'package:flutter/material.dart';
// import 'package:get/get.dart';
// import 'package:ntsmetrics/Depositsuccess/view/deposit_success_screen.dart';
// import 'package:ntsmetrics/Iphone52depositfromcreditcard/view/deposit_from_credit_card_screen.dart';
// import 'package:ntsmetrics/createpinscreen/view/create_pin_screen.dart';
// import 'package:ntsmetrics/login/view/login_screen.dart';
// import 'package:ntsmetrics/otp/view/otp_screen.dart';
// import 'package:ntsmetrics/signup/view/singup_screen.dart';
// import 'package:uni_links/uni_links.dart'; // Add this package for deep linking
//
// void main() {
//   runApp(MyApp());
// }
//
// class MyApp extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return GetMaterialApp(
//       debugShowCheckedModeBanner: false,
//       home: SingUpScreen(),
//       initialRoute: '/',
//       getPages: [
//         GetPage(name: '/', page: () => SingUpScreen()),
//         GetPage(name: '/confirm-login', page: () => LoginScreen()),
//         // Add more routes as needed
//       ],
//     );
//   }
// }




import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:uni_links/uni_links.dart'; // Add this package for deep linking
import 'package:ntsmetrics/Depositsuccess/view/deposit_success_screen.dart';
import 'package:ntsmetrics/Iphone52depositfromcreditcard/view/deposit_from_credit_card_screen.dart';
import 'package:ntsmetrics/createpinscreen/view/create_pin_screen.dart';
import 'package:ntsmetrics/login/view/login_screen.dart';
import 'package:ntsmetrics/otp/view/otp_screen.dart';
import 'package:ntsmetrics/signup/view/singup_screen.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  void initState() {
    super.initState();
    _initializeDeepLinks();
  }

  void _initializeDeepLinks() async {
    // Handle the app when launched via a deep link
    final initialUri = await getInitialUri();
    if (initialUri != null) {
      _handleDeepLink(initialUri);
    }

    // Listen for incoming deep links while the app is running
    uriLinkStream.listen((Uri? deepLink) {
      if (deepLink != null) {
        _handleDeepLink(deepLink);
      }
    });
  }

  void _handleDeepLink(Uri deepLink) {
    // Check the path and query parameters
    if (deepLink.path == '/confirm-login') {
      final token = deepLink.queryParameters['token'];
      if (token != null) {
        // Navigate to LoginScreen and pass the token as an argument
        Get.toNamed('/confirm-login', arguments: {'token': token});
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      home: SingUpScreen(),
      initialRoute: '/',
      getPages: [
        GetPage(name: '/', page: () => SingUpScreen()),
        GetPage(name: '/confirm-login', page: () => LoginScreen()),
        // Add more routes as needed
      ],
    );
  }
}

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ntsmetrics/Otpforlogin/view/Otp_for_login_screen.dart';
import 'package:ntsmetrics/otp/view/otp_screen.dart';
import 'package:ntsmetrics/steps/view/steps_screen.dart';
import 'package:uni_links/uni_links.dart'; // Add this package for deep linking
import 'package:ntsmetrics/login/view/login_screen.dart';
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
    try {
      // Handle the app when launched via a deep link
      final initialUri = await getInitialUri();
      if (initialUri != null) {
        debugPrint('Initial deep link: $initialUri');
        _handleDeepLink(initialUri);
      }

      // Listen for incoming deep links while the app is running
      uriLinkStream.listen((Uri? deepLink) {
        if (deepLink != null) {
          debugPrint('Received deep link: $deepLink');
          _handleDeepLink(deepLink);
        }
      }, onError: (err) {
        debugPrint('Deep link error: $err');
      });
    } catch (e) {
      debugPrint('Error initializing deep links: $e');
    }
  }

  void _handleDeepLink(Uri deepLink) {
    // Check the path and query parameters
    debugPrint('Handling deep link: $deepLink');
    if (deepLink.path == '/confirm-login') {
      final token = deepLink.queryParameters['token'];
      if (token != null) {
        debugPrint('Navigating to LoginScreen with token: $token');
        // Navigate to LoginScreen and pass the token as an argument
        Get.toNamed('/confirm-login', arguments: {'token': token});
        return;
      }
    }
    debugPrint('No matching deep link found. Staying on the current screen.');
  }

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      home: SingUpScreen(),
      initialRoute: '/',
      getPages: [
        GetPage(name: '/', page: () => SingUpScreen()),
        GetPage(
          name: '/confirm-login',
          page: () => LoginScreen(),
        ),
      ],
    );
  }
}

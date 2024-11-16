import 'package:cookie_jar/cookie_jar.dart';
import 'package:dio/dio.dart';
import 'package:dio_cookie_manager/dio_cookie_manager.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:get/get.dart';
import 'package:ntsmetrics/Otpforlogin/view/Otp_for_login_screen.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../Global/GetTokens.dart';
import '../../baseurl.dart';
import '../../createpinscreen/view/create_pin_screen.dart';
import '../../otp/view/otp_screen.dart';

class LoginController extends GetxController{
  final FlutterSecureStorage storage = FlutterSecureStorage();
  final Dio dio = Dio();
  final GetTokens getTokens = GetTokens();
  final cookieJar = CookieJar();
  RxBool isLoading = false.obs;
  RxBool isCaptchaLoading = false.obs;
  RxBool isOtpLoading = false.obs;
  final emailController = TextEditingController().obs;
  final passwordController = TextEditingController().obs;
  final captchaController = TextEditingController().obs;
  final phoneOtpController = TextEditingController().obs;
  final emailOtpController = TextEditingController().obs;

  LoginController() {
    dio.interceptors.add(CookieManager(cookieJar));
  }

  Future<String> getSignInCaptcha() async {
    isCaptchaLoading.value = true;
    try {
      final response = await dio.get("$baseUrl/auth/captcha");

      if (response.statusCode == 200) {
        print("INnnnnnnnnnnnnnnnnnnnsiddddddddddeeeeeeeee loginnnnnnnnnnnnnn");
        final cookies = response.headers['set-cookie'];
        print("cookies $cookies");
        if (cookies != null) {
          String? sessionId;

          for (var cookie in cookies) {
            if (cookie.contains('connect.sid=')) {
              sessionId = Uri.decodeComponent(cookie.split('connect.sid=')[1].split(';')[0]);
            }
          }

          if (sessionId != null) {
            try {
              final prefs = await SharedPreferences.getInstance();
              await prefs.setString('sessionId', sessionId);
              print('Stored sessionId successfully from login $sessionId');
            } catch (e) {
              print("cookies: $cookies");
              print("sessionId: $sessionId");
              print('Error writing sessionId to SharedPreferences: $e');
            }
          } else {
            print('Session ID is null');
          }
        }
        isCaptchaLoading.value = false;
        final responseData = response.data;
        final image = responseData["image"];
        return image;
      } else {
        isCaptchaLoading.value = false;
        print("response $response");
        print("responseData ${response.data}");
        Get.snackbar("Error", "Error occurred");
        return "";
      }
    } catch (error) {
      handleError(error.toString() as DioError);
      return '';
    }
  }

  Future<void> signIn() async {
    isLoading.value = true;
    try {
      final data = {
        "email": emailController.value.text,
        "password": passwordController.value.text,
        "captcha": captchaController.value.text
      };

      final tokens = await getTokens.getTokens();
      final sessionId = tokens['connect.sid'];
      print('Session ID: $sessionId');

      final response = await dio.post("$baseUrl/auth/login",
          data: data,
          options: Options(
              headers: {
                'Content-Type':'application/json',
                'Cookie': 'connect.sid=$sessionId',
              }
          )
      );

      if (response.statusCode == 200) {
        // final cookies = response.headers['set-cookie'];
        // if (cookies != null) {
        //   String? sessionId;
        //
        //   for (var cookie in cookies) {
        //     if (cookie.contains('connect.sid=')) {
        //       sessionId = Uri.decodeComponent(cookie.split('connect.sid=')[1].split(';')[0]);
        //     }
        //   }
        //
        //   if (sessionId != null) {
        //     try {
        //       final prefs = await SharedPreferences.getInstance();
        //       await prefs.setString('sessionId', sessionId);
        //       print('Stored sessionId successfully');
        //     } catch (e) {
        //       print("cookies: $cookies");
        //       print("sessionId: $sessionId");
        //       print('Error writing sessionId to SharedPreferences: $e');
        //     }
        //   } else {
        //     print('Session ID is null');
        //   }
        // }
        final cookies = response.headers['set-cookie'];
        print("cookies $cookies");
        if (cookies != null) {
          String? sessionId;

          for (var cookie in cookies) {
            if (cookie.contains('connect.sid=')) {
              sessionId = Uri.decodeComponent(cookie.split('connect.sid=')[1].split(';')[0]);
            }
          }

          if (sessionId != null) {
            try {
              final prefs = await SharedPreferences.getInstance();
              await prefs.setString('sessionId', sessionId);
              print('Stored sessionId successfully from login $sessionId');
            } catch (e) {
              print("cookies: $cookies");
              print("sessionId: $sessionId");
              print('Error writing sessionId to SharedPreferences: $e');
            }
          } else {
            print('Session ID is null');
          }
        }
        isLoading.value = false;
        Get.off(OtpForLoginScreen());
        //isSignUpSuccess.value = true;
        print(response.data["message"]);
      } else {
        isLoading.value = false;
        Get.snackbar("Error", "Error occurred");
      }
    } catch(error) {
      if (error is DioError) {
        isLoading.value = false;
        print('DioError: ${error.toString()}');
        if (error.response != null) {
          print('Error Response Data: ${error.response?.data}');
        }
        final errorMessage = error.response?.data['message'] ?? 'An error occurred. Please try again.';
      } else {
        isLoading.value = false;
      }
    }
  }

  Future<void> verifyOtp() async {
    isOtpLoading.value = true;
    try {
      final data = {
        //  "emailOtp": emailOtpController.value.text,
        // "phoneOtp": phoneOtpController.value.text,
        "emailOtp": int.tryParse(emailOtpController.value.text) ?? 0,
        "phoneOtp": int.tryParse(phoneOtpController.value.text) ?? 0,
      };

      final tokens = await getTokens.getTokens();
      final sessionId = tokens['connect.sid'];
      print('Session ID: $sessionId');

      print("data $data");

      final response = await dio.post("$baseUrl/auth/login/verify-otp",
          data: data,
          options: Options(
              headers: {
                'Content-Type':'application/json',
                'Cookie': 'connect.sid=$sessionId',
              }
          )
      );

      print("response $response");

      print("response data ${response.data}");

      print("statuscode ${response.statusCode}");

      if (response.statusCode == 200) {
        var responseData = response.data;
        isOtpLoading.value = false;
        Get.off(CreatePinScreen());
      } else {
        isOtpLoading.value = false;
        Get.snackbar("Error", "Error occurred");
      }
    } catch(error) {
      if (error is DioError) {
        isOtpLoading.value = false;
        if (error.response != null) {
          Get.snackbar("Error", "${error.response?.data['message']}");
        }
        print("error $error");
        var errorMessage = error.message;
        print("$errorMessage");
      } else {
        isOtpLoading.value = false;
      }
    }
  }

  void handleError(DioError error) {
    isCaptchaLoading.value = false;
    if (error.response != null) {
      print("error response ${error.response}");
      final errorMessage = error.response?.data['message'] ?? 'An error occurred. Please try again.';
      print('Error: $errorMessage');
    } else {
      print('An unknown error occurred');
    }
  }

  Future<void> getToken() async {
    //GetTokens getToken = GetTokens();
    final tokens = await getTokens.getTokens();
    final sessionId = tokens['connect.sid'];
    print('Session ID: $sessionId');
  }

  Future<void> delToken() async {
    //GetTokens getToken = GetTokens();
    //final tokens =
    await getTokens.clearAllTokens();
    // final sessionId = tokens['connect.sid'];
    // print('Session ID: $sessionId');
  }

}
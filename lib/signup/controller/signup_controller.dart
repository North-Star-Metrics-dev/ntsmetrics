import 'package:dio/dio.dart';
import 'package:dio_cookie_manager/dio_cookie_manager.dart';
import 'package:cookie_jar/cookie_jar.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_rx/src/rx_types/rx_types.dart';
import 'package:get/get_state_manager/src/simple/get_controllers.dart';
import 'package:ntsmetrics/2FA/view/2FA_screen.dart';
import 'package:ntsmetrics/otp/view/otp_screen.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../Global/GetTokens.dart';
import '../../baseurl.dart';

class SignUpController extends GetxController {
  final FlutterSecureStorage storage = FlutterSecureStorage();
  final Dio dio = Dio();
  final GetTokens getTokens = GetTokens();
  final cookieJar = CookieJar();
  RxBool isSignUpSuccess = false.obs;
  RxBool isLoading = false.obs;
  RxBool isCaptchaLoading = false.obs;
  RxBool isOtpLoading = false.obs;
  final emailController = TextEditingController().obs;
  final passwordController = TextEditingController().obs;
  final confirmPasswordController = TextEditingController().obs;
  final phoneNumberController = TextEditingController().obs;
  final captchaController = TextEditingController().obs;
  final phoneOtpController = TextEditingController().obs;
  final emailOtpController = TextEditingController().obs;

  SignUpController() {
    dio.interceptors.add(CookieManager(cookieJar));
    // dio.interceptors.add(InterceptorsWrapper(
    //   onRequest: (options, handler) {
    //     print("Request Headers: ${options.headers}");
    //     return handler.next(options);
    //   },
    // ));
  }

  Future<String> getSignUpCaptcha() async {
    isCaptchaLoading.value = true;
    try {
      final response = await dio.get("$baseUrl/auth/captcha");

      if (response.statusCode == 200) {
        isCaptchaLoading.value = false;
        final responseData = response.data;
        final image = responseData["image"];
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
        //       await _storage.write(key: 'sessionId', value: sessionId);
        //       print('Stored sessionId successfully');
        //     } catch (e) {
        //       print('Error writing sessionId to storage: $e');
        //     }
        //
        //     final storedSessionId = await _storage.read(key: 'sessionId');
        //   } else {
        //     print('Session ID is null');
        //   }
        //
        //
        // }
        return image;
      } else {
        isCaptchaLoading.value = false;
        Get.snackbar("Error", "Error occurred");
        return "";
      }
    } catch (error) {
      handleError(error.toString() as DioError);
      return '';
    }
  }

  Future<void> signUp() async {
    isLoading.value = true;
    try {
      final data = {
        "email": emailController.value.text,
        "password": passwordController.value.text,
        "confirmpassword": confirmPasswordController.value.text,
        "phone": phoneNumberController.value.text,
        "countryCode": "91",
        "captcha": captchaController.value.text
      };

      final response = await dio.post("$baseUrl/auth/register", data: data);

      if (response.statusCode == 200) {
        final cookies = response.headers['set-cookie'];
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
        //       await storage.write(key: 'sessionId', value: sessionId);
        //       print('Stored sessionId successfully');
        //     } catch (e) {
        //       print("cookies $cookies");
        //       print("sessionid = $sessionId");
        //       print('Error writing sessionId to storage: $e');
        //     }
        //
        //     final storedSessionId = await storage.read(key: 'sessionId');
        //   } else {
        //     print('Session ID is null');
        //   }
        // }
        if (cookies != null) {
          String? sessionId;

          for (var cookie in cookies) {
            if (cookie.contains('connect.sid=')) {
              sessionId = Uri.decodeComponent(cookie.split('connect.sid=')[1].split(';')[0]);
            }
          }

          if (sessionId != null) {
            try {
              // Save the session ID using SharedPreferences
              final prefs = await SharedPreferences.getInstance();
              await prefs.setString('sessionId', sessionId);
              print('Stored sessionId successfully');
            } catch (e) {
              print("cookies: $cookies");
              print("sessionId: $sessionId");
              print('Error writing sessionId to SharedPreferences: $e');
            }

            // Retrieve the stored session ID
            final prefs = await SharedPreferences.getInstance();
            final storedSessionId = prefs.getString('sessionId');
            print('Retrieved stored sessionId: $storedSessionId');
          } else {
            print('Session ID is null');
          }
        }
        isLoading.value = false;
        Get.off(OtpScreen(controller: this,));
        isSignUpSuccess.value = true;
        print(response.data["message"]);
      } else {
        isLoading.value = false;
        Get.snackbar("Error", "Error occurred");
      }
    }
    // catch (error) {
    //   handleError(error as DioError);
    // }
    catch(error) {
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
        // "emailOtp": emailOtpController.value.text,
        // "phoneOtp": phoneOtpController.value.text,
        "emailOtp": int.tryParse(emailOtpController.value.text) ?? 0,
        "phoneOtp": int.tryParse(phoneOtpController.value.text) ?? 0,
      };

      // final tokens = await getTokens.getTokens();
      // final sessionId = tokens['connect.sid'];
      final tokens = await getTokens.getTokens();
      final sessionId = tokens['connect.sid'];
      print('Session ID: $sessionId');

      print("data $data");

      final response = await dio.post("$baseUrl/auth/register/verify-otp",
          data: data,
          options: Options(
              headers: {
                'Content-Type':'application/json',
                'Cookie': 'connect.sid=$sessionId',
              }
          )
      );

      print("response $response");

      if (response.statusCode == 200) {
        var responseData = response.data;
        print("response data $responseData");
        isOtpLoading.value = false;
        //Get.off(OtpScreen());
        Get.off(TwoFactorAuthenticationScreen());
        print(response.data["message"]);
      } else {
        isOtpLoading.value = false;
        Get.snackbar("Error", "Error occurred");
      }
    } catch (error) {
      handleError(error as DioError);
    }
  }

  void handleError(DioError error) {
    isLoading.value = false;
    isCaptchaLoading.value = false;
    if (error.response != null) {
      print("error response ${error.response}");
      final errorMessage = error.response?.data['message'] ?? 'An error occurred. Please try again.';
      print('Error: $errorMessage');
    } else {
      print('An unknown error occurred');
    }
  }
}

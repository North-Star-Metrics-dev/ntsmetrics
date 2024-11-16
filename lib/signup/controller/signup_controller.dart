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
import 'package:ntsmetrics/createpinscreen/view/create_pin_screen.dart';
import 'package:ntsmetrics/login/view/login_screen.dart';
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
  RxBool isCreatingPinLoading = false.obs;
  final emailController = TextEditingController().obs;
  final passwordController = TextEditingController().obs;
  final confirmPasswordController = TextEditingController().obs;
  final phoneNumberController = TextEditingController().obs;
  final captchaController = TextEditingController().obs;
  final phoneOtpController = TextEditingController().obs;
  final emailOtpController = TextEditingController().obs;
  final pinController = TextEditingController().obs;

  SignUpController() {
    dio.interceptors.add(CookieManager(cookieJar));
  }

  Future<String> getSignUpCaptcha() async {
    isCaptchaLoading.value = true;
    try {
      final response = await dio.get("$baseUrl/auth/captcha");

      if (response.statusCode == 200) {
        final cookies = response.headers['set-cookie'];
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
            } catch (e) {
              print('Error writing sessionId to SharedPreferences: $e');
            }
          }
        }
        isCaptchaLoading.value = false;
        final responseData = response.data;
        final image = responseData["image"];
        return image;
      } else {
        isCaptchaLoading.value = false;
        Get.snackbar("Error", "Error occurred");
        return "";
      }
    } catch(error) {
      if (error is DioError) {
        isCaptchaLoading.value = false;
        if (error.response != null) {
          Get.snackbar("Error", "${error.response?.data['message']}");
          return "";
        }
      } else {
        isCaptchaLoading.value = false;
        return "";
      }
      return "";
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

      final tokens = await getTokens.getTokens();
      final sessionId = tokens['connect.sid'];

      final response = await dio.post("$baseUrl/auth/register",
          data: data,
          options: Options(
              headers: {
                'Content-Type':'application/json',
                'Cookie': 'connect.sid=$sessionId',
              }
          )
      );

      if (response.statusCode == 200) {
        isLoading.value = false;
        Get.off(OtpScreen());
        isSignUpSuccess.value = true;
      } else {
        isLoading.value = false;
        Get.snackbar("Error", "Error occurred");
      }
    } catch(error) {
      if (error is DioError) {
        isLoading.value = false;
        if (error.response != null) {
          Get.snackbar("Error", "${error.response?.data['message']}");
        }
      } else {
        isLoading.value = false;
      }
    }
  }

  Future<void> verifyOtp() async {
    isOtpLoading.value = true;
    try {
      final data = {
        "emailOtp": int.tryParse(emailOtpController.value.text) ?? 0,
        "phoneOtp": int.tryParse(phoneOtpController.value.text) ?? 0,
      };

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
      } else {
        isOtpLoading.value = false;
      }
    }
  }

  Future<void> createPin() async {
    isCreatingPinLoading.value = true;
    try {
      final data = {
        "pin": pinController.value.text
      };

      final tokens = await getTokens.getTokens();
      final sessionId = tokens['connect.sid'];
      print("before token $sessionId");

      final response = await dio.post("$baseUrl/auth/register/create-pin",
          data: data,
          options: Options(
              headers: {
                'Content-Type':'application/json',
                'Cookie': 'connect.sid=$sessionId',
              }
          )
      );

      if (response.statusCode == 201) {
        await getTokens.clearAllTokens();
        final sessionId2 = tokens['connect.sid'];
        print("after token $sessionId2");
        isCreatingPinLoading.value = false;

        Get.off(LoginScreen());
        Get.snackbar("Success", "User Created Successfully");
        // await getTokens.clearAllTokens();
        // final remainingTokens = await getTokens.getTokens();
        // if (remainingTokens.isEmpty) {
        //   // Tokens cleared successfully, proceed
        //   print("Tokens cleared successfully");
        //   Get.off(() => LoginScreen());
        //   Get.snackbar("Success", "User Created Successfully");
        // } else {
        //   // Handle token clearance failure
        //   Get.snackbar("Error", "Failed to clear tokens. Please try again.");
        // }
      } else {
        isCreatingPinLoading.value = false;
        Get.snackbar("Error", "Error occurred");
      }
    } catch(error) {
      if (error is DioError) {
        isCreatingPinLoading.value = false;
        if (error.response != null) {
          Get.snackbar("Error", "${error.response?.data['message']}");
        }
      } else {
        isCreatingPinLoading.value = false;
      }
    }
  }

  // Future<void> createPin() async {
  //   isCreatingPinLoading.value = true;
  //   try {
  //     final data = {
  //       "pin": pinController.value.text,
  //     };
  //
  //     final tokens = await getTokens.getTokens();
  //     final sessionId = tokens['connect.sid'];
  //
  //     final response = await dio.post(
  //       "$baseUrl/auth/register/create-pin",
  //       data: data,
  //       options: Options(
  //         headers: {
  //           'Content-Type': 'application/json',
  //           'Cookie': 'connect.sid=$sessionId',
  //         },
  //       ),
  //     );
  //
  //     if (response.statusCode == 201) {
  //       await getTokens.clearAllTokens();
  //
  //       // Confirm that tokens are cleared
  //       final remainingTokens = await getTokens.getTokens();
  //       if (remainingTokens.isEmpty) {
  //         isCreatingPinLoading.value = false;
  //         Get.off(() => LoginScreen());
  //         Get.snackbar("Success", "User Created Successfully");
  //       } else {
  //         throw Exception("Failed to clear tokens");
  //       }
  //     } else {
  //       isCreatingPinLoading.value = false;
  //       Get.snackbar("Error", "Error occurred");
  //     }
  //   } catch (error) {
  //     isCreatingPinLoading.value = false;
  //     if (error is DioError && error.response != null) {
  //       Get.snackbar("Error", "${error.response?.data['message']}");
  //     } else if (error is Exception) {
  //       Get.snackbar("Error", error.toString());
  //     } else {
  //       Get.snackbar("Error", "An unexpected error occurred");
  //     }
  //   }
  // }
}

import 'package:cookie_jar/cookie_jar.dart';
import 'package:dio/dio.dart';
import 'package:dio_cookie_manager/dio_cookie_manager.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:get/get.dart';
import 'package:ntsmetrics/2FA/view/2FA_screen.dart';
import 'package:ntsmetrics/Otpforlogin/view/Otp_for_login_screen.dart';
import 'package:ntsmetrics/selectpaymentmethod/view/payment_method_screen.dart';
import 'package:ntsmetrics/steps/view/steps_screen.dart';
import 'package:ntsmetrics/verifypinforlogin/view/verify_pin_for_login.dart';
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
  RxBool isCheckingPinLoading = false.obs;
  RxBool isTwoFactorLoading = false.obs;
  RxBool isResendingPhoneOtp = false.obs;
  RxBool isResendingEmailOtp = false.obs;
  final emailController = TextEditingController().obs;
  final passwordController = TextEditingController().obs;
  final captchaController = TextEditingController().obs;
  final phoneOtpController = TextEditingController().obs;
  final emailOtpController = TextEditingController().obs;
  final pinController = TextEditingController().obs;
  final twoFactorAuthenticationController = TextEditingController().obs;


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
      isCaptchaLoading.value = false;
      if (error is DioError && error.response != null) {
        final statusCode = error.response!.statusCode;
        final message = error.response!.data['message'] ?? "Unknown error";

        switch (statusCode) {
          case 500:
            Get.snackbar("User creation failed", message);
            break;
          default:
            Get.snackbar("Error", message);
            break;
        }
        return "";
      } else {
        Get.snackbar("Error", "Something went wrong. Please try again.");
        return "";
      }
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
        Get.snackbar(response.data['code'], response.data['message'] ?? "Logged in successfully");
        Get.off(OtpForLoginScreen());
        print(response.data["message"]);
      } else {
        isLoading.value = false;
        Get.snackbar("Error", "Error occurred");
      }
    } catch (error) {
      isLoading.value = false;
      if (error is DioError && error.response != null) {
        final statusCode = error.response!.statusCode;
        final message = error.response!.data['message'] ?? "Unknown error";
        final title = error.response!.data["code"] ?? "Unknown";

        switch (statusCode) {
          case 400:
            Get.snackbar(title, message);
            break;
          case 401:
            Get.snackbar(title, message);
            break;
          case 404:
            Get.snackbar(title, message);
            break;
          case 409:
            Get.snackbar(title, message);
            break;
          case 500:
            Get.snackbar(title, message);
            break;
          default:
            Get.snackbar("Error", message);
            break;
        }
      } else {
        Get.snackbar("Error", "Something went wrong. Please try again.");
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
        Get.snackbar(response.data['code'], response.data['message'] ?? "OTP's verified");
        Get.off(VerifyPinForLogin());
      } else {
        isOtpLoading.value = false;
        Get.snackbar("Error", "Error occurred");
      }
    } catch (error) {
      isOtpLoading.value = false;
      if (error is DioError && error.response != null) {
        final statusCode = error.response!.statusCode;
        final message = error.response!.data['message'] ?? "Unknown error";
        final title = error.response!.data['code'] ?? "Unknown";

        switch (statusCode) {
          case 400:
            Get.snackbar(title, message);
            break;
          case 401:
            Get.snackbar(title, message);
            break;
          case 403:
            Get.snackbar(title, message);
            break;
          default:
            Get.snackbar("Error", message);
            break;
        }
      } else {
        Get.snackbar("Error", "Something went wrong. Please try again.");
      }
    }
  }

  Future<void> createPin() async {
    isCheckingPinLoading.value = true;
    try {
      final data = {
        "pin": pinController.value.text
      };

      final tokens = await getTokens.getTokens();
      final sessionId = tokens['connect.sid'];
      print("before token $sessionId");

      final response = await dio.post("$baseUrl/auth/login/verify-pin",
          data: data,
          options: Options(
              headers: {
                'Content-Type':'application/json',
                'Cookie': 'connect.sid=$sessionId',
              },
            responseType: ResponseType.bytes,
          )
      );

      //print("response $response");

      print("response data ${response.data}");

      print("statuscode ${response.statusCode}");

      //print("headerssssssssssssssssssssss ${response.headers}");

      if (response.statusCode == 200) {
        //await getTokens.clearAllTokens();
        //final sessionId2 = tokens['connect.sid'];
        final responseData = response.data;
        //print("after token $sessionId2");
        isCheckingPinLoading.value = false;

        Get.off(TwoFactorAuthenticationScreen(imageBytes: responseData));
        Get.snackbar(responseData['code'], responseData['message']);
      } else {
        isCheckingPinLoading.value = false;
        Get.snackbar("Error", "Error occurred");
      }
    } catch (error) {
      isCheckingPinLoading.value = false;
      if (error is DioError && error.response != null) {
        final statusCode = error.response!.statusCode;
        final message = error.response!.data['message'] ?? "Unknown error";
        final title = error.response!.data['code'] ?? "Unknown";

        switch (statusCode) {
          case 400:
            Get.snackbar(title, message);
            break;
          case 401:
            Get.snackbar(title, message);
            break;
          case 403:
            Get.snackbar(title, message);
            break;
          case 409:
            Get.snackbar(title, message);
            break;
          default:
            Get.snackbar("Error", message);
            break;
        }
      } else {
        Get.snackbar("Error", "Something went wrong. Please try again.");
      }
    }
  }

  Future<void> verify2FA() async {
    isTwoFactorLoading.value = true;
    try {
      final data = {
        "twoFAcode":twoFactorAuthenticationController.value.text
      };

      final tokens = await getTokens.getTokens();
      final sessionId = tokens['connect.sid'];
      print('Session ID: $sessionId');

      print("data $data");

      final response = await dio.post("$baseUrl/auth/login/verify-2fa",
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
        isTwoFactorLoading.value = false;

        // Save accessToken and refreshToken to SharedPreferences
        // final prefs = await SharedPreferences.getInstance();
        // await prefs.setString('accessToken', response.data['accessToken']);
        // await prefs.setString('refreshToken', response.data['refreshToken']);
        final cookies = response.headers['set-cookie'];
        print("cookies $cookies");

        Get.snackbar(response.data['code'], response.data['message']);
        Get.off(StepsScreen());
      } else {
        isTwoFactorLoading.value = false;
        Get.snackbar("Error", "Error occurred");
      }
    } catch (error) {
      isTwoFactorLoading.value = false;
      if (error is DioError && error.response != null) {
        final statusCode = error.response!.statusCode;
        final message = error.response!.data['message'] ?? "Unknown error";
        final title = error.response!.data['code'] ?? "Unknown";

        switch (statusCode) {
          case 401:
            Get.snackbar(title, message);
            break;
          case 403:
            Get.snackbar(title, message);
            break;
          case 500:
            Get.snackbar(title, message);
            break;
          default:
            Get.snackbar("Error", message);
            break;
        }
      } else {
        Get.snackbar("Error", "Something went wrong. Please try again.");
      }
    }
  }

  Future<void> resendPhoneOtp() async {
    isResendingPhoneOtp.value = true;
    try {
      final tokens = await getTokens.getTokens();
      final sessionId = tokens['connect.sid'];
      print("before token $sessionId");

      final response = await dio.post("$baseUrl/auth/resend-phone-otp",
          options: Options(
              headers: {
                'Content-Type':'application/json',
                'Cookie': 'connect.sid=$sessionId',
              }
          )
      );

      if (response.statusCode == 200) {
        isResendingPhoneOtp.value = false;
        var responseBody = response.data;

        Get.snackbar("${responseBody["code"]}", "${responseBody["message"]}");
      } else {
        isResendingPhoneOtp.value = false;
        Get.snackbar("Error", "Error occurred");
      }
    } catch (error) {
      isResendingPhoneOtp.value = false;
      if (error is DioError && error.response != null) {
        final statusCode = error.response!.statusCode;
        final message = error.response!.data['message'] ?? "Unknown error";

        switch (statusCode) {
          case 400:
            Get.snackbar("Error", message);
            break;
          case 401:
            Get.snackbar("Error", message);
            break;
          case 500:
            Get.snackbar("Error", message);
            break;
          default:
            Get.snackbar("Error", message);
            break;
        }
      } else {
        Get.snackbar("Error", "Something went wrong. Please try again.");
      }
    }
  }

  Future<void> resendEmailOtp() async {
    isResendingEmailOtp.value = true;
    try {
      final tokens = await getTokens.getTokens();
      final sessionId = tokens['connect.sid'];
      print("before token $sessionId");

      final response = await dio.post("$baseUrl/auth/resend-email-otp",
          options: Options(
              headers: {
                'Content-Type':'application/json',
                'Cookie': 'connect.sid=$sessionId',
              }
          )
      );

      if (response.statusCode == 200) {
        isResendingEmailOtp.value = false;
        var responseBody = response.data;

        Get.snackbar("${responseBody["code"]}", "${responseBody["message"]}");
      } else {
        isResendingEmailOtp.value = false;
        Get.snackbar("Error", "Error occurred");
      }
    } catch (error) {
      isResendingEmailOtp.value = false;
      if (error is DioError && error.response != null) {
        final statusCode = error.response!.statusCode;
        final message = error.response!.data['message'] ?? "Unknown error";

        switch (statusCode) {
          case 400:
            Get.snackbar("Error", message);
            break;
          case 401:
            Get.snackbar("Error", message);
            break;
          case 500:
            Get.snackbar("Error", message);
            break;
          default:
            Get.snackbar("Error", message);
            break;
        }
      } else {
        Get.snackbar("Error", "Something went wrong. Please try again.");
      }
    }
  }

}
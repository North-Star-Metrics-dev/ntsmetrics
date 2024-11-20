import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get_state_manager/src/rx_flutter/rx_obx_widget.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:ntsmetrics/login/controller/login_controller.dart';
import 'package:pin_code_fields/pin_code_fields.dart';


class OtpForLoginScreen extends StatefulWidget {
  const OtpForLoginScreen({super.key});

  @override
  State<OtpForLoginScreen> createState() => _OtpForLoginScreenState();
}

class _OtpForLoginScreenState extends State<OtpForLoginScreen> {
  LoginController controller = LoginController();

  @override
  void initState() {
    super.initState();
    controller.phoneOtpController.value.addListener(() {
      print("phone OTP Controller value:  ${controller.phoneOtpController.value.text}");
    });
    controller.emailOtpController.value.addListener(() {
      print("email OTP Controller value:  ${controller.emailOtpController.value.text}");
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(height: MediaQuery.of(context).size.height * 0.25),
            Center(
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: SizedBox(
                  child: Card(
                    elevation: 30,
                    shadowColor: Color(0xFFE3E3E3),
                    color: Colors.white,
                    child: Padding(
                      padding: const EdgeInsets.all(20.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Enter 6 digit codes',
                            style: GoogleFonts.alata(
                              fontSize: 18,
                              fontWeight: FontWeight.w400,
                              color: Color(0xFF2C2C2C),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(top: 10),
                            child: Text(
                              'Two 6 digit codes should have come to your email address and to your mobile number that you indicated.',
                              style: GoogleFonts.alata(
                                fontSize: 14,
                                fontWeight: FontWeight.w400,
                                color: Color(0xFF2C2C2C),
                              ),
                            ),
                          ),
                          //phone otp text
                          Padding(
                            padding: const EdgeInsets.only(top: 10),
                            child: Text(
                              'Phone OTP',
                              style: GoogleFonts.alata(
                                fontSize: 14,
                                fontWeight: FontWeight.w600,
                                color: Color(0xFF2C2C2C),
                              ),
                            ),
                          ),
                          //phone otp field
                          Padding(
                            padding: const EdgeInsets.only(top: 20),
                            child: PinCodeTextField(
                              controller: controller.phoneOtpController.value,
                              appContext: context,
                              pastedTextStyle: TextStyle(
                                color: Colors.green.shade600,
                                fontWeight: FontWeight.bold,
                              ),
                              length: 6,
                              animationType: AnimationType.fade,
                              pinTheme: PinTheme(
                                shape: PinCodeFieldShape.box,
                                borderRadius: BorderRadius.circular(5),
                                fieldHeight: 55,
                                fieldWidth: 40,
                                activeColor: Color(0xFF00AEF7),
                                activeFillColor: Color(0xFFE3E3E3).withOpacity(0.15),
                                inactiveColor: Colors.grey[400]!,
                                inactiveFillColor: Color(0xFFE3E3E3).withOpacity(0.15),
                                selectedColor: Color(0xFF00AEF7),
                                selectedFillColor: Color(0xFFE3E3E3).withOpacity(0.15),
                              ),
                              animationDuration: const Duration(milliseconds: 300),
                              keyboardType: TextInputType.number,
                              onChanged: (value) {},
                              onCompleted: (value) {
                                print("Completed OTP: $value");
                              },
                              cursorColor: Color(0xFF00AEF7),
                              enableActiveFill: true,
                            ),
                          ),
                          //resend phone otp text
                          Align(
                            alignment: Alignment.centerRight,
                            child: InkWell(
                                onTap: () {
                                  controller.resendPhoneOtp();
                                },
                                child: Obx(() {
                                  return controller.isResendingPhoneOtp.value == false ?
                                  Text(
                                    'Resend Phone OTP',
                                    style: GoogleFonts.alata(
                                      fontSize: 14,
                                      fontWeight: FontWeight.w600,
                                      color: Color(0xFF00D1FF),
                                    ),
                                  )
                                      :
                                  Container(
                                    height: 15,
                                    width: 15,
                                    child: CircularProgressIndicator(),
                                  );
                                })
                            ),
                          ),
                          //email otp text
                          Padding(
                            padding: const EdgeInsets.only(top: 10),
                            child: Text(
                              'Email OTP',
                              style: GoogleFonts.alata(
                                fontSize: 14,
                                fontWeight: FontWeight.w600,
                                color: Color(0xFF2C2C2C),
                              ),
                            ),
                          ),
                          //email otp field
                          Padding(
                            padding: const EdgeInsets.only(top: 20),
                            child: PinCodeTextField(
                              controller: controller.emailOtpController.value,
                              appContext: context,
                              pastedTextStyle: TextStyle(
                                color: Colors.green.shade600,
                                fontWeight: FontWeight.bold,
                              ),
                              length: 6,
                              animationType: AnimationType.fade,
                              pinTheme: PinTheme(
                                shape: PinCodeFieldShape.box,
                                borderRadius: BorderRadius.circular(5),
                                fieldHeight: 55,
                                fieldWidth: 40,
                                activeColor: Color(0xFF00AEF7),
                                activeFillColor: Color(0xFFE3E3E3).withOpacity(0.15),
                                inactiveColor: Colors.grey[400]!,
                                inactiveFillColor: Color(0xFFE3E3E3).withOpacity(0.15),
                                selectedColor: Color(0xFF00AEF7),
                                selectedFillColor: Color(0xFFE3E3E3).withOpacity(0.15),
                              ),
                              animationDuration: const Duration(milliseconds: 300),
                              keyboardType: TextInputType.number,
                              onChanged: (value) {},
                              onCompleted: (value) {
                                print("Completed OTP: $value");
                              },
                              cursorColor: Color(0xFF00AEF7),
                              enableActiveFill: true,
                            ),
                          ),
                          //resend otp text
                          Align(
                            alignment: Alignment.centerRight,
                            child: InkWell(
                                onTap: () {
                                  controller.resendEmailOtp();
                                },
                                child: Obx(() {
                                  return controller.isResendingEmailOtp.value == false ?
                                  Text(
                                    'Resend Email OTP',
                                    style: GoogleFonts.alata(
                                      fontSize: 14,
                                      fontWeight: FontWeight.w600,
                                      color: Color(0xFF00D1FF),
                                    ),
                                  )
                                      :
                                  Container(
                                    height: 15,
                                    width: 15,
                                    child: CircularProgressIndicator(),
                                  );
                                })
                            ),
                          ),

                          Padding(
                            padding: const EdgeInsets.only(top: 15),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                SizedBox(
                                  width: MediaQuery.of(context).size.width * 0.35,
                                  height: 50,
                                  child: ElevatedButton(
                                      onPressed: () {
                                        print("pressed  ${controller.phoneOtpController.value.text} & ${controller.emailOtpController.value.text}");
                                        controller.verifyOtp();
                                      },
                                      style: ElevatedButton.styleFrom(
                                        backgroundColor: Color(0xFF00D1FF),
                                        shape: RoundedRectangleBorder(
                                          borderRadius: BorderRadius.circular(8),
                                        ),
                                      ),
                                      child: Obx(() {
                                        return controller.isOtpLoading.value == false ?
                                        Text(
                                          'Confirm',
                                          style: GoogleFonts.alata(
                                            fontSize: 16,
                                            fontWeight: FontWeight.w400,
                                            color: Color(0xFFFFFFFF),
                                          ),
                                        )
                                            :
                                        Container(
                                            height: 20,
                                            width: 20,
                                            child: Center(child: CircularProgressIndicator()));
                                      })
                                  ),
                                ),
                              ],
                            ),
                          )
                        ],
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

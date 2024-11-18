import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:get/get_state_manager/src/rx_flutter/rx_obx_widget.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:ntsmetrics/login/controller/login_controller.dart';
import 'package:pin_code_fields/pin_code_fields.dart';
import 'dart:typed_data';


class TwoFactorAuthenticationScreen extends StatefulWidget {
  final Uint8List imageBytes;

  const TwoFactorAuthenticationScreen({required this.imageBytes});

  @override
  State<TwoFactorAuthenticationScreen> createState() => _TwoFactorAuthenticationScreenState();
}

class _TwoFactorAuthenticationScreenState extends State<TwoFactorAuthenticationScreen> {
  LoginController controller = LoginController();

  @override
  void initState() {
    super.initState();
    controller.twoFactorAuthenticationController.value.addListener(() {
      print("phone OTP Controller value:  ${controller.phoneOtpController.value.text}");
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        leading: IconButton(
          icon: Icon(Icons.arrow_back,
            color: Color(0xFF2C2C2C),
            size: 26.2,
          ),
          onPressed: () {
            // Handle back button press
          },
        ),
        title: Text('2FA',
          style: GoogleFonts.alata(
            fontSize: 17.47,
            fontWeight: FontWeight.w400,
            color: Color(0xFF07112E),
          ),
        ),
        backgroundColor: Colors.white,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Align(
                alignment: Alignment.center,
                child: Text("Secure account with 2FA authentication",
                  style: GoogleFonts.alata(
                      fontSize: 17.47,
                      fontWeight: FontWeight.w400,
                      color: Color(0xFF07112E)
                  ),
                ),
              ),
              SizedBox(height: 16,),
              Obx(() {
                return Container(
                    child: controller.isCaptchaLoading.value == false ?
                    Align(
                      alignment: Alignment.center,
                      child: Image.memory(
                        widget.imageBytes,
                        height: 250,
                        width: 250,
                        fit: BoxFit.contain,
                      ),
                    )
                        :
                    Container(
                        height: 20,
                        width: 40,
                        child: Center(child: CircularProgressIndicator()))
                );
              }),
              SizedBox(height: 16,),
              Padding(
                padding: const EdgeInsets.only(left: 10,bottom: 10),
                child: Text("2Fa Code",
                  style: GoogleFonts.alata(
                      fontWeight: FontWeight.w400,
                      fontSize: 17.47,
                      color: Color(0xFF000000)
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 10),
                child: PinCodeTextField(
                  controller: controller.twoFactorAuthenticationController.value,
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
                    fieldWidth: 50,
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
                  onCompleted: (value) {},
                  cursorColor: Color(0xFF00AEF7),
                  enableActiveFill: true,
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
                            print("pressed  ${controller.twoFactorAuthenticationController.value.text}");
                            controller.verify2FA();
                          },
                          style: ElevatedButton.styleFrom(
                            backgroundColor: Color(0xFF00D1FF),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(8),
                            ),
                          ),
                          child: Obx(() {
                            return controller.isTwoFactorLoading.value == false ?
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
                    // SizedBox(
                    //   width: MediaQuery.of(context).size.width * 0.35,
                    //   height: 50,
                    //   child: OutlinedButton(
                    //     onPressed: () {},
                    //     child: Text(
                    //       'Cancel',
                    //       style: GoogleFonts.alata(
                    //         fontSize: 16,
                    //         fontWeight: FontWeight.w400,
                    //         color: Color(0xFF00D1FF),
                    //       ),
                    //     ),
                    //     style: OutlinedButton.styleFrom(
                    //       shape: RoundedRectangleBorder(
                    //         borderRadius: BorderRadius.circular(8),
                    //       ),
                    //       side: BorderSide(color: Color(0xFF00D1FF)),
                    //     ),
                    //   ),
                    // ),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
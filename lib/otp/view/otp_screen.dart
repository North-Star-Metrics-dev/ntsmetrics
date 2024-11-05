import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:pin_code_fields/pin_code_fields.dart';

class OtpScreen extends StatefulWidget {
  const OtpScreen({super.key});

  @override
  State<OtpScreen> createState() => _OtpScreenState();
}

class _OtpScreenState extends State<OtpScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.white,
        body: SingleChildScrollView(
          child: Column(
            children: [
              SizedBox(height: MediaQuery.of(context).size.height * 0.25,),
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
                              'Enter 4 digit code',
                              style: GoogleFonts.alata(
                                fontSize: 18,
                                fontWeight: FontWeight.w400,
                                color: Color(0xFF2C2C2C),
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.only(top: 10),
                              child: Text(
                                'A 4 digit code should have come to your email address that you indicated.',
                                style: GoogleFonts.alata(
                                  fontSize: 14,
                                  fontWeight: FontWeight.w400,
                                  color: Color(0xFF2C2C2C),
                                ),
                              ),
                            ),

                            // Pin TextField using PinCodeTextField for OTP-style input
                            Padding(
                              padding: const EdgeInsets.only(top: 20),
                              child: PinCodeTextField(
                                appContext: context,
                                length: 4,
                                obscureText: false,
                                keyboardType: TextInputType.number,
                                animationType: AnimationType.fade,
                                pinTheme: PinTheme(
                                    shape: PinCodeFieldShape.box,
                                    borderRadius: BorderRadius.circular(5), // Adjust as needed
                                    fieldHeight: 70,
                                    fieldWidth: 50,
                                    activeColor: Color(0xFF00AEF7),
                                    activeFillColor: Color(0xFFE3E3E3).withOpacity(0.15),
                                    inactiveColor: Colors.grey[400],
                                    inactiveFillColor: Color(0xFFE3E3E3).withOpacity(0.15),
                                    selectedColor: Color(0xFF00AEF7),
                                    selectedFillColor: Color(0xFFE3E3E3).withOpacity(0.15)
                                ),
                                onChanged: (value) {},
                                onCompleted: (value) {
                                  //pin = value;
                                },
                                cursorColor: Color(0xFF00Aef7),
                                enableActiveFill: true,
                              ),
                            ),

                            //confirm and cancel button
                            Padding(
                              padding: const EdgeInsets.only(top: 15),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: [
                                  SizedBox(
                                    width: MediaQuery.of(context).size.width * 0.35,
                                    height: 50,
                                    child: ElevatedButton(
                                      onPressed: () {},
                                      style: ElevatedButton.styleFrom(
                                        backgroundColor: Color(0xFF00D1FF),
                                        shape: RoundedRectangleBorder(
                                          borderRadius: BorderRadius.circular(8),
                                        ),
                                      ),
                                      child: Text(
                                        'Confirm',
                                        style: GoogleFonts.alata(
                                          fontSize: 16,
                                          fontWeight: FontWeight.w400,
                                          color: Color(0xFFFFFFFF),
                                        ),
                                      ),
                                    ),
                                  ),
                                  SizedBox(
                                    width: MediaQuery.of(context).size.width * 0.35,
                                    height: 50,
                                    child: OutlinedButton.icon(
                                      onPressed: () {
                                        // Handle sign in with Google
                                      },
                                      label: Text('Cancel',
                                        style: GoogleFonts.alata(
                                          fontSize: 16,
                                          fontWeight: FontWeight.w400,
                                          color: Color(0xFF00D1FF),
                                        ),
                                      ),
                                      style: OutlinedButton.styleFrom(
                                        shape: RoundedRectangleBorder(
                                          borderRadius: BorderRadius.circular(8),
                                        ),
                                        side: BorderSide(color: Color(0xFF00D1FF,)),
                                      ),
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
        )
    );
  }
}
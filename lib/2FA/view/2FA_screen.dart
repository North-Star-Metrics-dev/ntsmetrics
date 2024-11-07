import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:pin_code_fields/pin_code_fields.dart';


class TwoFactorAuthenticationScreen extends StatefulWidget {
  const TwoFactorAuthenticationScreen({super.key});

  @override
  State<TwoFactorAuthenticationScreen> createState() => _TwoFactorAuthenticationScreenState();
}

class _TwoFactorAuthenticationScreenState extends State<TwoFactorAuthenticationScreen> {
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
              Align(
                alignment: Alignment.center,
                  child: Image.asset("assets/images/qr.png",height: 250,width: 250,)
              ),
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
            ],
          ),
        ),
      ),
    );
  }
}

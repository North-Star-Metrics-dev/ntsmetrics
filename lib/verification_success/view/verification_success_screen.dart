import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class VerificationSuccessScreen extends StatefulWidget {
  const VerificationSuccessScreen({super.key});

  @override
  State<VerificationSuccessScreen> createState() => _VerificationSuccessScreenState();
}

class _VerificationSuccessScreenState extends State<VerificationSuccessScreen> {
  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height * 1;
    double width = MediaQuery.of(context).size.width * 1;
    return Scaffold(
      appBar: AppBar(),
      body: Column(
        //mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Center(
              child: Padding(
                padding: const EdgeInsets.only(top: 50,bottom: 50),
                child: Image.asset("assets/verification.png"),
              )
          ),
          Padding(
            padding: const EdgeInsets.only(top: 10,bottom: 10),
            child: Text("Verification Success!",
              style: GoogleFonts.sora(
                fontWeight: FontWeight.w600,
                fontSize: 16,
                color: Color(0xFF07112E)
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 10,left: 25,right: 25),
            child: Text("Your account has been successfully verified, and 2-Factor Authentication is set up. Redirecting you to the dashboard in a few seconds.",
              style: GoogleFonts.sora(
                  fontWeight: FontWeight.w400,
                  fontSize: 12,
                  color: Color(0xFF51586D)
              ),
              textAlign: TextAlign.center,
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 50),
            child: Container(
              height: height * 0.12,
              width: height * 0.14,
              decoration: BoxDecoration(
                color: Color(0xFFECEDF0),
                borderRadius: BorderRadius.circular(12)
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Text("Redirecting in",
                    style: GoogleFonts.sora(
                      fontWeight: FontWeight.w400,
                      fontSize: 12,
                    ),
                  ),
                  Text("00:08",
                    style: GoogleFonts.sora(
                      fontSize: 24,
                      fontWeight: FontWeight.w600,
                      color: Color(0xFF00D1FF)
                    ),
                  )
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}

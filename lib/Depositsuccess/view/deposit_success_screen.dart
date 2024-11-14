import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class DepositSuccessScreen extends StatefulWidget {
  const DepositSuccessScreen({super.key});

  @override
  State<DepositSuccessScreen> createState() => _DepositSuccessScreenState();
}

class _DepositSuccessScreenState extends State<DepositSuccessScreen> {
  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height * 1;
    double width = MediaQuery.of(context).size.width * 1;
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
      ),
      body: Column(
        //mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Center(
              child: Padding(
                padding: const EdgeInsets.only(top: 50,bottom: 50),
                child: Image.asset("assets/images/verification.png"),
              )
          ),
          Padding(
            padding: const EdgeInsets.only(top: 10,bottom: 10),
            child: Text("Deposit Success!",
              style: GoogleFonts.sora(
                  fontWeight: FontWeight.w600,
                  fontSize: 16,
                  color: Color(0xFF07112E)
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 10,left: 25,right: 25),
            child: Text("Your deposit of &399 via credit card has been successfully created.Your credit will be in your wallet shortly after verification process from 3rd party.",
              style: GoogleFonts.sora(
                  fontWeight: FontWeight.w400,
                  fontSize: 12,
                  color: Color(0xFF51586D)
              ),
              textAlign: TextAlign.center,
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 50,left: 16,right: 16),
            child: SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                onPressed: () {},
                style: ElevatedButton.styleFrom(
                  disabledBackgroundColor: Color(0xFF9Ca0AB),
                  disabledForegroundColor: Color(0xFF51586D),
                  backgroundColor:  Color(0xFFD6E1FF),
                  padding: EdgeInsets.symmetric(vertical: 16),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(30),
                  ),
                ),
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 10),
                  child: Text(
                    'Dismiss',
                    style: GoogleFonts.alata(
                        fontWeight: FontWeight.w400,
                        fontSize: 17.47,
                        color: Color(0xFF002280)
                    ),
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

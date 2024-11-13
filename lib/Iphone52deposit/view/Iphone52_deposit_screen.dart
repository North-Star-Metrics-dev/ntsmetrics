import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class Iphone52DepositScreen extends StatefulWidget {
  const Iphone52DepositScreen({super.key});

  @override
  State<Iphone52DepositScreen> createState() => _Iphone52DepositScreenState();
}

class _Iphone52DepositScreenState extends State<Iphone52DepositScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        title: Text("Deposit",
          style: GoogleFonts.alata(
            fontSize: 16,
            fontWeight: FontWeight.w400,
            color: Color(0xFF07112E),
          ),
        ),
        leading: IconButton(
          icon: Icon(Icons.arrow_back,
            color: Color(0xFF07112E),
            size: 22,
          ),
          onPressed: () {
            // Handle back button press
          },
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text("Saved Deposit Methods",
              style: GoogleFonts.alata(
                fontSize: 16,
                fontWeight: FontWeight.w400,
                color: Color(0xFF51586D),
              ),
            ),
            //no saved method container
            Padding(
              padding: const EdgeInsets.only(top: 15),
              child: Container(
                width: MediaQuery.of(context).size.width * 1,
                decoration: BoxDecoration(
                    color: Color(0xFFFAFBFC),
                    border: Border.all(color: Color(0xFFD4D6DB)),
                    borderRadius: BorderRadius.circular(8)
                ),
                child: Padding(
                  padding: const EdgeInsets.all(12.0),
                  child: Align(
                    alignment: Alignment.center,
                    child: Text("No saved deposit method",
                      style: GoogleFonts.alata(
                        fontSize: 14,
                        fontWeight: FontWeight.w400,
                        color: Color(0xFF9CA0AB),
                      ),
                    ),
                  ),
                ),
              ),
            ),

            //horizontal line
            Padding(
              padding: const EdgeInsets.only(top: 20),
              child: Container(
                width: MediaQuery.of(context).size.width * 1,
                height: 1,
                decoration: BoxDecoration(
                  color: Color(0xFFD4D6DB),
                ),
              ),
            ),

            //add method text
            Padding(
              padding: const EdgeInsets.only(top: 30),
              child: Text("Add New Method",
                style: GoogleFonts.alata(
                    fontWeight: FontWeight.w400,
                    fontSize: 16,
                    color: Color(0xFF51586D)
                ),
              ),
            ),

            SizedBox(height: 15,),

            //bank transfer method
            buildMethods(iconOrImage: Icons.account_balance_outlined, title: "Bank Transfer"),
            SizedBox(height: 5,),

            //credit card method
            buildMethods(iconOrImage: Icons.credit_card, title: "Credit Card"),
            SizedBox(height: 5,),

            //venmo method
            buildMethods(iconOrImage: "assets/images/venmo.png", title: "Credit Card"),
          ],
        ),
      ),
    );
  }

  Widget buildMethods({
    required dynamic iconOrImage,
    required String title,
  }) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 6),
      child: Container(
        width: MediaQuery.of(context).size.width * 1,
        decoration: BoxDecoration(
          color: Color(0xFFF1F3FA),
          border: Border.all(color: Color(0xFFD4D6DB)),
          borderRadius: BorderRadius.circular(8),
        ),
        child: Padding(
          padding: const EdgeInsets.all(12),
          child: Row(
            children: [
              if (iconOrImage is IconData)
                Icon(iconOrImage, color: Color(0xFF51586D))
              else if (iconOrImage is String)
                Image.asset(iconOrImage, height: 24, width: 24, color: Color(0xFF51586D)),
              Padding(
                padding: const EdgeInsets.only(left: 10),
                child: Text(
                  title,
                  style: GoogleFonts.alata(
                    fontSize: 16,
                    fontWeight: FontWeight.w400,
                    color: Color(0xFF51586D),
                  ),
                ),
              ),
              Spacer(),
              Icon(Icons.chevron_right, color: Color(0xFF51586D)),
            ],
          ),
        ),
      ),
    );
  }
}
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class Iphone51DepositBankTransferScreen extends StatefulWidget {
  const Iphone51DepositBankTransferScreen({super.key});

  @override
  State<Iphone51DepositBankTransferScreen> createState() => _Iphone51DepositBankTransferScreenState();
}

class _Iphone51DepositBankTransferScreenState extends State<Iphone51DepositBankTransferScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        title: Text("Deposit",
          style: GoogleFonts.alata(
            fontSize: 17.47,
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
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.only(left: 5),
                child: Text("Bank Transfer",
                  style: GoogleFonts.alata(
                    fontWeight: FontWeight.w400,
                    fontSize: 17.47,
                    color: Color(0xFF51586D)
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 25, left: 10, bottom: 5),
                child: Text(
                  "Choose Bank",
                  style: GoogleFonts.alata(
                      fontWeight: FontWeight.w400,
                      fontSize: 13.1,
                      color: Color(0xFF07112E)),
                ),
              ),
              Container(
                width: double.infinity,
                decoration: BoxDecoration(
                    color: Color(0xFFF1F3FA),
                    borderRadius: BorderRadius.circular(8),
                    border: Border.all(color: Color(0xFFD4D6DB))),
                child: Padding(
                  padding: const EdgeInsets.symmetric(
                      horizontal: 15, vertical: 12),
                  child: Row(
                    children: [
                      Text(
                        "Union",
                        style: GoogleFonts.alata(
                            fontSize: 16,
                            fontWeight: FontWeight.w400,
                            color: Color(0xFF51586D)),
                      ),
                      Spacer(),
                      Icon(Icons.arrow_drop_down, color: Color(0xFF51586D))
                    ],
                  ),
                ),
              ),
              SizedBox(height: 20,),
              Container(
                height: 1,
                width: MediaQuery.of(context).size.width,
                color: Color(0xFFD4D6DB),
              ),
              SizedBox(height: 20,),
              Container(
                width: double.infinity,
                decoration: BoxDecoration(
                    color: Color(0xFFF1F3FA),
                    borderRadius: BorderRadius.circular(8),
                    border: Border.all(color: Color(0xFFD4D6DB))),
                child: Padding(
                  padding: const EdgeInsets.symmetric(
                      horizontal: 15, vertical: 25),
                  child: Column(
                    children: [
                      SizedBox(height: 55,),
                      Container(
                        height: 1,
                        width: MediaQuery.of(context).size.width,
                        color: Color(0xFFD4D6DB),
                      ),
                      SizedBox(height: 18,),
                      Align(
                        alignment: Alignment.bottomLeft,
                        child: Text(
                          "Virtual Account Number",
                          style: GoogleFonts.alata(
                              fontSize: 13.1,
                              fontWeight: FontWeight.w400,
                              color: Color(0xFF51586D)),
                        ),
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Flexible(
                            flex: 7,
                            child: Text(
                              "8888-7777-6666-5555",
                              style: GoogleFonts.alata(
                                  fontSize: 17.47,
                                  fontWeight: FontWeight.w400,
                                  color: Color(0xFF07112E)
                              ),
                              overflow: TextOverflow.ellipsis,
                            ),
                          ),
                          Flexible(
                            flex: 2,
                              child: Icon(Icons.copy,color: Color(0xFF00D1FF),))
                        ],
                      )
                    ],
                  ),
                ),
              ),
              SizedBox(height: 20,),
              Container(
                width: double.infinity,
                decoration: BoxDecoration(
                    color: Color(0xFFF1F3FA),
                    borderRadius: BorderRadius.circular(8),
                    border: Border.all(color: Color(0xFFD4D6DB))),
                child: Padding(
                  padding: const EdgeInsets.symmetric(
                      horizontal: 15, vertical: 25),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "Instructions:",
                        style: GoogleFonts.alata(
                            fontSize: 13.1,
                            fontWeight: FontWeight.w400,
                            color: Color(0xFF000000)),
                      ),
                      SizedBox(height: 20,),
                      Text(
                        "1. Log in: Open your bank app and log in.",
                        style: GoogleFonts.alata(
                            fontSize: 10.92,
                            fontWeight: FontWeight.w400,
                            color: Color(0xFF000000)),
                      ),
                      Text(
                        "2. Access Transfer Section: Navigate to 'Transfer' or 'Send Money'.",
                        style: GoogleFonts.alata(
                            fontSize: 10.92,
                            fontWeight: FontWeight.w400,
                            color: Color(0xFF000000)),
                      ),
                      Text(
                        "3. Select Transfer Method: Choose 'Virtual Account Transfer'.",
                        style: GoogleFonts.alata(
                            fontSize: 10.92,
                            fontWeight: FontWeight.w400,
                            color: Color(0xFF000000)),
                      ),
                      Text(
                        "4. Input Details: Enter recipient's virtual account details.",
                        style: GoogleFonts.alata(
                            fontSize: 10.92,
                            fontWeight: FontWeight.w400,
                            color: Color(0xFF000000)),
                      ),
                      Text(
                        "5. Verify Information: Double-check recipient details.",
                        style: GoogleFonts.alata(
                            fontSize: 10.92,
                            fontWeight: FontWeight.w400,
                            color: Color(0xFF000000)),
                      ),
                      Text(
                        "6. Enter Amount: Specify transfer amount.",
                        style: GoogleFonts.alata(
                            fontSize: 10.92,
                            fontWeight: FontWeight.w400,
                            color: Color(0xFF000000)),
                      ),
                      Text(
                        "7. Review and Confirm: Check details and confirm the Transfer.",
                        style: GoogleFonts.alata(
                            fontSize: 10.92,
                            fontWeight: FontWeight.w400,
                            color: Color(0xFF000000)),
                      ),
                      Text(
                        "8. Authenticate: Follow app prompt for authentication.",
                        style: GoogleFonts.alata(
                            fontSize: 10.92,
                            fontWeight: FontWeight.w400,
                            color: Color(0xFF000000)),
                      ),
                      Text(
                        "9. Review Confirmation: Get the confirmation message.",
                        style: GoogleFonts.alata(
                            fontSize: 10.92,
                            fontWeight: FontWeight.w400,
                            color: Color(0xFF000000)),
                      ),
                      Text(
                        "10. Check History: Verify in your transaction history.",
                        style: GoogleFonts.alata(
                            fontSize: 10.92,
                            fontWeight: FontWeight.w400,
                            color: Color(0xFF000000)),
                      ),
                    ],
                  ),
                ),
              ),
              SizedBox(height: 50,),
              Padding(
                padding: const EdgeInsets.only(top: 5),
                child: SizedBox(
                  width: double.infinity,
                  child: ElevatedButton(
                    onPressed: () {},
                    style: ElevatedButton.styleFrom(
                        backgroundColor:  Color(0xFF00D1FF),
                        padding: EdgeInsets.symmetric(vertical: 16),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(30),
                        ),
                        disabledBackgroundColor: Color(0xFF9CA0Ab)
                    ),
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 10),
                      child: Text(
                        'Done',
                        style: GoogleFonts.alata(
                            fontWeight: FontWeight.w400,
                            fontSize: 16,
                            color: Color(0xFFFAFBFC)
                        ),
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

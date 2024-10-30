import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class BankTransferScreen extends StatefulWidget {
  const BankTransferScreen({super.key});

  @override
  State<BankTransferScreen> createState() => _BankTransferScreenState();
}

class _BankTransferScreenState extends State<BankTransferScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        title: Text("Payment Method",
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
        padding: const EdgeInsets.symmetric(vertical: 10,horizontal: 22),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text("Bank Transfer",
              style: GoogleFonts.alata(
                fontWeight: FontWeight.w400,
                fontSize: 16,
                color: Color(0xFF07112E)
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 10),
              child: Container(
                decoration: BoxDecoration(
                  color: Color(0xFFF1F3FA),
                  borderRadius: BorderRadius.circular(10)
                ),
                width: MediaQuery.of(context).size.width * 1,
                child: Padding(
                  padding: const EdgeInsets.all(14.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Image.asset("assets/images/standard_chatered.png"),
                      Padding(
                        padding: const EdgeInsets.only(top: 16),
                        child: Container(
                          height: 1,
                          decoration: BoxDecoration(
                            color: Color(0xFFD4D6DB)
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(top: 18),
                        child: Text("Account Name",
                          style: GoogleFonts.alata(
                            fontSize: 16,
                            fontWeight: FontWeight.w400,
                            color: Color(0xFF51586D)
                          ),
                        ),
                      ),
                      Text("Donald Dunn",
                        style: GoogleFonts.alata(
                            fontSize: 16,
                            fontWeight: FontWeight.w400,
                            color: Color(0xFF07112E)
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(top: 18),
                        child: Text("Account Number",
                          style: GoogleFonts.alata(
                              fontSize: 16,
                              fontWeight: FontWeight.w400,
                              color: Color(0xFF51586D)
                          ),
                        ),
                      ),
                      Text("8888-7777-6666-5555",
                        style: GoogleFonts.alata(
                            fontSize: 16,
                            fontWeight: FontWeight.w400,
                            color: Color(0xFF07112E)
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}

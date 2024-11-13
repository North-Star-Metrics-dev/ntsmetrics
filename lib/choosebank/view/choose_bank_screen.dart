import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class ChooseBankScreen extends StatefulWidget {
  const ChooseBankScreen({super.key});

  @override
  State<ChooseBankScreen> createState() => _ChooseBankScreenState();
}

class _ChooseBankScreenState extends State<ChooseBankScreen> {
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
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              // Main content area with scrollable fields
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Align(
                    alignment: Alignment.center,
                    child: Text(
                      "Bank Transfer",
                      style: GoogleFonts.alata(
                          fontWeight: FontWeight.w400,
                          fontSize: 16,
                          color: Color(0xFF51586D)),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 25, left: 6, bottom: 5),
                    child: Text(
                      "Choose Bank",
                      style: GoogleFonts.alata(
                          fontWeight: FontWeight.w400,
                          fontSize: 16,
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
                          horizontal: 15, vertical: 15),
                      child: Row(
                        children: [
                          Text(
                            "Placeholder",
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
                  Padding(
                    padding: const EdgeInsets.only(top: 25, bottom: 5),
                    child: Text(
                      "Account Number",
                      style: GoogleFonts.alata(
                          fontWeight: FontWeight.w400,
                          fontSize: 16,
                          color: Color(0xFF07112E)),
                    ),
                  ),
                  TextFormField(
                    style: GoogleFonts.plusJakartaSans(
                      fontSize: 16,
                      fontWeight: FontWeight.w600,
                      color: Color(0xFF2C2C2C),
                    ),
                    decoration: InputDecoration(
                      filled: true,
                      fillColor: Color(0xFFF1F3FA),
                      hintText: "Placeholder",
                      hintStyle: GoogleFonts.alata(
                          fontSize: 16,
                          fontWeight: FontWeight.w400,
                          color: Color(0xFF51586D)),
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(8),
                          borderSide: BorderSide(color: Color(0xFFE1E1E1), width: 1)),
                      enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(8),
                        borderSide: BorderSide(color: Color(0xFFD4D6DB), width: 1.0),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(8),
                        borderSide: BorderSide(color: Color(0xFF00D1FF), width: 1.0),
                      ),
                    ),
                    cursorColor: Color(0xFF00D1FF),
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Please enter your account number';
                      }
                      return null;
                    },
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 25, bottom: 5),
                    child: Text(
                      "Account Name",
                      style: GoogleFonts.alata(
                          fontWeight: FontWeight.w400,
                          fontSize: 16,
                          color: Color(0xFF07112E)),
                    ),
                  ),
                  TextFormField(
                    style: GoogleFonts.plusJakartaSans(
                      fontSize: 16,
                      fontWeight: FontWeight.w600,
                      color: Color(0xFF2C2C2C),
                    ),
                    decoration: InputDecoration(
                      filled: true,
                      fillColor: Color(0xFFF1F3FA),
                      hintText: "Placeholder",
                      hintStyle: GoogleFonts.alata(
                          fontSize: 16,
                          fontWeight: FontWeight.w400,
                          color: Color(0xFF51586D)),
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(8),
                          borderSide: BorderSide(color: Color(0xFFE1E1E1), width: 1)),
                      enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(8),
                        borderSide: BorderSide(color: Color(0xFFD4D6DB), width: 1.0),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(8),
                        borderSide: BorderSide(color: Color(0xFF00D1FF), width: 1.0),
                      ),
                    ),
                    cursorColor: Color(0xFF00D1FF),
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Please enter your account name';
                      }
                      return null;
                    },
                  ),
                  SizedBox(height: 20,)
                ],
              ),
        
              // "Next" button with padding and space adjustment
              Padding(
                padding: EdgeInsets.only(
                    bottom: MediaQuery.of(context).viewInsets.bottom),
                child: SizedBox(
                  width: double.infinity,
                  child: ElevatedButton(
                    onPressed: () {
                      // Your button action
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Color(0xFF00D1FF),
                      padding: EdgeInsets.symmetric(vertical: 16),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(30),
                      ),
                    ),
                    child: Text(
                      'Next',
                      style: GoogleFonts.alata(
                          fontWeight: FontWeight.w400,
                          fontSize: 16,
                          color: Color(0xFF51586D)),
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

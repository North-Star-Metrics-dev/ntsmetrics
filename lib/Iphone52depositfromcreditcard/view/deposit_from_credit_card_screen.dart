import 'dart:ffi';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class DepositFromCreditCardScreen extends StatefulWidget {
  const DepositFromCreditCardScreen({super.key});

  @override
  State<DepositFromCreditCardScreen> createState() => _DepositFromCreditCardScreenState();
}

class _DepositFromCreditCardScreenState extends State<DepositFromCreditCardScreen> {
   var label = 0;
   bool isAutoSubscribeEnabled = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        leading: IconButton(
          icon: Icon(Icons.arrow_back_outlined,
            color: Color(0xFF2C2C2C),
            size: 25,
          ),
          onPressed: () {
            // Handle back button press
          },
        ),
        title: Text('Deposit',
          style: GoogleFonts.alata(
            fontSize: 17.47,
            fontWeight: FontWeight.w400,
            color: Color(0xFF07112E),
          ),
        ),
        backgroundColor: Colors.white,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text("Deposit from Credit Card",
              style: GoogleFonts.alata(
                fontSize: 17.47,
                fontWeight: FontWeight.w400,
                color: Color(0xFF51586D)
              ),
            ),
            SizedBox(height: 15,),
            Container(
              width: MediaQuery.of(context).size.width,
              decoration: BoxDecoration(
                color: Color(0xFFF1F3FA),
                borderRadius: BorderRadius.circular(5),
                border: Border.all(color: Color(0xFFD4D6DB))
              ),
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 14,vertical: 5),
                child: Row(
                  //crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    Icon(Icons.currency_rupee),
                    SizedBox(width: 5,),
                    Text("$label",
                      style: GoogleFonts.alata(
                          fontSize: 17.47,
                          fontWeight: FontWeight.w400,
                          color: Color(0xFF51586D)
                      ),
                    ),
                    Spacer(),
                    IconButton(
                        onPressed: () {
                          setState(() {
                            label++;
                          });
                        },
                        icon: Icon(Icons.add)
                    ),
                    SizedBox(width: 5,),
                    IconButton(
                        onPressed: () {
                          setState(() {
                            label--;
                          });
                        },
                        icon: Icon(Icons.remove)
                    )
                  ],
                ),
              ),
            ),
            SizedBox(height: 15,),
            Container(
              width: MediaQuery.of(context).size.width,
              decoration: BoxDecoration(
                  color: Color(0xFFD5E1FF),
                  borderRadius: BorderRadius.circular(5),
                  border: Border.all(color: Color(0xFFD4D6DB))
              ),
              child: Padding(
                padding: const EdgeInsets.symmetric(vertical: 12,horizontal: 10),
                child: Text("Maximum deposit is 1000",
                  style: GoogleFonts.alata(
                    fontWeight: FontWeight.w400,
                    fontSize: 13.1,
                    color: Color(0xFF00D1FF)
                  ),
                ),
              )
            ),
            SizedBox(height: 15,),
            Container(
              width: MediaQuery.of(context).size.width,
              decoration: BoxDecoration(
                  color: Color(0xFFFAFBFC),
                  borderRadius: BorderRadius.circular(5),
                  border: Border.all(color: Color(0xFFD4D6DB))
              ),
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 14,vertical: 5),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Image.asset("assets/images/visa.png"),
                    Column(
                      children: [
                        Text("Donald Dunn",
                          style: GoogleFonts.alata(
                            fontSize: 13.1,
                            fontWeight: FontWeight.w400,
                            color: Color(0xFF51586D)
                          ),
                        ),
                        Text("**** **** **** 1881",
                          style: GoogleFonts.alata(
                              fontSize: 13.1,
                              fontWeight: FontWeight.w400,
                              color: Color(0xFF51586D)
                          ),
                        )
                      ],
                    )
                  ],
                ),
              ),
            ),
            SizedBox(height: 15,),
            Container(
              width: MediaQuery.of(context).size.width,
              decoration: BoxDecoration(
                  color: Color(0xFFFAFBFC),
                  borderRadius: BorderRadius.circular(5),
                  border: Border.all(color: Color(0xFFD4D6DB))
              ),
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 14,vertical: 5),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Flexible(
                      child: Text("Convert automatically to USDT",
                        style: GoogleFonts.alata(
                            fontSize: 13.1,
                            fontWeight: FontWeight.w400,
                            color: Color(0xFF51586D)
                        ),
                        overflow: TextOverflow.ellipsis,
                      ),
                    ),
                    CupertinoSwitch(
                      value: isAutoSubscribeEnabled,
                      onChanged: (value) {
                        setState(() {
                          isAutoSubscribeEnabled = value;
                        });
                      },
                      activeColor: Color(0xFF00D1FF),
                      trackColor: isAutoSubscribeEnabled ? Color(0xFF00D1FF): Color(0xFFD4D6DB),
                      thumbColor: isAutoSubscribeEnabled ? Colors.white : Color(0xFFF1F3FA),
                    )
                  ],
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 30),
              child: SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                  onPressed: null,
                  style: ElevatedButton.styleFrom(
                    disabledBackgroundColor: Color(0xFF9Ca0AB),
                    disabledForegroundColor: Color(0xFF51586D),
                    backgroundColor:  Color(0xFF00D1FF),
                    padding: EdgeInsets.symmetric(vertical: 16),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(30),
                    ),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 10),
                    child: Text(
                      'Deposit',
                      style: GoogleFonts.alata(
                          fontWeight: FontWeight.w600,
                          fontSize: 17.47,
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
    );
  }
}

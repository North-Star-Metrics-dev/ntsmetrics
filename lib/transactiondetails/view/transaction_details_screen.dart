import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class TransactionDetailsScreen extends StatefulWidget {
  const TransactionDetailsScreen({super.key});

  @override
  State<TransactionDetailsScreen> createState() => _TransactionDetailsScreenState();
}

class _TransactionDetailsScreenState extends State<TransactionDetailsScreen> {
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
        title: Text('Transaction List',
          style: GoogleFonts.alata(
            fontSize: 19.65,
            fontWeight: FontWeight.w400,
            color: Color(0xFF2C2C2C),
          ),
        ),
        backgroundColor: Colors.white,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(15.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Container(
                width: MediaQuery.of(context).size.width * 1,
                decoration: BoxDecoration(
                  color: Color(0xFFF1F3FA),
                  borderRadius: BorderRadius.circular(10)
                ),
                child: Padding(
                  padding: const EdgeInsets.all(15.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Image.asset("assets/images/transaction_pair.png"),
        
                      //transaction pair text
                      Padding(
                        padding: const EdgeInsets.symmetric(vertical: 12),
                        child: Text("Transaction Pair",
                          style: GoogleFonts.alata(
                            fontWeight: FontWeight.w400,
                            fontSize: 13.1,
                            color: Color(0xFF51586D)
                          ),
                        ),
                      ),
        
                      //Solana(SOL)/Theter(USDT)
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Flexible(
                            child: Text("Solana(SOL)/Theter(USDT)",
                              style: GoogleFonts.alata(
                                  fontWeight: FontWeight.w400,
                                  fontSize: 17.46,
                                  color: Color(0xFF07112E)
                              ),
                              overflow: TextOverflow.ellipsis,
                            ),
                          ),
                          Container(
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(6),
                              color: Color(0xFFC7EDC8),
                            ),
                            child: Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Text("Buy",
                                style: GoogleFonts.alata(
                                    fontSize: 13.1,
                                    fontWeight: FontWeight.w400,
                                    color: Color(0xFF2E5C30)
                                ),
                              ),
                            ),
                          )
                        ],
                      ),
        
                      //horizontal line
                      Padding(
                        padding: const EdgeInsets.symmetric(vertical: 12),
                        child: Container(
                          width: MediaQuery.of(context).size.width * 1,
                          height: 1,
                          color: Color(0xFFD4D6DB),
                        ),
                      ),
        
                      //total sol and total ustd portion
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text("Total SOL",
                            style: GoogleFonts.alata(
                                fontWeight: FontWeight.w400,
                                fontSize: 13.1,
                                color: Color(0xFF51586D)
                            ),
                          ),
                          Text("1.099",
                            style: GoogleFonts.alata(
                                fontWeight: FontWeight.w400,
                                fontSize: 13.1,
                                color: Color(0xFF51586D)
                            ),
                          ),
                        ],
                      ),
                      SizedBox(height: 14,),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text("Total USDT",
                            style: GoogleFonts.alata(
                                fontWeight: FontWeight.w400,
                                fontSize: 13.1,
                                color: Color(0xFF51586D)
                            ),
                          ),
                          Text("59.41",
                            style: GoogleFonts.alata(
                                fontWeight: FontWeight.w400,
                                fontSize: 13.1,
                                color: Color(0xFF51586D)
                            ),
                          ),
                        ],
                      ),
        
                      //horizontal line
                      Padding(
                        padding: const EdgeInsets.symmetric(vertical: 12),
                        child: Container(
                          width: MediaQuery.of(context).size.width * 1,
                          height: 1,
                          color: Color(0xFFD4D6DB),
                        ),
                      ),
        
                      //middle part
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text("Price Type",
                            style: GoogleFonts.alata(
                                fontWeight: FontWeight.w400,
                                fontSize: 13.1,
                                color: Color(0xFF51586D)
                            ),
                          ),
                          Text("Limit",
                            style: GoogleFonts.alata(
                                fontWeight: FontWeight.w400,
                                fontSize: 13.1,
                                color: Color(0xFF51586D)
                            ),
                          ),
                        ],
                      ),
                      SizedBox(height: 14,),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text("Limit Price",
                            style: GoogleFonts.alata(
                                fontWeight: FontWeight.w400,
                                fontSize: 13.1,
                                color: Color(0xFF51586D)
                            ),
                          ),
                          Text("59.41",
                            style: GoogleFonts.alata(
                                fontWeight: FontWeight.w400,
                                fontSize: 13.1,
                                color: Color(0xFF51586D)
                            ),
                          ),
                        ],
                      ),
                      SizedBox(height: 14,),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text("Time",
                            style: GoogleFonts.alata(
                                fontWeight: FontWeight.w400,
                                fontSize: 13.1,
                                color: Color(0xFF51586D)
                            ),
                          ),
                          Text("3:28",
                            style: GoogleFonts.alata(
                                fontWeight: FontWeight.w400,
                                fontSize: 13.1,
                                color: Color(0xFF51586D)
                            ),
                          ),
                        ],
                      ),
                      SizedBox(height: 14,),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text("Gas Fee",
                            style: GoogleFonts.alata(
                                fontWeight: FontWeight.w400,
                                fontSize: 13.1,
                                color: Color(0xFF51586D)
                            ),
                          ),
                          Text("0.05 USDT",
                            style: GoogleFonts.alata(
                                fontWeight: FontWeight.w400,
                                fontSize: 13.1,
                                color: Color(0xFF51586D)
                            ),
                          ),
                        ],
                      ),
                      SizedBox(height: 14,),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text("Date",
                            style: GoogleFonts.alata(
                                fontWeight: FontWeight.w400,
                                fontSize: 13.1,
                                color: Color(0xFF51586D)
                            ),
                          ),
                          Text("11/29/2023",
                            style: GoogleFonts.alata(
                                fontWeight: FontWeight.w400,
                                fontSize: 13.1,
                                color: Color(0xFF51586D)
                            ),
                          ),
                        ],
                      ),
        
                      //horizontal line
                      Padding(
                        padding: const EdgeInsets.symmetric(vertical: 12),
                        child: Container(
                          width: MediaQuery.of(context).size.width * 1,
                          height: 1,
                          color: Color(0xFFD4D6DB),
                        ),
                      ),
        
                      //last part
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text("Transaction Status",
                            style: GoogleFonts.alata(
                                fontWeight: FontWeight.w400,
                                fontSize: 13.1,
                                color: Color(0xFF51586D)
                            ),
                          ),
                          Text("Pending",
                            style: GoogleFonts.alata(
                                fontWeight: FontWeight.w400,
                                fontSize: 13.1,
                                color: Color(0xFFBBA24A)
                            ),
                          ),
                        ],
                      ),
                      SizedBox(height: 14,),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text("Filled",
                            style: GoogleFonts.alata(
                                fontWeight: FontWeight.w400,
                                fontSize: 13.1,
                                color: Color(0xFF51586D)
                            ),
                          ),
                          Text("0.01/1.099",
                            style: GoogleFonts.alata(
                                fontWeight: FontWeight.w400,
                                fontSize: 13.1,
                                color: Color(0xFFBBA24A)
                            ),
                          ),
                        ],
                      ),
        
                      SizedBox(height: 14,),
        
                      //total display row
                      Container(
                        width: MediaQuery.of(context).size.width * 1,
                        decoration: BoxDecoration(
                          color: Color(0xFFD6E1FF),
                          borderRadius: BorderRadius.circular(8)
                        ),
                        child: Padding(
                          padding: const EdgeInsets.all(12.0),
                          child: Row(
                            children: [
                              Spacer(),
                              Text("Total 1.149 USDT",
                                style: GoogleFonts.alata(
                                  fontWeight: FontWeight.w400,
                                  fontSize: 13.1,
                                  color: Color(0xFF002280)
                                ),
                              ),
                            ],
                          ),
                        ),
                      )
                    ],
                  ),
                ),
              ),
              SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                  onPressed: () {
                    // Add proceed functionality here
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor:  Color(0xFFD6E1FF),
                    padding: EdgeInsets.symmetric(vertical: 16),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(30),
                    ),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 10),
                    child: Text(
                      'Cancel Transaction',
                      style: GoogleFonts.alata(
                          fontWeight: FontWeight.w400,
                          fontSize: 17.47,
                          color: Color(0xFF002280)
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

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:ntsmetrics/iphone52earnlog/view/iphone51earnlog_list.dart';

class Iphone51earnlogScreen extends StatefulWidget {
  const Iphone51earnlogScreen({super.key});

  @override
  State<Iphone51earnlogScreen> createState() => _Iphone51earnlogScreenState();
}

class _Iphone51earnlogScreenState extends State<Iphone51earnlogScreen> {
  int selectedIndex = 1;
  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
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
        title: Text('Log',
          style: GoogleFonts.alata(
            fontSize: 19.65,
            fontWeight: FontWeight.w400,
            color: Color(0xFF2C2C2C),
          ),
        ),
        backgroundColor: Colors.white,
      ),
      body:
      Column(
        children: [
          SizedBox(
            height: 15,
          ),

          //market,earn,wallet button
          Row(
            children: [
              InkWell(
                onTap: () {
                  setState(() {
                    selectedIndex = 0;
                  });
                },
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      "Market",
                      style: GoogleFonts.alata(
                          color: selectedIndex == 0 ? Color(0xFF00D1FF) : Color(0xFF51586D),
                          fontWeight: FontWeight.w400,
                          fontSize: 19.65
                      ),
                    ),
                    SizedBox(height: 5),
                    if (selectedIndex == 0)
                      Container(
                        height: 2,
                        width: width * 0.33,
                        color: Color(0xFF00D1FF),
                      )
                    else
                      Container(
                        height: 2,
                        width: width * 0.33,
                        color: Color(0xFFD4D6DB),
                      )
                  ],
                ),
              ),
              InkWell(
                onTap: () {
                  setState(() {
                    selectedIndex = 1;
                  });
                },
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      "Earn",
                      style: GoogleFonts.alata(
                          color: selectedIndex == 1 ? Color(0xFF00D1FF) : Color(0xFF51586D),
                          fontWeight: FontWeight.w400,
                          fontSize: 19.65
                      ),
                    ),
                    SizedBox(height: 5),
                    if (selectedIndex == 1)
                      Container(
                        height: 2,
                        width: width * 0.33,
                        color: Color(0xFF00D1FF),
                      )
                    else
                      Container(
                        height: 2,
                        width: width * 0.33,
                        color: Color(0xFFD4D6DB),
                      )
                  ],
                ),
              ),
              InkWell(
                onTap: () {
                  setState(() {
                    selectedIndex = 2;
                  });
                },
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      "Wallet",
                      style: GoogleFonts.alata(
                          color: selectedIndex == 2 ? Color(0xFF00D1FF) : Color(0xFF51586D),
                          fontWeight: FontWeight.w400,
                          fontSize: 19.65
                      ),
                    ),
                    SizedBox(height: 5),
                    if (selectedIndex == 2)
                      Container(
                        height: 2,
                        width: width * 0.33,
                        color: Color(0xFF00D1FF),
                      )
                    else
                      Container(
                        height: 2,
                        width: width * 0.34,
                        color: Color(0xFFD4D6DB),
                      )
                  ],
                ),
              ),
            ],
          ),

          SizedBox(
            height: 5,
          ),

          //newest to oldest,and the date dropdown
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              SizedBox(width: 8),
              Expanded(
                flex: 1,
                child: Container(
                  decoration: BoxDecoration(
                    color: Color(0xFFF1F3FA),
                    borderRadius: BorderRadius.circular(5),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 12),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Flexible(
                          child: Text(
                            "Newest To Oldest",
                            style: GoogleFonts.alata(
                              fontWeight: FontWeight.w400,
                              fontSize: 13.1,
                              color: Color(0xFF51586D),
                            ),
                            overflow: TextOverflow.ellipsis, // Ensure text doesn't overflow
                          ),
                        ),
                        Icon(Icons.arrow_drop_down, color: Color(0xFF51586D)),
                      ],
                    ),
                  ),
                ),
              ),
              SizedBox(width: 8), // Add a bit of spacing between the containers
              Expanded(
                flex: 1,
                child: Container(
                  decoration: BoxDecoration(
                    color: Color(0xFFF1F3FA),
                    borderRadius: BorderRadius.circular(5),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 12),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Flexible(
                          child: Text(
                            "10/30/2023 to 11/30/2023",
                            style: GoogleFonts.alata(
                              fontWeight: FontWeight.w400,
                              fontSize: 13.1,
                              color: Color(0xFF51586D),
                            ),
                            overflow: TextOverflow.ellipsis, // Ensure text doesn't overflow
                          ),
                        ),
                        Icon(Icons.arrow_drop_down, color: Color(0xFF51586D)),
                      ],
                    ),
                  ),
                ),
              ),
              SizedBox(width: 8),
            ],
          ),

          SizedBox(
            height: 15,
          ),

          Iphone51earnlogList(
              r1c1: "Algorand",
              r1c2: "100.00 ALGO",
              r2c1: "Period",
              r2c2: "30d",
              r3c1: "3:28",
              r3c2: "11/29/2023",
              r4c1: "Active",
              r4c2: "0.21%",
              status: "active"
          ),
          Iphone51earnlogList(
              r1c1: "Theter",
              r1c2: "1000.00 USDT",
              r2c1: "Period",
              r2c2: "30d",
              r3c1: "3:28",
              r3c2: "11/29/2023",
              r4c1: "Liquid",
              r4c2: "100%",
              status: "inactive"
          ),
          Iphone51earnlogList(
              r1c1: "Solana",
              r1c2: "97.01 SOL",
              r2c1: "Period",
              r2c2: "30d",
              r3c1: "3:28",
              r3c2: "11/29/2023",
              r4c1: "Liquid",
              r4c2: "100%",
              status: "inactive"
          )
        ],
      ),
    );
  }
}

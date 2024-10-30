import 'dart:ui';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class MarketScreen extends StatefulWidget {
  @override
  _MarketScreenState createState() => _MarketScreenState();
}

class _MarketScreenState extends State<MarketScreen> {
  int selectedTopButtonIndex = 0;
  int selectedTabButtonIndex = 0;

  final List<String> topButtons = ["Top Movers", "Top 100", "Recently Added"];
  final List<String> tabButtons = ["Tab", "Tab", "Gainers", "Newcomers"];

  void onTopButtonPressed(int index) {
    setState(() {
      selectedTopButtonIndex = index;
    });
  }

  void onTabButtonPressed(int index) {
    setState(() {
      selectedTabButtonIndex = index;
    });
  }

  Widget buildTopButton(int index, String label) {
    return GestureDetector(
      onTap: () => onTopButtonPressed(index),
      child: Padding(
        padding: const EdgeInsets.only(right: 5),
        child: Container(
          padding: EdgeInsets.symmetric(horizontal: 12, vertical: 6),
          decoration: BoxDecoration(
            color: selectedTopButtonIndex == index ? Color(0xFFD6E1FF) : Color(0xFFF1F3FA),
            borderRadius: BorderRadius.circular(20),
          ),
          child: Text(
            label,
            style: GoogleFonts.sora(
              color: selectedTopButtonIndex == index ? Color(0xFF002280) : Color(0xFF51586D),
              fontWeight: FontWeight.w600,fontSize: 12
            ),
          ),
        ),
      ),
    );
  }

  Widget buildTabButton(int index, String label) {
    return GestureDetector(
      onTap: () => onTabButtonPressed(index),
      child: Column(
        children: [
          Text(
            label,
            style: GoogleFonts.sora(
              color: selectedTabButtonIndex == index ? Color(0xFF1956FC) : Color(0xFF51586D),
              fontWeight: FontWeight.w400,
              fontSize: 13.2
            ),
          ),
          SizedBox(height: 5),
          if (selectedTabButtonIndex == index)
            Container(
              height: 2,
              width: 50,
              color: Color(0xFF1956FC),
            )
        ],
      ),
    );
  }
  
  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
      ),
      body: SingleChildScrollView(
        child: Padding(
          // padding: const EdgeInsets.only(top: 16,left: 16,bottom: 16,right: 12),
          padding: const EdgeInsets.all(16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Search bar
              TextField(
                decoration: InputDecoration(
                  hintText: "Search for an asset",
                  hintStyle: GoogleFonts.sora(
                    fontWeight: FontWeight.w400,
                    fontSize: 12,
                    color: Color(0xFF51586D)
                  ),
                  prefixIcon: Icon(Icons.search,size: 24,),
                  filled: true,
                  fillColor: Color(0xFFf1F3FA),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(25),
                    borderSide: BorderSide.none,
                  ),
                ),
              ),

              //Horizontal line
              Padding(
                padding: const EdgeInsets.only(top: 15),
                child: Container(
                  height: 1,
                  width: MediaQuery.of(context).size.width * 1,
                  color: Color(0xFFD4D6DB),
                ),
              ),
              SizedBox(height: 20),

              //Market text
              Padding(
                padding: const EdgeInsets.only(bottom: 20),
                child: Text("Market",
                  style: GoogleFonts.sora(
                    fontSize: 16,
                    fontWeight: FontWeight.w600,
                    color: Color(0xFF07112E)
                  ),
                ),
              ),

              // Top buttons
              SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: List.generate(topButtons.length, (index) {
                    return buildTopButton(index, topButtons[index]);
                  }),
                ),
              ),
              SizedBox(height: 20),

              //Atom and ENJ
              SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(right: 10),
                      child: Container(
                        decoration: BoxDecoration(
                          color: Colors.transparent,
                          border: Border.all(color: Color(0xFFD4D6DB)),
                          borderRadius: BorderRadius.circular(10)
                        ),
                        child: Padding(
                          padding: const EdgeInsets.only(left: 12,top: 12,bottom: 12,right: 8),
                          child: Row(
                            children: [
                              Image.asset("assets/images/atom.png",height: 32, width: 32,),
                              Padding(
                                padding: const EdgeInsets.only(left: 5,right: 5),
                                child: Column(
                                  children: [
                                    Text("Atom",
                                      style: GoogleFonts.sora(
                                        fontSize: 12,
                                        fontWeight: FontWeight.w600,
                                        color: Color(0xFF07112E)
                                      ),
                                    ),
                                    Text("&9.23",
                                      style: GoogleFonts.sora(
                                          fontSize: 12,
                                          fontWeight: FontWeight.w400,
                                          color: Color(0xFF51586D)
                                      ),
                                    )
                                  ],
                                ),
                              ),
                              SizedBox(
                                height: 35,
                                child: VerticalDivider(
                                  color: Color(0xFFD4D6DB),
                                  thickness: 1,
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.only(left: 5),
                                child: Column(
                                  children: [
                                    Text("+853.08",
                                      style: GoogleFonts.sora(
                                          fontSize: 12,
                                          fontWeight: FontWeight.w400,
                                          color: Color(0xFF4AB84D)
                                      ),
                                    ),
                                    Text("+2.29%",
                                      style: GoogleFonts.sora(
                                          fontSize: 12,
                                          fontWeight: FontWeight.w600,
                                          color: Color(0xFF4AB84D)
                                      ),
                                    )
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(right: 10),
                      child: Container(
                        decoration: BoxDecoration(
                            color: Colors.transparent,
                            border: Border.all(color: Color(0xFFD4D6DB)),
                            borderRadius: BorderRadius.circular(10)
                        ),
                        child: Padding(
                          padding: const EdgeInsets.all(12.0),
                          child: Row(
                            children: [
                              Image.asset("assets/images/ENJ.png",height: 32, width: 32,),
                              Padding(
                                padding: const EdgeInsets.only(left: 5,right: 5),
                                child: Column(
                                  children: [
                                    Text("ENJ",
                                      style: GoogleFonts.sora(
                                          fontSize: 12,
                                          fontWeight: FontWeight.w600,
                                          color: Color(0xFF07112E)
                                      ),
                                    ),
                                    Text("&0.29",
                                      style: GoogleFonts.sora(
                                          fontSize: 12,
                                          fontWeight: FontWeight.w400,
                                          color: Color(0xFF51586D)
                                      ),
                                    )
                                  ],
                                ),
                              ),
                              SizedBox(
                                height: 35,
                                child: VerticalDivider(
                                  color: Color(0xFFD4D6DB),
                                  thickness: 1,
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.only(left: 5),
                                child: Column(
                                  children: [
                                    Text("+322.08",
                                      style: GoogleFonts.sora(
                                          fontSize: 12,
                                          fontWeight: FontWeight.w400,
                                          color: Color(0xFF4AB84D)
                                      ),
                                    ),
                                    Text("+4.33%",
                                      style: GoogleFonts.sora(
                                          fontSize: 12,
                                          fontWeight: FontWeight.w600,
                                          color: Color(0xFF4AB84D)
                                      ),
                                    )
                                  ],
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


              SizedBox(height: 25,),

              // Tab buttons
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: List.generate(tabButtons.length, (index) {
                  return buildTabButton(index, tabButtons[index]);
                }),
              ),


              SizedBox(height: 20),

              //Asset list
              Container(
                color: Colors.transparent,
                child: Padding(
                  padding: const EdgeInsets.all(12.0),
                  child: Column(
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Row(
                            children: [
                              Image.asset("assets/images/ENJ.png"),
                              Padding(
                                padding: const EdgeInsets.only(left: 10),
                                child: Column(
                                  children: [
                                    Text("SOL/USDT",
                                      style: GoogleFonts.sora(
                                          fontWeight: FontWeight.w600,
                                          fontSize: 12,
                                          color: Color(0xFF07112E)
                                      ),
                                    ),
                                    Text("VOL/1.95B",
                                      style: GoogleFonts.sora(
                                          fontWeight: FontWeight.w400,
                                          fontSize: 12,
                                          color: Color(0xFF9CA0AB)
                                      ),
                                    )
                                  ],
                                ),
                              )
                            ],
                          ),
                          Column(
                            children: [
                              Text("7.055",
                                style: GoogleFonts.sora(
                                    fontWeight: FontWeight.w600,
                                    fontSize: 12,
                                    color: Color(0xFFB84A72)
                                ),
                              ),
                              Text("&7.055",
                                style: GoogleFonts.sora(
                                    fontWeight: FontWeight.w400,
                                    fontSize: 12,
                                    color: Color(0xFF9CA0AB)
                                ),
                              )
                            ],
                          ),
                          Container(
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(6),
                              color: Color(0xFFEDC7D5),
                            ),
                            child: Padding(
                              padding: const EdgeInsets.all(5.0),
                              child: Text("6.71%",
                                style: GoogleFonts.sora(
                                  fontSize: 12,
                                  fontWeight: FontWeight.w600,
                                  color: Color(0xFF5C0F2B)
                                ),
                              ),
                            ),
                          )
                        ],
                      ),
                      Padding(
                        padding: const EdgeInsets.only(top: 15),
                        child: Container(
                          height: 1,
                          width: MediaQuery.of(context).size.width * 1,
                          color: Color(0xFFD4D6DB),
                        ),
                      )
                    ],
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

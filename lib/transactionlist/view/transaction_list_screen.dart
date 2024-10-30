import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class TransactionListScreen extends StatefulWidget {
  const TransactionListScreen({super.key});

  @override
  State<TransactionListScreen> createState() => _TransactionListScreenState();
}

class _TransactionListScreenState extends State<TransactionListScreen> {
  int selectedIndex = 0;

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
        title: Text('Transaction List',
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
          // Container(
          //   color: Colors.transparent,
          //   child: Column(
          //     children: [
          //       Padding(
          //         padding: const EdgeInsets.symmetric(horizontal: 15,vertical: 15),
          //         child: Row(
          //           mainAxisAlignment: MainAxisAlignment.spaceBetween,
          //           children: [
          //             Row(
          //               children: [
          //                 Image.asset("assets/images/transaction_pair.png"),
          //                 Padding(
          //                   padding: const EdgeInsets.only(left: 10),
          //                   child: Column(
          //                     crossAxisAlignment: CrossAxisAlignment.start,
          //                     children: [
          //                       Text("SOL/USDT",
          //                         style: GoogleFonts.alata(
          //                             fontWeight: FontWeight.w400,
          //                             fontSize: 13.1,
          //                             color: Color(0xFF07112E)
          //                         ),
          //                       ),
          //                       Text("&1.099/59.41",
          //                         style: GoogleFonts.sora(
          //                             fontWeight: FontWeight.w600,
          //                             fontSize: 13.1,
          //                             color: Color(0xFF51586D)
          //                         ),
          //                       )
          //                     ],
          //                   ),
          //                 )
          //               ],
          //             ),
          //             Column(
          //               crossAxisAlignment: CrossAxisAlignment.start,
          //               children: [
          //                 Text("Limit",
          //                   style: GoogleFonts.alata(
          //                       fontWeight: FontWeight.w400,
          //                       fontSize: 13.1,
          //                       color: Color(0xFF07112E)
          //                   ),
          //                 ),
          //                 Text("59.41",
          //                   style: GoogleFonts.alata(
          //                       fontWeight: FontWeight.w400,
          //                       fontSize: 13.1,
          //                       color: Color(0xFF51586D)
          //                   ),
          //                 )
          //               ],
          //             ),
          //             Column(
          //               crossAxisAlignment: CrossAxisAlignment.start,
          //               children: [
          //                 Text("3.28",
          //                   style: GoogleFonts.alata(
          //                       fontWeight: FontWeight.w400,
          //                       fontSize: 13.1,
          //                       color: Color(0xFF51586D)
          //                   ),
          //                 ),
          //                 Text("11/29/2023",
          //                   style: GoogleFonts.alata(
          //                       fontWeight: FontWeight.w400,
          //                       fontSize: 13.1,
          //                       color: Color(0xFF51586D)
          //                   ),
          //                 )
          //               ],
          //             ),
          //             Column(
          //               crossAxisAlignment: CrossAxisAlignment.end,
          //               children: [
          //                 Text("Pending",
          //                   style: GoogleFonts.alata(
          //                       fontWeight: FontWeight.w400,
          //                       fontSize: 13.1,
          //                       color: Color(0xFFB8A24A)
          //                   ),
          //                 ),
          //                 Text("0.01/1.099",
          //                   style: GoogleFonts.alata(
          //                       fontWeight: FontWeight.w400,
          //                       fontSize: 13.1,
          //                       color: Color(0xFFB8A24A)
          //                   ),
          //                 )
          //               ],
          //             ),
          //           ],
          //         ),
          //       ),
          //       Container(
          //         height: 1,
          //         width: MediaQuery.of(context).size.width * 1,
          //         color: Color(0xFFD4D6DB),
          //       )
          //     ],
          //   ),
          // ),

          //coins list
          Container(
            color: Colors.transparent,
            child: Column(
              children: [
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 15),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Expanded(
                        flex: 4,
                        child: Row(
                          children: [
                            Image.asset("assets/images/transaction_pair.png"),
                            Padding(
                              padding: const EdgeInsets.only(left: 10),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  ConstrainedBox(
                                    constraints: BoxConstraints(maxWidth: width * 0.25),
                                    child: Text(
                                      "SOL/USDT",
                                      style: GoogleFonts.alata(
                                        fontWeight: FontWeight.w400,
                                        fontSize: 13.1,
                                        color: Color(0xFF07112E),
                                      ),
                                      overflow: TextOverflow.ellipsis,
                                    ),
                                  ),
                                  ConstrainedBox(
                                    constraints: BoxConstraints(maxWidth: width * 0.25),
                                    child: Text(
                                      "&1.099/59.41",
                                      style: GoogleFonts.sora(
                                        fontWeight: FontWeight.w600,
                                        fontSize: 13.1,
                                        color: Color(0xFF51586D),
                                      ),
                                      overflow: TextOverflow.ellipsis,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                      Expanded(
                        flex: 2,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              "Limit",
                              style: GoogleFonts.alata(
                                fontWeight: FontWeight.w400,
                                fontSize: 13.1,
                                color: Color(0xFF07112E),
                              ),
                            ),
                            Text(
                              "59.41",
                              style: GoogleFonts.alata(
                                fontWeight: FontWeight.w400,
                                fontSize: 13.1,
                                color: Color(0xFF51586D),
                              ),
                            ),
                          ],
                        ),
                      ),
                      Expanded(
                        flex: 2,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              "3.28",
                              style: GoogleFonts.alata(
                                fontWeight: FontWeight.w400,
                                fontSize: 13.1,
                                color: Color(0xFF51586D),
                              ),
                            ),
                            Text(
                              "11/29/2023",
                              style: GoogleFonts.alata(
                                fontWeight: FontWeight.w400,
                                fontSize: 13.1,
                                color: Color(0xFF51586D),
                              ),
                            ),
                          ],
                        ),
                      ),
                      Expanded(
                        flex: 2,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.end,
                          children: [
                            Text(
                              "Pending",
                              style: GoogleFonts.alata(
                                fontWeight: FontWeight.w400,
                                fontSize: 13.1,
                                color: Color(0xFFB8A24A),
                              ),
                              overflow: TextOverflow.ellipsis,
                            ),
                            Text(
                              "0.01/1.099",
                              style: GoogleFonts.alata(
                                fontWeight: FontWeight.w400,
                                fontSize: 13.1,
                                color: Color(0xFFB8A24A),
                              ),
                              overflow: TextOverflow.ellipsis,
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
                Container(
                  height: 1,
                  width: double.infinity,
                  color: Color(0xFFD4D6DB),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}


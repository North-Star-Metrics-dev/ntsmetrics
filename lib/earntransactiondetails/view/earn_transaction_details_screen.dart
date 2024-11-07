import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class EarnTransactionDetailsScreen extends StatefulWidget {
  const EarnTransactionDetailsScreen({super.key});

  @override
  State<EarnTransactionDetailsScreen> createState() => _EarnTransactionDetailsScreenState();
}

class _EarnTransactionDetailsScreenState extends State<EarnTransactionDetailsScreen> {
  bool isAutoSubscribeEnabled = false;
  bool _isSubscribed = false;

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
        title: Text('Algorand Subscription',
          style: GoogleFonts.alata(
            fontSize: 17.47,
            fontWeight: FontWeight.w600,
            color: Color(0xFF2C2C2C),
          ),
        ),
        backgroundColor: Colors.white,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            children: [
              Container(
                width: MediaQuery.of(context).size.width,
                decoration: BoxDecoration(
                  color: Color(0xFFFAFBFC),
                  borderRadius: BorderRadius.circular(15),
                  border: Border.all(color: Color(0xFFD4D6DB))
                ),
                child: Padding(
                  padding: const EdgeInsets.all(12.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text("Liquidation Progress",
                        style: GoogleFonts.alata(
                          fontSize: 13.1,
                          fontWeight: FontWeight.w600,
                          color: Color(0xFF07112E)
                        ),
                      ),
                      Text("Based on the plan you have selected, this specific asset will undergo liquidation once the subscription period concludes.",
                        style: GoogleFonts.alata(
                            fontSize: 13.1,
                            fontWeight: FontWeight.w400,
                            color: Color(0xFF51586D)
                        ),
                      ),
                      SizedBox(height: 16),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text("Day 1",
                            style: GoogleFonts.alata(
                                fontSize: 13.1,
                                fontWeight: FontWeight.w400,
                                color: Color(0xFF51586D)
                            ),
                          ),
                          Text("Day 30",
                            style: GoogleFonts.alata(
                                fontSize: 13.1,
                                fontWeight: FontWeight.w400,
                                color: Color(0xFF51586D)
                            ),
                          ),
                        ],
                      ),
                      SizedBox(height: 10),
                      LinearProgressIndicator(
                        value: 0.034,
                        backgroundColor: Color(0xFFD6E1FF),
                        color: Color(0xFF00D1FF),
                        minHeight: 8,
                        borderRadius: BorderRadius.circular(10),
                      ),
                      SizedBox(height: 10),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Flexible(
                            child: Text("29 days,23:05:02 to liquidation",
                              style: GoogleFonts.alata(
                                  fontSize: 13.1,
                                  fontWeight: FontWeight.w400,
                                  color: Color(0xFF00D1FF)
                              ),
                              overflow: TextOverflow.ellipsis,
                            ),
                          ),
                          Flexible(
                            child: Text("0.38/100%",
                              style: GoogleFonts.alata(
                                  fontSize: 13.1,
                                  fontWeight: FontWeight.w400,
                                  color: Color(0xFF00D1FF)
                              ),
                              overflow: TextOverflow.ellipsis,
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
              SizedBox(height: 16,),
              Container(
                width: MediaQuery.of(context).size.width,
                decoration: BoxDecoration(
                    color: Color(0xFFF1F3FA),
                    borderRadius: BorderRadius.circular(15),
                ),
                child: Padding(
                  padding: const EdgeInsets.all(15.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      //Summary text
                      Padding(
                        padding: const EdgeInsets.symmetric(vertical: 12),
                        child: Text("Summary",
                          style: GoogleFonts.alata(
                              fontWeight: FontWeight.w600,
                              fontSize: 13.1,
                              color: Color(0xFF07112E)
                          ),
                        ),
                      ),
        
                      //horizontal line
                      Padding(
                        padding: const EdgeInsets.only(bottom: 12),
                        child: Container(
                          width: MediaQuery.of(context).size.width * 1,
                          height: 1,
                          color: Color(0xFFD4D6DB),
                        ),
                      ),
        
                      //first part
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Flexible(
                            child: Text("Total Value Locked",
                              style: GoogleFonts.alata(
                                  fontWeight: FontWeight.w400,
                                  fontSize: 13.1,
                                  color: Color(0xFF51586D)
                              ),
                              overflow: TextOverflow.ellipsis,
                            ),
                          ),
                          Flexible(
                            child: Text("0.8932 ALGO",
                              style: GoogleFonts.alata(
                                  fontWeight: FontWeight.w600,
                                  fontSize: 13.1,
                                  color: Color(0xFF51586D)
                              ),
                              overflow: TextOverflow.ellipsis,
                            ),
                          ),
                        ],
                      ),
                      SizedBox(height: 14,),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Flexible(
                            child: Text("Total Value Locked(in FIAT)",
                              style: GoogleFonts.alata(
                                  fontWeight: FontWeight.w400,
                                  fontSize: 13.1,
                                  color: Color(0xFF51586D)
                              ),
                              overflow: TextOverflow.ellipsis,
                            ),
                          ),
                          Flexible(
                            child: Text("13.49 USD",
                              style: GoogleFonts.alata(
                                  fontWeight: FontWeight.w600,
                                  fontSize: 13.1,
                                  color: Color(0xFF51586D)
                              ),
                              overflow: TextOverflow.ellipsis,
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
                          Flexible(
                            child: Text("Subscription Period",
                              style: GoogleFonts.alata(
                                  fontWeight: FontWeight.w400,
                                  fontSize: 13.1,
                                  color: Color(0xFF51586D)
                              ),
                              overflow: TextOverflow.ellipsis,
                            ),
                          ),
                          Flexible(
                            child: Text("30 Days",
                              style: GoogleFonts.alata(
                                  fontWeight: FontWeight.w600,
                                  fontSize: 13.1,
                                  color: Color(0xFF51586D)
                              ),
                              overflow: TextOverflow.ellipsis,
                            ),
                          ),
                        ],
                      ),
                      SizedBox(height: 14,),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Flexible(
                            child: Text("Duration left",
                              style: GoogleFonts.alata(
                                  fontWeight: FontWeight.w400,
                                  fontSize: 13.1,
                                  color: Color(0xFF51586D)
                              ),
                              overflow: TextOverflow.ellipsis,
                            ),
                          ),
                          Flexible(
                            child: Text("29 Days,23:05:02",
                              style: GoogleFonts.alata(
                                  fontWeight: FontWeight.w400,
                                  fontSize: 13.1,
                                  color: Color(0xFF00D1FF)
                              ),
                              overflow: TextOverflow.ellipsis,
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
                          Flexible(
                            child: Text("Rewards Earned",
                              style: GoogleFonts.alata(
                                  fontWeight: FontWeight.w400,
                                  fontSize: 13.1,
                                  color: Color(0xFF51586D)
                              ),
                              overflow: TextOverflow.ellipsis,
                            ),
                          ),
                          Flexible(
                            child: Text("0.08932 ALGO",
                              style: GoogleFonts.alata(
                                  fontWeight: FontWeight.w600,
                                  fontSize: 13.1,
                                  color: Color(0xFF51586D)
                              ),
                              overflow: TextOverflow.ellipsis,
                            ),
                          ),
                        ],
                      ),
                      SizedBox(height: 14,),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Flexible(
                            child: Text("Total estimated rewards",
                              style: GoogleFonts.alata(
                                  fontWeight: FontWeight.w400,
                                  fontSize: 13.1,
                                  color: Color(0xFF51586D)
                              ),
                              overflow: TextOverflow.ellipsis,
                            ),
                          ),
                          Flexible(
                            child: Text("10 ALGO",
                              style: GoogleFonts.alata(
                                  fontWeight: FontWeight.w600,
                                  fontSize: 13.1,
                                  color: Color(0xFF51586D)
                              ),
                              overflow: TextOverflow.ellipsis,
                            ),
                          ),
                        ],
                      ),
                      SizedBox(height: 14,),
                    ],
                  ),
                ),
              ),
              SizedBox(height: 16,),
              Container(
                width: MediaQuery.of(context).size.width,
                decoration: BoxDecoration(
                  color: Color(0xFFFAFBFC),
                  borderRadius: BorderRadius.circular(5),
                  border: Border.all(color: Color(0xFFD4D6DB))
                ),
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 15,vertical: 5),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text("Auto Subscribe",
                        style: GoogleFonts.alata(
                          fontWeight: FontWeight.w600,
                          fontSize: 13.1,
                          color: Color(0xFF51586D)
                        ),
                      ),
                      // Switch(
                      //   value: isAutoSubscribeEnabled,
                      //   onChanged: (value) {
                      //     setState(() {
                      //       isAutoSubscribeEnabled = value;
                      //     });
                      //   },
                      //   activeColor: Color(0xFF00D1FF),
                      //   activeTrackColor: Color(0xFF00D1FF),
                      //   inactiveTrackColor: Color(0xFFF1F3FA),
                      //   inactiveThumbColor: Color(0xFFD4D6DB),
                      // ),
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
                        'Liquidify the asset',
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
      ),
    );
  }
}

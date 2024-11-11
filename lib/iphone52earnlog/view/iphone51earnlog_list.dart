import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class Iphone51earnlogList extends StatelessWidget {
  final String r1c1;
  final String r1c2;
  final String r2c1;
  final String r2c2;
  final String r3c1;
  final String r3c2;
  final String r4c1;
  final String r4c2;
  final String status;

  const Iphone51earnlogList({
    required this.r1c1,
    required this.r1c2,
    required this.r2c1,
    required this.r2c2,
    required this.r3c1,
    required this.r3c2,
    required this.r4c1,
    required this.r4c2,
    required this.status
});

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    return Container(
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
                                r1c1,
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
                                r1c2,
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
                        r2c1,
                        style: GoogleFonts.alata(
                          fontWeight: FontWeight.w400,
                          fontSize: 13.1,
                          color: Color(0xFF07112E),
                        ),
                      ),
                      Text(
                        r2c2,
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
                        r3c1,
                        style: GoogleFonts.alata(
                          fontWeight: FontWeight.w400,
                          fontSize: 13.1,
                          color: Color(0xFF51586D),
                        ),
                      ),
                      Text(
                        r3c2,
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
                        r4c1,
                        style: GoogleFonts.alata(
                          fontWeight: FontWeight.w400,
                          fontSize: 13.1,
                          color: status == "active" ? Color(0xFF4AB84D) : Color(0xFF00D1FF),
                        ),
                        overflow: TextOverflow.ellipsis,
                      ),
                      Text(
                        r4c2,
                        style: GoogleFonts.alata(
                          fontWeight: FontWeight.w400,
                          fontSize: 13.1,
                          color: status == "active" ? Color(0xFF4AB84D) : Color(0xFF00D1FF),
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
    );
  }
}

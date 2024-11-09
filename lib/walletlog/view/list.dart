import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class WalletLogScreenList extends StatelessWidget {
  final String r1c1;
  final String r1c2;
  final String r2c1;
  final String r2c2;
  final String r3c1;
  final String r3c2;
  final IconData icon;

  const WalletLogScreenList({
    required this.r1c1,
    required this.r1c2,
    required this.r2c1,
    required this.r2c2,
    required this.r3c1,
    required this.r3c2,
    required this.icon
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
                  flex: 3,
                  child: Row(
                    children: [
                      Container(
                        height: 30,
                        width: 30,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(50),
                            color: icon == Icons.arrow_back_outlined ? Color(0xFFEDC7D5) : Color(0xFFC7EDC8)
                        ),
                        child: Center(
                          child: Icon(icon,
                            color: icon == Icons.arrow_back_outlined ? Color(0xFFB84A72) : Color(0xFF4ABD48)
                          ),
                        ),
                      ),
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
                                style: GoogleFonts.alata(
                                  fontWeight: FontWeight.w400,
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
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                      Text(
                        r3c1,
                        style: GoogleFonts.alata(
                          fontWeight: FontWeight.w400,
                          fontSize: 13.1,
                          color: r3c1 == "Pending" ? Color(0xFFB8A24A) : Color(0xFF4AB84D),
                        ),
                        overflow: TextOverflow.ellipsis,
                      ),
                      Text(
                        r3c2,
                        style: GoogleFonts.alata(
                          fontWeight: FontWeight.w400,
                          fontSize: 13.1,
                          color: Color(0xFF51586D),
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

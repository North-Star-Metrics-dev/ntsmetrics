import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class EarnSearchScreen extends StatefulWidget {
  const EarnSearchScreen({super.key});

  @override
  State<EarnSearchScreen> createState() => _EarnSearchScreenState();
}

class _EarnSearchScreenState extends State<EarnSearchScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Padding(
        padding: const EdgeInsets.only(top: 50,left: 16,right: 16,bottom: 16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                Expanded(
                  flex: 7,
                  child: TextField(
                    decoration: InputDecoration(
                      hintText: "Search for an asset",
                      hintStyle: GoogleFonts.alata(
                          fontWeight: FontWeight.w400,
                          fontSize: 12,
                          color: Color(0xFF51586D)
                      ),
                      prefixIcon: Icon(Icons.search,size: 24,),
                      filled: true,
                      fillColor: Color(0xFFf1F3FA),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(30),
                        borderSide: BorderSide.none,
                      ),
                    ),
                  ),
                ),
                SizedBox(width: 10,),
                Expanded(
                    flex: 2,
                    child: Container(
                      decoration: BoxDecoration(
                        color: Color(0xFFD6E1FF),
                        borderRadius: BorderRadius.circular(20)
                      ),
                      child: Center(
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Text("Search",
                            style: GoogleFonts.alata(
                                fontWeight: FontWeight.w600,
                                fontSize: 13.1,
                                color: Color(0xFF002280)
                            ),
                            overflow: TextOverflow.ellipsis,
                          ),
                        ),
                      ),
                    )
                )
              ],
            ),
            SizedBox(height: 20,),
            Container(
              height: 2,
              width: MediaQuery.of(context).size.width,
              decoration: BoxDecoration(
                  color: Color(0xFFD4D6DB)
              ),
            ),
            SizedBox(height: 20,),
            Text("Search in Earn",
              style: GoogleFonts.alata(
                fontSize: 13.1,
                fontWeight: FontWeight.w400,
                color: Color(0xFF51586D)
              ),
            ),
            Text("Matching Result",
              style: GoogleFonts.alata(
                  fontSize: 17.47,
                  fontWeight: FontWeight.w600,
                  color: Color(0xFF07112E)
              ),
            ),
            SizedBox(height: 20,),
            Container(
              width: MediaQuery.of(context).size.width * 1,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  border: Border.all(color: Color(0xFFD4D6DB))
              ),
              child: Padding(
                  padding: const EdgeInsets.symmetric(vertical: 18,horizontal: 12),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Expanded(
                        flex: 5,
                        child: Row(
                          children: [
                            Flexible(
                              flex: 3,
                              child: Padding(
                                padding: const EdgeInsets.only(right: 8),
                                child: Image.asset("assets/images/EMC.png",),
                              ),
                            ),
                            Flexible(
                              flex: 7,
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text("Etherium",
                                    style: GoogleFonts.alata(
                                        fontWeight: FontWeight.w600,
                                        fontSize: 13.1,
                                        color: Color(0xFF07112E)
                                    ),
                                    overflow: TextOverflow.ellipsis,
                                  ),
                                  Text("7-90 days",
                                    style: GoogleFonts.sora(
                                        fontWeight: FontWeight.w400,
                                        fontSize: 13.1,
                                        color: Color(0xFF51586D)
                                    ),
                                    overflow: TextOverflow.ellipsis,
                                  )
                                ],
                              ),
                            )
                          ],
                        ),
                      ),
                      SizedBox(width: 10,),
                      Expanded(
                        flex: 5,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.end,
                          children: [
                            Text("+23.29%",
                              style: GoogleFonts.alata(
                                  fontWeight: FontWeight.w600,
                                  fontSize: 13.1,
                                  color: Color(0xFF4AB84D)
                              ),
                            ),
                            Text("APR Maximum",
                              style: GoogleFonts.alata(
                                  fontWeight: FontWeight.w400,
                                  fontSize: 13.1,
                                  color: Color(0xFF51586D)
                              ),
                              overflow: TextOverflow.ellipsis,
                            )
                          ],
                        ),
                      )
                    ],
                  )
              ),
            ),
          ],
        ),
      ),
    );
  }
}

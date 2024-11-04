import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class EarnScreen extends StatefulWidget {
  const EarnScreen({super.key});

  @override
  State<EarnScreen> createState() => _EarnScreenState();
}

class _EarnScreenState extends State<EarnScreen> {
  int selectedTopButtonIndex = 0;

  final List<String> topButtons = ["Featured", "Recently Added", "Highest APR%"];

  void onTopButtonPressed(int index) {
    setState(() {
      selectedTopButtonIndex = index;
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

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.only(top: 50,left: 16,right: 16,bottom: 16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  Expanded(
                    flex: 9,
                    child: TextField(
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
                          borderRadius: BorderRadius.circular(30),
                          borderSide: BorderSide.none,
                        ),
                      ),
                    ),
                  ),
                  Expanded(
                      flex: 1,
                      child: Icon(Icons.sort,size: 35,color: Color(0xFF07112E),))
                ],
              ),
              Padding(
                padding: const EdgeInsets.only(top: 15),
                child: Container(
                  width: MediaQuery.of(context).size.width * 1,
                  height: 1,
                  color: Color(0xFFD4D6DB),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 15,bottom: 15),
                child: Text("Earn",
                  style: GoogleFonts.sora(
                    fontSize: 17.47,
                    fontWeight: FontWeight.w600,
                    color: Color(0xFF07112E)
                  ),
                ),
              ),
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
              SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Row(
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(right: 15),
                      child: Container(
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          border: Border.all(color: Color(0xFFD4D6DB))
                        ),
                        child: Padding(
                          padding: const EdgeInsets.only(left: 12,top: 12,bottom: 12,right: 50),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Image.asset("assets/images/EMC.png"),
                              Padding(
                                padding: const EdgeInsets.only(top: 8),
                                child: Text("EMC",
                                  style: GoogleFonts.sora(
                                    fontSize: 13.1,
                                    fontWeight: FontWeight.w600,
                                    color: Color(0xFF07112E)
                                  ),
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.only(top: 14),
                                child: Text("62.80%",
                                  style: GoogleFonts.sora(
                                      fontSize: 17.47,
                                      fontWeight: FontWeight.w400,
                                      color: Color(0xFF4AB84D)
                                  ),
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.only(top: 8),
                                child: Text("APR Maximum",
                                  style: GoogleFonts.sora(
                                      fontSize: 10.92,
                                      fontWeight: FontWeight.w400,
                                      color: Color(0xFF51586D)
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ],
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
                                children: [
                                  Text("ChainLink",
                                    style: GoogleFonts.sora(
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
                              style: GoogleFonts.sora(
                                  fontWeight: FontWeight.w600,
                                  fontSize: 13.1,
                                  color: Color(0xFF4AB84D)
                              ),
                            ),
                            Text("APR Maximum",
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
                  )
                ),
              ),
              SizedBox(height: 10,),
            ],
          ),
        ),
      ),
    );
  }
}

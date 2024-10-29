import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:ntsmetrics/market/view/market_screen.dart';
import 'package:ntsmetrics/trade/view/trade_screen.dart';

class MarketSearchScreen extends StatefulWidget {
  const MarketSearchScreen({super.key});

  @override
  State<MarketSearchScreen> createState() => _MarketSearchScreenState();
}

class _MarketSearchScreenState extends State<MarketSearchScreen> {
  TextEditingController _searchController = TextEditingController();

  @override
  void initState() {
    super.initState();
    _searchController.addListener(() {
      setState(() {});
    });
  }

  @override
  void dispose() {
    _searchController.dispose();
    super.dispose();
  }

  void _clearSearch() {
    _searchController.clear();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  // Search Box with Clear Button
                  Expanded(
                    child: TextFormField(
                      cursorColor: Color(0xFF1956FC),
                      controller: _searchController,
                      decoration: InputDecoration(
                        prefixIcon: Icon(
                          Icons.search,
                          color: Color(0xFF1956FC),
                        ),
                        suffixIcon: _searchController.text.isNotEmpty
                            ? IconButton(
                          icon: Icon(Icons.close, color: Color(0xFF51586D)),
                          onPressed: _clearSearch,
                        )
                            : null,
                        hintText: "Liteco",
                        filled: true,
                        fillColor: Color(0xFFF1F3FA),
                        enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(30) ,
                          borderSide: BorderSide(color: Color(0xFF1956FC), width: 1.5),
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(35),
                          borderSide: BorderSide(color: Color(0xFF1956FC), width: 1.5),
                        ),
                        contentPadding: EdgeInsets.symmetric(vertical: 0.0),
                      ),
                    ),
                  ),
                  SizedBox(width: 15),
                  // "Small" Button
                  ElevatedButton(
                    onPressed: () {},
                    style: ElevatedButton.styleFrom(
                      padding: EdgeInsets.symmetric(horizontal: 18),
                      backgroundColor: Color(0xFFD6E1FF),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(20),
                      ),
                    ),
                    child: Text(
                      "Small",
                      style: GoogleFonts.sora(
                        fontSize: 12,
                        fontWeight: FontWeight.w600,
                        color: Color(0xFF002280)
                      ),
                    ),
                  ),
                ],
              ),
              SizedBox(height: 20),
              Padding(
                padding: const EdgeInsets.only(left: 16),
                child: Text(
                  "Search in Market",
                  style: GoogleFonts.sora(
                    fontWeight: FontWeight.w400,
                    fontSize: 12,
                    color: Color(0xFF51586D)
                  )
                ),
              ),
              SizedBox(height: 5),
              Padding(
                padding: const EdgeInsets.only(left: 16),
                child: Text(
                  "Matching Result",
                    style: GoogleFonts.sora(
                        fontWeight: FontWeight.w600,
                        fontSize: 16,
                        color: Color(0xFF07112E)
                    )
                ),
              ),
              SizedBox(height: 25),
              Container(
                color: Colors.transparent,
                child: Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Row(
                          children: [
                            Image.asset("assets/ENJ.png"),
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
            ],
          ),
        ),
      ),
    );
  }
}

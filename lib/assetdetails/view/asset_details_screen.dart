import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class AssetDetailsScreen extends StatefulWidget {
  const AssetDetailsScreen({super.key});

  @override
  State<AssetDetailsScreen> createState() => _AssetDetailsScreenState();
}

class _AssetDetailsScreenState extends State<AssetDetailsScreen> {
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
        title: Text('Algorand (ALGO)',
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
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text("About Token",
                style: GoogleFonts.sora(
                  fontSize: 16.84,
                  fontWeight: FontWeight.w600,
                  color: Color(0xFF07112E)
                ),
              ),
              SizedBox(height: 10,),
              Text("Algorand is a self-sustaining, decentralized, blockchain based network that supports a wide range of applications.These systems are secure,scalable and efficient, all critical properties for effective ",
                style: GoogleFonts.sora(
                    fontSize: 12.63,
                    fontWeight: FontWeight.w400,
                    color: Color(0xFF51586D)
                ),
              ),
              SizedBox(height: 10,),
              Text("View More",
                style: GoogleFonts.sora(
                    fontSize: 12.63,
                    fontWeight: FontWeight.w600,
                    color: Color(0xFF00D1FF)
                ),
              ),
              SizedBox(height: 10,),
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
                      //transaction pair text
                      Padding(
                        padding: const EdgeInsets.symmetric(vertical: 12),
                        child: Text("Token Details",
                          style: GoogleFonts.sora(
                              fontWeight: FontWeight.w600,
                              fontSize: 16.84,
                              color: Color(0xFF07112E)
                          ),
                        ),
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
                          Flexible(
                            child: Text("Market Cap",
                              style: GoogleFonts.sora(
                                  fontWeight: FontWeight.w400,
                                  fontSize: 12.63,
                                  color: Color(0xFF51586D)
                              ),
                              overflow: TextOverflow.ellipsis,
                            ),
                          ),
                          Flexible(
                            child: Text("&1.08B",
                              style: GoogleFonts.sora(
                                  fontWeight: FontWeight.w600,
                                  fontSize: 12.63,
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
                            child: Text("Volume(24h)",
                              style: GoogleFonts.sora(
                                  fontWeight: FontWeight.w400,
                                  fontSize: 12.63,
                                  color: Color(0xFF51586D)
                              ),
                              overflow: TextOverflow.ellipsis,
                            ),
                          ),
                          Flexible(
                            child: Text("&147.83M",
                              style: GoogleFonts.sora(
                                  fontWeight: FontWeight.w600,
                                  fontSize: 12.63,
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
                            child: Text("Volume/Market Cap",
                              style: GoogleFonts.sora(
                                  fontWeight: FontWeight.w400,
                                  fontSize: 12.63,
                                  color: Color(0xFF51586D)
                              ),
                              overflow: TextOverflow.ellipsis,
                            ),
                          ),
                          Flexible(
                            child: Text("7.52%",
                              style: GoogleFonts.sora(
                                  fontWeight: FontWeight.w600,
                                  fontSize: 12.63,
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
                            child: Text("Circulatig supply",
                              style: GoogleFonts.sora(
                                  fontWeight: FontWeight.w400,
                                  fontSize: 12.63,
                                  color: Color(0xFF51586D)
                              ),
                              overflow: TextOverflow.ellipsis,
                            ),
                          ),
                          Flexible(
                            child: Text("8.01B ALGO",
                              style: GoogleFonts.sora(
                                  fontWeight: FontWeight.w600,
                                  fontSize: 12.63,
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

                      //last part
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Flexible(
                            child: Text("Total Supply",
                              style: GoogleFonts.sora(
                                  fontWeight: FontWeight.w400,
                                  fontSize: 12.63,
                                  color: Color(0xFF51586D)
                              ),
                              overflow: TextOverflow.ellipsis,
                            ),
                          ),
                          Flexible(
                            child: Text("8.01B ALGO",
                              style: GoogleFonts.sora(
                                  fontWeight: FontWeight.w600,
                                  fontSize: 12.63,
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
                            child: Text("Max supply",
                              style: GoogleFonts.sora(
                                  fontWeight: FontWeight.w400,
                                  fontSize: 12.63,
                                  color: Color(0xFF51586D)
                              ),
                              overflow: TextOverflow.ellipsis,
                            ),
                          ),
                          Flexible(
                            child: Text("10B ALGO",
                              style: GoogleFonts.sora(
                                  fontWeight: FontWeight.w600,
                                  fontSize: 12.63,
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
                            child: Text("Fully diluted market cap",
                              style: GoogleFonts.sora(
                                  fontWeight: FontWeight.w400,
                                  fontSize: 12.63,
                                  color: Color(0xFF51586D)
                              ),
                              overflow: TextOverflow.ellipsis,
                            ),
                          ),
                          Flexible(
                            child: Text("&1.35B",
                              style: GoogleFonts.sora(
                                  fontWeight: FontWeight.w600,
                                  fontSize: 12.63,
                                  color: Color(0xFF51586D)
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
              SizedBox(height: 20,),
              Text("Available Plans",
                style: GoogleFonts.sora(
                    fontSize: 16.84,
                    fontWeight: FontWeight.w600,
                    color: Color(0xFF07112E)
                ),
              ),
              SizedBox(height: 10,),
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
              SizedBox(height: 15,),
              SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                  onPressed: () {
                    // Add proceed functionality here
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor:  Color(0xFF00D1FF),
                    padding: EdgeInsets.symmetric(vertical: 16),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(30),
                    ),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 10),
                    child: Text(
                      'Subscribe',
                      style: GoogleFonts.sora(
                          fontWeight: FontWeight.w400,
                          fontSize: 16.84,
                          color: Color(0xFFFAFBFC)
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

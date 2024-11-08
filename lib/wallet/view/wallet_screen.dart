import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../steps/view/custom_icon_button.dart';

class WalletScreen extends StatefulWidget {
  const WalletScreen({super.key});

  @override
  State<WalletScreen> createState() => _WalletScreenState();
}

class _WalletScreenState extends State<WalletScreen> {
  int selectedIndex = -1;
  String selectedTab = "Market";

  void onIconTap(int index) {
    setState(() { selectedIndex = index; });
  }

  Widget buildToggleButton(String label) {
    return GestureDetector(
      onTap: () {
        setState(() {
          selectedTab = label;
        });
      },
      child: Container(
        padding: EdgeInsets.symmetric(vertical: 2, horizontal: 24),
        decoration: BoxDecoration(
          color: selectedTab == label ? Colors.white : Colors.transparent,
          borderRadius: BorderRadius.circular(8),
        ),
        child: Center(
          child: Text(
            label,
            style: GoogleFonts.alata(
                color: Color(0xFF07112E),
                fontWeight: FontWeight.w400,
                fontSize: 17.17
            ),
          ),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: Text("Wallet",
          style: GoogleFonts.alata(
            fontSize: 17.47,
            fontWeight: FontWeight.w400,
            color: Color(0xFF07112E)
          ),
        ),
        elevation: 0,
        backgroundColor: Colors.white,
        actions: [
          Icon(Icons.account_circle_outlined,
            size: 26.2,
            color: Color(0xFF51586D),
          ),
          SizedBox(width: 10,),
          Icon(Icons.notifications_none,
            size: 26.2,
            color: Color(0xFF51586D),
          ),
          SizedBox(width: 14,)
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text("Total asset",
              style: GoogleFonts.alata(
                fontWeight: FontWeight.w400,
                fontSize: 17.47,
                color: Color(0xFF51586D)
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text("&50398.03025",
                  style: GoogleFonts.alata(
                      fontWeight: FontWeight.w400,
                      fontSize: 17.47,
                      color: Color(0xFF07112E)
                  ),
                ),
                Icon(Icons.remove_red_eye_outlined,
                  size: 26.2,
                  color: Color(0xFF51586D),
                ),
              ],
            ),
            SizedBox(height: 12,),
            Text("P&L",
              style: GoogleFonts.alata(
                  fontWeight: FontWeight.w400,
                  fontSize: 17.47,
                  color: Color(0xFF51586D)
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Flexible(
                  child: Text("+&1,388/+3.99%",
                    style: GoogleFonts.alata(
                        fontWeight: FontWeight.w400,
                        fontSize: 17.47,
                        color: Color(0xFF4AB84D)
                    ),
                    overflow: TextOverflow.ellipsis,
                  ),
                ),
                Flexible(
                  child: Text("See Statistics >",
                    style: GoogleFonts.alata(
                        fontWeight: FontWeight.w400,
                        fontSize: 17.47,
                        color: Color(0xFF00D1FF)
                    ),
                    overflow: TextOverflow.ellipsis,
                  ),
                ),
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
            SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Row(
                children: [
                  CustomIconButton(
                    icon: Icons.list,
                    label: 'Log',
                    isSelected: selectedIndex == 0,
                    onTap: () => onIconTap(0),
                  ),
                  CustomIconButton(
                    icon: Icons.arrow_back_outlined,
                    label: 'Deposit',
                    isSelected: selectedIndex == 1,
                    onTap: () => onIconTap(1),
                  ),
                  CustomIconButton(
                    icon: Icons.arrow_back_outlined,
                    label: 'Withdraw',
                    isSelected: selectedIndex == 2,
                    onTap: () => onIconTap(2),
                  ),
                  CustomIconButton(
                    icon: Icons.arrow_circle_right_outlined,
                    label: 'Transfer',
                    isSelected: selectedIndex == 3,
                    onTap: () => onIconTap(3),
                  ),
                  CustomIconButton(
                    icon: Icons.compare_arrows_outlined,
                    label: 'Convert',
                    isSelected: selectedIndex == 4,
                    onTap: () => onIconTap(4),
                  ),
                ],
              ),
            ),
            SizedBox(height: 15,),
            Container(
              decoration: BoxDecoration(
                color: Color(0xFFF1F3FA),
                borderRadius: BorderRadius.circular(8),
              ),
              child: Padding(
                padding: const EdgeInsets.all(5.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Expanded(child: buildToggleButton("Market")),
                    SizedBox(width: 10),
                    Expanded(child: buildToggleButton("Earn")),
                  ],
                ),
              ),
            ),
            SizedBox(height: 15,),
            Container(
              width: MediaQuery.of(context).size.width,
              decoration: BoxDecoration(
                color: Color(0xFFF1F3FA),
                borderRadius: BorderRadius.circular(10)
              ),
              child: Padding(
                padding: const EdgeInsets.all(10.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Flexible(
                      child: Column(
                        children: [
                          Text("Total asset value",
                            style: GoogleFonts.alata(
                              fontWeight: FontWeight.w400,
                              fontSize: 13.1,
                              color: Color(0xFF51586D)
                            ),
                            overflow: TextOverflow.ellipsis,
                          ),
                          Text("&50,398.02035",
                            style: GoogleFonts.alata(
                                fontWeight: FontWeight.w400,
                                fontSize: 13.1,
                                color: Color(0xFF51586D)
                            ),
                            overflow: TextOverflow.ellipsis,
                          )
                        ],
                      ),
                    ),
                    Flexible(
                      child: Column(
                        children: [
                          Text("24h P&L",
                            style: GoogleFonts.alata(
                                fontWeight: FontWeight.w400,
                                fontSize: 13.1,
                                color: Color(0xFF51586D)
                            ),
                            overflow: TextOverflow.ellipsis,
                          ),
                          Text("-&1,388/-3.99%",
                            style: GoogleFonts.alata(
                                fontWeight: FontWeight.w400,
                                fontSize: 13.1,
                                color: Color(0xFFB84A72)
                            ),
                            overflow: TextOverflow.ellipsis,
                          ),
                        ],
                      ),
                    ),
                    Flexible(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.end,
                        children: [
                          Text("Asset",
                            style: GoogleFonts.alata(
                                fontWeight: FontWeight.w400,
                                fontSize: 13.1,
                                color: Color(0xFF51586D)
                            ),
                            overflow: TextOverflow.ellipsis,
                          ),
                          Text("10 Coins",
                            style: GoogleFonts.alata(
                                fontWeight: FontWeight.w400,
                                fontSize: 13.1,
                                color: Color(0xFF51586D)
                            ),
                            overflow: TextOverflow.ellipsis,
                          ),
                        ],
                      ),
                    )
                  ],
                ),
              ),
            ),
            Container(
              color: Colors.transparent,
              child: Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 15),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Flexible(
                          child: Row(
                            children: [
                              Image.asset("assets/images/transaction_pair.png"),
                              Padding(
                                padding: const EdgeInsets.only(left: 10),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      "LTC",
                                      style: GoogleFonts.alata(
                                        fontWeight: FontWeight.w400,
                                        fontSize: 13.1,
                                        color: Color(0xFF07112E),
                                      ),
                                      overflow: TextOverflow.ellipsis,
                                    ),
                                    Text(
                                      "Litecoin",
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
                        Flexible(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.end,
                            children: [
                              Text(
                                "188.080",
                                style: GoogleFonts.alata(
                                  fontWeight: FontWeight.w400,
                                  fontSize: 13.1,
                                  color: Color(0xFF07112E),
                                ),
                                overflow: TextOverflow.ellipsis,
                              ),
                              Text(
                                "&13,479.71",
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
            ),
          ],
        ),
      ),
    );
  }
}

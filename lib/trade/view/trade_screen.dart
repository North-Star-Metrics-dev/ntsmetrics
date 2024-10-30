import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class TradeScreen extends StatefulWidget {
  @override
  _TradeScreenState createState() => _TradeScreenState();
}

class _TradeScreenState extends State<TradeScreen> {
  int limitPrice = 0;
  int solTotal = 0;
  int usdtTotal = 0;
  String selectedTab = "Limit";

  void incrementValue(Function setValue, int value) {
    if (value < 100) {
      setState(() {
        setValue(value + 1);
      });
    }
  }

  void decrementValue(Function setValue, int value) {
    if (value > 0) {
      setState(() {
        setValue(value - 1);
      });
    }
  }

  Widget buildCounter(String label, int value, Function setValue) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.only(left: 10),
          child: Text(label,
            style: GoogleFonts.alata(
              fontSize: 17.47,
              fontWeight: FontWeight.w400,
              color: Color(0xFF07112E)
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(top: 6),
          child: Container(
            decoration: BoxDecoration(
              color: Color(0xFFF1f3FA),
              border: Border.all(color: Color(0xFFD4D6DB)),
              borderRadius: BorderRadius.circular(10)
            ),
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 8,vertical: 5),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  IconButton(
                    icon: Icon(Icons.remove),
                    onPressed: () => decrementValue(setValue, value),
                  ),
                  Text(value.toString(),
                    style: GoogleFonts.sora(
                      fontSize: 17.47,
                      fontWeight: FontWeight.w400,
                      color: Color(0xFF51586D)
                    ),
                  ),
                  IconButton(
                    icon: Icon(Icons.add),
                    onPressed: () => incrementValue(setValue, value),
                  ),
                ],
              ),
            ),
          ),
        ),
      ],
    );
  }

  Widget buildProgressIndicator(int value) {
    Color filledColor = Color(0xFF00D1FF);
    Color unfilledColor = Color(0xFFF1F3FA)!;
    Color borderColor = Color(0xFFD4D6DB);

    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: [
        Expanded(
          child: Column(
            children: [
              Container(
                height: 10,
                decoration: BoxDecoration(
                  border: Border.all(color: borderColor),
                  color: value >= 25 ? filledColor : unfilledColor,
                ),
              ),
              Text("25%",
                style: GoogleFonts.sora(
                    fontWeight: FontWeight.w600,
                    fontSize: 17.47,
                    color: Color(0xFF07112E)
                ),
              )
            ],
          ),
        ),
        SizedBox(width: 5),
        Expanded(
          child: Column(
            children: [
              Container(
                height: 10,
                decoration: BoxDecoration(
                  border: Border.all(color: borderColor),
                  color: value >= 50 ? filledColor : unfilledColor,
                ),
              ),
              Text("50%",
                style: GoogleFonts.sora(
                    fontWeight: FontWeight.w600,
                    fontSize: 17.47,
                    color: Color(0xFF07112E)
                ),
              )
            ],
          ),
        ),
        SizedBox(width: 5),
        Expanded(
          child: Column(
            children: [
              Container(
                height: 10,
                decoration: BoxDecoration(
                  border: Border.all(color: borderColor),
                  color: value >= 75 ? filledColor : unfilledColor,
                ),
              ),
              Text("75%",
                style: GoogleFonts.sora(
                    fontWeight: FontWeight.w600,
                    fontSize: 17.47,
                    color: Color(0xFF07112E)
                ),
              )
            ],
          ),
        ),
        SizedBox(width: 5),
        Expanded(
          child: Column(
            children: [
              Container(
                height: 10,
                decoration: BoxDecoration(
                  border: Border.all(color: borderColor),
                  color: value >= 100 ? filledColor : unfilledColor,
                ),
              ),
              Text("100%",
                style: GoogleFonts.sora(
                    fontWeight: FontWeight.w600,
                    fontSize: 17.47,
                    color: Color(0xFF07112E)
                ),
              )
            ],
          ),
        ),
      ],
    );
  }

  Widget buildToggleButton(String label) {
    return GestureDetector(
      onTap: () {
        setState(() {
          selectedTab = label; // Update selected tab
        });
      },
      child: Container(
        padding: EdgeInsets.symmetric(vertical: 8, horizontal: 24),
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
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            children: [
              Row(
                children: [
                  Icon(Icons.close),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 10),
                    child: Image.asset("assets/images/trade.png"),
                  ),
                  Text("SOL/USDT",
                    style: GoogleFonts.alata(
                        fontWeight: FontWeight.w400,
                        fontSize: 17.47,
                        color: Color(0xFF00172E)
                    ),
                  ),
                  Spacer(),
                  Icon(Icons.bar_chart,color: Color(0xFF51586D),),
                ],
              ),
              Padding(
                padding: const EdgeInsets.only(top: 15,bottom: 20),
                child: Container(
                  height: 1,
                  width: MediaQuery.of(context).size.width,
                  color: Color(0xFFD4D6DB),
                ),
              ),
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
                      Expanded(child: buildToggleButton("Limit")),
                      SizedBox(width: 10),
                      Expanded(child: buildToggleButton("Market")),
                    ],
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 25),
                child: buildCounter("Limit Price", limitPrice, (val) => limitPrice = val),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 25),
                child: buildCounter("SOL Total", solTotal, (val) => solTotal = val),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 12,horizontal: 6),
                child: buildProgressIndicator(solTotal),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 25),
                child: buildCounter("USDT Total", usdtTotal, (val) => usdtTotal = val),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 25),
                child: Container(
                  width: MediaQuery.of(context).size.width,
                  decoration: BoxDecoration(
                    color: Color(0xFFECEDF0),
                    borderRadius: BorderRadius.circular(5)
                  ),
                  child: Padding(
                    padding: const EdgeInsets.symmetric(vertical: 16,horizontal: 12),
                    child: Text("Available: 399.40 USDT",
                      style: GoogleFonts.alata(
                        fontSize: 17.47,
                        fontWeight: FontWeight.w400,
                        color: Color(0xFF00D1FF)
                      ),
                    ),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 105),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    SizedBox(
                      width: MediaQuery.of(context).size.width * 0.45,
                      child: ElevatedButton(
                        onPressed: () {},
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Color(0xFFD6E1FF),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(30),
                          ),
                        ),
                        child: Padding(
                          padding: const EdgeInsets.symmetric(vertical: 11),
                          child: Text(
                            'Sell',
                            style: GoogleFonts.alata(
                              fontSize: 17.47,
                              fontWeight: FontWeight.w400,
                              color: Color(0xFF002280),
                            ),
                          ),
                        ),
                      ),
                    ),
                    SizedBox(
                      width: MediaQuery.of(context).size.width * 0.45,
                      child: ElevatedButton(
                        onPressed: () {},
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Color(0xFF00D1FF),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(30),
                          ),
                        ),
                        child: Padding(
                          padding: const EdgeInsets.symmetric(vertical: 11),
                          child: Text(
                            'Buy',
                            style: GoogleFonts.alata(
                              fontSize: 17.47,
                              fontWeight: FontWeight.w400,
                              color: Color(0xFFFAFBFC),
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
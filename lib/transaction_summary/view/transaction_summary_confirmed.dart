import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:ntsmetrics/buttons/buttons.dart';

class SummaryConfirmScreen extends StatefulWidget {
  @override
  State<SummaryConfirmScreen> createState() => _SummaryConfirmScreenState();
}

class _SummaryConfirmScreenState extends State<SummaryConfirmScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[200],
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        toolbarHeight: 30,
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          Container(
                  padding: EdgeInsets.symmetric(horizontal: 16.0, vertical: 12.0),
                  decoration: BoxDecoration(
                    color: Color(0xFF000000),
                    borderRadius: BorderRadius.circular(8.0),
                  ),
                  child: Row(
                    children: [
                      Icon(Icons.check_circle, color: Color(0xFF00C853)), // Green check icon
                      SizedBox(width: 8),
                      Expanded(
                        child: Text(
                          'Buy SOL/USDT (1.099) is successfully placed',
                          style: TextStyle(color: Colors.white),
                        ),
                      ),
                    ],
                  ),
                ),
          Container(
            padding: EdgeInsets.all(16.0),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(16.0),
                topRight: Radius.circular(16.0),
              ),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text("Summary",
          style: GoogleFonts.alata(
            fontSize: 17.37,
            fontWeight: FontWeight.w400,
            color: Color(0xFF07112E),
          ),
        ),
              
                SizedBox(height: 8.0),
                Container(
                  padding: EdgeInsets.all(12.0),
                  decoration: BoxDecoration(
                    color: Colors.blue[50],
                    borderRadius: BorderRadius.circular(8.0),
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        children: [
                        Image.asset(
                            'assets/s_tra.png',
                            width: 20,
                            height: 20,
                          ), // Add the correct icon here
                          SizedBox(width: 8.0),
                           Text("Transaction Pair",
          style: GoogleFonts.alata(
            fontSize: 17.37,
            fontWeight: FontWeight.w400,
            color: Color(0xFF07112E),
          ),
        ),
                         
                          Spacer(),
                          Text("Solana (SOL) / Tether (USDT)",
          style: GoogleFonts.alata(
            fontSize: 17.37,
            fontWeight: FontWeight.w400,
            color: Color(0xFF07112E),
          ),
        ),
                        
                        ],
                      ),
                      SizedBox(height: 8.0),
                      buildSummaryRow("Price Type", "Limit"),
                      buildSummaryRow("Limit Price", "59.41"),
                      buildSummaryRow("USDT Total", "59.41"),
                      buildSummaryRow("SOL Total", "1.099"),
                      buildSummaryRow("Gas Fee", "0.05 USDT"),
                      Divider(thickness: 1, color: Colors.blue[100]),
                      Container(
                        padding: EdgeInsets.symmetric(vertical: 8.0),
                        alignment: Alignment.center,
                        child: Text(
                          "Total 1.149 USDT",
                          style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.bold,
                            color: Colors.blue,
                          ),
                        ),
                      ),

           
                    ],
                  ),
                ),
              ],
            ),
            
          ),
                       Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 16.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
         Buttons()
              ],
            ),
          ),],
        
      ),
      
    );
  }

  Widget buildSummaryRow(String label, String value) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 4.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            label,
            style: TextStyle(fontSize: 14, color: Colors.grey[700]),
          ),
          Text(
            value,
            style: TextStyle(fontSize: 14, fontWeight: FontWeight.bold),
          ),
        ],
      ),
    );
  }
}

import 'package:flutter/material.dart';



class TradeScreen_new extends StatefulWidget {
  @override
  State<TradeScreen_new> createState() => _TradeScreen_newState();
}

class _TradeScreen_newState extends State<TradeScreen_new> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[200],
      appBar: AppBar(
        leading: IconButton(
          icon: Icon(Icons.close),
          onPressed: () {},
        ),
        title: Row(
          children: [
            CircleAvatar(
              backgroundImage: AssetImage('assets/sol_logo.png'), // SOL icon
              radius: 12,
            ),
            SizedBox(width: 4),
            CircleAvatar(
              backgroundImage: AssetImage('assets/usdt_logo.png'), // USDT icon
              radius: 12,
            ),
            SizedBox(width: 8),
            Text("SOL/USDT"),
          ],
        ),
        backgroundColor: Colors.white,
        foregroundColor: Colors.black,
        elevation: 0,
      ),
      body: Padding(
        padding: EdgeInsets.all(16.0),
        child: Column(
          children: [
            // Tabs for Limit and Market
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                TextButton(
                  onPressed: () {},
                  child: Text("Limit"),
                ),
                TextButton(
                  onPressed: () {},
                  child: Text("Market"),
                ),
              ],
            ),
            SizedBox(height: 16),
            // Limit Price Row
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text("Limit Price"),
                Row(
                  children: [
                    IconButton(
                      icon: Icon(Icons.remove),
                      onPressed: () {},
                    ),
                    Text("59.41"),
                    IconButton(
                      icon: Icon(Icons.add),
                      onPressed: () {},
                    ),
                  ],
                ),
              ],
            ),
            SizedBox(height: 16),
            // SOL Total and USDT Total
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text("SOL Total"),
                    Row(
                      children: [
                        IconButton(
                          icon: Icon(Icons.remove),
                          onPressed: () {},
                        ),
                        Text("1.099"),
                        IconButton(
                          icon: Icon(Icons.add),
                          onPressed: () {},
                        ),
                      ],
                    ),
                  ],
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text("USDT Total"),
                    Row(
                      children: [
                        IconButton(
                          icon: Icon(Icons.remove),
                          onPressed: () {},
                        ),
                        Text("59.41"),
                        IconButton(
                          icon: Icon(Icons.add),
                          onPressed: () {},
                        ),
                      ],
                    ),
                  ],
                ),
              ],
            ),
            SizedBox(height: 16),
            // Percentage buttons
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                for (var percentage in ['25%', '50%', '75%', '100%'])
                  ElevatedButton(
                    onPressed: () {},
                    child: Text(percentage),
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.grey[300],
                      foregroundColor: Colors.black,
                    ),
                  ),
              ],
            ),
            SizedBox(height: 16),
            // Available balance
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Text("Available: 399.40 USDT",
                    style: TextStyle(color: Colors.blue)),
              ],
            ),
            SizedBox(height: 16),
            // Sell and Buy buttons
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                ElevatedButton(
                  onPressed: () {},
                  child: Text("Sell"),
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.purple,
                  ),
                ),
                ElevatedButton(
                  onPressed: () {},
                  child: Text("Buy"),
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.blue,
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

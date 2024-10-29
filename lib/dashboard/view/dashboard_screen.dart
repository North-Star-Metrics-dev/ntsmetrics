import 'package:flutter/material.dart';


class DashboardScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        title: TextField(
          decoration: InputDecoration(
            hintText: 'Search for an asset',
            border: InputBorder.none,
            prefixIcon: Icon(Icons.search),
          ),
        ),
        actions: [
          IconButton(icon: Icon(Icons.person), onPressed: () {}),
          IconButton(icon: Icon(Icons.notifications), onPressed: () {}),
        ],
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Total Asset
            Text(
              'Total Asset',
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
            ),
            Text(
              '\$50,398.03025',
              style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
            ),
            Text(
              '24h P&L +\$1,388 / +3.99%',
              style: TextStyle(color: Colors.green, fontSize: 16),
            ),
            SizedBox(height: 20),

            // Latest Transactions
            Text(
              'Latest Transactions',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            _buildTransactionRow('Deposit', '\$3,045', 'Pending'),
            _buildTransactionRow('Withdraw', '\$3,045', 'Success'),
            SizedBox(height: 20),

            // Earn Section
            Text(
              'Earn',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 10),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                _buildEarnTile('ALGO', '63.86%', Colors.green),
                _buildEarnTile('EMC', '', Colors.grey),
                _buildEarnTile('OMG', '', Colors.grey),
              ],
            ),
            SizedBox(height: 20),

            // Market Section
            Text(
              'Market',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 10),
            _buildMarketRow('BTC/USDT', '38,081.82', '+853.08', '+2.29%'),
            _buildMarketRow('ETH/USDT', '2,053.39', '+27.77', '+1.37%'),
            _buildMarketRow('SOL/USDT', '58.10', '+10.08', '+6.24%'),
            SizedBox(height: 20),

            // Feed Section
            Row(
              children: [
                Expanded(child: _buildFeedTab('Feed', true)),
                Expanded(child: _buildFeedTab('Article', false)),
              ],
            ),
            _buildFeedPost(
                'Emily Bogdanović', '@emibovic', 'Crypto Winter or Bullish Cheer? 🎄'),
          ],
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: [
          BottomNavigationBarItem(icon: Icon(Icons.dashboard), label: 'Dashboard'),
          BottomNavigationBarItem(icon: Icon(Icons.bar_chart), label: 'Market'),
          BottomNavigationBarItem(icon: Icon(Icons.account_balance_wallet), label: 'Wallet'),
          BottomNavigationBarItem(icon: Icon(Icons.money), label: 'Earn'),
          BottomNavigationBarItem(icon: Icon(Icons.people), label: 'Community'),
        ],
      ),
    );
  }

  Widget _buildTransactionRow(String title, String amount, String status) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 8),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(title),
          Text(amount),
          Text(status),
        ],
      ),
    );
  }

  Widget _buildEarnTile(String title, String percentage, Color color) {
    return Column(
      children: [
        CircleAvatar(
          radius: 30,
          backgroundColor: color.withOpacity(0.1),
          child: Text(
            title,
            style: TextStyle(color: color),
          ),
        ),
        SizedBox(height: 5),
        Text(percentage, style: TextStyle(color: color)),
      ],
    );
  }

  Widget _buildMarketRow(String pair, String price, String change, String percentage) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 8),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(pair),
          Column(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              Text(price),
              Text(change, style: TextStyle(color: Colors.green)),
              Text(percentage, style: TextStyle(color: Colors.green)),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildFeedTab(String title, bool isActive) {
    return Container(
      padding: EdgeInsets.symmetric(vertical: 12),
      alignment: Alignment.center,
      decoration: BoxDecoration(
        color: isActive ? Colors.blue : Colors.grey[300],
      ),
      child: Text(title, style: TextStyle(color: isActive ? Colors.white : Colors.black)),
    );
  }

  Widget _buildFeedPost(String name, String handle, String content) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text('$name ($handle)', style: TextStyle(fontWeight: FontWeight.bold)),
        Text(content),
      ],
    );
  }
}

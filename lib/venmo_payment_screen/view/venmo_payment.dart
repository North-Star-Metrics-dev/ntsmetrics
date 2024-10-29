import 'package:flutter/material.dart';

class VenmoPaymentScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFFF7F8FA), // Light background color
      body: Column(
        children: [
          SizedBox(height: 100),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                // Top notification bar with success message
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
                          'Venmo is successfully connected',
                          style: TextStyle(color: Colors.white),
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(height: 30),

                // Pay with Venmo Section
                Text(
                  'Pay with Venmo',
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                    color: Colors.black,
                  ),
                ),
                SizedBox(height: 10),

                // BottomSheet trigger button
                ElevatedButton(
                  onPressed: () {
                    showModalBottomSheet(
                      context: context,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
                      ),
                      isScrollControlled: true,
                      builder: (context) => _buildBottomSheet(),
                    );
                  },
                  child: Text('Connect Venmo'),
                ),
              ],
            ),
          ),
          Spacer(),

          // Bottom "Confirm" buttons
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 16.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                _buildConfirmButton('Confirm', Colors.black),
                _buildConfirmButton('Confirm', Colors.grey[400]!),
              ],
            ),
          ),
        ],
      ),
    );
  }

  // BottomSheet content
  Widget _buildBottomSheet() {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          ListTile(
            leading: Icon(Icons.verified_user, color: Colors.blue),
            title: Text('Authorize Entrybit to charge future purchases'),
            subtitle: Text('(deposit/withdraw)'),
          ),
          Divider(),
          ListTile(
            leading: Icon(Icons.person, color: Colors.grey),
            title: Text('Donald Dunn @notjarred'),
          ),
          ListTile(
            leading: Icon(Icons.account_balance_wallet, color: Colors.blue),
            title: Text('Pay with Venmo Balance'),
          ),
        ],
      ),
    );
  }

  // Helper method to build confirm button
  Widget _buildConfirmButton(String text, Color color) {
    return ElevatedButton(
      onPressed: () {
        // Confirm button logic here
      },
      style: ElevatedButton.styleFrom(
        minimumSize: Size(160, 50), // Button size
        backgroundColor: color,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(12),
        ),
      ),
      child: Text(
        text,
        style: TextStyle(fontSize: 16, color: Colors.white),
      ),
    );
  }
}


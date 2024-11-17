import 'package:flutter/material.dart';

class FilterBottomSheet extends StatefulWidget {
  @override
  _FilterBottomSheetState createState() => _FilterBottomSheetState();
}

class _FilterBottomSheetState extends State<FilterBottomSheet> {
  List<String> selectedCoins = [];
  double subscriptionAmount = 100;
  String selectedLockingPeriod = "All";

  final List<String> coins = [
    "Ethereum", "Cardano", "Polkadot", "Tether", 
    "Algorand", "Cosmos", "VeChain"
  ];

  final List<String> lockingPeriods = [
    "All", "Flexible", "30 Days", "60 Days", "90 Days"
  ];

  @override
  Widget build(BuildContext context) {
    return Material( // Added Material widget here
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 20.0),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                IconButton(
                  icon: Icon(Icons.close),
                  onPressed: () => Navigator.pop(context),
                ),
                Text(
                  "Filter",
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                ),
              ],
            ),
            SizedBox(height: 20),
            Text(
              "Select Coin",
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
            ),
            Wrap(
              spacing: 8,
              children: coins.map((coin) => _buildCoinChip(coin)).toList(),
            ),
            SizedBox(height: 20),
            Text(
              "Subscription Amount",
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 10),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text("\$${subscriptionAmount.toInt()}"),
                Text("\$1000"),
              ],
            ),
            Slider(
              value: subscriptionAmount,
              min: 0,
              max: 1000,
              divisions: 10,
              onChanged: (value) {
                setState(() {
                  subscriptionAmount = value;
                });
              },
              activeColor: Colors.lightBlueAccent,
              inactiveColor: Colors.grey.shade300,
            ),
            SizedBox(height: 20),
            Text(
              "Locking Period",
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
            ),
            Wrap(
              spacing: 8,
              children: lockingPeriods
                  .map((period) => _buildLockingPeriodChip(period))
                  .toList(),
            ),
            SizedBox(height: 20),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                ElevatedButton(
                  onPressed: () {
                    setState(() {
                      selectedCoins.clear();
                      subscriptionAmount = 100;
                      selectedLockingPeriod = "All";
                    });
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.grey.shade200,
                    foregroundColor: Colors.black,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(8),
                    ),
                  ),
                  child: Text("Reset Filter"),
                ),
                ElevatedButton(
                  onPressed: () {
                    // Handle Apply Filter
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.lightBlueAccent,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(8),
                    ),
                  ),
                  child: Text("Apply Filter"),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildCoinChip(String coin) {
    bool isSelected = selectedCoins.contains(coin);
    return ChoiceChip(
      label: Text(coin),
      selected: isSelected,
      selectedColor: Colors.lightBlueAccent.withOpacity(0.2),
      onSelected: (selected) {
        setState(() {
          isSelected ? selectedCoins.remove(coin) : selectedCoins.add(coin);
        });
      },
      labelStyle: TextStyle(
        color: isSelected ? Colors.blue : Colors.black,
        fontWeight: FontWeight.bold,
      ),
    );
  }

  Widget _buildLockingPeriodChip(String period) {
    bool isSelected = selectedLockingPeriod == period;
    return ChoiceChip(
      label: Text(period),
      selected: isSelected,
      selectedColor: Colors.lightBlueAccent.withOpacity(0.2),
      onSelected: (selected) {
        setState(() {
          selectedLockingPeriod = period;
        });
      },
      labelStyle: TextStyle(
        color: isSelected ? Colors.blue : Colors.black,
        fontWeight: FontWeight.bold,
      ),
    );
  }
}

// Function to show the filter bottom sheet
void showFilterBottomSheet(BuildContext context) {
  showModalBottomSheet(
    context: context,
    isScrollControlled: true,
    backgroundColor: Colors.white,
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.vertical(top: Radius.circular(16)),
    ),
    builder: (context) => FilterBottomSheet(),
  );
}

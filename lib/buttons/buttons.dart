import 'package:flutter/material.dart';

class Buttons extends StatefulWidget {
  const Buttons({super.key});

  @override
  State<Buttons> createState() => _ButtonsState();
}

class _ButtonsState extends State<Buttons> {
  // Method to create a confirm button
  Widget _buildConfirmButton(String text, Color color) {
    return ElevatedButton(
      onPressed: () {
        // Confirm button logic here
      },
      style: ElevatedButton.styleFrom(
        minimumSize: const Size(160, 50), // Button size
        backgroundColor: color,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(12),
        ),
      ),
      child: Text(
        text,
        style: const TextStyle(fontSize: 16, color: Colors.white),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        _buildConfirmButton("Confirm", Colors.blue),
        
        SizedBox(width:20) ,// Spacing between buttons
        _buildConfirmButton("Cancel", Colors.red),
        // Add more buttons as needed
      ],
    );
  }
}

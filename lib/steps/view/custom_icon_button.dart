import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class CustomIconButton extends StatelessWidget {
  final IconData icon;
  final String label;
  final bool isSelected;
  final VoidCallback onTap;

  const CustomIconButton({
    required this.icon,
    required this.label,
    required this.isSelected,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(30),
                color: isSelected ? Color(0xFF00D1FF) : Color(0xFFECEEF6),
              ),
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Icon(icon,
                  color: isSelected ? Colors.white : Color(0xFF00D1FF),
                  size: 30,),
              ),
            ),
            Text(label,
              style: GoogleFonts.alata(
                  fontSize: 17.47,
                  fontWeight: FontWeight.w400,
                  color: Color(0xFF51586D)
              ),
            )
          ],
        ),
      ),
    );
  }
}

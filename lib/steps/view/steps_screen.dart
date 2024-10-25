import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class StepsScreen extends StatefulWidget {
  const StepsScreen({super.key});

  @override
  State<StepsScreen> createState() => _StepsScreenState();
}

class _StepsScreenState extends State<StepsScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.white,
        actions: [
          TextButton(
            onPressed: () {
              // Add skip functionality here
            },
            child: Text(
              'Skip',
              style: GoogleFonts.alata(
                fontWeight: FontWeight.w400,
                fontSize: 16,
                color: Color(0xFF000000)
              ),
            ),
          ),
          IconButton(
            icon: Icon(Icons.arrow_forward,color: Color(0xFF07112E),),
            color: Colors.black,
            onPressed: () {
              // Add forward navigation functionality here
            },
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Header Box
              Container(
                padding: EdgeInsets.all(16),
                decoration: BoxDecoration(
                  color: Color(0xFFFAFBFC),
                  borderRadius: BorderRadius.circular(8),
                  border: Border.all(color: Color(0xFFD4D6DB)),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Good job! You are halfway to be here!',
                      style: GoogleFonts.sora(
                        fontWeight: FontWeight.w600,
                        fontSize: 16,
                        color: Color(0xFF07112E)
                      )
                    ),
                    SizedBox(height: 8),
                    Text(
                      'Happy to see you again! Please enter your credentials to access your account.',
                        style: GoogleFonts.sora(
                            fontWeight: FontWeight.w400,
                            fontSize: 12,
                            color: Color(0xFF51586D)
                        )
                    ),
                    SizedBox(height: 16),
                    LinearProgressIndicator(
                      value: 0.5,
                      backgroundColor: Color(0xFFD6E1FF),
                      color: Color(0xFF00D1FF),
                      minHeight: 8,
                      borderRadius: BorderRadius.circular(10),
                    ),
                    SizedBox(height: 8),
                    Text('2 Steps Remaining',
                        style: GoogleFonts.sora(
                            fontWeight: FontWeight.w400,
                            fontSize: 12,
                            color: Color(0xFF51586D)
                        )
                    ),
                  ],
                ),
              ),
              SizedBox(height: 16),
              // Progress Box
              Container(
                padding: EdgeInsets.all(16),
                decoration: BoxDecoration(
                  color: Color(0xFFFAFBFC),
                  borderRadius: BorderRadius.circular(8),
                  border: Border.all(color: Color(0xFFD4D6DB)),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      '2 Out Of 4 Steps Completed!',
                      style: GoogleFonts.sora(
                        fontSize: 16,
                        fontWeight: FontWeight.w600,
                        color: Color(0xFF07112E)
                      ),
                    ),
                    SizedBox(height: 8),
                    Text(
                      'You’re almost ready to use the most of your account',
                      style: GoogleFonts.sora(
                          fontSize: 12,
                          fontWeight: FontWeight.w400,
                          color: Color(0xFF51586D)
                      ),
                    ),
                    SizedBox(height: 16),
                    //Account Created
                    _buildStepItem(
                      label: 'Account Created',
                      completed: true,
                    ),
                    SizedBox(height: 8),
                    // Account Verified
                    _buildStepItem(
                      label: 'Account Verified',
                      completed: true,
                    ),
                    SizedBox(height: 8),
                    // Complete Profile
                    _buildStepItem(
                      label: 'Complete Profile',
                      completed: false,
                      icon: Icons.person_outline,
                      iconColor: Color(0xFF00D1FF),
                    ),
                    SizedBox(height: 8),
                    // Add Payment Method
                    _buildStepItem(
                      label: 'Add Payment Method',
                      completed: false,
                      icon: Icons.payment_outlined,
                      iconColor:  Color(0xFF00D1FF),
                    ),
                  ],
                ),
              ),
              // Proceed Button
              Padding(
                padding: const EdgeInsets.only(top: 200),
                child: SizedBox(
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
                        'Proceed to Complete My Profile',
                        style: GoogleFonts.alata(
                          fontWeight: FontWeight.w400,
                          fontSize: 16,
                          color: Color(0xFFFAFBFC)
                        ),
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

  Widget _buildStepItem({
    required String label,
    required bool completed,
    IconData? icon,
    Color? iconColor,

  }) {
    double height = MediaQuery.of(context).size.height * 1;
    double width = MediaQuery.of(context).size.width * 1;
    return Container(
      width: width ,
      decoration: BoxDecoration(
        color: Color(0xFFF1F3FA),
        borderRadius: BorderRadius.circular(7),
        border: Border.all(color: Color(0xFFD4D6DB))
      ),
      child: Padding(
        padding: const EdgeInsets.all(12.0),
        child: Row(
          children: [
            if (completed)
              Icon(Icons.check_circle, color: Color(0xff4aB84D))
            else
              Icon(icon, color: iconColor ?? Colors.grey),
            SizedBox(width: 8),
            Text(
              label,
                style: GoogleFonts.sora(
                    fontSize: 12,
                    fontWeight: FontWeight.w600,
                    color: completed ? Color(0xff4aB84D) : Color(0xFF51586D)
                )
            ),
          ],
        ),
      ),
    );
  }
}

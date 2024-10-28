import 'package:flutter/material.dart';

class ForgotPasswordScreen extends StatefulWidget {
  const ForgotPasswordScreen({super.key});

  @override
  State<ForgotPasswordScreen> createState() => _ForgotPasswordScreenState();
}

class _ForgotPasswordScreenState extends State<ForgotPasswordScreen> {
  final _formKey = GlobalKey<FormState>(); // Form key to manage validation
  String? _password; // Variable to hold password

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Forgot Password'),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Form(
          key: _formKey,
          child: Center(
            child: Column(
               mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start, 
              children: [
                Padding(
                   padding: const EdgeInsets.only(left: 10.0, top: 80),
                  child: Text(
                    'Forgot Password?',
                    style: TextStyle(
                      fontSize: 42,
                      
                      fontFamily: 'Alata',
                      color: Color(0xFF00D1FF)
                    ),
                    textAlign: TextAlign.center,
                  ),
                ),
                SizedBox(height: 30), // Spacing

   Padding(
    padding: const EdgeInsets.only(left: 10.0, top: 5),
     child: Text(
                    'Enter your email for the verification process,',
                    style: TextStyle(
                      fontSize: 16,
                      
                      fontFamily: 'Alata',
                      
                    ),
                    textAlign: TextAlign.center,
                  ),
   ),
                Padding(
                    padding: const EdgeInsets.only(left: 10.0, top: 5),
                  child: Text(
                    'we will send code for your email',
                    style: TextStyle(
                      fontSize: 16,
                      
                      fontFamily: 'Alata',
                      
                    ),
                    textAlign: TextAlign.left,
                  ),
                ),
   Padding(
                    padding: const EdgeInsets.only(left: 10.0, top: 50),
                  child: Text(
                    'Email',
                    style: TextStyle(
                      fontSize: 16,
                      
                      fontFamily: 'Alata',
                      
                    ),
                    textAlign: TextAlign.left,
                  ),
                ),
          
          SizedBox(height: 10,),
                Padding(
                  padding: const EdgeInsets.only(left: 10.0, top: 5),
                  child: SizedBox(
                    width: 342,  // Set your desired width
                 height: 48,  
                    child: TextFormField(
                      decoration: InputDecoration(
                        labelText: 'Enter your Email',
                        border: OutlineInputBorder(),
                        // prefixIcon: Icon(Icons.lock),
                      ),
                      obscureText: true,
                      onChanged: (value) {
                        setState(() {
                          _password = value;
                        });
                      },
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Please enter your new password';
                        }
                        if (value.length < 6) {
                          return 'Password should be at least 6 characters long';
                        }
                        return null;
                      },
                    ),
                  ),
                ),
                SizedBox(height: 30), // Spacing

                // Submit Button
               Padding(
                  padding: const EdgeInsets.only(left: 10.0, top: 5),
                 child: SizedBox(
                 width: 342,  // Set your desired width
                 height: 48,  // Set your desired height
                 child: ElevatedButton(
                
                   onPressed: () {
                     if (_formKey.currentState!.validate()) {
                       // Perform submit action (e.g., API call)
                       ScaffoldMessenger.of(context).showSnackBar(
                         SnackBar(content: Text('Password updated successfully')),
                       );
                     }
                   },
                   style: ElevatedButton.styleFrom(
backgroundColor:    Color(0xFF00D1FF),
                     padding: EdgeInsets.symmetric(vertical: 15),
                     shape: RoundedRectangleBorder(
                       borderRadius: BorderRadius.circular(10),
                      
                     ),
                   ),
                   child: Text(
                     'Continue',
                     style: TextStyle(fontSize: 18),
                   ),
                 ),
               ),
               )

              ],
            ),
          ),
        ),
      ),
    );
  }
}

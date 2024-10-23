import 'package:flutter/material.dart';

import 'package:ntsmetrics/forgotpasswprd/view/forgot_password_screen.dart';
import 'package:pin_code_fields/pin_code_fields.dart';

class LoginScreen extends StatefulWidget {
  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final _formKey = GlobalKey<FormState>(); // For form validation
  String? email, password, pin, confirmPin;
  bool _isPasswordVisible = false; // For toggling password visibility

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Login'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: SingleChildScrollView(
          // Allow scrolling
          child: Form(
            key: _formKey, // Assign the form key
            child: Column(
              crossAxisAlignment: CrossAxisAlignment
                  .start, // Aligns all child widgets to the left
              children: [
                // Email TextField with Icon
                TextFormField(
                  decoration: InputDecoration(
                    labelText: 'Email',
                    prefixIcon: Icon(Icons.email),
                  ),
                  keyboardType: TextInputType.emailAddress,
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter your email';
                    }
                    // You can add more email validation here
                    return null;
                  },
                  onSaved: (value) => email = value,
                ),
                SizedBox(height: 16),

                // Password TextField with Eye Icon to show/hide password
                TextFormField(
                  decoration: InputDecoration(
                    labelText: 'Password',
                    prefixIcon: Icon(Icons.lock),
                    suffixIcon: IconButton(
                      icon: Icon(
                        _isPasswordVisible
                            ? Icons.visibility
                            : Icons.visibility_off,
                      ),
                      onPressed: () {
                        setState(() {
                          _isPasswordVisible = !_isPasswordVisible;
                        });
                      },
                    ),
                  ),
                  obscureText: !_isPasswordVisible,
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter your password';
                    }
                    return null;
                  },
                  onSaved: (value) => password = value,
                ),
                SizedBox(height: 16),

                // Align "Enter Pin" to the left
                Align(
                  alignment: Alignment.centerLeft,
                  child: Text(
                    'Enter Pin',
                    style: TextStyle(fontSize: 16),
                  ),
                ),
                SizedBox(height: 8),

                // Pin TextField using PinCodeTextField for OTP-style input
                PinCodeTextField(
                  appContext: context,
                  length: 4,
                  obscureText: false,
                  keyboardType: TextInputType.number,
                  animationType: AnimationType.fade,
                  pinTheme: PinTheme(
                    shape: PinCodeFieldShape.box,
                    borderRadius: BorderRadius.circular(5),
                    fieldHeight: 50,
                    fieldWidth: 40,
                    activeFillColor: Colors.white,
                  ),
                  onChanged: (value) {},
                  onCompleted: (value) {
                    pin = value;
                  },
                ),
                SizedBox(height: 16),

                // Align "Confirm Pin" to the left
                Align(
                  alignment: Alignment.centerLeft,
                  child: Text(
                    'Confirm Pin',
                    style: TextStyle(fontSize: 16),
                  ),
                ),
                SizedBox(height: 8),

                // Confirm Pin TextField using PinCodeTextField for OTP-style input
                PinCodeTextField(
                  appContext: context,
                  length: 4,
                  obscureText: false,
                  keyboardType: TextInputType.number,
                  animationType: AnimationType.fade,
                  pinTheme: PinTheme(
                    shape: PinCodeFieldShape.box,
                    borderRadius: BorderRadius.circular(5),
                    fieldHeight: 50,
                    fieldWidth: 40,
                    activeFillColor: Colors.white,
                  ),
                  onChanged: (value) {},
                  onCompleted: (value) {
                    confirmPin = value;
                    if (confirmPin != pin) {
                      // Show error if pins do not match
                      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                        content: Text('Pins do not match'),
                      ));
                    }
                  },
                ),
                SizedBox(height: 32),

                // Submit Button
                ElevatedButton(
                  onPressed: () {
                    if (_formKey.currentState!.validate()) {
                      _formKey.currentState!.save();
                      if (pin != confirmPin) {
                        ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                          content: Text('Pins do not match'),
                        ));
                        return;
                      }
                      // Process sign up with the entered information
                      print('Email: $email, Password: $password, Pin: $pin');
                    }
                  },
                  child: Text('Login'),
                  style: ElevatedButton.styleFrom(
                    minimumSize: Size(double.infinity, 50),
                  ),
                ),

                SizedBox(
                  height: 15,
                ),
                Align(
                    alignment: Alignment.centerRight,
                    child: InkWell(
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => ForgotPasswordScreen()),
                          );
                        },
                        child: Text('Forgot Password ?')))
              ],
            ),
          ),
        ),
      ),
    );
  }
}

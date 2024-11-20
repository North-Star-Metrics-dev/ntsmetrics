import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:ntsmetrics/login/controller/login_controller.dart';

class LoginScreen extends StatefulWidget {
  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  LoginController controller = Get.put(LoginController());
  late String imageUrl;
  late String base64String;

  final _formKey = GlobalKey<FormState>(); // For form validation
  String? email, password, pin, confirmPin;
  bool _isPasswordVisible = false; // For toggling password visibility

  @override
  void initState() {
    super.initState();
    fetchCaptcha();
  }

  Future<void> fetchCaptcha() async {
    imageUrl = await controller.getSignInCaptcha();
    base64String = imageUrl.split(",").last;
    setState(() {
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        leading: IconButton(
          icon: Icon(Icons.arrow_back_ios_new,
            color: Color(0xFF2C2C2C),
            size: 15,
          ),
          onPressed: () {
            // Handle back button press
          },
        ),
        title: Text('Back',
          style: GoogleFonts.alata(
            fontSize: 14,
            fontWeight: FontWeight.w400,
            color: Color(0xFF2C2C2C),
          ),
        ),
        backgroundColor: Colors.white,
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
                //sign in text
                Text(
                  'Sign in',
                  style: GoogleFonts.alata(
                    fontSize: 42,
                    fontWeight: FontWeight.w400,
                    color: Color(0xFF00D1FF),
                  ),
                ),
                SizedBox(height: 8),

                //sign in text
                Text(
                  'Please log in into your account',
                  style: GoogleFonts.alata(
                    fontSize: 16,
                    fontWeight: FontWeight.w400,
                    color: Color(0xFF2C2C2C),
                  ),
                ),
                SizedBox(height: 40),

                // Email TextField with Icon
                Align(
                  alignment: Alignment.centerLeft,
                  child: Padding(
                    padding: const EdgeInsets.only(bottom: 10),
                    child: Text('Email',
                        style: GoogleFonts.alata(
                          fontSize: 14,
                          fontWeight: FontWeight.w400,
                          color: Color(0xFF2C2C2C),
                        ),
                    ),
                  ),
                ),
                TextFormField(
                  controller: controller.emailController.value,
                  style: GoogleFonts.alata(
                    fontSize: 16,
                    fontWeight: FontWeight.w400,
                    color: Color(0xFF2C2C2C),
                  ),
                  decoration: InputDecoration(
                    //labelText: 'Email',
                    suffixIcon: Icon(Icons.check, color: Colors.green),
                    filled: true ,
                    fillColor: MaterialStateColor.resolveWith((states) {
                      if (states.contains(MaterialState.focused)) {
                        return Color(0xFF00AEF7).withOpacity(0.2);
                      }
                      return Color(0xFFF5F5F5);
                    }),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(8),
                      borderSide: BorderSide(color: Color(0xFFE1E1E1),width: 1 )
                    ),
                    enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(8),
                        borderSide: BorderSide(color: Color(0xFFE1E1E1), width: 1.0),
                    ),
                    focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(8),
                        borderSide: BorderSide(color: Color(0xFF00AEF7), width: 1.0),
                    ),
                  ),
                  keyboardType: TextInputType.emailAddress,
                  cursorColor: Color(0xFF00AEf7),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter your email';
                    }
                    // You can add more email validation here
                    return null;
                  },
                  onSaved: (value) => email = value,
                ),
                SizedBox(height: 25),

                // Password TextField with Eye Icon to show/hide password
                Align(
                  alignment: Alignment.centerLeft,
                  child: Padding(
                    padding: const EdgeInsets.only(bottom: 10),
                    child: Text('Password',
                      style: GoogleFonts.alata(
                        fontSize: 14,
                        fontWeight: FontWeight.w400,
                        color: Color(0xFF2C2C2C),
                      ),
                    ),
                  ),
                ),
                TextFormField(
                  controller: controller.passwordController.value,
                  style: GoogleFonts.plusJakartaSans(
                    fontSize: 16,
                    fontWeight: FontWeight.w600,
                    color: Color(0xFF2C2C2C),
                  ),
                  decoration: InputDecoration(
                    //labelText: 'Password',
                    suffixIcon: IconButton(
                      icon: Icon(
                        _isPasswordVisible
                            ? Icons.visibility
                            : Icons.visibility_off,
                        color: Colors.blue,
                      ),
                      onPressed: () {
                        setState(() {
                          _isPasswordVisible = !_isPasswordVisible;
                        });
                      },
                    ),
                    filled: true ,
                    fillColor: MaterialStateColor.resolveWith((states) {
                      if (states.contains(MaterialState.focused)) {
                        return Color(0xFF00AEF7).withOpacity(0.2);
                      }
                      return Color(0xFFF5F5F5);
                    }),
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(8),
                        borderSide: BorderSide(color: Color(0xFFE1E1E1),width: 1 )
                    ),
                    enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(8),
                      borderSide: BorderSide(color: Color(0xFFE1E1E1), width: 1.0),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(8),
                      borderSide: BorderSide(color: Color(0xFF00AEF7), width: 1.0),
                    ),
                  ),
                  obscureText: !_isPasswordVisible,
                  cursorColor: Color(0xFF00Aef7),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter your password';
                    }
                    return null;
                  },
                  onSaved: (value) => password = value,
                ),
                SizedBox(height: 25),

                // Captcha TextField
                Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(right: 10),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          SizedBox(height: 12,),
                          Text('Enter Captcha',
                            style: GoogleFonts.alata(
                              fontSize: 14,
                              fontWeight: FontWeight.w400,
                              color: Color(0xFF2C2C2C),
                            ),
                          ),
                        ],
                      ),
                    ),
                    Obx(() {
                      return Container(
                          height: 45,
                          child: controller.isCaptchaLoading.value == false ?
                          Image.memory(
                            base64Decode(base64String),
                            fit: BoxFit.fitWidth,
                            //height: 50,
                            //width: 200,
                          ) : Container(
                              height: 20,
                              width: 40,
                              child: Center(child: CircularProgressIndicator()))
                      );
                    })
                  ],
                ),
                TextFormField(
                  controller: controller.captchaController.value,
                  style: GoogleFonts.alata(
                    fontSize: 16,
                    fontWeight: FontWeight.w400,
                    color: Color(0xFF2C2C2C),
                  ),
                  decoration: InputDecoration(
                    filled: true ,
                    fillColor: MaterialStateColor.resolveWith((states) {
                      if (states.contains(MaterialState.focused)) {
                        return Color(0xFF00AEF7).withOpacity(0.2);
                      }
                      return Color(0xFFF5F5F5);
                    }),
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(8),
                        borderSide: BorderSide(color: Color(0xFFE1E1E1),width: 1 )
                    ),
                    enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(8),
                      borderSide: BorderSide(color: Color(0xFFE1E1E1), width: 1.0),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(8),
                      borderSide: BorderSide(color: Color(0xFF00AEF7), width: 1.0),
                    ),
                  ),
                  cursorColor: Color(0xFF00AEf7),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter your email';
                    }
                    // You can add more email validation here
                    return null;
                  },
                  onSaved: (value) => email = value,
                ),

                //forget password button
                Align(
                  alignment: Alignment.centerRight,
                  child: TextButton(
                    onPressed: () {
                      // Handle forgot password
                    },
                    child: Padding(
                      padding: const EdgeInsets.only(bottom:10,top: 3),
                      child: Text(
                        'Forgot password?',
                        style: GoogleFonts.alata(
                          fontSize: 14,
                          fontWeight: FontWeight.w400,
                          color: Color(0xFFF78720),
                        ),
                      ),
                    ),
                  ),
                ),

                // Sign In Button
                SizedBox(
                  width: double.infinity,
                  height: 50,
                  child: ElevatedButton(
                    onPressed: () async {
                        controller.signIn();
                      // await controller.delToken();
                      // controller.getToken();
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Color(0xFF00D1FF),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(8),
                      ),
                    ),
                    child: Obx(() {
                      return controller.isLoading.value == false ?
                      Text(
                        'Sign in',
                        style: GoogleFonts.alata(
                          fontSize: 16,
                          fontWeight: FontWeight.w400,
                          color: Color(0xFFFFFFFF),
                        ),
                      )
                          :
                      Container(
                          height: 20,
                          width: 20,
                          child: Center(child: CircularProgressIndicator()));
                    })
                  ),
                ),

                SizedBox(height: 80,),

                //Sign in with google & sign in with fb button
                SizedBox(
                  width: double.infinity,
                  height: 50,
                  child: OutlinedButton.icon(
                    onPressed: () {
                      // Handle sign in with Google
                    },
                    icon: Image.asset(
                      'assets/images/google_logo.png',
                      width: 20,
                      height: 20,
                    ),
                    label: Text('Sign in with Google',
                      style: GoogleFonts.alata(
                        fontSize: 16,
                        fontWeight: FontWeight.w400,
                        color: Color(0xFF00D1FF),
                      ),
                    ),
                    style: OutlinedButton.styleFrom(
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(8),
                      ),
                      side: BorderSide(color: Color(0xFF00D1FF,)),
                    ),
                  ),
                ),
                SizedBox(height: 12),
                SizedBox(
                  width: double.infinity,
                  height: 50,
                  child: OutlinedButton.icon(
                    onPressed: () {
                      // Handle sign in with Facebook
                    },
                    // icon: Image.network(
                    //   'https://upload.wikimedia.org/wikipedia/commons/thumb/1/1b/Facebook_icon.svg/512px-Facebook_icon.svg.png',
                    //   width: 24,
                    //   height: 24,
                    // ),
                    icon: Image.asset(
                      'assets/images/fb_logo.png',
                      width: 24,
                      height: 24,
                    ),
                    label: Text('Sign in with Facebook',
                      style: GoogleFonts.alata(
                        fontSize: 16,
                        fontWeight: FontWeight.w400,
                        color: Color(0xFF00D1FF),
                      ),
                    ),
                    style: OutlinedButton.styleFrom(
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(8),
                      ),
                      side: BorderSide(color: Color(0xFF00D1FF,)),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

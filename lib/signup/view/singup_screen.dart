import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl_phone_number_input/intl_phone_number_input.dart';
import 'package:ntsmetrics/otp/view/otp_screen.dart';
import 'package:ntsmetrics/signup/controller/signup_controller.dart';


class SingUpScreen extends StatefulWidget {
  @override
  _SignUpScreenState createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SingUpScreen> {
  SignUpController controller = Get.put(SignUpController());
  final _formKey = GlobalKey<FormState>();
  String? email, password, pin, confirmPin;
  bool _isPasswordVisible = false;
  bool _isConfirmPasswordVisible = false;
  bool isChecked = false;
  String _selectedCountryCode = '+91';
  late String imageUrl;
  late String base64String;

  @override
  void initState() {
    super.initState();
    fetchCaptcha();
  }

  Future<void> fetchCaptcha() async {
    imageUrl = await controller.getSignUpCaptcha();
    base64String = imageUrl.split(",").last;
    setState(() {
    });
  }



  @override
  Widget build(BuildContext context) {
    PhoneNumber number = PhoneNumber(isoCode: 'IN');
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
            key: _formKey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                //sign up text
                Text(
                  'Sign up',
                  style: GoogleFonts.alata(
                    fontSize: 42,
                    fontWeight: FontWeight.w400,
                    color: Color(0xFF00D1FF),
                  ),
                ),
                SizedBox(height: 8),

                //sign in text
                Text(
                  'Please create a new account',
                  style: GoogleFonts.alata(
                    fontSize: 16,
                    fontWeight: FontWeight.w400,
                    color: Color(0xFF2C2C2C),
                  ),
                ),
                SizedBox(height: 40),

                // Email TextField
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

                // confirmPassword TextField with Eye Icon to show/hide password
                Align(
                  alignment: Alignment.centerLeft,
                  child: Padding(
                    padding: const EdgeInsets.only(bottom: 10),
                    child: Text('Confirm Password',
                      style: GoogleFonts.alata(
                        fontSize: 14,
                        fontWeight: FontWeight.w400,
                        color: Color(0xFF2C2C2C),
                      ),
                    ),
                  ),
                ),
                TextFormField(
                  controller: controller.confirmPasswordController.value,
                  style: GoogleFonts.plusJakartaSans(
                    fontSize: 16,
                    fontWeight: FontWeight.w600,
                    color: Color(0xFF2C2C2C),
                  ),
                  decoration: InputDecoration(
                    //labelText: 'Password',
                    suffixIcon: IconButton(
                      icon: Icon(
                        _isConfirmPasswordVisible
                            ? Icons.visibility
                            : Icons.visibility_off,
                        color: Colors.blue,
                      ),
                      onPressed: () {
                        setState(() {
                          _isConfirmPasswordVisible = !_isConfirmPasswordVisible;
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
                  obscureText: !_isConfirmPasswordVisible,
                  cursorColor: Color(0xFF00Aef7),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter your password';
                    }
                    return null;
                  },
                  onSaved: (value) => password = value,
                ),
                SizedBox(height: 15),

                //enter phone number with country code
                Align(
                  alignment: Alignment.centerLeft,
                  child: Padding(
                    padding: const EdgeInsets.only(bottom: 10),
                    child: Text('Enter Phone Number',
                      style: GoogleFonts.alata(
                        fontSize: 14,
                        fontWeight: FontWeight.w400,
                        color: Color(0xFF2C2C2C),
                      ),
                    ),
                  ),
                ),
                TextFormField(
                  controller: controller.phoneNumberController.value,
                  style: GoogleFonts.plusJakartaSans(
                    fontSize: 16,
                    fontWeight: FontWeight.w600,
                    color: Color(0xFF2C2C2C),
                  ),
                  decoration: InputDecoration(
                    //labelText: 'Password',
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
                  obscureText: false,
                  cursorColor: Color(0xFF00Aef7),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter your password';
                    }
                    return null;
                  },
                  keyboardType: TextInputType.number,
                  onSaved: (value) => password = value,
                ),
                // InternationalPhoneNumberInput(
                //   onInputChanged: (PhoneNumber number) {
                //     print(number.phoneNumber);
                //     phoneNumberController = number.phoneNumber as TextEditingController;
                //   },
                //   selectorConfig: SelectorConfig(
                //     selectorType: PhoneInputSelectorType.DROPDOWN,
                //     showFlags: false ,
                //     useEmoji: false,
                //   ),
                //   initialValue: number,
                //   textFieldController: phoneNumberController,
                //   inputDecoration: InputDecoration(
                //     filled: true ,
                //     fillColor: MaterialStateColor.resolveWith((states) {
                //       if (states.contains(MaterialState.focused)) {
                //         return Color(0xFF00AEF7).withOpacity(0.2);
                //       }
                //       return Color(0xFFF5F5F5);
                //     }),
                //     border: OutlineInputBorder(
                //         borderRadius: BorderRadius.circular(8),
                //         borderSide: BorderSide(color: Color(0xFFE1E1E1),width: 1 )
                //     ),
                //     enabledBorder: OutlineInputBorder(
                //       borderRadius: BorderRadius.circular(8),
                //       borderSide: BorderSide(color: Color(0xFFE1E1E1), width: 1.0),
                //     ),
                //     focusedBorder: OutlineInputBorder(
                //       borderRadius: BorderRadius.circular(8),
                //       borderSide: BorderSide(color: Color(0xFF00AEF7), width: 1.0),
                //     ),
                //   ),
                //   cursorColor: Color(0xFF00AEf7),
                //   selectorTextStyle: GoogleFonts.alata(
                //       fontWeight: FontWeight.w400,
                //       fontSize: 14,
                //       color: Color(0xFF000000)
                //   ),
                //   formatInput: false, // Set to true if you want to format the input
                //   keyboardType: TextInputType.numberWithOptions(signed: true, decimal: true),
                //   inputBorder: OutlineInputBorder(),
                //   spaceBetweenSelectorAndTextField: 2, // Adjust space between selector and field
                //   selectorButtonOnErrorPadding: 0,
                //   onSaved: (PhoneNumber number) {
                //     print('On Saved: $number');
                //   },
                // ),
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

                //checkbox to agree T&C
                Padding(
                  padding: const EdgeInsets.only(top: 25),
                  child: Row(
                    children: [
                      Checkbox(
                        value: isChecked,
                        onChanged: (bool? value) {
                          setState(() {
                            isChecked = value!;
                          });
                        },
                        checkColor: Colors.white,
                        // activeColor: Color(0xFF16D5FF),
                        activeColor: Colors.red,
                        fillColor: MaterialStateProperty.resolveWith((Set<MaterialState> states) {
                          if (!states.contains(MaterialState.selected)) {
                            return Colors.white;
                          }
                          return Color(0xFF00D1FF);
                        }),
                      ),
                      Expanded(
                        child: Text(
                          'Agree to terms of use and privacy policy',
                          style: GoogleFonts.alata(
                            fontSize: 14,
                            fontWeight: FontWeight.w400,
                            color: Color(0xFF2C2C2C),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),

                // Sign up Button
                Padding(
                  padding: const EdgeInsets.only(top: 25),
                  child: SizedBox(
                    width: double.infinity,
                    height: 50,
                    child: ElevatedButton(
                      onPressed: () {
                        print("pressed");
                        controller.signUp();
                        // if (controller.isSignUpSuccess == true) {
                        //   Get.off(OtpScreen(controller: controller,));
                        // }
                      },
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Color(0xFF00D1FF),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(50),
                        ),
                      ),
                      child:
                      Obx(() {
                        return controller.isLoading.value == true ?
                        Container(
                            height: 20,
                            width: 20,
                            child: Center(child: CircularProgressIndicator())) :
                        Text( 'Sign up',
                          style: GoogleFonts.alata(
                            fontSize: 16,
                            fontWeight: FontWeight.w400,
                            color: Color(0xFFFFFFFF),
                          ),
                        );
                      }),
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

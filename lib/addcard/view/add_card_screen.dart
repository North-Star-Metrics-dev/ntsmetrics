// import 'package:flutter/material.dart';
// import 'package:google_fonts/google_fonts.dart';
//
// class AddCardScreen extends StatefulWidget {
//   const AddCardScreen({super.key});
//
//   @override
//   State<AddCardScreen> createState() => _AddCardScreenState();
// }
//
// class _AddCardScreenState extends State<AddCardScreen> {
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       backgroundColor: Colors.white,
//       appBar: AppBar(
//         backgroundColor: Colors.white,
//         title: Text("Payment Method",
//           style: GoogleFonts.alata(
//             fontSize: 16,
//             fontWeight: FontWeight.w400,
//             color: Color(0xFF07112E),
//           ),
//         ),
//         leading: IconButton(
//           icon: Icon(Icons.arrow_back,
//             color: Color(0xFF07112E),
//             size: 22,
//           ),
//           onPressed: () {
//             // Handle back button press
//           },
//         ),
//       ),
//       body: SingleChildScrollView(
//         padding: EdgeInsets.only(
//           bottom: MediaQuery.of(context).viewInsets.bottom, // Adjust for keyboard
//         ),
//         child: Padding(
//           padding: const EdgeInsets.all(20.0),
//           child: Column(
//             mainAxisAlignment: MainAxisAlignment.start,
//             crossAxisAlignment: CrossAxisAlignment.start,
//             children: [
//               Text("Add a card",
//                 style: GoogleFonts.alata(
//                     fontWeight: FontWeight.w400,
//                     fontSize: 16,
//                     color: Color(0xFF51586D)
//                 ),
//               ),
//               Padding(
//                 padding: const EdgeInsets.only(top: 30,bottom: 5,left: 8),
//                 child: Text("Card Number",
//                   style: GoogleFonts.alata(
//                       fontWeight: FontWeight.w400,
//                       fontSize: 16,
//                       color: Color(0xFF07112E)
//                   ),
//                 ),
//               ),
//               TextFormField(
//                 style: GoogleFonts.plusJakartaSans(
//                   fontSize: 16,
//                   fontWeight: FontWeight.w600,
//                   color: Color(0xFF2C2C2C),
//                 ),
//                 decoration: InputDecoration(
//                   filled: true ,
//                   fillColor:  Color(0xFFF1F3FA),
//                   hintText: "Placeholder",
//                   hintStyle: GoogleFonts.alata(
//                       fontSize: 16,
//                       fontWeight: FontWeight.w400,
//                       color: Color(0xFF51586D)
//                   ),
//                   suffixIcon: Image.asset("assets/visa.png"),
//                   border: OutlineInputBorder(
//                       borderRadius: BorderRadius.circular(8),
//                       borderSide: BorderSide(color: Color(0xFFE1E1E1),width: 1 )
//                   ),
//                   enabledBorder: OutlineInputBorder(
//                     borderRadius: BorderRadius.circular(8),
//                     borderSide: BorderSide(color: Color(0xFFD4D6DB), width: 1.0),
//                   ),
//                   focusedBorder: OutlineInputBorder(
//                     borderRadius: BorderRadius.circular(8),
//                     borderSide: BorderSide(color: Color(0xFF00D1FF), width: 1.0),
//                   ),
//                 ),
//                 cursorColor: Color(0xFF00D1FF),
//                 validator: (value) {
//                   if (value == null || value.isEmpty) {
//                     return 'Please enter your password';
//                   }
//                   return null;
//                 },
//               ),
//               Row(
//                 mainAxisAlignment: MainAxisAlignment.start,
//                 children: [
//                   Expanded(
//                     child: Column(
//                       mainAxisAlignment: MainAxisAlignment.start,
//                       crossAxisAlignment: CrossAxisAlignment.start,
//                       children: [
//                         Padding(
//                           padding: const EdgeInsets.only(top: 30,bottom: 5,left: 8),
//                           child: Text("Expiration",
//                             style: GoogleFonts.alata(
//                                 fontWeight: FontWeight.w400,
//                                 fontSize: 16,
//                                 color: Color(0xFF07112E)
//                             ),
//                           ),
//                         ),
//                         TextFormField(
//                           style: GoogleFonts.plusJakartaSans(
//                             fontSize: 16,
//                             fontWeight: FontWeight.w600,
//                             color: Color(0xFF2C2C2C),
//                           ),
//                           decoration: InputDecoration(
//                             filled: true ,
//                             fillColor:  Color(0xFFF1F3FA),
//                             hintText: "Choose",
//                             hintStyle: GoogleFonts.alata(
//                                 fontSize: 16,
//                                 fontWeight: FontWeight.w400,
//                                 color: Color(0xFF51586D)
//                             ),
//                             border: OutlineInputBorder(
//                                 borderRadius: BorderRadius.circular(8),
//                                 borderSide: BorderSide(color: Color(0xFFE1E1E1),width: 1 )
//                             ),
//                             enabledBorder: OutlineInputBorder(
//                               borderRadius: BorderRadius.circular(8),
//                               borderSide: BorderSide(color: Color(0xFFD4D6DB), width: 1.0),
//                             ),
//                             focusedBorder: OutlineInputBorder(
//                               borderRadius: BorderRadius.circular(8),
//                               borderSide: BorderSide(color: Color(0xFF00D1FF), width: 1.0),
//                             ),
//                           ),
//                           cursorColor: Color(0xFF00D1FF),
//                           validator: (value) {
//                             if (value == null || value.isEmpty) {
//                               return 'Please enter your password';
//                             }
//                             return null;
//                           },
//                         ),
//                       ],
//                     ),
//                   ),
//                   SizedBox(
//                     width: 10,
//                   ),
//                   Expanded(
//                     child: Column(
//                       mainAxisAlignment: MainAxisAlignment.start,
//                       crossAxisAlignment: CrossAxisAlignment.start,
//                       children: [
//                         Padding(
//                           padding: const EdgeInsets.only(top: 30,bottom: 5,left: 8),
//                           child: Text("CVC",
//                             style: GoogleFonts.alata(
//                                 fontWeight: FontWeight.w400,
//                                 fontSize: 16,
//                                 color: Color(0xFF07112E)
//                             ),
//                           ),
//                         ),
//                         TextFormField(
//                           style: GoogleFonts.plusJakartaSans(
//                             fontSize: 16,
//                             fontWeight: FontWeight.w600,
//                             color: Color(0xFF2C2C2C),
//                           ),
//                           decoration: InputDecoration(
//                             filled: true ,
//                             fillColor:  Color(0xFFF1F3FA),
//                             hintText: "Choose",
//                             hintStyle: GoogleFonts.alata(
//                                 fontSize: 16,
//                                 fontWeight: FontWeight.w400,
//                                 color: Color(0xFF51586D)
//                             ),
//                             border: OutlineInputBorder(
//                                 borderRadius: BorderRadius.circular(8),
//                                 borderSide: BorderSide(color: Color(0xFFE1E1E1),width: 1 )
//                             ),
//                             enabledBorder: OutlineInputBorder(
//                               borderRadius: BorderRadius.circular(8),
//                               borderSide: BorderSide(color: Color(0xFFD4D6DB), width: 1.0),
//                             ),
//                             focusedBorder: OutlineInputBorder(
//                               borderRadius: BorderRadius.circular(8),
//                               borderSide: BorderSide(color: Color(0xFF00D1FF), width: 1.0),
//                             ),
//                           ),
//                           cursorColor: Color(0xFF00D1FF),
//                           validator: (value) {
//                             if (value == null || value.isEmpty) {
//                               return 'Please enter your password';
//                             }
//                             return null;
//                           },
//                         ),
//                       ],
//                     ),
//                   )
//                 ],
//               ),
//               Padding(
//                 padding: const EdgeInsets.only(top: 450),
//                 child: SizedBox(
//                   width: double.infinity,
//                   child: ElevatedButton(
//                     onPressed: () {},
//                     style: ElevatedButton.styleFrom(
//                         backgroundColor:  Color(0xFF00D1FF),
//                         padding: EdgeInsets.symmetric(vertical: 16),
//                         shape: RoundedRectangleBorder(
//                           borderRadius: BorderRadius.circular(30),
//                         ),
//                         disabledBackgroundColor: Color(0xFF9CA0Ab)
//                     ),
//                     child: Padding(
//                       padding: const EdgeInsets.symmetric(horizontal: 10),
//                       child: Text(
//                         'Add Card',
//                         style: GoogleFonts.alata(
//                             fontWeight: FontWeight.w400,
//                             fontSize: 16,
//                             color: Color(0xFFFAFBFC)
//                         ),
//                       ),
//                     ),
//                   ),
//                 ),
//               ),
//             ],
//           ),
//         ),
//       ),
//     );
//   }
// }





import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class AddCardScreen extends StatefulWidget {
  const AddCardScreen({super.key});

  @override
  State<AddCardScreen> createState() => _AddCardScreenState();
}

class _AddCardScreenState extends State<AddCardScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        title: Text("Payment Method",
          style: GoogleFonts.alata(
            fontSize: 16,
            fontWeight: FontWeight.w400,
            color: Color(0xFF07112E),
          ),
        ),
        leading: IconButton(
          icon: Icon(Icons.arrow_back,
            color: Color(0xFF07112E),
            size: 22,
          ),
          onPressed: () {
            // Handle back button press
          },
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SingleChildScrollView(
              child: Column(
                children: [
                  Text("Add a card",
                    style: GoogleFonts.alata(
                        fontWeight: FontWeight.w400,
                        fontSize: 16,
                        color: Color(0xFF51586D)
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 30,bottom: 5,left: 8),
                    child: Text("Card Number",
                      style: GoogleFonts.alata(
                          fontWeight: FontWeight.w400,
                          fontSize: 16,
                          color: Color(0xFF07112E)
                      ),
                    ),
                  ),
                  TextFormField(
                    style: GoogleFonts.plusJakartaSans(
                      fontSize: 16,
                      fontWeight: FontWeight.w600,
                      color: Color(0xFF2C2C2C),
                    ),
                    decoration: InputDecoration(
                      filled: true ,
                      fillColor:  Color(0xFFF1F3FA),
                      hintText: "Placeholder",
                      hintStyle: GoogleFonts.alata(
                          fontSize: 16,
                          fontWeight: FontWeight.w400,
                          color: Color(0xFF51586D)
                      ),
                      suffixIcon: Image.asset("assets/visa.png"),
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(8),
                          borderSide: BorderSide(color: Color(0xFFE1E1E1),width: 1 )
                      ),
                      enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(8),
                        borderSide: BorderSide(color: Color(0xFFD4D6DB), width: 1.0),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(8),
                        borderSide: BorderSide(color: Color(0xFF00D1FF), width: 1.0),
                      ),
                    ),
                    cursorColor: Color(0xFF00D1FF),
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Please enter your password';
                      }
                      return null;
                    },
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Expanded(
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Padding(
                              padding: const EdgeInsets.only(top: 30,bottom: 5,left: 8),
                              child: Text("Expiration",
                                style: GoogleFonts.alata(
                                    fontWeight: FontWeight.w400,
                                    fontSize: 16,
                                    color: Color(0xFF07112E)
                                ),
                              ),
                            ),
                            TextFormField(
                              style: GoogleFonts.plusJakartaSans(
                                fontSize: 16,
                                fontWeight: FontWeight.w600,
                                color: Color(0xFF2C2C2C),
                              ),
                              decoration: InputDecoration(
                                filled: true ,
                                fillColor:  Color(0xFFF1F3FA),
                                hintText: "Choose",
                                hintStyle: GoogleFonts.alata(
                                    fontSize: 16,
                                    fontWeight: FontWeight.w400,
                                    color: Color(0xFF51586D)
                                ),
                                border: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(8),
                                    borderSide: BorderSide(color: Color(0xFFE1E1E1),width: 1 )
                                ),
                                enabledBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(8),
                                  borderSide: BorderSide(color: Color(0xFFD4D6DB), width: 1.0),
                                ),
                                focusedBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(8),
                                  borderSide: BorderSide(color: Color(0xFF00D1FF), width: 1.0),
                                ),
                              ),
                              cursorColor: Color(0xFF00D1FF),
                              validator: (value) {
                                if (value == null || value.isEmpty) {
                                  return 'Please enter your password';
                                }
                                return null;
                              },
                            ),
                          ],
                        ),
                      ),
                      SizedBox(
                        width: 10,
                      ),
                      Expanded(
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Padding(
                              padding: const EdgeInsets.only(top: 30,bottom: 5,left: 8),
                              child: Text("CVC",
                                style: GoogleFonts.alata(
                                    fontWeight: FontWeight.w400,
                                    fontSize: 16,
                                    color: Color(0xFF07112E)
                                ),
                              ),
                            ),
                            TextFormField(
                              style: GoogleFonts.plusJakartaSans(
                                fontSize: 16,
                                fontWeight: FontWeight.w600,
                                color: Color(0xFF2C2C2C),
                              ),
                              decoration: InputDecoration(
                                filled: true ,
                                fillColor:  Color(0xFFF1F3FA),
                                hintText: "Choose",
                                hintStyle: GoogleFonts.alata(
                                    fontSize: 16,
                                    fontWeight: FontWeight.w400,
                                    color: Color(0xFF51586D)
                                ),
                                border: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(8),
                                    borderSide: BorderSide(color: Color(0xFFE1E1E1),width: 1 )
                                ),
                                enabledBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(8),
                                  borderSide: BorderSide(color: Color(0xFFD4D6DB), width: 1.0),
                                ),
                                focusedBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(8),
                                  borderSide: BorderSide(color: Color(0xFF00D1FF), width: 1.0),
                                ),
                              ),
                              cursorColor: Color(0xFF00D1FF),
                              validator: (value) {
                                if (value == null || value.isEmpty) {
                                  return 'Please enter your password';
                                }
                                return null;
                              },
                            ),
                          ],
                        ),
                      )
                    ],
                  ),
                ],
              ),
            ),
            Spacer(),
            Padding(
              padding: const EdgeInsets.only(top: 5),
              child: SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                  onPressed: () {},
                  style: ElevatedButton.styleFrom(
                      backgroundColor:  Color(0xFF00D1FF),
                      padding: EdgeInsets.symmetric(vertical: 16),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(30),
                      ),
                      disabledBackgroundColor: Color(0xFF9CA0Ab)
                  ),
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 10),
                    child: Text(
                      'Add Card',
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
    );
  }
}

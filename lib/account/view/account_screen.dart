// import 'package:flutter/material.dart';
// import 'package:ntsmetrics/dialog/bottomsheet_dialog.dart';

// class AccountScreen extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: Column(
//         children: [
//           // Custom AppBar Container
//           SizedBox(
//             height: 50,
//           ),
//           Padding(
//             padding: const EdgeInsets.all(16.0),
//             child: Container(
//               padding: EdgeInsets.symmetric(horizontal: 5.0),
//               height: 48, // Adjust height as needed
//               color: Color.fromARGB(255, 205, 208, 212),
//               child: Row(
//                 mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                 children: [
//                   IconButton(
//                     icon: Icon(Icons.arrow_back),
//                     color: Color(0xFF07112E),
//                     onPressed: () {
//                       // Go back logic
//                     },
//                   ),
//                   Text(
//                     'Account',
//                     style: TextStyle(
//                       color: Color(0xFF07112E),
//                       fontFamily: 'Alata',
//                       fontSize: 18,
//                     ),
//                   ),
//                   // Optionally, add a trailing icon or widget
//                   SizedBox(
//                       width: 240), // Add empty space or widget for symmetry
//                 ],
//               ),
//             ),
//           ),

//           // Main content starts here
//           Expanded(
//             child: SingleChildScrollView(
//               padding: EdgeInsets.all(16.0),
//               child: Column(
//                 crossAxisAlignment: CrossAxisAlignment.start,
//                 children: [
//                   // User Information
//                   Container(
//                     padding: EdgeInsets.all(8.0),
//                     decoration: BoxDecoration(
//                       color: Colors.grey[200],
//                       borderRadius: BorderRadius.circular(10),
//                     ),
//                     child: Column(
//                       children: [
//                         Row(
//                           children: [
//                             CircleAvatar(
//                               radius: 30,
//                               backgroundColor: Colors.grey[400],
//                               child: Icon(Icons.person, size: 40),
//                             ),
//                             SizedBox(width: 200),
//                             GestureDetector(
//                               onTap: () {
//                                 // Change avatar logic
//                                 showModalBottomSheet(
//                                   context: context,
//                                   shape: RoundedRectangleBorder(
//                                     borderRadius: BorderRadius.vertical(
//                                         top: Radius.circular(20)),
//                                   ),
//                                   builder: (BuildContext context) {
//                                     return BotttomSheetDialog();
//                                   },
//                                 );
//                               },
//                               child: Text('Change avatar',
//                                   style: TextStyle(color: Colors.blue)),
//                             ),
//                           ],
//                         ),
//                         SizedBox(
//                           height: 10,
//                         ),
//                         Divider(
//                             thickness: 2,
//                             color: Color.fromARGB(255, 235, 225, 225)),
//                         SizedBox(
//                           height: 10,
//                         ),
//                         Row(
//                           children: [
//                             Text('Donald Dunn', style: TextStyle(fontSize: 18)),
//                             SizedBox(width: 180),
//                             GestureDetector(
//                               onTap: () {
//                                 // Change avatar logic
//                               },
//                               child: Text('Edit Name',
//                                   style: TextStyle(color: Colors.blue)),
//                             ),
//                           ],
//                         ),
//                         SizedBox(
//                           height: 10,
//                         ),
//                         Divider(
//                             thickness: 2,
//                             color: Color.fromARGB(255, 235, 225, 225)),
//                         SizedBox(
//                           height: 10,
//                         ),
//                         Row(
//                           children: [
//                             Text('user@gmail.com',
//                                 style: TextStyle(fontSize: 18)),
//                             SizedBox(width: 180),
//                           ],
//                         ),
//                         SizedBox(
//                           height: 10,
//                         ),
//                         Row(
//                           children: [
//                             Text('*******', style: TextStyle(fontSize: 18)),
//                             SizedBox(width: 180),
//                             GestureDetector(
//                               onTap: () {
//                                 // Change avatar logic
//                               },
//                               child: Text('Change Password',
//                                   style: TextStyle(color: Colors.blue)),
//                             ),
//                           ],
//                         ),
//                       ],
//                     ),
//                   ),

//                   SizedBox(height: 80),

//                   // Settings Section
//                   Column(
//                     crossAxisAlignment: CrossAxisAlignment.start,
//                     children: [
//                       // Settings Section
//                       Text('Settings',
//                           style: TextStyle(
//                               fontSize: 18,
//                               fontWeight: FontWeight.bold,
//                               fontFamily: 'Alata')),
//                       SizedBox(height: 10),
//                       // Language card with onTap to open bottom sheet
//                       _buildSettingsCard(
//                           context, Icons.language, 'Language', 'Not Set',
//                           onTap: () {
//                         showModalBottomSheet(
//                           context: context,
//                           builder: (BuildContext context) {
//                             return BotttomSheetDialog(
//                               showLanguage:
//                                   true, // Show the language selection sheet
//                             );
//                           },
//                         );
//                       }),
//                       _buildSettingsCard(
//                           context, Icons.attach_money, 'Currency', 'Not Set',
//                           onTap: () {
//                         showModalBottomSheet(
//                           context: context,
//                           builder: (BuildContext context) {
//                             return BotttomSheetDialog(
//                               showCurrency:
//                                   true, // Show the language selection sheet
//                             );
//                           },
//                         );
//                       }),

//                       _buildSettingsCard(
//                           context, Icons.notifications, 'Notifications', 'Not Set',
//                           onTap: () {
//                         showModalBottomSheet(
//                           context: context,
//                           builder: (BuildContext context) {
//                             return BotttomSheetDialog(
//                               showNotification:
//                                   true, // Show the language selection sheet
//                             );
//                           },
//                         );
//                       }),
//                       // _buildSettingsCard(context, Icons.attach_money, 'Currency', 'Not Set'),
//                       _buildSettingsCard(context, Icons.notifications,
//                           'Notifications', 'Not Set'),
//                       _buildSettingsCard(
//                           context, Icons.security, 'Security', 'Not Set'),
//                     ],
//                   ),

//                   SizedBox(height: 20),

//                   // Support Section
//                   Text('Support',
//                       style:
//                           TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
//                   SizedBox(height: 10),
//                   _buildSupportTile(context, Icons.help_outline,
//                       'Frequently Asked Questions', 'FAQ\'s'),
//                   _buildSupportTile(context, Icons.chat_bubble_outline,
//                       'Customer Helpdesk', 'Chat'),

//                   // Button
//                   SizedBox(height: 30),
//                   Center(
//                     child: ElevatedButton(
//                       onPressed: () {
//                         // Next button logic
//                       },
//                       style: ElevatedButton.styleFrom(
//                         minimumSize: Size(200, 50),
//                         primary: Colors.grey[400], // Set color to match image
//                         shape: RoundedRectangleBorder(
//                           borderRadius: BorderRadius.circular(10),
//                         ),
//                       ),
//                       child: Text('Next',
//                           style: TextStyle(fontSize: 18, color: Colors.white)),
//                     ),
//                   ),
//                 ],
//               ),
//             ),
//           ),
//         ],
//       ),
//     );
//   }

//   Widget _buildSettingsCard(
//       BuildContext context, IconData icon, String title, String status,
//       {VoidCallback? onTap}) {
//     return Card(
//       elevation: 2, // Controls the shadow effect
//       margin: EdgeInsets.symmetric(vertical: 8, horizontal: 0),
//       shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
//       child: ListTile(
//         leading: Icon(icon, color: Colors.black),
//         title: Text(title),
//         trailing: Row(
//           mainAxisSize: MainAxisSize
//               .min, // Ensures the Row takes up only the needed space
//           children: [
//             Text(status, style: TextStyle(color: Colors.grey)),
//             SizedBox(width: 8), // Adds space between the text and the icon
//             Icon(Icons.arrow_forward_ios,
//                 color: Colors.grey, size: 16), // Example icon
//           ],
//         ),
//         onTap: onTap, // Handle tap with the passed onTap callback
//       ),
//     );
//   }

//   Widget _buildSupportTile(
//       BuildContext context, IconData icon, String title, String action) {
//     return Card(
//         elevation: 2, // Controls the shadow effect
//         margin: EdgeInsets.symmetric(vertical: 8, horizontal: 0),
//         shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
//         child: ListTile(
//           leading: Icon(icon, color: Colors.black),
//           title: Text(title),
//           trailing: Row(
//             mainAxisSize: MainAxisSize
//                 .min, // Ensures the Row takes up only the needed space
//             children: [
//               Text(action, style: TextStyle(color: Colors.grey)),
//               SizedBox(width: 8), // Adds space between the text and the icon
//               Icon(Icons.arrow_forward_ios,
//                   color: Colors.grey, size: 16), // Example icon
//             ],
//           ),
//           onTap: () {
//             // Navigate to respective support page
//           },
//         ));
//   }
// }

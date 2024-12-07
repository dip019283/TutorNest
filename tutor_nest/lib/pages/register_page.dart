// import 'package:flutter/material.dart';
//
// class RegisterPage extends StatefulWidget {
//   @override
//   _RegisterPageState createState() => _RegisterPageState();
// }
//
// class _RegisterPageState extends State<RegisterPage> {
//   String gender = 'Male'; // Default gender
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       resizeToAvoidBottomInset: true,
//       body: SingleChildScrollView(
//         child: Padding(
//           padding: const EdgeInsets.all(20.0),
//           child: Column(
//             mainAxisAlignment: MainAxisAlignment.center,
//             children: [
//               SizedBox(height: 80), // Space from top
//               // Register Title
//               Text(
//                 "Register",
//                 style: TextStyle(
//                   fontSize: 24,
//                   fontWeight: FontWeight.bold,
//                 ),
//               ),
//               const SizedBox(height: 30),
//               // Username TextField
//               TextField(
//                 decoration: InputDecoration(
//                   prefixIcon: Icon(Icons.person),
//                   hintText: "Username",
//                   filled: true,
//                   fillColor: Colors.white.withOpacity(0.8),
//                   border: OutlineInputBorder(
//                     borderRadius: BorderRadius.circular(30.0),
//                     borderSide: BorderSide.none,
//                   ),
//                 ),
//               ),
//               const SizedBox(height: 15),
//               // Address TextField
//               TextField(
//                 decoration: InputDecoration(
//                   prefixIcon: Icon(Icons.home),
//                   hintText: "Address",
//                   filled: true,
//                   fillColor: Colors.white.withOpacity(0.8),
//                   border: OutlineInputBorder(
//                     borderRadius: BorderRadius.circular(30.0),
//                     borderSide: BorderSide.none,
//                   ),
//                 ),
//               ),
//               const SizedBox(height: 15),
//               // Email TextField
//               TextField(
//                 decoration: InputDecoration(
//                   prefixIcon: Icon(Icons.email),
//                   hintText: "Email",
//                   filled: true,
//                   fillColor: Colors.white.withOpacity(0.8),
//                   border: OutlineInputBorder(
//                     borderRadius: BorderRadius.circular(30.0),
//                     borderSide: BorderSide.none,
//                   ),
//                 ),
//               ),
//               const SizedBox(height: 15),
//               // Password TextField
//               TextField(
//                 obscureText: true,
//                 decoration: InputDecoration(
//                   prefixIcon: Icon(Icons.lock),
//                   hintText: "Password",
//                   filled: true,
//                   fillColor: Colors.white.withOpacity(0.8),
//                   border: OutlineInputBorder(
//                     borderRadius: BorderRadius.circular(30.0),
//                     borderSide: BorderSide.none,
//                   ),
//                 ),
//               ),
//               const SizedBox(height: 15),
//               // Re-type Password TextField
//               TextField(
//                 obscureText: true,
//                 decoration: InputDecoration(
//                   prefixIcon: Icon(Icons.lock_outline),
//                   hintText: "Re-Type Password",
//                   filled: true,
//                   fillColor: Colors.white.withOpacity(0.8),
//                   border: OutlineInputBorder(
//                     borderRadius: BorderRadius.circular(30.0),
//                     borderSide: BorderSide.none,
//                   ),
//                 ),
//               ),
//               const SizedBox(height: 15),
//               // Gender Selection
//               Row(
//                 mainAxisAlignment: MainAxisAlignment.center,
//                 children: [
//                   Icon(Icons.people),
//                   const SizedBox(width: 10),
//                   Text("Gender:"),
//                   const SizedBox(width: 10),
//                   // Male Radio Button
//                   Row(
//                     children: [
//                       Radio(
//                         value: 'Male',
//                         groupValue: gender,
//                         onChanged: (String? value) {
//                           setState(() {
//                             gender = value!;
//                           });
//                         },
//                       ),
//                       const Text("Male"),
//                     ],
//                   ),
//                   // Female Radio Button
//                   Row(
//                     children: [
//                       Radio(
//                         value: 'Female',
//                         groupValue: gender,
//                         onChanged: (String? value) {
//                           setState(() {
//                             gender = value!;
//                           });
//                         },
//                       ),
//                       const Text("Female"),
//                     ],
//                   ),
//                 ],
//               ),
//               const SizedBox(height: 20),
//               // Register Button
//               ElevatedButton(
//                 onPressed: () {
//                   // Handle registration logic here
//                 },
//                 style: ElevatedButton.styleFrom(
//                   backgroundColor: Colors.grey,
//                   padding: const EdgeInsets.symmetric(horizontal: 40.0, vertical: 15.0),
//                   shape: RoundedRectangleBorder(
//                     borderRadius: BorderRadius.circular(30.0),
//                   ),
//                 ),
//                 child: Text(
//                   "Register",
//                   style: TextStyle(
//                     color: Colors.white,
//                     fontSize: 16,
//                   ),
//                 ),
//               ),
//               const SizedBox(height: 50), // Space at the bottom
//             ],
//           ),
//         ),
//       ),
//     );
//   }
// }


// import 'package:flutter/material.dart';
//
// class RegisterPage extends StatefulWidget {
//   @override
//   _RegisterPageState createState() => _RegisterPageState();
// }
//
// class _RegisterPageState extends State<RegisterPage> {
//   String gender = 'Male'; // Default gender
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       resizeToAvoidBottomInset: true,
//       body: Stack(
//         children: [
//           // Background image with semi-transparent overlay
//           Positioned.fill(
//             child: Opacity(
//               opacity: 0.5, // Adjust opacity for semi-transparency
//               child: Image.asset(
//                 'assets/background.png', // Make sure to add your image in the assets folder and update pubspec.yaml
//                 fit: BoxFit.cover,
//               ),
//             ),
//           ),
//           // Content of the registration form
//           SingleChildScrollView(
//             child: Padding(
//               padding: const EdgeInsets.all(20.0),
//               child: Column(
//                 mainAxisAlignment: MainAxisAlignment.center,
//                 children: [
//                   SizedBox(height: 80), // Space from top
//                   // Register Title
//                   Text(
//                     "Register",
//                     style: TextStyle(
//                       fontSize: 24,
//                       fontWeight: FontWeight.bold,
//                     ),
//                   ),
//                   const SizedBox(height: 30),
//                   // Container with form and background overlay
//                   Container(
//                     decoration: BoxDecoration(
//                       color: Colors.black.withOpacity(0.2), // Semi-transparent overlay
//                       borderRadius: BorderRadius.circular(20),
//                     ),
//                     padding: EdgeInsets.all(20),
//                     child: Column(
//                       children: [
//                         // Username TextField
//                         TextField(
//                           decoration: InputDecoration(
//                             prefixIcon: Icon(Icons.person),
//                             hintText: "Username",
//                             filled: true,
//                             fillColor: Colors.white,
//                             border: OutlineInputBorder(
//                               borderRadius: BorderRadius.circular(30.0),
//                               borderSide: BorderSide.none,
//                             ),
//                           ),
//                         ),
//                         const SizedBox(height: 15),
//                         // Address TextField
//                         TextField(
//                           decoration: InputDecoration(
//                             prefixIcon: Icon(Icons.home),
//                             hintText: "Address",
//                             filled: true,
//                             fillColor: Colors.white,
//                             border: OutlineInputBorder(
//                               borderRadius: BorderRadius.circular(30.0),
//                               borderSide: BorderSide.none,
//                             ),
//                           ),
//                         ),
//                         const SizedBox(height: 15),
//                         // Email TextField
//                         TextField(
//                           decoration: InputDecoration(
//                             prefixIcon: Icon(Icons.email),
//                             hintText: "Email",
//                             filled: true,
//                             fillColor: Colors.white,
//                             border: OutlineInputBorder(
//                               borderRadius: BorderRadius.circular(30.0),
//                               borderSide: BorderSide.none,
//                             ),
//                           ),
//                         ),
//                         const SizedBox(height: 15),
//                         // Password TextField
//                         TextField(
//                           obscureText: true,
//                           decoration: InputDecoration(
//                             prefixIcon: Icon(Icons.lock),
//                             hintText: "Password",
//                             filled: true,
//                             fillColor: Colors.white,
//                             border: OutlineInputBorder(
//                               borderRadius: BorderRadius.circular(30.0),
//                               borderSide: BorderSide.none,
//                             ),
//                           ),
//                         ),
//                         const SizedBox(height: 15),
//                         // Re-type Password TextField
//                         TextField(
//                           obscureText: true,
//                           decoration: InputDecoration(
//                             prefixIcon: Icon(Icons.lock_outline),
//                             hintText: "Re-Type Password",
//                             filled: true,
//                             fillColor: Colors.white,
//                             border: OutlineInputBorder(
//                               borderRadius: BorderRadius.circular(30.0),
//                               borderSide: BorderSide.none,
//                             ),
//                           ),
//                         ),
//                         const SizedBox(height: 15),
//                         // Gender Selection
//                         Row(
//                           mainAxisAlignment: MainAxisAlignment.center,
//                           children: [
//                             Icon(Icons.people),
//                             const SizedBox(width: 10),
//                             Text("Gender:"),
//                             const SizedBox(width: 10),
//                             // Male Radio Button
//                             Row(
//                               children: [
//                                 Radio(
//                                   value: 'Male',
//                                   groupValue: gender,
//                                   onChanged: (String? value) {
//                                     setState(() {
//                                       gender = value!;
//                                     });
//                                   },
//                                 ),
//                                 const Text("Male"),
//                               ],
//                             ),
//                             // Female Radio Button
//                             Row(
//                               children: [
//                                 Radio(
//                                   value: 'Female',
//                                   groupValue: gender,
//                                   onChanged: (String? value) {
//                                     setState(() {
//                                       gender = value!;
//                                     });
//                                   },
//                                 ),
//                                 const Text("Female"),
//                               ],
//                             ),
//                           ],
//                         ),
//                         const SizedBox(height: 20),
//                         // Register Button
//                         ElevatedButton(
//                           onPressed: () {
//                             // Handle registration logic here
//                           },
//                           style: ElevatedButton.styleFrom(
//                             backgroundColor: Colors.grey,
//                             padding: const EdgeInsets.symmetric(
//                                 horizontal: 40.0, vertical: 15.0),
//                             shape: RoundedRectangleBorder(
//                               borderRadius: BorderRadius.circular(30.0),
//                             ),
//                           ),
//                           child: Text(
//                             "Register",
//                             style: TextStyle(
//                               color: Colors.white,
//                               fontSize: 16,
//                             ),
//                           ),
//                         ),
//                         const SizedBox(height: 20),
//                       ],
//                     ),
//                   ),
//                   const SizedBox(height: 50), // Space at the bottom
//                 ],
//               ),
//             ),
//           ),
//         ],
//       ),
//     );
//   }
// }


// import 'package:flutter/material.dart';
//
// class RegisterPage extends StatefulWidget {
//   @override
//   _RegisterPageState createState() => _RegisterPageState();
// }
//
// class _RegisterPageState extends State<RegisterPage> {
//   String gender = 'Male'; // Default gender
//   bool _isPasswordVisible = false; // Toggle password visibility
//   bool _isReTypePasswordVisible = false; // Toggle re-type password visibility
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       resizeToAvoidBottomInset: true,
//       body: Stack(
//         children: [
//           // Background image with semi-transparent overlay
//           Positioned.fill(
//             child: Opacity(
//               opacity: 0.5, // Adjust opacity for semi-transparency
//               child: Image.asset(
//                 'assets/background.png', // Make sure to add your image in the assets folder and update pubspec.yaml
//                 fit: BoxFit.cover,
//               ),
//             ),
//           ),
//           // Content of the registration form
//           SingleChildScrollView(
//             child: Padding(
//               padding: const EdgeInsets.all(20.0),
//               child: Column(
//                 mainAxisAlignment: MainAxisAlignment.center,
//                 children: [
//                   SizedBox(height: 80), // Space from top
//                   // Register Title
//                   Text(
//                     "Register",
//                     style: TextStyle(
//                       fontSize: 24,
//                       fontWeight: FontWeight.bold,
//                     ),
//                   ),
//                   const SizedBox(height: 30),
//                   // Container with form and background overlay
//                   Container(
//                     decoration: BoxDecoration(
//                       color: Colors.black.withOpacity(0.2), // Semi-transparent overlay
//                       borderRadius: BorderRadius.circular(20),
//                     ),
//                     padding: EdgeInsets.all(20),
//                     child: Column(
//                       children: [
//                         // Username TextField
//                         TextField(
//                           decoration: InputDecoration(
//                             prefixIcon: Icon(Icons.person),
//                             hintText: "Username",
//                             filled: true,
//                             fillColor: Colors.white,
//                             border: OutlineInputBorder(
//                               borderRadius: BorderRadius.circular(30.0),
//                               borderSide: BorderSide.none,
//                             ),
//                           ),
//                         ),
//                         const SizedBox(height: 15),
//                         // Address TextField
//                         TextField(
//                           decoration: InputDecoration(
//                             prefixIcon: Icon(Icons.home),
//                             hintText: "Address",
//                             filled: true,
//                             fillColor: Colors.white,
//                             border: OutlineInputBorder(
//                               borderRadius: BorderRadius.circular(30.0),
//                               borderSide: BorderSide.none,
//                             ),
//                           ),
//                         ),
//                         const SizedBox(height: 15),
//                         // Email TextField
//                         TextField(
//                           decoration: InputDecoration(
//                             prefixIcon: Icon(Icons.email),
//                             hintText: "Email",
//                             filled: true,
//                             fillColor: Colors.white,
//                             border: OutlineInputBorder(
//                               borderRadius: BorderRadius.circular(30.0),
//                               borderSide: BorderSide.none,
//                             ),
//                           ),
//                         ),
//                         const SizedBox(height: 15),
//                         // Password TextField with show/hide icon
//                         TextField(
//                           obscureText: !_isPasswordVisible,
//                           decoration: InputDecoration(
//                             prefixIcon: Icon(Icons.lock),
//                             hintText: "Password",
//                             filled: true,
//                             fillColor: Colors.white,
//                             border: OutlineInputBorder(
//                               borderRadius: BorderRadius.circular(30.0),
//                               borderSide: BorderSide.none,
//                             ),
//                             suffixIcon: IconButton(
//                               icon: Icon(
//                                 _isPasswordVisible
//                                     ? Icons.visibility
//                                     : Icons.visibility_off,
//                               ),
//                               onPressed: () {
//                                 setState(() {
//                                   _isPasswordVisible = !_isPasswordVisible;
//                                 });
//                               },
//                             ),
//                           ),
//                         ),
//                         const SizedBox(height: 15),
//                         // Re-type Password TextField with show/hide icon
//                         TextField(
//                           obscureText: !_isReTypePasswordVisible,
//                           decoration: InputDecoration(
//                             prefixIcon: Icon(Icons.lock_outline),
//                             hintText: "Re-Type Password",
//                             filled: true,
//                             fillColor: Colors.white,
//                             border: OutlineInputBorder(
//                               borderRadius: BorderRadius.circular(30.0),
//                               borderSide: BorderSide.none,
//                             ),
//                             suffixIcon: IconButton(
//                               icon: Icon(
//                                 _isReTypePasswordVisible
//                                     ? Icons.visibility
//                                     : Icons.visibility_off,
//                               ),
//                               onPressed: () {
//                                 setState(() {
//                                   _isReTypePasswordVisible = !_isReTypePasswordVisible;
//                                 });
//                               },
//                             ),
//                           ),
//                         ),
//                         const SizedBox(height: 15),
//                         // Gender Selection
//                         Row(
//                           mainAxisAlignment: MainAxisAlignment.center,
//                           children: [
//                             Icon(Icons.people),
//                             const SizedBox(width: 10),
//                             Text("Gender:"),
//                             const SizedBox(width: 10),
//                             // Male Radio Button
//                             Row(
//                               children: [
//                                 Radio(
//                                   value: 'Male',
//                                   groupValue: gender,
//                                   onChanged: (String? value) {
//                                     setState(() {
//                                       gender = value!;
//                                     });
//                                   },
//                                 ),
//                                 const Text("Male"),
//                               ],
//                             ),
//                             // Female Radio Button
//                             Row(
//                               children: [
//                                 Radio(
//                                   value: 'Female',
//                                   groupValue: gender,
//                                   onChanged: (String? value) {
//                                     setState(() {
//                                       gender = value!;
//                                     });
//                                   },
//                                 ),
//                                 const Text("Female"),
//                               ],
//                             ),
//                           ],
//                         ),
//                         const SizedBox(height: 20),
//                         // Register Button
//                         ElevatedButton(
//                           onPressed: () {
//                             // Handle registration logic here
//
//                             Navigator.pushNamed(context, '/login');
//                           },
//                           style: ElevatedButton.styleFrom(
//                             backgroundColor: Colors.blue,
//                             padding: const EdgeInsets.symmetric(
//                                 horizontal: 40.0, vertical: 15.0),
//                             shape: RoundedRectangleBorder(
//                               borderRadius: BorderRadius.circular(30.0),
//                             ),
//                           ),
//                           child: Text(
//                             "Register",
//                             style: TextStyle(
//                               color: Colors.white,
//                               fontSize: 16,
//                             ),
//                           ),
//                         ),
//                         const SizedBox(height: 20),
//                       ],
//                     ),
//                   ),
//                   const SizedBox(height: 50), // Space at the bottom
//                 ],
//               ),
//             ),
//           ),
//         ],
//       ),
//     );
//   }
// }
//

// import 'package:flutter/material.dart';
//
// class RegisterPage extends StatefulWidget {
//   @override
//   _RegisterPageState createState() => _RegisterPageState();
// }
//
// class _RegisterPageState extends State<RegisterPage> {
//   String gender = 'Male'; // Default gender
//   bool _isPasswordVisible = false; // Toggle password visibility
//   bool _isReTypePasswordVisible = false; // Toggle re-type password visibility
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       resizeToAvoidBottomInset: false, // Prevent layout resizing when keyboard appears
//       body: Stack(
//         children: [
//           // Fixed Background Image
//           Positioned.fill(
//             child: Image.asset(
//               'assets/background.png', // Ensure the image is added to assets and listed in pubspec.yaml
//               fit: BoxFit.cover,
//             ),
//           ),
//           // Semi-transparent overlay to darken the background
//           Positioned.fill(
//             child: Container(
//               color: Colors.black.withOpacity(0.3), // Adjust opacity as needed
//             ),
//           ),
//           // Foreground content (scrollable)
//           Center(
//             child: SingleChildScrollView(
//               padding: const EdgeInsets.all(20.0),
//               child: Column(
//                 mainAxisAlignment: MainAxisAlignment.center,
//                 children: [
//                   const SizedBox(height: 80), // Space from the top
//                   // Register Title
//                   Text(
//                     "Register",
//                     style: TextStyle(
//                       fontSize: 24,
//                       fontWeight: FontWeight.bold,
//                       color: Colors.white,
//                     ),
//                   ),
//                   const SizedBox(height: 30),
//                   // Form Container
//                   Container(
//                     decoration: BoxDecoration(
//                       color: Colors.black.withOpacity(0.5), // Semi-transparent overlay
//                       borderRadius: BorderRadius.circular(20),
//                     ),
//                     padding: const EdgeInsets.all(20),
//                     child: Column(
//                       children: [
//                         // Username TextField
//                         TextField(
//                           decoration: InputDecoration(
//                             prefixIcon: Icon(Icons.person),
//                             hintText: "Username",
//                             filled: true,
//                             fillColor: Colors.white,
//                             border: OutlineInputBorder(
//                               borderRadius: BorderRadius.circular(30.0),
//                               borderSide: BorderSide.none,
//                             ),
//                           ),
//                         ),
//                         const SizedBox(height: 15),
//                         // Address TextField
//                         TextField(
//                           decoration: InputDecoration(
//                             prefixIcon: Icon(Icons.home),
//                             hintText: "Address",
//                             filled: true,
//                             fillColor: Colors.white,
//                             border: OutlineInputBorder(
//                               borderRadius: BorderRadius.circular(30.0),
//                               borderSide: BorderSide.none,
//                             ),
//                           ),
//                         ),
//                         const SizedBox(height: 15),
//                         // Email TextField
//                         TextField(
//                           decoration: InputDecoration(
//                             prefixIcon: Icon(Icons.email),
//                             hintText: "Email",
//                             filled: true,
//                             fillColor: Colors.white,
//                             border: OutlineInputBorder(
//                               borderRadius: BorderRadius.circular(30.0),
//                               borderSide: BorderSide.none,
//                             ),
//                           ),
//                         ),
//                         const SizedBox(height: 15),
//                         // Password TextField with show/hide icon
//                         TextField(
//                           obscureText: !_isPasswordVisible,
//                           decoration: InputDecoration(
//                             prefixIcon: Icon(Icons.lock),
//                             hintText: "Password",
//                             filled: true,
//                             fillColor: Colors.white,
//                             border: OutlineInputBorder(
//                               borderRadius: BorderRadius.circular(30.0),
//                               borderSide: BorderSide.none,
//                             ),
//                             suffixIcon: IconButton(
//                               icon: Icon(
//                                 _isPasswordVisible
//                                     ? Icons.visibility
//                                     : Icons.visibility_off,
//                               ),
//                               onPressed: () {
//                                 setState(() {
//                                   _isPasswordVisible = !_isPasswordVisible;
//                                 });
//                               },
//                             ),
//                           ),
//                         ),
//                         const SizedBox(height: 15),
//                         // Re-type Password TextField with show/hide icon
//                         TextField(
//                           obscureText: !_isReTypePasswordVisible,
//                           decoration: InputDecoration(
//                             prefixIcon: Icon(Icons.lock_outline),
//                             hintText: "Re-Type Password",
//                             filled: true,
//                             fillColor: Colors.white,
//                             border: OutlineInputBorder(
//                               borderRadius: BorderRadius.circular(30.0),
//                               borderSide: BorderSide.none,
//                             ),
//                             suffixIcon: IconButton(
//                               icon: Icon(
//                                 _isReTypePasswordVisible
//                                     ? Icons.visibility
//                                     : Icons.visibility_off,
//                               ),
//                               onPressed: () {
//                                 setState(() {
//                                   _isReTypePasswordVisible = !_isReTypePasswordVisible;
//                                 });
//                               },
//                             ),
//                           ),
//                         ),
//                         const SizedBox(height: 15),
//                         // Gender Selection
//                         Row(
//                           mainAxisAlignment: MainAxisAlignment.center,
//                           children: [
//                             Icon(Icons.people, color: Colors.white),
//                             const SizedBox(width: 10),
//                             Text("Gender:", style: TextStyle(color: Colors.white)),
//                             const SizedBox(width: 10),
//                             // Male Radio Button
//                             Row(
//                               children: [
//                                 Radio(
//                                   value: 'Male',
//                                   groupValue: gender,
//                                   onChanged: (String? value) {
//                                     setState(() {
//                                       gender = value!;
//                                     });
//                                   },
//                                 ),
//                                 const Text("Male"),
//                               ],
//                             ),
//                             // Female Radio Button
//                             Row(
//                               children: [
//                                 Radio(
//                                   value: 'Female',
//                                   groupValue: gender,
//                                   onChanged: (String? value) {
//                                     setState(() {
//                                       gender = value!;
//                                     });
//                                   },
//                                 ),
//                                 const Text("Female"),
//                               ],
//                             ),
//                           ],
//                         ),
//                         const SizedBox(height: 20),
//                         // Register Button
//                         ElevatedButton(
//                           onPressed: () {
//                             // Handle registration logic here
//                             Navigator.pushNamed(context, '/login');
//                           },
//                           style: ElevatedButton.styleFrom(
//                             backgroundColor: Colors.blue,
//                             padding: const EdgeInsets.symmetric(
//                                 horizontal: 40.0, vertical: 15.0),
//                             shape: RoundedRectangleBorder(
//                               borderRadius: BorderRadius.circular(30.0),
//                             ),
//                           ),
//                           child: Text(
//                             "Register",
//                             style: TextStyle(
//                               color: Colors.white,
//                               fontSize: 16,
//                             ),
//                           ),
//                         ),
//                       ],
//                     ),
//                   ),
//                   const SizedBox(height: 50), // Space at the bottom
//                 ],
//               ),
//             ),
//           ),
//         ],
//       ),
//     );
//   }
// }

// import 'package:flutter/material.dart';
//
// class RegisterPage extends StatefulWidget {
//   @override
//   _RegisterPageState createState() => _RegisterPageState();
// }
//
// class _RegisterPageState extends State<RegisterPage> {
//   String gender = 'Male'; // Default gender
//   bool _isPasswordVisible = false; // Toggle password visibility
//   bool _isReTypePasswordVisible = false; // Toggle re-type password visibility
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       resizeToAvoidBottomInset: true, // Allow resizing for keyboard
//       body: Stack(
//         children: [
//           // Fixed Background Image
//           Positioned.fill(
//             child: Image.asset(
//               'assets/register_background.png', // Ensure image is added to assets folder
//               fit: BoxFit.cover,
//             ),
//           ),
//           // Semi-transparent overlay
//           Positioned.fill(
//             child: Container(
//               color: Colors.black.withOpacity(0.3), // Adjust transparency
//             ),
//           ),
//           // Scrollable Content
//           SafeArea(
//             child: LayoutBuilder(
//               builder: (context, constraints) {
//                 return SingleChildScrollView(
//                   child: ConstrainedBox(
//                     constraints: BoxConstraints(
//                       minHeight: constraints.maxHeight,
//                     ),
//                     child: Padding(
//                       padding: const EdgeInsets.all(20.0),
//                       child: Column(
//                         mainAxisAlignment: MainAxisAlignment.center,
//                         children: [
//                           const SizedBox(height: 40),
//                           // Title
//                           Text(
//                             "Register",
//                             style: TextStyle(
//                               fontSize: 24,
//                               fontWeight: FontWeight.bold,
//                               color: Colors.white,
//                             ),
//                           ),
//                           const SizedBox(height: 30),
//                           // Form
//                           Container(
//                             decoration: BoxDecoration(
//                               color: Colors.white.withOpacity(0.3),
//                               borderRadius: BorderRadius.circular(20),
//                             ),
//                             padding: const EdgeInsets.all(20),
//                             child: Column(
//                               children: [
//                                 // Username Field
//                                 TextField(
//                                   decoration: InputDecoration(
//                                     prefixIcon: Icon(Icons.person),
//                                     hintText: "Username",
//                                     filled: true,
//                                     fillColor: Colors.white,
//                                     border: OutlineInputBorder(
//                                       borderRadius: BorderRadius.circular(30.0),
//                                       borderSide: BorderSide.none,
//                                     ),
//                                   ),
//                                 ),
//                                 const SizedBox(height: 15),
//                                 // Address Field
//                                 TextField(
//                                   decoration: InputDecoration(
//                                     prefixIcon: Icon(Icons.home),
//                                     hintText: "Address",
//                                     filled: true,
//                                     fillColor: Colors.white,
//                                     border: OutlineInputBorder(
//                                       borderRadius: BorderRadius.circular(30.0),
//                                       borderSide: BorderSide.none,
//                                     ),
//                                   ),
//                                 ),
//                                 const SizedBox(height: 15),
//                                 // Email Field
//                                 TextField(
//                                   decoration: InputDecoration(
//                                     prefixIcon: Icon(Icons.email),
//                                     hintText: "Email",
//                                     filled: true,
//                                     fillColor: Colors.white,
//                                     border: OutlineInputBorder(
//                                       borderRadius: BorderRadius.circular(30.0),
//                                       borderSide: BorderSide.none,
//                                     ),
//                                   ),
//                                 ),
//                                 const SizedBox(height: 15),
//                                 // Password Field
//                                 TextField(
//                                   obscureText: !_isPasswordVisible,
//                                   decoration: InputDecoration(
//                                     prefixIcon: Icon(Icons.lock),
//                                     hintText: "Password",
//                                     filled: true,
//                                     fillColor: Colors.white,
//                                     border: OutlineInputBorder(
//                                       borderRadius: BorderRadius.circular(30.0),
//                                       borderSide: BorderSide.none,
//                                     ),
//                                     suffixIcon: IconButton(
//                                       icon: Icon(
//                                         _isPasswordVisible
//                                             ? Icons.visibility
//                                             : Icons.visibility_off,
//                                       ),
//                                       onPressed: () {
//                                         setState(() {
//                                           _isPasswordVisible =
//                                           !_isPasswordVisible;
//                                         });
//                                       },
//                                     ),
//                                   ),
//                                 ),
//                                 const SizedBox(height: 15),
//                                 // Re-Type Password Field
//                                 TextField(
//                                   obscureText: !_isReTypePasswordVisible,
//                                   decoration: InputDecoration(
//                                     prefixIcon: Icon(Icons.lock_outline),
//                                     hintText: "Re-Type Password",
//                                     filled: true,
//                                     fillColor: Colors.white,
//                                     border: OutlineInputBorder(
//                                       borderRadius: BorderRadius.circular(30.0),
//                                       borderSide: BorderSide.none,
//                                     ),
//                                     suffixIcon: IconButton(
//                                       icon: Icon(
//                                         _isReTypePasswordVisible
//                                             ? Icons.visibility
//                                             : Icons.visibility_off,
//                                       ),
//                                       onPressed: () {
//                                         setState(() {
//                                           _isReTypePasswordVisible =
//                                           !_isReTypePasswordVisible;
//                                         });
//                                       },
//                                     ),
//                                   ),
//                                 ),
//                                 const SizedBox(height: 15),
//                                 // Gender Selection
//                                 Row(
//                                   mainAxisAlignment: MainAxisAlignment.center,
//                                   children: [
//                                     Icon(Icons.people, color: Colors.white),
//                                     const SizedBox(width: 10),
//                                     Text(
//                                       "Gender:",
//                                       style: TextStyle(color: Colors.white),
//                                     ),
//                                     const SizedBox(width: 10),
//                                     // Male
//                                     Row(
//                                       children: [
//                                         Radio(
//                                           value: 'Male',
//                                           groupValue: gender,
//                                           onChanged: (String? value) {
//                                             setState(() {
//                                               gender = value!;
//                                             });
//                                           },
//                                         ),
//                                         const Text("Male"),
//                                       ],
//                                     ),
//                                     // Female
//                                     Row(
//                                       children: [
//                                         Radio(
//                                           value: 'Female',
//                                           groupValue: gender,
//                                           onChanged: (String? value) {
//                                             setState(() {
//                                               gender = value!;
//                                             });
//                                           },
//                                         ),
//                                         const Text("Female"),
//                                       ],
//                                     ),
//                                   ],
//                                 ),
//                                 const SizedBox(height: 20),
//                                 // Register Button
//                                 ElevatedButton(
//                                   onPressed: () {
//                                     Navigator.pushNamed(context, '/login');
//                                   },
//                                   style: ElevatedButton.styleFrom(
//                                     backgroundColor: Colors.blue,
//                                     padding: const EdgeInsets.symmetric(
//                                         horizontal: 40.0, vertical: 15.0),
//                                     shape: RoundedRectangleBorder(
//                                       borderRadius: BorderRadius.circular(30.0),
//                                     ),
//                                   ),
//                                   child: Text(
//                                     "Register",
//                                     style: TextStyle(
//                                       color: Colors.white,
//                                       fontSize: 16,
//                                     ),
//                                   ),
//                                 ),
//                               ],
//                             ),
//                           ),
//                           const SizedBox(height: 50),
//                         ],
//                       ),
//                     ),
//                   ),
//                 );
//               },
//             ),
//           ),
//         ],
//       ),
//     );
//   }
// }

//
// import 'package:flutter/material.dart';
//
// class RegisterPage extends StatefulWidget {
//   @override
//   _RegisterPageState createState() => _RegisterPageState();
// }
//
// class _RegisterPageState extends State<RegisterPage> {
//   String gender = 'Male'; // Default gender
//   bool _isPasswordVisible = false; // Toggle password visibility
//   bool _isReTypePasswordVisible = false; // Toggle re-type password visibility
//
//   // Controllers for the text fields (optional, useful for validation and retrieving input)
//   final TextEditingController _usernameController = TextEditingController();
//   final TextEditingController _addressController = TextEditingController();
//   final TextEditingController _phoneController = TextEditingController(); // New Controller
//   final TextEditingController _emailController = TextEditingController();
//   final TextEditingController _passwordController = TextEditingController();
//   final TextEditingController _reTypePasswordController = TextEditingController();
//
//   @override
//   void dispose() {
//     // Dispose controllers when the widget is disposed
//     _usernameController.dispose();
//     _addressController.dispose();
//     _phoneController.dispose(); // Dispose new controller
//     _emailController.dispose();
//     _passwordController.dispose();
//     _reTypePasswordController.dispose();
//     super.dispose();
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       resizeToAvoidBottomInset: true, // Allow resizing for keyboard
//       body: Stack(
//         children: [
//           // Fixed Background Image
//           Positioned.fill(
//             child: Image.asset(
//               'assets/register_background.png', // Ensure image is added to assets folder
//               fit: BoxFit.cover,
//             ),
//           ),
//           // Semi-transparent overlay
//           Positioned.fill(
//             child: Container(
//               color: Colors.black.withOpacity(0.3), // Adjust transparency
//             ),
//           ),
//           // Scrollable Content
//           SafeArea(
//             child: LayoutBuilder(
//               builder: (context, constraints) {
//                 return SingleChildScrollView(
//                   child: ConstrainedBox(
//                     constraints: BoxConstraints(
//                       minHeight: constraints.maxHeight,
//                     ),
//                     child: Padding(
//                       padding: const EdgeInsets.all(20.0),
//                       child: Column(
//                         mainAxisAlignment: MainAxisAlignment.center,
//                         children: [
//                           const SizedBox(height: 40),
//                           // Title
//                           Text(
//                             "Register",
//                             style: TextStyle(
//                               fontSize: 24,
//                               fontWeight: FontWeight.bold,
//                               color: Colors.white,
//                             ),
//                           ),
//                           const SizedBox(height: 30),
//                           // Form
//                           Container(
//                             decoration: BoxDecoration(
//                               color: Colors.white.withOpacity(0.3),
//                               borderRadius: BorderRadius.circular(20),
//                             ),
//                             padding: const EdgeInsets.all(20),
//                             child: Column(
//                               children: [
//                                 // Username Field
//                                 TextField(
//                                   controller: _usernameController,
//                                   decoration: InputDecoration(
//                                     prefixIcon: Icon(Icons.person),
//                                     hintText: "Username",
//                                     filled: true,
//                                     fillColor: Colors.white,
//                                     border: OutlineInputBorder(
//                                       borderRadius: BorderRadius.circular(30.0),
//                                       borderSide: BorderSide.none,
//                                     ),
//                                   ),
//                                 ),
//                                 const SizedBox(height: 15),
//                                 // Address Field
//                                 TextField(
//                                   controller: _addressController,
//                                   decoration: InputDecoration(
//                                     prefixIcon: Icon(Icons.home),
//                                     hintText: "Address",
//                                     filled: true,
//                                     fillColor: Colors.white,
//                                     border: OutlineInputBorder(
//                                       borderRadius: BorderRadius.circular(30.0),
//                                       borderSide: BorderSide.none,
//                                     ),
//                                   ),
//                                 ),
//                                 const SizedBox(height: 15),
//                                 // **Phone Number Field** (Newly Added)
//                                 TextField(
//                                   controller: _phoneController,
//                                   keyboardType: TextInputType.phone,
//                                   decoration: InputDecoration(
//                                     prefixIcon: Icon(Icons.phone),
//                                     hintText: "Phone Number",
//                                     filled: true,
//                                     fillColor: Colors.white,
//                                     border: OutlineInputBorder(
//                                       borderRadius: BorderRadius.circular(30.0),
//                                       borderSide: BorderSide.none,
//                                     ),
//                                   ),
//                                 ),
//                                 const SizedBox(height: 15),
//                                 // Email Field
//                                 TextField(
//                                   controller: _emailController,
//                                   keyboardType: TextInputType.emailAddress,
//                                   decoration: InputDecoration(
//                                     prefixIcon: Icon(Icons.email),
//                                     hintText: "Email",
//                                     filled: true,
//                                     fillColor: Colors.white,
//                                     border: OutlineInputBorder(
//                                       borderRadius: BorderRadius.circular(30.0),
//                                       borderSide: BorderSide.none,
//                                     ),
//                                   ),
//                                 ),
//                                 const SizedBox(height: 15),
//                                 // Password Field
//                                 TextField(
//                                   controller: _passwordController,
//                                   obscureText: !_isPasswordVisible,
//                                   decoration: InputDecoration(
//                                     prefixIcon: Icon(Icons.lock),
//                                     hintText: "Password",
//                                     filled: true,
//                                     fillColor: Colors.white,
//                                     border: OutlineInputBorder(
//                                       borderRadius: BorderRadius.circular(30.0),
//                                       borderSide: BorderSide.none,
//                                     ),
//                                     suffixIcon: IconButton(
//                                       icon: Icon(
//                                         _isPasswordVisible
//                                             ? Icons.visibility
//                                             : Icons.visibility_off,
//                                       ),
//                                       onPressed: () {
//                                         setState(() {
//                                           _isPasswordVisible =
//                                           !_isPasswordVisible;
//                                         });
//                                       },
//                                     ),
//                                   ),
//                                 ),
//                                 const SizedBox(height: 15),
//                                 // Re-Type Password Field
//                                 TextField(
//                                   controller: _reTypePasswordController,
//                                   obscureText: !_isReTypePasswordVisible,
//                                   decoration: InputDecoration(
//                                     prefixIcon: Icon(Icons.lock_outline),
//                                     hintText: "Re-Type Password",
//                                     filled: true,
//                                     fillColor: Colors.white,
//                                     border: OutlineInputBorder(
//                                       borderRadius: BorderRadius.circular(30.0),
//                                       borderSide: BorderSide.none,
//                                     ),
//                                     suffixIcon: IconButton(
//                                       icon: Icon(
//                                         _isReTypePasswordVisible
//                                             ? Icons.visibility
//                                             : Icons.visibility_off,
//                                       ),
//                                       onPressed: () {
//                                         setState(() {
//                                           _isReTypePasswordVisible =
//                                           !_isReTypePasswordVisible;
//                                         });
//                                       },
//                                     ),
//                                   ),
//                                 ),
//                                 const SizedBox(height: 15),
//                                 // Gender Selection
//                                 Row(
//                                   mainAxisAlignment: MainAxisAlignment.center,
//                                   children: [
//                                     Icon(Icons.people, color: Colors.white),
//                                     const SizedBox(width: 10),
//                                     Text(
//                                       "Gender:",
//                                       style: TextStyle(color: Colors.white),
//                                     ),
//                                     const SizedBox(width: 10),
//                                     // Male
//                                     Row(
//                                       children: [
//                                         Radio(
//                                           value: 'Male',
//                                           groupValue: gender,
//                                           onChanged: (String? value) {
//                                             setState(() {
//                                               gender = value!;
//                                             });
//                                           },
//                                         ),
//                                         const Text("Male"),
//                                       ],
//                                     ),
//                                     // Female
//                                     Row(
//                                       children: [
//                                         Radio(
//                                           value: 'Female',
//                                           groupValue: gender,
//                                           onChanged: (String? value) {
//                                             setState(() {
//                                               gender = value!;
//                                             });
//                                           },
//                                         ),
//                                         const Text("Female"),
//                                       ],
//                                     ),
//                                   ],
//                                 ),
//                                 const SizedBox(height: 20),
//                                 // Register Button
//                                 ElevatedButton(
//                                   onPressed: () {
//                                     // Implement registration logic here
//                                     Navigator.pushNamed(context, '/login');
//                                   },
//                                   style: ElevatedButton.styleFrom(
//                                     backgroundColor: Colors.blue,
//                                     padding: const EdgeInsets.symmetric(
//                                         horizontal: 40.0, vertical: 15.0),
//                                     shape: RoundedRectangleBorder(
//                                       borderRadius: BorderRadius.circular(30.0),
//                                     ),
//                                   ),
//                                   child: Text(
//                                     "Register",
//                                     style: TextStyle(
//                                       color: Colors.white,
//                                       fontSize: 16,
//                                     ),
//                                   ),
//                                 ),
//                               ],
//                             ),
//                           ),
//                           const SizedBox(height: 50),
//                         ],
//                       ),
//                     ),
//                   ),
//                 );
//               },
//             ),
//           ),
//         ],
//       ),
//     );
//   }
// }

// import 'package:flutter/material.dart';
//
// class RegisterPage extends StatefulWidget {
//   @override
//   _RegisterPageState createState() => _RegisterPageState();
// }
//
// class _RegisterPageState extends State<RegisterPage> {
//   String gender = 'Male'; // Default gender
//   bool _isPasswordVisible = false; // Toggle password visibility
//   bool _isReTypePasswordVisible = false; // Toggle re-type password visibility
//
//   // Controllers for the text fields
//   final TextEditingController _usernameController = TextEditingController();
//   final TextEditingController _addressController = TextEditingController();
//   final TextEditingController _phoneController = TextEditingController();
//   final TextEditingController _emailController = TextEditingController();
//   final TextEditingController _passwordController = TextEditingController();
//   final TextEditingController _reTypePasswordController =
//   TextEditingController();
//
//   // Country selection state
//   String? _selectedCountry;
//
//   // List of countries (sample list)
//   final List<String> _countries = [
//     "USA",
//     "Canada",
//     "United Kingdom",
//     "Australia",
//     "Germany",
//     "France",
//     "India",
//     "China",
//     "Japan",
//     "Brazil",
//     // Add more countries as needed
//   ];
//
//   // GlobalKey for the form (useful for validation)
//   final _formKey = GlobalKey<FormState>();
//
//   @override
//   void dispose() {
//     // Dispose controllers when the widget is disposed
//     _usernameController.dispose();
//     _addressController.dispose();
//     _phoneController.dispose();
//     _emailController.dispose();
//     _passwordController.dispose();
//     _reTypePasswordController.dispose();
//     super.dispose();
//   }
//
//   // Method to build the Country Dropdown
//   Widget _buildCountryDropdown() {
//     return Padding(
//       padding: const EdgeInsets.symmetric(vertical: 8.0),
//       child: DropdownButtonFormField<String>(
//         value: _selectedCountry,
//         decoration: InputDecoration(
//           prefixIcon: Icon(Icons.flag),
//           labelText: "Country",
//           filled: true,
//           fillColor: Colors.white,
//           border: OutlineInputBorder(
//             borderRadius: BorderRadius.circular(30.0),
//             borderSide: BorderSide.none,
//           ),
//         ),
//         items: _countries
//             .map(
//               (country) => DropdownMenuItem<String>(
//             value: country,
//             child: Text(country),
//           ),
//         )
//             .toList(),
//         onChanged: (value) {
//           setState(() {
//             _selectedCountry = value;
//           });
//         },
//         validator: (value) {
//           if (value == null || value.isEmpty) {
//             return 'Please select your country';
//           }
//           return null;
//         },
//       ),
//     );
//   }
//
//   // Method to build the Gender Selection
//   Widget _buildGenderSelection() {
//     return Padding(
//       padding: const EdgeInsets.symmetric(vertical: 8.0),
//       child: Column(
//         crossAxisAlignment: CrossAxisAlignment.start,
//         children: [
//           Text(
//             "Gender",
//             style: TextStyle(
//                 fontSize: 16, fontWeight: FontWeight.w500, color: Colors.white),
//           ),
//           Row(
//             children: [
//               // Male Radio Button
//               Expanded(
//                 child: RadioListTile<String>(
//                   title: Text("Male", style: TextStyle(color: Colors.white)),
//                   value: "Male",
//                   groupValue: gender,
//                   onChanged: (value) {
//                     setState(() {
//                       gender = value!;
//                     });
//                   },
//                   activeColor: Colors.blue,
//                   contentPadding: EdgeInsets.zero,
//                 ),
//               ),
//               // Female Radio Button
//               Expanded(
//                 child: RadioListTile<String>(
//                   title:
//                   Text("Female", style: TextStyle(color: Colors.white)),
//                   value: "Female",
//                   groupValue: gender,
//                   onChanged: (value) {
//                     setState(() {
//                       gender = value!;
//                     });
//                   },
//                   activeColor: Colors.blue,
//                   contentPadding: EdgeInsets.zero,
//                 ),
//               ),
//             ],
//           ),
//         ],
//       ),
//     );
//   }
//
//   // Method to build the Register Button
//   Widget _buildRegisterButton() {
//     return ElevatedButton(
//       onPressed: () {
//         if (_formKey.currentState!.validate()) {
//           // Implement registration logic here
//           // For example, send data to backend or navigate to another page
//           ScaffoldMessenger.of(context).showSnackBar(
//             SnackBar(content: Text('Registration Successful!')),
//           );
//           Navigator.pushNamed(context, '/login'); // Navigate to login page
//         }
//       },
//       style: ElevatedButton.styleFrom(
//         backgroundColor: Colors.blue,
//         padding:
//         const EdgeInsets.symmetric(horizontal: 40.0, vertical: 15.0),
//         shape: RoundedRectangleBorder(
//           borderRadius: BorderRadius.circular(30.0),
//         ),
//       ),
//       child: Text(
//         "Register",
//         style: TextStyle(
//           color: Colors.white,
//           fontSize: 16,
//         ),
//       ),
//     );
//   }
//
//   // Method to build the entire registration form
//   Widget _buildRegistrationForm() {
//     return Form(
//       key: _formKey, // Assign the GlobalKey to the Form
//       child: Column(
//         children: [
//           // Username Field
//           TextFormField(
//             controller: _usernameController,
//             decoration: InputDecoration(
//               prefixIcon: Icon(Icons.person),
//               hintText: "Username",
//               filled: true,
//               fillColor: Colors.white,
//               border: OutlineInputBorder(
//                 borderRadius: BorderRadius.circular(30.0),
//                 borderSide: BorderSide.none,
//               ),
//             ),
//             validator: (value) {
//               if (value == null || value.isEmpty) {
//                 return 'Please enter your username';
//               }
//               return null;
//             },
//           ),
//           const SizedBox(height: 15),
//           // Address Field
//           TextFormField(
//             controller: _addressController,
//             decoration: InputDecoration(
//               prefixIcon: Icon(Icons.home),
//               hintText: "Address",
//               filled: true,
//               fillColor: Colors.white,
//               border: OutlineInputBorder(
//                 borderRadius: BorderRadius.circular(30.0),
//                 borderSide: BorderSide.none,
//               ),
//             ),
//             validator: (value) {
//               if (value == null || value.isEmpty) {
//                 return 'Please enter your address';
//               }
//               return null;
//             },
//           ),
//           const SizedBox(height: 15),
//           // Phone Number Field
//           TextFormField(
//             controller: _phoneController,
//             keyboardType: TextInputType.phone,
//             decoration: InputDecoration(
//               prefixIcon: Icon(Icons.phone),
//               hintText: "Phone Number",
//               filled: true,
//               fillColor: Colors.white,
//               border: OutlineInputBorder(
//                 borderRadius: BorderRadius.circular(30.0),
//                 borderSide: BorderSide.none,
//               ),
//             ),
//             validator: (value) {
//               if (value == null || value.isEmpty) {
//                 return 'Please enter your phone number';
//               }
//               // Simple phone number validation
//               if (!RegExp(r'^\+?\d{10,15}$').hasMatch(value)) {
//                 return 'Please enter a valid phone number';
//               }
//               return null;
//             },
//           ),
//           const SizedBox(height: 15),
//           // Email Field
//           TextFormField(
//             controller: _emailController,
//             keyboardType: TextInputType.emailAddress,
//             decoration: InputDecoration(
//               prefixIcon: Icon(Icons.email),
//               hintText: "Email",
//               filled: true,
//               fillColor: Colors.white,
//               border: OutlineInputBorder(
//                 borderRadius: BorderRadius.circular(30.0),
//                 borderSide: BorderSide.none,
//               ),
//             ),
//             validator: (value) {
//               if (value == null || value.isEmpty) {
//                 return 'Please enter your email';
//               }
//               // Simple email validation
//               if (!RegExp(
//                   r'^[^@]+@[^@]+\.[^@]+')
//                   .hasMatch(value)) {
//                 return 'Please enter a valid email address';
//               }
//               return null;
//             },
//           ),
//           const SizedBox(height: 15),
//           // Country Dropdown
//           _buildCountryDropdown(),
//           const SizedBox(height: 15),
//           // Password Field
//           TextFormField(
//             controller: _passwordController,
//             obscureText: !_isPasswordVisible,
//             decoration: InputDecoration(
//               prefixIcon: Icon(Icons.lock),
//               hintText: "Password",
//               filled: true,
//               fillColor: Colors.white,
//               border: OutlineInputBorder(
//                 borderRadius: BorderRadius.circular(30.0),
//                 borderSide: BorderSide.none,
//               ),
//               suffixIcon: IconButton(
//                 icon: Icon(
//                   _isPasswordVisible
//                       ? Icons.visibility
//                       : Icons.visibility_off,
//                 ),
//                 onPressed: () {
//                   setState(() {
//                     _isPasswordVisible = !_isPasswordVisible;
//                   });
//                 },
//               ),
//             ),
//             validator: (value) {
//               if (value == null || value.isEmpty) {
//                 return 'Please enter your password';
//               }
//               if (value.length < 6) {
//                 return 'Password must be at least 6 characters';
//               }
//               return null;
//             },
//           ),
//           const SizedBox(height: 15),
//           // Re-Type Password Field
//           TextFormField(
//             controller: _reTypePasswordController,
//             obscureText: !_isReTypePasswordVisible,
//             decoration: InputDecoration(
//               prefixIcon: Icon(Icons.lock_outline),
//               hintText: "Re-Type Password",
//               filled: true,
//               fillColor: Colors.white,
//               border: OutlineInputBorder(
//                 borderRadius: BorderRadius.circular(30.0),
//                 borderSide: BorderSide.none,
//               ),
//               suffixIcon: IconButton(
//                 icon: Icon(
//                   _isReTypePasswordVisible
//                       ? Icons.visibility
//                       : Icons.visibility_off,
//                 ),
//                 onPressed: () {
//                   setState(() {
//                     _isReTypePasswordVisible =
//                     !_isReTypePasswordVisible;
//                   });
//                 },
//               ),
//             ),
//             validator: (value) {
//               if (value == null || value.isEmpty) {
//                 return 'Please re-type your password';
//               }
//               if (value != _passwordController.text) {
//                 return 'Passwords do not match';
//               }
//               return null;
//             },
//           ),
//           const SizedBox(height: 15),
//           // Gender Selection
//           _buildGenderSelection(),
//           const SizedBox(height: 20),
//           // Register Button
//           _buildRegisterButton(),
//         ],
//       ),
//     );
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       resizeToAvoidBottomInset:
//       true, // Allow resizing when keyboard appears
//       body: Stack(
//         children: [
//           // Background Image
//           Positioned.fill(
//             child: Image.asset(
//               'assets/register_background.png', // Ensure this image exists in your assets
//               fit: BoxFit.cover,
//             ),
//           ),
//           // Semi-transparent overlay
//           Positioned.fill(
//             child: Container(
//               color: Colors.black.withOpacity(0.3), // Adjust opacity as needed
//             ),
//           ),
//           // Scrollable Content
//           SafeArea(
//             child: LayoutBuilder(
//               builder: (context, constraints) {
//                 return SingleChildScrollView(
//                   child: ConstrainedBox(
//                     constraints: BoxConstraints(
//                       minHeight: constraints.maxHeight,
//                     ),
//                     child: Padding(
//                       padding: const EdgeInsets.all(20.0),
//                       child: Column(
//                         mainAxisAlignment:
//                         MainAxisAlignment.center, // Center vertically
//                         children: [
//                           const SizedBox(height: 40),
//                           // Title
//                           Text(
//                             "Register",
//                             style: TextStyle(
//                               fontSize: 24,
//                               fontWeight: FontWeight.bold,
//                               color: Colors.white,
//                             ),
//                           ),
//                           const SizedBox(height: 30),
//                           // Registration Form Container
//                           Container(
//                             decoration: BoxDecoration(
//                               color: Colors.white.withOpacity(0.3),
//                               borderRadius: BorderRadius.circular(20),
//                             ),
//                             padding: const EdgeInsets.all(20),
//                             child: _buildRegistrationForm(),
//                           ),
//                           const SizedBox(height: 50),
//                         ],
//                       ),
//                     ),
//                   ),
//                 );
//               },
//             ),
//           ),
//         ],
//       ),
//     );
//   }
// }


// import 'package:flutter/material.dart';
//
// class RegisterPage extends StatefulWidget {
//   @override
//   _RegisterPageState createState() => _RegisterPageState();
// }
//
// class _RegisterPageState extends State<RegisterPage> {
//   String gender = 'Male'; // Default gender
//   bool _isPasswordVisible = false; // Toggle password visibility
//   bool _isReTypePasswordVisible = false; // Toggle re-type password visibility
//
//   // Controllers for the text fields
//   final TextEditingController _usernameController = TextEditingController();
//   final TextEditingController _addressController = TextEditingController();
//   final TextEditingController _phoneController = TextEditingController();
//   final TextEditingController _emailController = TextEditingController();
//   final TextEditingController _passwordController = TextEditingController();
//   final TextEditingController _reTypePasswordController =
//   TextEditingController();
//
//   // Country selection state
//   String? _selectedCountry;
//
//   // List of countries (sample list)
//   final List<String> _countries = [
//     "USA",
//     "Canada",
//     "United Kingdom",
//     "Australia",
//     "Germany",
//     "France",
//     "India",
//     "China",
//     "Japan",
//     "Brazil",
//     // Add more countries as needed
//   ];
//
//   // GlobalKey for the form (useful for validation)
//   final _formKey = GlobalKey<FormState>();
//
//   @override
//   void dispose() {
//     // Dispose controllers when the widget is disposed
//     _usernameController.dispose();
//     _addressController.dispose();
//     _phoneController.dispose();
//     _emailController.dispose();
//     _passwordController.dispose();
//     _reTypePasswordController.dispose();
//     super.dispose();
//   }
//
//   // Updated Method to build the Country Dropdown
//   Widget _buildCountryDropdown() {
//     return Padding(
//       padding: const EdgeInsets.symmetric(vertical: 8.0),
//       child: DropdownButtonFormField<String>(
//         value: _selectedCountry,
//         decoration: InputDecoration(
//           prefixIcon: Icon(Icons.flag),
//           labelText: _selectedCountry == null ? "Country" : null, // Conditionally show label
//           floatingLabelBehavior: _selectedCountry == null
//               ? FloatingLabelBehavior.auto
//               : FloatingLabelBehavior.never, // Control floating behavior
//           filled: true,
//           fillColor: Colors.white,
//           border: OutlineInputBorder(
//             borderRadius: BorderRadius.circular(30.0),
//             borderSide: BorderSide.none,
//           ),
//         ),
//         items: _countries
//             .map(
//               (country) => DropdownMenuItem<String>(
//             value: country,
//             child: Text(country),
//           ),
//         )
//             .toList(),
//         onChanged: (value) {
//           setState(() {
//             _selectedCountry = value;
//           });
//         },
//         validator: (value) {
//           if (value == null || value.isEmpty) {
//             return 'Please select your country';
//           }
//           return null;
//         },
//       ),
//     );
//   }
//
//   // ... (Rest of your code remains unchanged)
//
//   // Method to build the Gender Selection
//   Widget _buildGenderSelection() {
//     return Padding(
//       padding: const EdgeInsets.symmetric(vertical: 8.0),
//       child: Column(
//         crossAxisAlignment: CrossAxisAlignment.start,
//         children: [
//           Text(
//             "Gender",
//             style: TextStyle(
//                 fontSize: 16, fontWeight: FontWeight.w500, color: Colors.white),
//           ),
//           Row(
//             children: [
//               // Male Radio Button
//               Expanded(
//                 child: RadioListTile<String>(
//                   title: Text("Male", style: TextStyle(color: Colors.white)),
//                   value: "Male",
//                   groupValue: gender,
//                   onChanged: (value) {
//                     setState(() {
//                       gender = value!;
//                     });
//                   },
//                   activeColor: Colors.blue,
//                   contentPadding: EdgeInsets.zero,
//                 ),
//               ),
//               // Female Radio Button
//               Expanded(
//                 child: RadioListTile<String>(
//                   title:
//                   Text("Female", style: TextStyle(color: Colors.white)),
//                   value: "Female",
//                   groupValue: gender,
//                   onChanged: (value) {
//                     setState(() {
//                       gender = value!;
//                     });
//                   },
//                   activeColor: Colors.blue,
//                   contentPadding: EdgeInsets.zero,
//                 ),
//               ),
//             ],
//           ),
//         ],
//       ),
//     );
//   }
//
//   // Method to build the Register Button
//   Widget _buildRegisterButton() {
//     return ElevatedButton(
//       onPressed: () {
//         if (_formKey.currentState!.validate()) {
//           // Implement registration logic here
//           // For example, send data to backend or navigate to another page
//           ScaffoldMessenger.of(context).showSnackBar(
//             SnackBar(content: Text('Registration Successful!')),
//           );
//           Navigator.pushNamed(context, '/login'); // Navigate to login page
//         }
//       },
//       style: ElevatedButton.styleFrom(
//         backgroundColor: Colors.blue,
//         padding:
//         const EdgeInsets.symmetric(horizontal: 40.0, vertical: 15.0),
//         shape: RoundedRectangleBorder(
//           borderRadius: BorderRadius.circular(30.0),
//         ),
//       ),
//       child: Text(
//         "Register",
//         style: TextStyle(
//           color: Colors.white,
//           fontSize: 16,
//         ),
//       ),
//     );
//   }
//
//   // Method to build the entire registration form
//   Widget _buildRegistrationForm() {
//     return Form(
//       key: _formKey, // Assign the GlobalKey to the Form
//       child: Column(
//         children: [
//           // Username Field
//           TextFormField(
//             controller: _usernameController,
//             decoration: InputDecoration(
//               prefixIcon: Icon(Icons.person),
//               hintText: "Username",
//               filled: true,
//               fillColor: Colors.white,
//               border: OutlineInputBorder(
//                 borderRadius: BorderRadius.circular(30.0),
//                 borderSide: BorderSide.none,
//               ),
//             ),
//             validator: (value) {
//               if (value == null || value.isEmpty) {
//                 return 'Please enter your username';
//               }
//               return null;
//             },
//           ),
//           const SizedBox(height: 15),
//           // Address Field
//           TextFormField(
//             controller: _addressController,
//             decoration: InputDecoration(
//               prefixIcon: Icon(Icons.home),
//               hintText: "Address",
//               filled: true,
//               fillColor: Colors.white,
//               border: OutlineInputBorder(
//                 borderRadius: BorderRadius.circular(30.0),
//                 borderSide: BorderSide.none,
//               ),
//             ),
//             validator: (value) {
//               if (value == null || value.isEmpty) {
//                 return 'Please enter your address';
//               }
//               return null;
//             },
//           ),
//           const SizedBox(height: 15),
//           // Phone Number Field
//           TextFormField(
//             controller: _phoneController,
//             keyboardType: TextInputType.phone,
//             decoration: InputDecoration(
//               prefixIcon: Icon(Icons.phone),
//               hintText: "Phone Number",
//               filled: true,
//               fillColor: Colors.white,
//               border: OutlineInputBorder(
//                 borderRadius: BorderRadius.circular(30.0),
//                 borderSide: BorderSide.none,
//               ),
//             ),
//             validator: (value) {
//               if (value == null || value.isEmpty) {
//                 return 'Please enter your phone number';
//               }
//               // Simple phone number validation
//               if (!RegExp(r'^\+?\d{10,15}$').hasMatch(value)) {
//                 return 'Please enter a valid phone number';
//               }
//               return null;
//             },
//           ),
//           const SizedBox(height: 15),
//           // Email Field
//           TextFormField(
//             controller: _emailController,
//             keyboardType: TextInputType.emailAddress,
//             decoration: InputDecoration(
//               prefixIcon: Icon(Icons.email),
//               hintText: "Email",
//               filled: true,
//               fillColor: Colors.white,
//               border: OutlineInputBorder(
//                 borderRadius: BorderRadius.circular(30.0),
//                 borderSide: BorderSide.none,
//               ),
//             ),
//             validator: (value) {
//               if (value == null || value.isEmpty) {
//                 return 'Please enter your email';
//               }
//               // Simple email validation
//               if (!RegExp(
//                   r'^[^@]+@[^@]+\.[^@]+')
//                   .hasMatch(value)) {
//                 return 'Please enter a valid email address';
//               }
//               return null;
//             },
//           ),
//           const SizedBox(height: 15),
//           // Country Dropdown
//           _buildCountryDropdown(),
//           const SizedBox(height: 15),
//           // Password Field
//           TextFormField(
//             controller: _passwordController,
//             obscureText: !_isPasswordVisible,
//             decoration: InputDecoration(
//               prefixIcon: Icon(Icons.lock),
//               hintText: "Password",
//               filled: true,
//               fillColor: Colors.white,
//               border: OutlineInputBorder(
//                 borderRadius: BorderRadius.circular(30.0),
//                 borderSide: BorderSide.none,
//               ),
//               suffixIcon: IconButton(
//                 icon: Icon(
//                   _isPasswordVisible
//                       ? Icons.visibility
//                       : Icons.visibility_off,
//                 ),
//                 onPressed: () {
//                   setState(() {
//                     _isPasswordVisible = !_isPasswordVisible;
//                   });
//                 },
//               ),
//             ),
//             validator: (value) {
//               if (value == null || value.isEmpty) {
//                 return 'Please enter your password';
//               }
//               if (value.length < 6) {
//                 return 'Password must be at least 6 characters';
//               }
//               return null;
//             },
//           ),
//           const SizedBox(height: 15),
//           // Re-Type Password Field
//           TextFormField(
//             controller: _reTypePasswordController,
//             obscureText: !_isReTypePasswordVisible,
//             decoration: InputDecoration(
//               prefixIcon: Icon(Icons.lock_outline),
//               hintText: "Re-Type Password",
//               filled: true,
//               fillColor: Colors.white,
//               border: OutlineInputBorder(
//                 borderRadius: BorderRadius.circular(30.0),
//                 borderSide: BorderSide.none,
//               ),
//               suffixIcon: IconButton(
//                 icon: Icon(
//                   _isReTypePasswordVisible
//                       ? Icons.visibility
//                       : Icons.visibility_off,
//                 ),
//                 onPressed: () {
//                   setState(() {
//                     _isReTypePasswordVisible =
//                     !_isReTypePasswordVisible;
//                   });
//                 },
//               ),
//             ),
//             validator: (value) {
//               if (value == null || value.isEmpty) {
//                 return 'Please re-type your password';
//               }
//               if (value != _passwordController.text) {
//                 return 'Passwords do not match';
//               }
//               return null;
//             },
//           ),
//           const SizedBox(height: 15),
//           // Gender Selection
//           _buildGenderSelection(),
//           const SizedBox(height: 20),
//           // Register Button
//           _buildRegisterButton(),
//         ],
//       ),
//     );
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       resizeToAvoidBottomInset:
//       true, // Allow resizing when keyboard appears
//       body: Stack(
//         children: [
//           // Background Image
//           Positioned.fill(
//             child: Image.asset(
//               'assets/register_background.png', // Ensure this image exists in your assets
//               fit: BoxFit.cover,
//             ),
//           ),
//           // Semi-transparent overlay
//           Positioned.fill(
//             child: Container(
//               color: Colors.black.withOpacity(0.3), // Adjust opacity as needed
//             ),
//           ),
//           // Scrollable Content
//           SafeArea(
//             child: LayoutBuilder(
//               builder: (context, constraints) {
//                 return SingleChildScrollView(
//                   child: ConstrainedBox(
//                     constraints: BoxConstraints(
//                       minHeight: constraints.maxHeight,
//                     ),
//                     child: Padding(
//                       padding: const EdgeInsets.all(20.0),
//                       child: Column(
//                         mainAxisAlignment:
//                         MainAxisAlignment.center, // Center vertically
//                         children: [
//                           const SizedBox(height: 40),
//                           // Title
//                           Text(
//                             "Register",
//                             style: TextStyle(
//                               fontSize: 24,
//                               fontWeight: FontWeight.bold,
//                               color: Colors.white,
//                             ),
//                           ),
//                           const SizedBox(height: 30),
//                           // Registration Form Container
//                           Container(
//                             decoration: BoxDecoration(
//                               color: Colors.white.withOpacity(0.3),
//                               borderRadius: BorderRadius.circular(20),
//                             ),
//                             padding: const EdgeInsets.all(20),
//                             child: _buildRegistrationForm(),
//                           ),
//                           const SizedBox(height: 50),
//                         ],
//                       ),
//                     ),
//                   ),
//                 );
//               },
//             ),
//           ),
//         ],
//       ),
//     );
//   }
// }

// import 'package:flutter/material.dart';
//
// class RegisterPage extends StatefulWidget {
//   @override
//   _RegisterPageState createState() => _RegisterPageState();
// }
//
// class _RegisterPageState extends State<RegisterPage> {
//   String gender = 'Male'; // Default gender
//   bool _isPasswordVisible = false; // Toggle password visibility
//   bool _isReTypePasswordVisible = false; // Toggle re-type password visibility
//
//   // Controllers for the text fields
//   final TextEditingController _usernameController = TextEditingController();
//   final TextEditingController _addressController = TextEditingController();
//   final TextEditingController _phoneController = TextEditingController();
//   final TextEditingController _emailController = TextEditingController();
//   final TextEditingController _passwordController = TextEditingController();
//   final TextEditingController _reTypePasswordController =
//   TextEditingController();
//
//   // Country selection state
//   String? _selectedCountry;
//   String? _selectedCountryCode;
//
//   // List of countries with their codes
//   final List<Map<String, String>> _countryData = [
//     {"name": "USA", "code": "+1"},
//     {"name": "Canada", "code": "+1"},
//     {"name": "United Kingdom", "code": "+44"},
//     {"name": "Australia", "code": "+61"},
//     {"name": "Germany", "code": "+49"},
//     {"name": "France", "code": "+33"},
//     {"name": "India", "code": "+91"},
//     {"name": "China", "code": "+86"},
//     {"name": "Japan", "code": "+81"},
//     {"name": "Brazil", "code": "+55"},
//     // Add more countries and their codes as needed
//   ];
//
//   // GlobalKey for the form (useful for validation)
//   final _formKey = GlobalKey<FormState>();
//
//   @override
//   void dispose() {
//     // Dispose controllers when the widget is disposed
//     _usernameController.dispose();
//     _addressController.dispose();
//     _phoneController.dispose();
//     _emailController.dispose();
//     _passwordController.dispose();
//     _reTypePasswordController.dispose();
//     super.dispose();
//   }
//
//   // Method to build the Country Code Dropdown
//   Widget _buildCountryCodeDropdown() {
//     return Expanded(
//       flex: 3,
//       child: DropdownButtonFormField<String>(
//         value: _selectedCountryCode,
//         decoration: InputDecoration(
//           prefixIcon: Icon(Icons.flag),
//           hintText: "Code",
//           filled: true,
//           fillColor: Colors.white,
//           border: OutlineInputBorder(
//             borderRadius: BorderRadius.circular(30.0),
//             borderSide: BorderSide.none,
//           ),
//         ),
//         items: _countryData.map((country) {
//           return DropdownMenuItem<String>(
//             value: country['code'],
//             child: Text("${country['code']} (${country['name']})"),
//           );
//         }).toList(),
//         onChanged: (value) {
//           setState(() {
//             _selectedCountryCode = value;
//           });
//         },
//         validator: (value) {
//           if (value == null || value.isEmpty) {
//             return 'Please select your country code';
//           }
//           return null;
//         },
//       ),
//     );
//   }
//
//   // Method to build the Phone Number Field with Country Code
//   Widget _buildPhoneNumberField() {
//     return Row(
//       children: [
//         _buildCountryCodeDropdown(),
//         SizedBox(width: 10),
//         Expanded(
//           flex: 7,
//           child: TextFormField(
//             controller: _phoneController,
//             keyboardType: TextInputType.phone,
//             decoration: InputDecoration(
//               prefixIcon: Icon(Icons.phone),
//               hintText: "Phone Number",
//               filled: true,
//               fillColor: Colors.white,
//               border: OutlineInputBorder(
//                 borderRadius: BorderRadius.circular(30.0),
//                 borderSide: BorderSide.none,
//               ),
//             ),
//             validator: (value) {
//               if (value == null || value.isEmpty) {
//                 return 'Please enter your phone number';
//               }
//               // Simple phone number validation (adjust as needed)
//               if (!RegExp(r'^\d{6,14}$').hasMatch(value)) {
//                 return 'Please enter a valid phone number';
//               }
//               return null;
//             },
//           ),
//         ),
//       ],
//     );
//   }
//
//   // Method to build the Country Dropdown
//   Widget _buildCountryDropdown() {
//     return Padding(
//       padding: const EdgeInsets.symmetric(vertical: 8.0),
//       child: DropdownButtonFormField<String>(
//         value: _selectedCountry,
//         decoration: InputDecoration(
//           prefixIcon: Icon(Icons.flag),
//           labelText: _selectedCountry == null ? "Country" : null,
//           floatingLabelBehavior: _selectedCountry == null
//               ? FloatingLabelBehavior.auto
//               : FloatingLabelBehavior.never,
//           filled: true,
//           fillColor: Colors.white,
//           border: OutlineInputBorder(
//             borderRadius: BorderRadius.circular(30.0),
//             borderSide: BorderSide.none,
//           ),
//         ),
//         items: _countryData.map((country) {
//           return DropdownMenuItem<String>(
//             value: country['name'],
//             child: Text(country['name']!),
//           );
//         }).toList(),
//         onChanged: (value) {
//           setState(() {
//             _selectedCountry = value;
//             // Automatically set the country code based on selected country
//             _selectedCountryCode = _countryData
//                 .firstWhere((country) => country['name'] == value)['code'];
//           });
//         },
//         validator: (value) {
//           if (value == null || value.isEmpty) {
//             return 'Please select your country';
//           }
//           return null;
//         },
//       ),
//     );
//   }
//
//   // ... (Rest of your code remains unchanged)
//
//   // Method to build the Gender Selection
//   Widget _buildGenderSelection() {
//     return Padding(
//       padding: const EdgeInsets.symmetric(vertical: 8.0),
//       child: Column(
//         crossAxisAlignment: CrossAxisAlignment.start,
//         children: [
//           Text(
//             "Gender",
//             style: TextStyle(
//                 fontSize: 16, fontWeight: FontWeight.w500, color: Colors.white),
//           ),
//           Row(
//             children: [
//               // Male Radio Button
//               Expanded(
//                 child: RadioListTile<String>(
//                   title: Text("Male", style: TextStyle(color: Colors.white)),
//                   value: "Male",
//                   groupValue: gender,
//                   onChanged: (value) {
//                     setState(() {
//                       gender = value!;
//                     });
//                   },
//                   activeColor: Colors.blue,
//                   contentPadding: EdgeInsets.zero,
//                 ),
//               ),
//               // Female Radio Button
//               Expanded(
//                 child: RadioListTile<String>(
//                   title:
//                   Text("Female", style: TextStyle(color: Colors.white)),
//                   value: "Female",
//                   groupValue: gender,
//                   onChanged: (value) {
//                     setState(() {
//                       gender = value!;
//                     });
//                   },
//                   activeColor: Colors.blue,
//                   contentPadding: EdgeInsets.zero,
//                 ),
//               ),
//             ],
//           ),
//         ],
//       ),
//     );
//   }
//
//   // Method to build the Register Button
//   Widget _buildRegisterButton() {
//     return ElevatedButton(
//       onPressed: () {
//         if (_formKey.currentState!.validate()) {
//           // Implement registration logic here
//           // For example, send data to backend or navigate to another page
//           ScaffoldMessenger.of(context).showSnackBar(
//             SnackBar(content: Text('Registration Successful!')),
//           );
//           Navigator.pushNamed(context, '/login'); // Navigate to login page
//         }
//       },
//       style: ElevatedButton.styleFrom(
//         backgroundColor: Colors.blue,
//         padding:
//         const EdgeInsets.symmetric(horizontal: 40.0, vertical: 15.0),
//         shape: RoundedRectangleBorder(
//           borderRadius: BorderRadius.circular(30.0),
//         ),
//       ),
//       child: Text(
//         "Register",
//         style: TextStyle(
//           color: Colors.white,
//           fontSize: 16,
//         ),
//       ),
//     );
//   }
//
//   // Method to build the entire registration form
//   Widget _buildRegistrationForm() {
//     return Form(
//       key: _formKey, // Assign the GlobalKey to the Form
//       child: Column(
//         children: [
//           // Username Field
//           TextFormField(
//             controller: _usernameController,
//             decoration: InputDecoration(
//               prefixIcon: Icon(Icons.person),
//               hintText: "Username",
//               filled: true,
//               fillColor: Colors.white,
//               border: OutlineInputBorder(
//                 borderRadius: BorderRadius.circular(30.0),
//                 borderSide: BorderSide.none,
//               ),
//             ),
//             validator: (value) {
//               if (value == null || value.isEmpty) {
//                 return 'Please enter your username';
//               }
//               return null;
//             },
//           ),
//           const SizedBox(height: 15),
//           // Address Field
//           TextFormField(
//             controller: _addressController,
//             decoration: InputDecoration(
//               prefixIcon: Icon(Icons.home),
//               hintText: "Address",
//               filled: true,
//               fillColor: Colors.white,
//               border: OutlineInputBorder(
//                 borderRadius: BorderRadius.circular(30.0),
//                 borderSide: BorderSide.none,
//               ),
//             ),
//             validator: (value) {
//               if (value == null || value.isEmpty) {
//                 return 'Please enter your address';
//               }
//               return null;
//             },
//           ),
//           const SizedBox(height: 15),
//           // Phone Number Field with Country Code
//           _buildPhoneNumberField(),
//           const SizedBox(height: 15),
//           // Email Field
//           TextFormField(
//             controller: _emailController,
//             keyboardType: TextInputType.emailAddress,
//             decoration: InputDecoration(
//               prefixIcon: Icon(Icons.email),
//               hintText: "Email",
//               filled: true,
//               fillColor: Colors.white,
//               border: OutlineInputBorder(
//                 borderRadius: BorderRadius.circular(30.0),
//                 borderSide: BorderSide.none,
//               ),
//             ),
//             validator: (value) {
//               if (value == null || value.isEmpty) {
//                 return 'Please enter your email';
//               }
//               // Simple email validation
//               if (!RegExp(
//                   r'^[^@]+@[^@]+\.[^@]+')
//                   .hasMatch(value)) {
//                 return 'Please enter a valid email address';
//               }
//               return null;
//             },
//           ),
//           const SizedBox(height: 15),
//           // Country Dropdown
//           _buildCountryDropdown(),
//           const SizedBox(height: 15),
//           // Password Field
//           TextFormField(
//             controller: _passwordController,
//             obscureText: !_isPasswordVisible,
//             decoration: InputDecoration(
//               prefixIcon: Icon(Icons.lock),
//               hintText: "Password",
//               filled: true,
//               fillColor: Colors.white,
//               border: OutlineInputBorder(
//                 borderRadius: BorderRadius.circular(30.0),
//                 borderSide: BorderSide.none,
//               ),
//               suffixIcon: IconButton(
//                 icon: Icon(
//                   _isPasswordVisible
//                       ? Icons.visibility
//                       : Icons.visibility_off,
//                 ),
//                 onPressed: () {
//                   setState(() {
//                     _isPasswordVisible = !_isPasswordVisible;
//                   });
//                 },
//               ),
//             ),
//             validator: (value) {
//               if (value == null || value.isEmpty) {
//                 return 'Please enter your password';
//               }
//               if (value.length < 6) {
//                 return 'Password must be at least 6 characters';
//               }
//               return null;
//             },
//           ),
//           const SizedBox(height: 15),
//           // Re-Type Password Field
//           TextFormField(
//             controller: _reTypePasswordController,
//             obscureText: !_isReTypePasswordVisible,
//             decoration: InputDecoration(
//               prefixIcon: Icon(Icons.lock_outline),
//               hintText: "Re-Type Password",
//               filled: true,
//               fillColor: Colors.white,
//               border: OutlineInputBorder(
//                 borderRadius: BorderRadius.circular(30.0),
//                 borderSide: BorderSide.none,
//               ),
//               suffixIcon: IconButton(
//                 icon: Icon(
//                   _isReTypePasswordVisible
//                       ? Icons.visibility
//                       : Icons.visibility_off,
//                 ),
//                 onPressed: () {
//                   setState(() {
//                     _isReTypePasswordVisible =
//                     !_isReTypePasswordVisible;
//                   });
//                 },
//               ),
//             ),
//             validator: (value) {
//               if (value == null || value.isEmpty) {
//                 return 'Please re-type your password';
//               }
//               if (value != _passwordController.text) {
//                 return 'Passwords do not match';
//               }
//               return null;
//             },
//           ),
//           const SizedBox(height: 15),
//           // Gender Selection
//           _buildGenderSelection(),
//           const SizedBox(height: 20),
//           // Register Button
//           _buildRegisterButton(),
//         ],
//       ),
//     );
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       resizeToAvoidBottomInset:
//       true, // Allow resizing when keyboard appears
//       body: Stack(
//         children: [
//           // Background Image
//           Positioned.fill(
//             child: Image.asset(
//               'assets/register_background.png', // Ensure this image exists in your assets
//               fit: BoxFit.cover,
//             ),
//           ),
//           // Semi-transparent overlay
//           Positioned.fill(
//             child: Container(
//               color: Colors.black.withOpacity(0.3), // Adjust opacity as needed
//             ),
//           ),
//           // Scrollable Content
//           SafeArea(
//             child: LayoutBuilder(
//               builder: (context, constraints) {
//                 return SingleChildScrollView(
//                   child: ConstrainedBox(
//                     constraints: BoxConstraints(
//                       minHeight: constraints.maxHeight,
//                     ),
//                     child: Padding(
//                       padding: const EdgeInsets.all(20.0),
//                       child: Column(
//                         mainAxisAlignment:
//                         MainAxisAlignment.center, // Center vertically
//                         children: [
//                           const SizedBox(height: 40),
//                           // Title
//                           Text(
//                             "Register",
//                             style: TextStyle(
//                               fontSize: 24,
//                               fontWeight: FontWeight.bold,
//                               color: Colors.white,
//                             ),
//                           ),
//                           const SizedBox(height: 30),
//                           // Registration Form Container
//                           Container(
//                             decoration: BoxDecoration(
//                               color: Colors.white.withOpacity(0.3),
//                               borderRadius: BorderRadius.circular(20),
//                             ),
//                             padding: const EdgeInsets.all(20),
//                             child: _buildRegistrationForm(),
//                           ),
//                           const SizedBox(height: 50),
//                         ],
//                       ),
//                     ),
//                   ),
//                 );
//               },
//             ),
//           ),
//         ],
//       ),
//     );
//   }
// }

// import 'package:flutter/material.dart';
//
// class RegisterPage extends StatefulWidget {
//   @override
//   _RegisterPageState createState() => _RegisterPageState();
// }
//
// class _RegisterPageState extends State<RegisterPage> {
//   String gender = 'Male'; // Default gender
//   bool _isPasswordVisible = false; // Toggle password visibility
//   bool _isReTypePasswordVisible = false; // Toggle re-type password visibility
//
//   // Controllers for the text fields
//   final TextEditingController _usernameController = TextEditingController();
//   final TextEditingController _addressController = TextEditingController();
//   final TextEditingController _phoneController = TextEditingController(text: '+'); // Prefill with '+'
//   final TextEditingController _emailController = TextEditingController();
//   final TextEditingController _passwordController = TextEditingController();
//   final TextEditingController _reTypePasswordController =
//   TextEditingController();
//
//   // Country selection state
//   String? _selectedCountry;
//
//   // List of countries (sample list)
//   final List<String> _countries = [
//     "USA",
//     "Canada",
//     "United Kingdom",
//     "Australia",
//     "Germany",
//     "France",
//     "India",
//     "China",
//     "Japan",
//     "Brazil",
//     // Add more countries as needed
//   ];
//
//   // GlobalKey for the form (useful for validation)
//   final _formKey = GlobalKey<FormState>();
//
//   @override
//   void dispose() {
//     // Dispose controllers when the widget is disposed
//     _usernameController.dispose();
//     _addressController.dispose();
//     _phoneController.dispose();
//     _emailController.dispose();
//     _passwordController.dispose();
//     _reTypePasswordController.dispose();
//     super.dispose();
//   }
//
//   // Updated Method to build the Country Dropdown
//   Widget _buildCountryDropdown() {
//     return Padding(
//       padding: const EdgeInsets.symmetric(vertical: 8.0),
//       child: DropdownButtonFormField<String>(
//         value: _selectedCountry,
//         decoration: InputDecoration(
//           prefixIcon: Icon(Icons.flag),
//           labelText: _selectedCountry == null ? "Country" : null, // Conditionally show label
//           floatingLabelBehavior: _selectedCountry == null
//               ? FloatingLabelBehavior.auto
//               : FloatingLabelBehavior.never, // Control floating behavior
//           filled: true,
//           fillColor: Colors.white,
//           border: OutlineInputBorder(
//             borderRadius: BorderRadius.circular(30.0),
//             borderSide: BorderSide.none,
//           ),
//         ),
//         items: _countries
//             .map(
//               (country) => DropdownMenuItem<String>(
//             value: country,
//             child: Text(country),
//           ),
//         )
//             .toList(),
//         onChanged: (value) {
//           setState(() {
//             _selectedCountry = value;
//           });
//         },
//         validator: (value) {
//           if (value == null || value.isEmpty) {
//             return 'Please select your country';
//           }
//           return null;
//         },
//       ),
//     );
//   }
//
//   // Method to build the Gender Selection
//   Widget _buildGenderSelection() {
//     return Padding(
//       padding: const EdgeInsets.symmetric(vertical: 8.0),
//       child: Column(
//         crossAxisAlignment: CrossAxisAlignment.start,
//         children: [
//           Text(
//             "Gender",
//             style: TextStyle(
//                 fontSize: 16, fontWeight: FontWeight.w500, color: Colors.white),
//           ),
//           Row(
//             children: [
//               // Male Radio Button
//               Expanded(
//                 child: RadioListTile<String>(
//                   title: Text("Male", style: TextStyle(color: Colors.white)),
//                   value: "Male",
//                   groupValue: gender,
//                   onChanged: (value) {
//                     setState(() {
//                       gender = value!;
//                     });
//                   },
//                   activeColor: Colors.blue,
//                   contentPadding: EdgeInsets.zero,
//                 ),
//               ),
//               // Female Radio Button
//               Expanded(
//                 child: RadioListTile<String>(
//                   title:
//                   Text("Female", style: TextStyle(color: Colors.white)),
//                   value: "Female",
//                   groupValue: gender,
//                   onChanged: (value) {
//                     setState(() {
//                       gender = value!;
//                     });
//                   },
//                   activeColor: Colors.blue,
//                   contentPadding: EdgeInsets.zero,
//                 ),
//               ),
//             ],
//           ),
//         ],
//       ),
//     );
//   }
//
//   // Method to build the Register Button
//   Widget _buildRegisterButton() {
//     return ElevatedButton(
//       onPressed: () {
//         if (_formKey.currentState!.validate()) {
//           // Implement registration logic here
//           // For example, send data to backend or navigate to another page
//           ScaffoldMessenger.of(context).showSnackBar(
//             SnackBar(content: Text('Registration Successful!')),
//           );
//           Navigator.pushNamed(context, '/login'); // Navigate to login page
//         }
//       },
//       style: ElevatedButton.styleFrom(
//         backgroundColor: Colors.blue,
//         padding:
//         const EdgeInsets.symmetric(horizontal: 40.0, vertical: 15.0),
//         shape: RoundedRectangleBorder(
//           borderRadius: BorderRadius.circular(30.0),
//         ),
//       ),
//       child: Text(
//         "Register",
//         style: TextStyle(
//           color: Colors.white,
//           fontSize: 16,
//         ),
//       ),
//     );
//   }
//
//   // Method to build the entire registration form
//   Widget _buildRegistrationForm() {
//     return Form(
//       key: _formKey, // Assign the GlobalKey to the Form
//       child: Column(
//         children: [
//           // Username Field
//           TextFormField(
//             controller: _usernameController,
//             decoration: InputDecoration(
//               prefixIcon: Icon(Icons.person),
//               hintText: "Username",
//               filled: true,
//               fillColor: Colors.white,
//               border: OutlineInputBorder(
//                 borderRadius: BorderRadius.circular(30.0),
//                 borderSide: BorderSide.none,
//               ),
//             ),
//             validator: (value) {
//               if (value == null || value.isEmpty) {
//                 return 'Please enter your username';
//               }
//               return null;
//             },
//           ),
//           const SizedBox(height: 15),
//           // Address Field
//           TextFormField(
//             controller: _addressController,
//             decoration: InputDecoration(
//               prefixIcon: Icon(Icons.home),
//               hintText: "Address",
//               filled: true,
//               fillColor: Colors.white,
//               border: OutlineInputBorder(
//                 borderRadius: BorderRadius.circular(30.0),
//                 borderSide: BorderSide.none,
//               ),
//             ),
//             validator: (value) {
//               if (value == null || value.isEmpty) {
//                 return 'Please enter your address';
//               }
//               return null;
//             },
//           ),
//           const SizedBox(height: 15),
//           // Phone Number Field
//           TextFormField(
//             controller: _phoneController,
//             keyboardType: TextInputType.phone,
//             decoration: InputDecoration(
//               prefixIcon: Icon(Icons.phone),
//               hintText: "Phone Number",
//               filled: true,
//               fillColor: Colors.white,
//               border: OutlineInputBorder(
//                 borderRadius: BorderRadius.circular(30.0),
//                 borderSide: BorderSide.none,
//               ),
//               // Add a separate prefix to ensure '+' is not editable
//               prefix: Text('+'),
//             ),
//             onTap: () {
//               // Prevent cursor from going before '+'
//               if (_phoneController.text.isEmpty) {
//                 _phoneController.text = '+';
//               }
//             },
//             inputFormatters: [
//               // Ensure only digits can be entered after '+'
//               // You can add input formatters as needed
//             ],
//             validator: (value) {
//               if (value == null || value.isEmpty) {
//                 return 'Please enter your phone number';
//               }
//               // Ensure it starts with '+' followed by 10 to 15 digits
//               if (!RegExp(r'^\+\d{10,15}$').hasMatch(value)) {
//                 return 'Please enter a valid phone number with country code';
//               }
//               return null;
//             },
//           ),
//           const SizedBox(height: 15),
//           // Email Field
//           TextFormField(
//             controller: _emailController,
//             keyboardType: TextInputType.emailAddress,
//             decoration: InputDecoration(
//               prefixIcon: Icon(Icons.email),
//               hintText: "Email",
//               filled: true,
//               fillColor: Colors.white,
//               border: OutlineInputBorder(
//                 borderRadius: BorderRadius.circular(30.0),
//                 borderSide: BorderSide.none,
//               ),
//             ),
//             validator: (value) {
//               if (value == null || value.isEmpty) {
//                 return 'Please enter your email';
//               }
//               // Simple email validation
//               if (!RegExp(r'^[^@]+@[^@]+\.[^@]+').hasMatch(value)) {
//                 return 'Please enter a valid email address';
//               }
//               return null;
//             },
//           ),
//           const SizedBox(height: 15),
//           // Country Dropdown
//           _buildCountryDropdown(),
//           const SizedBox(height: 15),
//           // Password Field
//           TextFormField(
//             controller: _passwordController,
//             obscureText: !_isPasswordVisible,
//             decoration: InputDecoration(
//               prefixIcon: Icon(Icons.lock),
//               hintText: "Password",
//               filled: true,
//               fillColor: Colors.white,
//               border: OutlineInputBorder(
//                 borderRadius: BorderRadius.circular(30.0),
//                 borderSide: BorderSide.none,
//               ),
//               suffixIcon: IconButton(
//                 icon: Icon(
//                   _isPasswordVisible
//                       ? Icons.visibility
//                       : Icons.visibility_off,
//                 ),
//                 onPressed: () {
//                   setState(() {
//                     _isPasswordVisible = !_isPasswordVisible;
//                   });
//                 },
//               ),
//             ),
//             validator: (value) {
//               if (value == null || value.isEmpty) {
//                 return 'Please enter your password';
//               }
//               if (value.length < 6) {
//                 return 'Password must be at least 6 characters';
//               }
//               return null;
//             },
//           ),
//           const SizedBox(height: 15),
//           // Re-Type Password Field
//           TextFormField(
//             controller: _reTypePasswordController,
//             obscureText: !_isReTypePasswordVisible,
//             decoration: InputDecoration(
//               prefixIcon: Icon(Icons.lock_outline),
//               hintText: "Re-Type Password",
//               filled: true,
//               fillColor: Colors.white,
//               border: OutlineInputBorder(
//                 borderRadius: BorderRadius.circular(30.0),
//                 borderSide: BorderSide.none,
//               ),
//               suffixIcon: IconButton(
//                 icon: Icon(
//                   _isReTypePasswordVisible
//                       ? Icons.visibility
//                       : Icons.visibility_off,
//                 ),
//                 onPressed: () {
//                   setState(() {
//                     _isReTypePasswordVisible =
//                     !_isReTypePasswordVisible;
//                   });
//                 },
//               ),
//             ),
//             validator: (value) {
//               if (value == null || value.isEmpty) {
//                 return 'Please re-type your password';
//               }
//               if (value != _passwordController.text) {
//                 return 'Passwords do not match';
//               }
//               return null;
//             },
//           ),
//           const SizedBox(height: 15),
//           // Gender Selection
//           _buildGenderSelection(),
//           const SizedBox(height: 20),
//           // Register Button
//           _buildRegisterButton(),
//         ],
//       ),
//     );
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       resizeToAvoidBottomInset:
//       true, // Allow resizing when keyboard appears
//       body: Stack(
//         children: [
//           // Background Image
//           Positioned.fill(
//             child: Image.asset(
//               'assets/register_background.png', // Ensure this image exists in your assets
//               fit: BoxFit.cover,
//             ),
//           ),
//           // Semi-transparent overlay
//           Positioned.fill(
//             child: Container(
//               color: Colors.black.withOpacity(0.3), // Adjust opacity as needed
//             ),
//           ),
//           // Scrollable Content
//           SafeArea(
//             child: LayoutBuilder(
//               builder: (context, constraints) {
//                 return SingleChildScrollView(
//                   child: ConstrainedBox(
//                     constraints: BoxConstraints(
//                       minHeight: constraints.maxHeight,
//                     ),
//                     child: Padding(
//                       padding: const EdgeInsets.all(20.0),
//                       child: Column(
//                         mainAxisAlignment:
//                         MainAxisAlignment.center, // Center vertically
//                         children: [
//                           const SizedBox(height: 40),
//                           // Title
//                           Text(
//                             "Register",
//                             style: TextStyle(
//                               fontSize: 24,
//                               fontWeight: FontWeight.bold,
//                               color: Colors.white,
//                             ),
//                           ),
//                           const SizedBox(height: 30),
//                           // Registration Form Container
//                           Container(
//                             decoration: BoxDecoration(
//                               color: Colors.white.withOpacity(0.3),
//                               borderRadius: BorderRadius.circular(20),
//                             ),
//                             padding: const EdgeInsets.all(20),
//                             child: _buildRegistrationForm(),
//                           ),
//                           const SizedBox(height: 50),
//                         ],
//                       ),
//                     ),
//                   ),
//                 );
//               },
//             ),
//           ),
//         ],
//       ),
//     );
//   }
// }

// import 'package:flutter/material.dart';
// import 'package:flutter/services.dart'; // Import for input formatters
//
// class RegisterPage extends StatefulWidget {
//   @override
//   _RegisterPageState createState() => _RegisterPageState();
// }
//
// class _RegisterPageState extends State<RegisterPage> {
//   String gender = 'Male'; // Default gender
//   bool _isPasswordVisible = false; // Toggle password visibility
//   bool _isReTypePasswordVisible = false; // Toggle re-type password visibility
//
//   // Controllers for the text fields
//   final TextEditingController _usernameController = TextEditingController();
//   final TextEditingController _addressController = TextEditingController();
//
//   // Initialize with '+' to include it in the textbox
//   final TextEditingController _phoneController = TextEditingController(text: '+');
//
//   final TextEditingController _emailController = TextEditingController();
//   final TextEditingController _passwordController = TextEditingController();
//   final TextEditingController _reTypePasswordController =
//   TextEditingController();
//
//   // Country selection state
//   String? _selectedCountry;
//
//   // List of countries (sample list)
//   final List<String> _countries = [
//     "USA",
//     "Canada",
//     "United Kingdom",
//     "Australia",
//     "Germany",
//     "France",
//     "India",
//     "China",
//     "Japan",
//     "Brazil",
//     // Add more countries as needed
//   ];
//
//   // GlobalKey for the form (useful for validation)
//   final _formKey = GlobalKey<FormState>();
//
//   @override
//   void dispose() {
//     // Dispose controllers when the widget is disposed
//     _usernameController.dispose();
//     _addressController.dispose();
//     _phoneController.dispose();
//     _emailController.dispose();
//     _passwordController.dispose();
//     _reTypePasswordController.dispose();
//     super.dispose();
//   }
//
//   // Updated Method to build the Country Dropdown
//   Widget _buildCountryDropdown() {
//     return Padding(
//       padding: const EdgeInsets.symmetric(vertical: 8.0),
//       child: DropdownButtonFormField<String>(
//         value: _selectedCountry,
//         decoration: InputDecoration(
//           prefixIcon: Icon(Icons.flag),
//           labelText: _selectedCountry == null ? "Country" : null, // Conditionally show label
//           floatingLabelBehavior: _selectedCountry == null
//               ? FloatingLabelBehavior.auto
//               : FloatingLabelBehavior.never, // Control floating behavior
//           filled: true,
//           fillColor: Colors.white,
//           border: OutlineInputBorder(
//             borderRadius: BorderRadius.circular(30.0),
//             borderSide: BorderSide.none,
//           ),
//         ),
//         items: _countries
//             .map(
//               (country) => DropdownMenuItem<String>(
//             value: country,
//             child: Text(country),
//           ),
//         )
//             .toList(),
//         onChanged: (value) {
//           setState(() {
//             _selectedCountry = value;
//           });
//         },
//         validator: (value) {
//           if (value == null || value.isEmpty) {
//             return 'Please select your country';
//           }
//           return null;
//         },
//       ),
//     );
//   }
//
//   // Method to build the Gender Selection
//   Widget _buildGenderSelection() {
//     return Padding(
//       padding: const EdgeInsets.symmetric(vertical: 8.0),
//       child: Column(
//         crossAxisAlignment: CrossAxisAlignment.start,
//         children: [
//           Text(
//             "Gender",
//             style: TextStyle(
//                 fontSize: 16, fontWeight: FontWeight.w500, color: Colors.white),
//           ),
//           Row(
//             children: [
//               // Male Radio Button
//               Expanded(
//                 child: RadioListTile<String>(
//                   title: Text("Male", style: TextStyle(color: Colors.white)),
//                   value: "Male",
//                   groupValue: gender,
//                   onChanged: (value) {
//                     setState(() {
//                       gender = value!;
//                     });
//                   },
//                   activeColor: Colors.blue,
//                   contentPadding: EdgeInsets.zero,
//                 ),
//               ),
//               // Female Radio Button
//               Expanded(
//                 child: RadioListTile<String>(
//                   title:
//                   Text("Female", style: TextStyle(color: Colors.white)),
//                   value: "Female",
//                   groupValue: gender,
//                   onChanged: (value) {
//                     setState(() {
//                       gender = value!;
//                     });
//                   },
//                   activeColor: Colors.blue,
//                   contentPadding: EdgeInsets.zero,
//                 ),
//               ),
//             ],
//           ),
//         ],
//       ),
//     );
//   }
//
//   // Method to build the Register Button
//   Widget _buildRegisterButton() {
//     return ElevatedButton(
//       onPressed: () {
//         if (_formKey.currentState!.validate()) {
//           // Implement registration logic here
//           // For example, send data to backend or navigate to another page
//           ScaffoldMessenger.of(context).showSnackBar(
//             SnackBar(content: Text('Registration Successful!')),
//           );
//           Navigator.pushNamed(context, '/login'); // Navigate to login page
//         }
//       },
//       style: ElevatedButton.styleFrom(
//         backgroundColor: Colors.blue,
//         padding:
//         const EdgeInsets.symmetric(horizontal: 40.0, vertical: 15.0),
//         shape: RoundedRectangleBorder(
//           borderRadius: BorderRadius.circular(30.0),
//         ),
//       ),
//       child: Text(
//         "Register",
//         style: TextStyle(
//           color: Colors.white,
//           fontSize: 16,
//         ),
//       ),
//     );
//   }
//
//   // Method to build the entire registration form
//   Widget _buildRegistrationForm() {
//     return Form(
//       key: _formKey, // Assign the GlobalKey to the Form
//       child: Column(
//         children: [
//           // Username Field
//           TextFormField(
//             controller: _usernameController,
//             decoration: InputDecoration(
//               prefixIcon: Icon(Icons.person),
//               hintText: "Username",
//               filled: true,
//               fillColor: Colors.white,
//               border: OutlineInputBorder(
//                 borderRadius: BorderRadius.circular(30.0),
//                 borderSide: BorderSide.none,
//               ),
//             ),
//             validator: (value) {
//               if (value == null || value.isEmpty) {
//                 return 'Please enter your username';
//               }
//               return null;
//             },
//           ),
//           const SizedBox(height: 15),
//           // Address Field
//           TextFormField(
//             controller: _addressController,
//             decoration: InputDecoration(
//               prefixIcon: Icon(Icons.home),
//               hintText: "Address",
//               filled: true,
//               fillColor: Colors.white,
//               border: OutlineInputBorder(
//                 borderRadius: BorderRadius.circular(30.0),
//                 borderSide: BorderSide.none,
//               ),
//             ),
//             validator: (value) {
//               if (value == null || value.isEmpty) {
//                 return 'Please enter your address';
//               }
//               return null;
//             },
//           ),
//           const SizedBox(height: 15),
//           // Phone Number Field
//           TextFormField(
//             controller: _phoneController,
//             keyboardType: TextInputType.phone,
//             decoration: InputDecoration(
//               // Remove the prefixIcon
//               // prefixIcon: Icon(Icons.phone), // Removed as per requirement
//               hintText: "Phone Number",
//               filled: true,
//               fillColor: Colors.white,
//               border: OutlineInputBorder(
//                 borderRadius: BorderRadius.circular(30.0),
//                 borderSide: BorderSide.none,
//               ),
//               // Remove the separate '+' prefix
//               // prefix: Text('+'), // Removed as per requirement
//             ),
//             onTap: () {
//               // Ensure the '+' is present
//               if (!_phoneController.text.startsWith('+')) {
//                 _phoneController.text = '+' + _phoneController.text;
//                 _phoneController.selection = TextSelection.fromPosition(
//                   TextPosition(offset: _phoneController.text.length),
//                 );
//               }
//             },
//             inputFormatters: [
//               // Allow only '+' as the first character and digits thereafter
//               FilteringTextInputFormatter.allow(RegExp(r'^\+?\d*')),
//               // Limit the total length to 16 (1 for '+' and 15 digits)
//               LengthLimitingTextInputFormatter(16),
//             ],
//             validator: (value) {
//               if (value == null || value.isEmpty) {
//                 return 'Please enter your phone number';
//               }
//               // Ensure it starts with '+' followed by 10 to 15 digits
//               if (!RegExp(r'^\+\d{10,15}$').hasMatch(value)) {
//                 return 'Please enter a valid phone number with country code';
//               }
//               return null;
//             },
//           ),
//           const SizedBox(height: 15),
//           // Email Field
//           TextFormField(
//             controller: _emailController,
//             keyboardType: TextInputType.emailAddress,
//             decoration: InputDecoration(
//               prefixIcon: Icon(Icons.email),
//               hintText: "Email",
//               filled: true,
//               fillColor: Colors.white,
//               border: OutlineInputBorder(
//                 borderRadius: BorderRadius.circular(30.0),
//                 borderSide: BorderSide.none,
//               ),
//             ),
//             validator: (value) {
//               if (value == null || value.isEmpty) {
//                 return 'Please enter your email';
//               }
//               // Simple email validation
//               if (!RegExp(r'^[^@]+@[^@]+\.[^@]+').hasMatch(value)) {
//                 return 'Please enter a valid email address';
//               }
//               return null;
//             },
//           ),
//           const SizedBox(height: 15),
//           // Country Dropdown
//           _buildCountryDropdown(),
//           const SizedBox(height: 15),
//           // Password Field
//           TextFormField(
//             controller: _passwordController,
//             obscureText: !_isPasswordVisible,
//             decoration: InputDecoration(
//               prefixIcon: Icon(Icons.lock),
//               hintText: "Password",
//               filled: true,
//               fillColor: Colors.white,
//               border: OutlineInputBorder(
//                 borderRadius: BorderRadius.circular(30.0),
//                 borderSide: BorderSide.none,
//               ),
//               suffixIcon: IconButton(
//                 icon: Icon(
//                   _isPasswordVisible
//                       ? Icons.visibility
//                       : Icons.visibility_off,
//                 ),
//                 onPressed: () {
//                   setState(() {
//                     _isPasswordVisible = !_isPasswordVisible;
//                   });
//                 },
//               ),
//             ),
//             validator: (value) {
//               if (value == null || value.isEmpty) {
//                 return 'Please enter your password';
//               }
//               if (value.length < 6) {
//                 return 'Password must be at least 6 characters';
//               }
//               return null;
//             },
//           ),
//           const SizedBox(height: 15),
//           // Re-Type Password Field
//           TextFormField(
//             controller: _reTypePasswordController,
//             obscureText: !_isReTypePasswordVisible,
//             decoration: InputDecoration(
//               prefixIcon: Icon(Icons.lock_outline),
//               hintText: "Re-Type Password",
//               filled: true,
//               fillColor: Colors.white,
//               border: OutlineInputBorder(
//                 borderRadius: BorderRadius.circular(30.0),
//                 borderSide: BorderSide.none,
//               ),
//               suffixIcon: IconButton(
//                 icon: Icon(
//                   _isReTypePasswordVisible
//                       ? Icons.visibility
//                       : Icons.visibility_off,
//                 ),
//                 onPressed: () {
//                   setState(() {
//                     _isReTypePasswordVisible =
//                     !_isReTypePasswordVisible;
//                   });
//                 },
//               ),
//             ),
//             validator: (value) {
//               if (value == null || value.isEmpty) {
//                 return 'Please re-type your password';
//               }
//               if (value != _passwordController.text) {
//                 return 'Passwords do not match';
//               }
//               return null;
//             },
//           ),
//           const SizedBox(height: 15),
//           // Gender Selection
//           _buildGenderSelection(),
//           const SizedBox(height: 20),
//           // Register Button
//           _buildRegisterButton(),
//         ],
//       ),
//     );
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       resizeToAvoidBottomInset:
//       true, // Allow resizing when keyboard appears
//       body: Stack(
//         children: [
//           // Background Image
//           Positioned.fill(
//             child: Image.asset(
//               'assets/register_background.png', // Ensure this image exists in your assets
//               fit: BoxFit.cover,
//             ),
//           ),
//           // Semi-transparent overlay
//           Positioned.fill(
//             child: Container(
//               color: Colors.black.withOpacity(0.3), // Adjust opacity as needed
//             ),
//           ),
//           // Scrollable Content
//           SafeArea(
//             child: LayoutBuilder(
//               builder: (context, constraints) {
//                 return SingleChildScrollView(
//                   child: ConstrainedBox(
//                     constraints: BoxConstraints(
//                       minHeight: constraints.maxHeight,
//                     ),
//                     child: Padding(
//                       padding: const EdgeInsets.all(20.0),
//                       child: Column(
//                         mainAxisAlignment:
//                         MainAxisAlignment.center, // Center vertically
//                         children: [
//                           const SizedBox(height: 40),
//                           // Title
//                           Text(
//                             "Register",
//                             style: TextStyle(
//                               fontSize: 24,
//                               fontWeight: FontWeight.bold,
//                               color: Colors.white,
//                             ),
//                           ),
//                           const SizedBox(height: 30),
//                           // Registration Form Container
//                           Container(
//                             decoration: BoxDecoration(
//                               color: Colors.white.withOpacity(0.3),
//                               borderRadius: BorderRadius.circular(20),
//                             ),
//                             padding: const EdgeInsets.all(20),
//                             child: _buildRegistrationForm(),
//                           ),
//                           const SizedBox(height: 50),
//                         ],
//                       ),
//                     ),
//                   ),
//                 );
//               },
//             ),
//           ),
//         ],
//       ),
//     );
//   }
// }

import 'package:flutter/material.dart';

class RegisterPage extends StatefulWidget {
  @override
  _RegisterPageState createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  String gender = 'Male'; // Default gender
  bool _isPasswordVisible = false; // Toggle password visibility
  bool _isReTypePasswordVisible = false; // Toggle re-type password visibility

  // Controllers for the text fields
  final TextEditingController _usernameController = TextEditingController();
  final TextEditingController _addressController = TextEditingController();
  final TextEditingController _phoneController = TextEditingController(text: '+'); // Prefill with '+'
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _reTypePasswordController =
  TextEditingController();

  // Country selection state
  String? _selectedCountry;

  // List of countries (sample list)
  final List<String> _countries = [
    "USA",
    "Canada",
    "United Kingdom",
    "Australia",
    "Germany",
    "France",
    "India",
    "China",
    "Japan",
    "Brazil",
    // Add more countries as needed
  ];

  // GlobalKey for the form (useful for validation)
  final _formKey = GlobalKey<FormState>();

  @override
  void dispose() {
    // Dispose controllers when the widget is disposed
    _usernameController.dispose();
    _addressController.dispose();
    _phoneController.dispose();
    _emailController.dispose();
    _passwordController.dispose();
    _reTypePasswordController.dispose();
    super.dispose();
  }

  // Updated Method to build the Country Dropdown
  Widget _buildCountryDropdown() {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: DropdownButtonFormField<String>(
        value: _selectedCountry,
        decoration: InputDecoration(
          prefixIcon: Icon(Icons.flag),
          labelText: _selectedCountry == null ? "Country" : null, // Conditionally show label
          floatingLabelBehavior: _selectedCountry == null
              ? FloatingLabelBehavior.auto
              : FloatingLabelBehavior.never, // Control floating behavior
          filled: true,
          fillColor: Colors.white,
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(30.0),
            borderSide: BorderSide.none,
          ),
        ),
        items: _countries
            .map(
              (country) => DropdownMenuItem<String>(
            value: country,
            child: Text(country),
          ),
        )
            .toList(),
        onChanged: (value) {
          setState(() {
            _selectedCountry = value;
          });
        },
        validator: (value) {
          if (value == null || value.isEmpty) {
            return 'Please select your country';
          }
          return null;
        },
      ),
    );
  }

  // Method to build the Gender Selection
  Widget _buildGenderSelection() {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            "Gender",
            style: TextStyle(
                fontSize: 16, fontWeight: FontWeight.w500, color: Colors.white),
          ),
          Row(
            children: [
              // Male Radio Button
              Expanded(
                child: RadioListTile<String>(
                  title: Text("Male", style: TextStyle(color: Colors.white)),
                  value: "Male",
                  groupValue: gender,
                  onChanged: (value) {
                    setState(() {
                      gender = value!;
                    });
                  },
                  activeColor: Colors.blue,
                  contentPadding: EdgeInsets.zero,
                ),
              ),
              // Female Radio Button
              Expanded(
                child: RadioListTile<String>(
                  title:
                  Text("Female", style: TextStyle(color: Colors.white)),
                  value: "Female",
                  groupValue: gender,
                  onChanged: (value) {
                    setState(() {
                      gender = value!;
                    });
                  },
                  activeColor: Colors.blue,
                  contentPadding: EdgeInsets.zero,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  // Method to build the Register Button
  Widget _buildRegisterButton() {
    return ElevatedButton(
      onPressed: () {
        if (_formKey.currentState!.validate()) {
          // Implement registration logic here
          // For example, send data to backend or navigate to another page
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(content: Text('Registration Successful!')),
          );
          Navigator.pushNamed(context, '/login'); // Navigate to login page
        }
      },
      style: ElevatedButton.styleFrom(
        backgroundColor: Colors.blue,
        padding:
        const EdgeInsets.symmetric(horizontal: 40.0, vertical: 15.0),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(30.0),
        ),
      ),
      child: Text(
        "Register",
        style: TextStyle(
          color: Colors.white,
          fontSize: 16,
        ),
      ),
    );
  }

  // Method to build the entire registration form
  Widget _buildRegistrationForm() {
    return Form(
      key: _formKey, // Assign the GlobalKey to the Form
      child: Column(
        children: [
          // Username Field
          TextFormField(
            controller: _usernameController,
            decoration: InputDecoration(
              prefixIcon: Icon(Icons.person),
              hintText: "Username",
              filled: true,
              fillColor: Colors.white,
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(30.0),
                borderSide: BorderSide.none,
              ),
            ),
            validator: (value) {
              if (value == null || value.isEmpty) {
                return 'Please enter your username';
              }
              return null;
            },
          ),
          const SizedBox(height: 15),
          // Address Field
          TextFormField(
            controller: _addressController,
            decoration: InputDecoration(
              prefixIcon: Icon(Icons.home),
              hintText: "Address",
              filled: true,
              fillColor: Colors.white,
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(30.0),
                borderSide: BorderSide.none,
              ),
            ),
            validator: (value) {
              if (value == null || value.isEmpty) {
                return 'Please enter your address';
              }
              return null;
            },
          ),
          const SizedBox(height: 15),
          // Phone Number Field
          TextFormField(
            controller: _phoneController,
            keyboardType: TextInputType.phone,
            decoration: InputDecoration(
              prefixIcon: Icon(Icons.phone),
              hintText: "Phone Number",
              filled: true,
              fillColor: Colors.white,
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(30.0),
                borderSide: BorderSide.none,
              ),
              // Removed the separate prefix: Text('+'),
            ),
            onTap: () {
              // Ensure the '+' symbol is present at the start
              if (_phoneController.text.isEmpty) {
                _phoneController.text = '+';
                _phoneController.selection = TextSelection.fromPosition(
                  TextPosition(offset: _phoneController.text.length),
                );
              }
            },
            inputFormatters: [
              // Ensure only digits can be entered after '+'
              // You can add input formatters as needed
            ],
            validator: (value) {
              if (value == null || value.isEmpty) {
                return 'Please enter your phone number';
              }
              // Ensure it starts with '+' followed by 10 to 15 digits
              if (!RegExp(r'^\+\d{10,15}$').hasMatch(value)) {
                return 'Please enter a valid phone number with country code';
              }
              return null;
            },
          ),
          const SizedBox(height: 15),
          // Email Field
          TextFormField(
            controller: _emailController,
            keyboardType: TextInputType.emailAddress,
            decoration: InputDecoration(
              prefixIcon: Icon(Icons.email),
              hintText: "Email",
              filled: true,
              fillColor: Colors.white,
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(30.0),
                borderSide: BorderSide.none,
              ),
            ),
            validator: (value) {
              if (value == null || value.isEmpty) {
                return 'Please enter your email';
              }
              // Simple email validation
              if (!RegExp(r'^[^@]+@[^@]+\.[^@]+').hasMatch(value)) {
                return 'Please enter a valid email address';
              }
              return null;
            },
          ),
          const SizedBox(height: 15),
          // Country Dropdown
          _buildCountryDropdown(),
          const SizedBox(height: 15),
          // Password Field
          TextFormField(
            controller: _passwordController,
            obscureText: !_isPasswordVisible,
            decoration: InputDecoration(
              prefixIcon: Icon(Icons.lock),
              hintText: "Password",
              filled: true,
              fillColor: Colors.white,
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(30.0),
                borderSide: BorderSide.none,
              ),
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
            validator: (value) {
              if (value == null || value.isEmpty) {
                return 'Please enter your password';
              }
              if (value.length < 6) {
                return 'Password must be at least 6 characters';
              }
              return null;
            },
          ),
          const SizedBox(height: 15),
          // Re-Type Password Field
          TextFormField(
            controller: _reTypePasswordController,
            obscureText: !_isReTypePasswordVisible,
            decoration: InputDecoration(
              prefixIcon: Icon(Icons.lock_outline),
              hintText: "Re-Type Password",
              filled: true,
              fillColor: Colors.white,
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(30.0),
                borderSide: BorderSide.none,
              ),
              suffixIcon: IconButton(
                icon: Icon(
                  _isReTypePasswordVisible
                      ? Icons.visibility
                      : Icons.visibility_off,
                ),
                onPressed: () {
                  setState(() {
                    _isReTypePasswordVisible =
                    !_isReTypePasswordVisible;
                  });
                },
              ),
            ),
            validator: (value) {
              if (value == null || value.isEmpty) {
                return 'Please re-type your password';
              }
              if (value != _passwordController.text) {
                return 'Passwords do not match';
              }
              return null;
            },
          ),
          const SizedBox(height: 15),
          // Gender Selection
          _buildGenderSelection(),
          const SizedBox(height: 20),
          // Register Button
          _buildRegisterButton(),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset:
      true, // Allow resizing when keyboard appears
      body: Stack(
        children: [
          // Background Image
          Positioned.fill(
            child: Image.asset(
              'assets/register_background.png', // Ensure this image exists in your assets
              fit: BoxFit.cover,
            ),
          ),
          // Semi-transparent overlay
          Positioned.fill(
            child: Container(
              color: Colors.black.withOpacity(0.3), // Adjust opacity as needed
            ),
          ),
          // Scrollable Content
          SafeArea(
            child: LayoutBuilder(
              builder: (context, constraints) {
                return SingleChildScrollView(
                  child: ConstrainedBox(
                    constraints: BoxConstraints(
                      minHeight: constraints.maxHeight,
                    ),
                    child: Padding(
                      padding: const EdgeInsets.all(20.0),
                      child: Column(
                        mainAxisAlignment:
                        MainAxisAlignment.center, // Center vertically
                        children: [
                          const SizedBox(height: 40),
                          // Title
                          Text(
                            "Register",
                            style: TextStyle(
                              fontSize: 24,
                              fontWeight: FontWeight.bold,
                              color: Colors.white,
                            ),
                          ),
                          const SizedBox(height: 30),
                          // Registration Form Container
                          Container(
                            decoration: BoxDecoration(
                              color: Colors.white.withOpacity(0.3),
                              borderRadius: BorderRadius.circular(20),
                            ),
                            padding: const EdgeInsets.all(20),
                            child: _buildRegistrationForm(),
                          ),
                          const SizedBox(height: 50),
                        ],
                      ),
                    ),
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}



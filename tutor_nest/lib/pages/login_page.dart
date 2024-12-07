



// import 'package:flutter/material.dart';
//
// class LoginPage extends StatefulWidget {
//   @override
//   _LoginPageState createState() => _LoginPageState();
// }
//
// class _LoginPageState extends State<LoginPage> {
//   bool rememberMe = false;
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: Stack(
//         children: [
//           // Background with image
//           Container(
//             decoration: BoxDecoration(
//               image: DecorationImage(
//                 image: AssetImage('assets/login_background.png'), // Replace with your background image
//                 fit: BoxFit.cover,
//               ),
//             ),
//           ),
//           // Main content
//           Column(
//             mainAxisAlignment: MainAxisAlignment.center,
//             children: [
//               Spacer(),
//               // Logo
//               Image.asset(
//                 'assets/education_logo.png', // Replace with your logo asset
//                 height: 100,
//               ),
//               const SizedBox(height: 20),
//               // Welcome Text
//               Text(
//                 "Welcome back, User",
//                 style: TextStyle(
//                   fontSize: 24,
//                   fontWeight: FontWeight.bold,
//                   color: Colors.black,
//                 ),
//               ),
//               const SizedBox(height: 30),
//               // Semi-transparent background container
//               Container(
//                 margin: EdgeInsets.symmetric(horizontal: 20),
//                 padding: EdgeInsets.symmetric(vertical: 20, horizontal: 20),
//                 decoration: BoxDecoration(
//                   color: Colors.black.withOpacity(0.45), // Semi-transparent black background
//                   borderRadius: BorderRadius.circular(20),
//                 ),
//                 child: Column(
//                   children: [
//                     // Username TextField
//                     TextField(
//                       decoration: InputDecoration(
//                         prefixIcon: Icon(Icons.person, color: Colors.white),
//                         hintText: "Username",
//                         hintStyle: TextStyle(color: Colors.white70),
//                         filled: true,
//                         fillColor: Colors.white.withOpacity(0.5),
//                         border: OutlineInputBorder(
//                           borderRadius: BorderRadius.circular(30.0),
//                           borderSide: BorderSide.none,
//                         ),
//                       ),
//                       style: TextStyle(color: Colors.white),
//                     ),
//                     const SizedBox(height: 15),
//                     // Password TextField
//                     TextField(
//                       obscureText: true,
//                       decoration: InputDecoration(
//                         prefixIcon: Icon(Icons.lock, color: Colors.white),
//                         hintText: "Password",
//                         hintStyle: TextStyle(color: Colors.white70),
//                         filled: true,
//                         fillColor: Colors.white.withOpacity(0.5),
//                         border: OutlineInputBorder(
//                           borderRadius: BorderRadius.circular(30.0),
//                           borderSide: BorderSide.none,
//                         ),
//                       ),
//                       style: TextStyle(color: Colors.white),
//                     ),
//                     const SizedBox(height: 10),
//                     // Remember Me and Forgot Password
//                     Row(
//                       mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                       children: [
//                         Row(
//                           children: [
//                             Checkbox(
//                               value: rememberMe,
//                               onChanged: (bool? value) {
//                                 setState(() {
//                                   rememberMe = value!;
//                                 });
//                               },
//                               checkColor: Colors.black,
//                               fillColor: MaterialStateProperty.all(Colors.white),
//                             ),
//                             Text("Remember me", style: TextStyle(color: Colors.white)),
//                           ],
//                         ),
//                         GestureDetector(
//                           onTap: () {
//                             Navigator.pushNamed(context, '/forgot-password');
//                           },
//                           child: Text(
//                             "Forgot Password?",
//                             style: TextStyle(
//                               color: Colors.blue,
//                               decoration: TextDecoration.underline,
//                             ),
//                           ),
//                         ),
//                       ],
//                     ),
//                     const SizedBox(height: 20),
//                     // Login Button
//                     ElevatedButton(
//                       onPressed: () {
//                         // Handle login logic here
//                       },
//                       style: ElevatedButton.styleFrom(
//                         backgroundColor: Colors.blue,
//                         padding: const EdgeInsets.symmetric(horizontal: 40.0, vertical: 15.0),
//                         shape: RoundedRectangleBorder(
//                           borderRadius: BorderRadius.circular(30.0),
//                         ),
//                       ),
//                       child: Text(
//                         "Log in",
//                         style: TextStyle(
//                           color: Colors.white,
//                           fontSize: 16,
//                         ),
//                       ),
//                     ),
//                     const SizedBox(height: 10),
//                     // OR Login With
//                     Text("or login with", style: TextStyle(color: Colors.white)),
//                     const SizedBox(height: 10),
//                     // Social Media Icons
//                     Row(
//                       mainAxisAlignment: MainAxisAlignment.center,
//                       children: [
//                         IconButton(
//                           icon: Image.asset('assets/google_icon.png'), // Replace with Google icon asset
//                           onPressed: () {},
//                         ),
//                         const SizedBox(width: 10),
//                         IconButton(
//                           icon: Image.asset('assets/twitter_icon.png'), // Replace with Twitter icon asset
//                           onPressed: () {},
//                         ),
//                         const SizedBox(width: 10),
//                         IconButton(
//                           icon: Image.asset('assets/facebook_icon.png'), // Replace with Facebook icon asset
//                           onPressed: () {},
//                         ),
//                       ],
//                     ),
//                     Row(
//                       mainAxisAlignment: MainAxisAlignment.center,
//                       children: [
//                         Text("Don't have an account? ", style: TextStyle(color: Colors.black)),
//                         GestureDetector(
//                           onTap: () {
//                             Navigator.pushNamed(context, '/signup');
//                           },
//                           child: Text(
//                             "Sign up",
//                             style: TextStyle(
//                               color: Colors.blue,
//                               fontWeight: FontWeight.bold,
//                               decoration: TextDecoration.underline,
//                             ),
//                           ),
//                         ),
//                       ],
//                     ),
//                     Spacer(),
//
//
//
//                   ],
//                 ),
//               ),
//               // const SizedBox(height: 20),
//               // // Sign-up Text
//
//             ],
//           ),
//         ],
//       ),
//     );
//   }
// }

// import 'package:flutter/material.dart';
//
// class LoginPage extends StatefulWidget {
//   @override
//   _LoginPageState createState() => _LoginPageState();
// }
//
// class _LoginPageState extends State<LoginPage> {
//   bool rememberMe = false;
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: Stack(
//         children: [
//           // Background with image
//           Container(
//             decoration: BoxDecoration(
//               image: DecorationImage(
//                 image: AssetImage('assets/login_background.png'), // Replace with your background image
//                 fit: BoxFit.cover,
//               ),
//             ),
//           ),
//           // Main content
//           Column(
//             mainAxisAlignment: MainAxisAlignment.center,
//             children: [
//               Spacer(),
//               // Logo
//               Image.asset(
//                 'assets/education_logo.png', // Replace with your logo asset
//                 height: 100,
//               ),
//               const SizedBox(height: 20),
//               // Welcome Text
//               Text(
//                 "Welcome back, User",
//                 style: TextStyle(
//                   fontSize: 24,
//                   fontWeight: FontWeight.bold,
//                   color: Colors.black,
//                 ),
//               ),
//               const SizedBox(height: 30),
//               // Semi-transparent background container
//               Container(
//                 margin: EdgeInsets.symmetric(horizontal: 20),
//                 padding: EdgeInsets.fromLTRB(20, 20, 20, 30), // Adjust padding to add space below
//                 decoration: BoxDecoration(
//                   color: Colors.black.withOpacity(0.45), // Semi-transparent black background
//                   borderRadius: BorderRadius.circular(20),
//                 ),
//                 child: Column(
//                   children: [
//                     // Username TextField
//                     TextField(
//                       decoration: InputDecoration(
//                         prefixIcon: Icon(Icons.person, color: Colors.white),
//                         hintText: "Username",
//                         hintStyle: TextStyle(color: Colors.white70),
//                         filled: true,
//                         fillColor: Colors.white.withOpacity(0.5),
//                         border: OutlineInputBorder(
//                           borderRadius: BorderRadius.circular(30.0),
//                           borderSide: BorderSide.none,
//                         ),
//                       ),
//                       style: TextStyle(color: Colors.white),
//                     ),
//                     const SizedBox(height: 15),
//                     // Password TextField
//                     TextField(
//                       obscureText: true,
//                       decoration: InputDecoration(
//                         prefixIcon: Icon(Icons.lock, color: Colors.white),
//                         hintText: "Password",
//                         hintStyle: TextStyle(color: Colors.white70),
//                         filled: true,
//                         fillColor: Colors.white.withOpacity(0.5),
//                         border: OutlineInputBorder(
//                           borderRadius: BorderRadius.circular(30.0),
//                           borderSide: BorderSide.none,
//                         ),
//                       ),
//                       style: TextStyle(color: Colors.white),
//                     ),
//                     const SizedBox(height: 10),
//                     // Remember Me and Forgot Password
//                     Row(
//                       mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                       children: [
//                         Row(
//                           children: [
//                             Checkbox(
//                               value: rememberMe,
//                               onChanged: (bool? value) {
//                                 setState(() {
//                                   rememberMe = value!;
//                                 });
//                               },
//                               checkColor: Colors.black,
//                               fillColor: MaterialStateProperty.all(Colors.white),
//                             ),
//                             Text("Remember me", style: TextStyle(color: Colors.white)),
//                           ],
//                         ),
//                         GestureDetector(
//                           onTap: () {
//                             Navigator.pushNamed(context, '/forgot-password');
//                           },
//                           child: Text(
//                             "Forgot Password?",
//                             style: TextStyle(
//                               color: Colors.blue,
//                               decoration: TextDecoration.underline,
//                             ),
//                           ),
//                         ),
//                       ],
//                     ),
//                     const SizedBox(height: 20),
//                     // Login Button
//                     ElevatedButton(
//                       onPressed: () {
//                         // Handle login logic here
//                       },
//                       style: ElevatedButton.styleFrom(
//                         backgroundColor: Colors.blue,
//                         padding: const EdgeInsets.symmetric(horizontal: 40.0, vertical: 15.0),
//                         shape: RoundedRectangleBorder(
//                           borderRadius: BorderRadius.circular(30.0),
//                         ),
//                       ),
//                       child: Text(
//                         "Log in",
//                         style: TextStyle(
//                           color: Colors.white,
//                           fontSize: 16,
//                         ),
//                       ),
//                     ),
//                     const SizedBox(height: 10),
//                     // OR Login With
//                     Text("or login with", style: TextStyle(color: Colors.white)),
//                     const SizedBox(height: 10),
//                     // Social Media Icons
//                     Row(
//                       mainAxisAlignment: MainAxisAlignment.center,
//                       children: [
//                         IconButton(
//                           icon: Image.asset('assets/google_icon.png'), // Replace with Google icon asset
//                           onPressed: () {},
//                         ),
//                         const SizedBox(width: 10),
//                         IconButton(
//                           icon: Image.asset('assets/twitter_icon.png'), // Replace with Twitter icon asset
//                           onPressed: () {},
//                         ),
//                         const SizedBox(width: 10),
//                         IconButton(
//                           icon: Image.asset('assets/facebook_icon.png'), // Replace with Facebook icon asset
//                           onPressed: () {},
//                         ),
//                       ],
//                     ),
//                     const SizedBox(height: 10),
//                     Row(
//                       mainAxisAlignment: MainAxisAlignment.center,
//                       children: [
//                         Text("Don't have an account? ", style: TextStyle(color: Colors.white)),
//                         GestureDetector(
//                           onTap: () {
//                             Navigator.pushNamed(context, '/signup');
//                           },
//                           child: Text(
//                             "Sign up",
//                             style: TextStyle(
//                               color: Colors.blue,
//                               fontWeight: FontWeight.bold,
//                               decoration: TextDecoration.underline,
//                             ),
//                           ),
//                         ),
//                       ],
//                     ),
//                   ],
//                 ),
//               ),
//               Spacer(), // Ensures proper spacing for the overall page
//             ],
//           ),
//         ],
//       ),
//     );
//   }
// }

// import 'package:flutter/material.dart';
//
// class LoginPage extends StatefulWidget {
//   @override
//   _LoginPageState createState() => _LoginPageState();
// }
//
// class _LoginPageState extends State<LoginPage> {
//   bool rememberMe = false;
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       resizeToAvoidBottomInset: true, // Allows the page to resize when the keyboard appears
//       body: Stack(
//         children: [
//           // Background with image
//           Container(
//             decoration: BoxDecoration(
//               image: DecorationImage(
//                 image: AssetImage('assets/login_background.png'), // Replace with your background image
//                 fit: BoxFit.cover,
//               ),
//             ),
//           ),
//           // Scrollable content
//           SingleChildScrollView(
//             child: Column(
//               mainAxisAlignment: MainAxisAlignment.center,
//               children: [
//                 SizedBox(height: 100), // Space from top
//                 // Logo
//                 Image.asset(
//                   'assets/education_logo.png', // Replace with your logo asset
//                   height: 100,
//                 ),
//                 const SizedBox(height: 20),
//                 // Welcome Text
//                 Text(
//                   "Welcome back, User",
//                   style: TextStyle(
//                     fontSize: 24,
//                     fontWeight: FontWeight.bold,
//                     color: Colors.black,
//                   ),
//                 ),
//                 const SizedBox(height: 30),
//                 // Semi-transparent background container
//                 Container(
//                   margin: EdgeInsets.symmetric(horizontal: 20),
//                   padding: EdgeInsets.fromLTRB(20, 20, 20, 30), // Adjust padding to add space below
//                   decoration: BoxDecoration(
//                     color: Colors.black.withOpacity(0.45), // Semi-transparent black background
//                     borderRadius: BorderRadius.circular(20),
//                   ),
//                   child: Column(
//                     children: [
//                       // Username TextField
//                       TextField(
//                         decoration: InputDecoration(
//                           prefixIcon: Icon(Icons.person, color: Colors.white),
//                           hintText: "Username",
//                           hintStyle: TextStyle(color: Colors.white70),
//                           filled: true,
//                           fillColor: Colors.white.withOpacity(0.5),
//                           border: OutlineInputBorder(
//                             borderRadius: BorderRadius.circular(30.0),
//                             borderSide: BorderSide.none,
//                           ),
//                         ),
//                         style: TextStyle(color: Colors.white),
//                       ),
//                       const SizedBox(height: 15),
//                       // Password TextField
//                       TextField(
//                         obscureText: true,
//                         decoration: InputDecoration(
//                           prefixIcon: Icon(Icons.lock, color: Colors.white),
//                           hintText: "Password",
//                           hintStyle: TextStyle(color: Colors.white70),
//                           filled: true,
//                           fillColor: Colors.white.withOpacity(0.5),
//                           border: OutlineInputBorder(
//                             borderRadius: BorderRadius.circular(30.0),
//                             borderSide: BorderSide.none,
//                           ),
//                         ),
//                         style: TextStyle(color: Colors.white),
//                       ),
//                       const SizedBox(height: 10),
//                       // Remember Me and Forgot Password
//                       Row(
//                         mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                         children: [
//                           Row(
//                             children: [
//                               Checkbox(
//                                 value: rememberMe,
//                                 onChanged: (bool? value) {
//                                   setState(() {
//                                     rememberMe = value!;
//                                   });
//                                 },
//                                 checkColor: Colors.black,
//                                 fillColor: MaterialStateProperty.all(Colors.white),
//                               ),
//                               Text("Remember me", style: TextStyle(color: Colors.white)),
//                             ],
//                           ),
//                           GestureDetector(
//                             onTap: () {
//                               Navigator.pushNamed(context, '/forgot-password');
//                             },
//                             child: Text(
//                               "Forgot Password?",
//                               style: TextStyle(
//                                 color: Colors.blue,
//                                 decoration: TextDecoration.underline,
//                               ),
//                             ),
//                           ),
//                         ],
//                       ),
//                       const SizedBox(height: 20),
//                       // Login Button
//                       ElevatedButton(
//                         onPressed: () {
//                           // Handle login logic here
//                         },
//                         style: ElevatedButton.styleFrom(
//                           backgroundColor: Colors.blue,
//                           padding: const EdgeInsets.symmetric(horizontal: 40.0, vertical: 15.0),
//                           shape: RoundedRectangleBorder(
//                             borderRadius: BorderRadius.circular(30.0),
//                           ),
//                         ),
//                         child: Text(
//                           "Log in",
//                           style: TextStyle(
//                             color: Colors.white,
//                             fontSize: 16,
//                           ),
//                         ),
//                       ),
//                       const SizedBox(height: 10),
//                       // OR Login With
//                       Text("or login with", style: TextStyle(color: Colors.white)),
//                       const SizedBox(height: 10),
//                       // Social Media Icons
//                       Row(
//                         mainAxisAlignment: MainAxisAlignment.center,
//                         children: [
//                           IconButton(
//                             icon: Image.asset('assets/google_icon.png'), // Replace with Google icon asset
//                             onPressed: () {},
//                           ),
//                           const SizedBox(width: 10),
//                           IconButton(
//                             icon: Image.asset('assets/twitter_icon.png'), // Replace with Twitter icon asset
//                             onPressed: () {},
//                           ),
//                           const SizedBox(width: 10),
//                           IconButton(
//                             icon: Image.asset('assets/facebook_icon.png'), // Replace with Facebook icon asset
//                             onPressed: () {},
//                           ),
//                         ],
//                       ),
//                       const SizedBox(height: 10),
//                       Row(
//                         mainAxisAlignment: MainAxisAlignment.center,
//                         children: [
//                           Text("Don't have an account? ", style: TextStyle(color: Colors.white)),
//                           GestureDetector(
//                             onTap: () {
//                               Navigator.pushNamed(context, '/signup');
//                             },
//                             child: Text(
//                               "Sign up",
//                               style: TextStyle(
//                                 color: Colors.blue,
//                                 fontWeight: FontWeight.bold,
//                                 decoration: TextDecoration.underline,
//                               ),
//                             ),
//                           ),
//                         ],
//                       ),
//                     ],
//                   ),
//                 ),
//                 SizedBox(height: 50), // Space at the bottom
//               ],
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
// class LoginPage extends StatefulWidget {
//   @override
//   _LoginPageState createState() => _LoginPageState();
// }
//
// class _LoginPageState extends State<LoginPage> {
//   bool rememberMe = false;
//   bool _isPasswordVisible = false; // Toggle password visibility
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       resizeToAvoidBottomInset: true, // Allows the page to resize when the keyboard appears
//       body: Stack(
//         children: [
//           // Background with image
//           Container(
//             decoration: BoxDecoration(
//               image: DecorationImage(
//                 image: AssetImage('assets/login_background.png'), // Replace with your background image
//                 fit: BoxFit.cover,
//               ),
//             ),
//           ),
//           // Scrollable content
//           SingleChildScrollView(
//             child: Column(
//               mainAxisAlignment: MainAxisAlignment.center,
//               children: [
//                 SizedBox(height: 100), // Space from top
//                 // Logo
//                 Image.asset(
//                   'assets/education_logo.png', // Replace with your logo asset
//                   height: 100,
//                 ),
//                 const SizedBox(height: 20),
//                 // Welcome Text
//                 Text(
//                   "Welcome back, User",
//                   style: TextStyle(
//                     fontSize: 24,
//                     fontWeight: FontWeight.bold,
//                     color: Colors.black,
//                   ),
//                 ),
//                 const SizedBox(height: 30),
//                 // Semi-transparent background container
//                 Container(
//                   margin: EdgeInsets.symmetric(horizontal: 20),
//                   padding: EdgeInsets.fromLTRB(20, 20, 20, 30), // Adjust padding to add space below
//                   decoration: BoxDecoration(
//                     color: Colors.black.withOpacity(0.45), // Semi-transparent black background
//                     borderRadius: BorderRadius.circular(20),
//                   ),
//                   child: Column(
//                     children: [
//                       // Username TextField
//                       TextField(
//                         decoration: InputDecoration(
//                           prefixIcon: Icon(Icons.person, color: Colors.white),
//                           hintText: "Username",
//                           hintStyle: TextStyle(color: Colors.white70),
//                           filled: true,
//                           fillColor: Colors.white.withOpacity(0.5),
//                           border: OutlineInputBorder(
//                             borderRadius: BorderRadius.circular(30.0),
//                             borderSide: BorderSide.none,
//                           ),
//                         ),
//                         style: TextStyle(color: Colors.white),
//                       ),
//                       const SizedBox(height: 15),
//                       // Password TextField with show/hide icon
//                       TextField(
//                         obscureText: !_isPasswordVisible,
//                         decoration: InputDecoration(
//                           prefixIcon: Icon(Icons.lock, color: Colors.white),
//                           hintText: "Password",
//                           hintStyle: TextStyle(color: Colors.white70),
//                           filled: true,
//                           fillColor: Colors.white.withOpacity(0.5),
//                           border: OutlineInputBorder(
//                             borderRadius: BorderRadius.circular(30.0),
//                             borderSide: BorderSide.none,
//                           ),
//                           suffixIcon: IconButton(
//                             icon: Icon(
//                               _isPasswordVisible
//                                   ? Icons.visibility
//                                   : Icons.visibility_off,
//                               color: Colors.white,
//                             ),
//                             onPressed: () {
//                               setState(() {
//                                 _isPasswordVisible = !_isPasswordVisible;
//                               });
//                             },
//                           ),
//                         ),
//                         style: TextStyle(color: Colors.white),
//                       ),
//                       const SizedBox(height: 10),
//                       // Remember Me and Forgot Password
//                       Row(
//                         mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                         children: [
//                           Row(
//                             children: [
//                               Checkbox(
//                                 value: rememberMe,
//                                 onChanged: (bool? value) {
//                                   setState(() {
//                                     rememberMe = value!;
//                                   });
//                                 },
//                                 checkColor: Colors.black,
//                                 fillColor: MaterialStateProperty.all(Colors.white),
//                               ),
//                               Text("Remember me", style: TextStyle(color: Colors.white)),
//                             ],
//                           ),
//                           GestureDetector(
//                             onTap: () {
//                               Navigator.pushNamed(context, '/forgot-password');
//                             },
//                             child: Text(
//                               "Forgot Password?",
//                               style: TextStyle(
//                                 color: Colors.blue,
//                                 decoration: TextDecoration.underline,
//                               ),
//                             ),
//                           ),
//                         ],
//                       ),
//                       const SizedBox(height: 20),
//                       // Login Button
//                       ElevatedButton(
//                         onPressed: () {
//                           // Handle login logic here
//                         },
//                         style: ElevatedButton.styleFrom(
//                           backgroundColor: Colors.blue,
//                           padding: const EdgeInsets.symmetric(horizontal: 40.0, vertical: 15.0),
//                           shape: RoundedRectangleBorder(
//                             borderRadius: BorderRadius.circular(30.0),
//                           ),
//                         ),
//                         child: Text(
//                           "Log in",
//                           style: TextStyle(
//                             color: Colors.white,
//                             fontSize: 16,
//                           ),
//                         ),
//                       ),
//                       const SizedBox(height: 10),
//                       // OR Login With
//                       Text("or login with", style: TextStyle(color: Colors.white)),
//                       const SizedBox(height: 10),
//                       // Social Media Icons
//                       Row(
//                         mainAxisAlignment: MainAxisAlignment.center,
//                         children: [
//                           IconButton(
//                             icon: Image.asset('assets/google_icon.png'), // Replace with Google icon asset
//                             onPressed: () {},
//                           ),
//                           const SizedBox(width: 10),
//                           IconButton(
//                             icon: Image.asset('assets/twitter_icon.png'), // Replace with Twitter icon asset
//                             onPressed: () {},
//                           ),
//                           const SizedBox(width: 10),
//                           IconButton(
//                             icon: Image.asset('assets/facebook_icon.png'), // Replace with Facebook icon asset
//                             onPressed: () {},
//                           ),
//                         ],
//                       ),
//                       const SizedBox(height: 10),
//                       Row(
//                         mainAxisAlignment: MainAxisAlignment.center,
//                         children: [
//                           Text("Don't have an account? ", style: TextStyle(color: Colors.white)),
//                           GestureDetector(
//                             onTap: () {
//                               Navigator.pushNamed(context, '/signup');
//                             },
//                             child: Text(
//                               "Sign up",
//                               style: TextStyle(
//                                 color: Colors.blue,
//                                 fontWeight: FontWeight.bold,
//                                 decoration: TextDecoration.underline,
//                               ),
//                             ),
//                           ),
//                         ],
//                       ),
//                     ],
//                   ),
//                 ),
//                 SizedBox(height: 50), // Space at the bottom
//               ],
//             ),
//           ),
//         ],
//       ),
//     );
//   }
// }


// import 'package:flutter/material.dart';
//
// class LoginPage extends StatefulWidget {
//   @override
//   _LoginPageState createState() => _LoginPageState();
// }
//
// class _LoginPageState extends State<LoginPage> {
//   bool rememberMe = false;
//   bool _isPasswordVisible = false; // Toggle password visibility
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       resizeToAvoidBottomInset: false, // Allows the page to resize when the keyboard appears
//       body: Stack(
//         children: [
//           // Background with image
//           Container(
//             decoration: BoxDecoration(
//               image: DecorationImage(
//                 image: AssetImage('assets/login_background.png'), // Replace with your background image
//                 fit: BoxFit.cover,
//               ),
//             ),
//           ),
//           // Scrollable content
//           SingleChildScrollView(
//             child: Column(
//               mainAxisAlignment: MainAxisAlignment.center,
//               children: [
//                 SizedBox(height: 100), // Space from top
//                 // Logo
//                 Image.asset(
//                   'assets/education_logo.png', // Replace with your logo asset
//                   height: 100,
//                 ),
//                 const SizedBox(height: 20),
//                 // Welcome Text
//                 Text(
//                   "Welcome back, User",
//                   style: TextStyle(
//                     fontSize: 24,
//                     fontWeight: FontWeight.bold,
//                     color: Colors.black,
//                   ),
//                 ),
//                 const SizedBox(height: 30),
//                 // Semi-transparent background container
//                 Container(
//                   margin: EdgeInsets.symmetric(horizontal: 20),
//                   padding: EdgeInsets.fromLTRB(20, 20, 20, 30), // Adjust padding to add space below
//                   decoration: BoxDecoration(
//                     color: Colors.black.withOpacity(0.45), // Semi-transparent black background
//                     borderRadius: BorderRadius.circular(20),
//                   ),
//                   child: Column(
//                     children: [
//                       // Username TextField
//                       TextField(
//                         decoration: InputDecoration(
//                           prefixIcon: Icon(Icons.person, color: Colors.white),
//                           hintText: "Username",
//                           hintStyle: TextStyle(color: Colors.white70),
//                           filled: true,
//                           fillColor: Colors.white.withOpacity(0.5),
//                           border: OutlineInputBorder(
//                             borderRadius: BorderRadius.circular(30.0),
//                             borderSide: BorderSide.none,
//                           ),
//                         ),
//                         style: TextStyle(color: Colors.white),
//                       ),
//                       const SizedBox(height: 15),
//                       // Password TextField with show/hide icon
//                       TextField(
//                         obscureText: !_isPasswordVisible,
//                         decoration: InputDecoration(
//                           prefixIcon: Icon(Icons.lock, color: Colors.white),
//                           hintText: "Password",
//                           hintStyle: TextStyle(color: Colors.white70),
//                           filled: true,
//                           fillColor: Colors.white.withOpacity(0.5),
//                           border: OutlineInputBorder(
//                             borderRadius: BorderRadius.circular(30.0),
//                             borderSide: BorderSide.none,
//                           ),
//                           suffixIcon: IconButton(
//                             icon: Icon(
//                               _isPasswordVisible
//                                   ? Icons.visibility
//                                   : Icons.visibility_off,
//                               color: Colors.white,
//                             ),
//                             onPressed: () {
//                               setState(() {
//                                 _isPasswordVisible = !_isPasswordVisible;
//                               });
//                             },
//                           ),
//                         ),
//                         style: TextStyle(color: Colors.white),
//                       ),
//                       const SizedBox(height: 10),
//                       // Remember Me and Forgot Password
//                       Row(
//                         mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                         children: [
//                           Row(
//                             children: [
//                               Checkbox(
//                                 value: rememberMe,
//                                 onChanged: (bool? value) {
//                                   setState(() {
//                                     rememberMe = value!;
//                                   });
//                                 },
//                                 checkColor: Colors.black,
//                                 fillColor: MaterialStateProperty.all(Colors.white),
//                               ),
//                               Text("Remember me", style: TextStyle(color: Colors.white)),
//                             ],
//                           ),
//                           GestureDetector(
//                             onTap: () {
//                               Navigator.pushNamed(context, '/forgot-password');
//                             },
//                             child: Text(
//                               "Forgot Password?",
//                               style: TextStyle(
//                                 color: Colors.blue[900],
//                                 decoration: TextDecoration.underline,
//                               ),
//                             ),
//                           ),
//                         ],
//                       ),
//                       const SizedBox(height: 20),
//                       // Login Button
//                       ElevatedButton(
//                         onPressed: () {
//                           // Handle login logic here
//                           Navigator.pushNamed(context, '/homepage');
//
//                         },
//                         style: ElevatedButton.styleFrom(
//                           backgroundColor: Colors.blue,
//                           padding: const EdgeInsets.symmetric(horizontal: 40.0, vertical: 15.0),
//                           shape: RoundedRectangleBorder(
//                             borderRadius: BorderRadius.circular(30.0),
//                           ),
//                         ),
//                         child: Text(
//                           "Log in",
//                           style: TextStyle(
//                             color: Colors.white,
//                             fontSize: 16,
//                           ),
//                         ),
//                       ),
//                       const SizedBox(height: 20),
//                       // OR Login With
//                       Text("or login with", style: TextStyle(color: Colors.white)),
//                       const SizedBox(height: 10),
//                       // Google Login Icon (Centered)
//                       Center(
//                         child: IconButton(
//                           icon: Image.asset('assets/google_icon.png'), // Replace with Google icon asset
//                           iconSize: 40, // Adjust the size as needed
//                           onPressed: () {
//                             // Handle Google login logic here
//                           },
//                         ),
//                       ),
//                       const SizedBox(height: 20),
//                       Row(
//                         mainAxisAlignment: MainAxisAlignment.center,
//                         children: [
//                           Text("Don't have an account? ", style: TextStyle(color: Colors.white)),
//                           GestureDetector(
//                             onTap: () {
//                               Navigator.pushNamed(context, '/signup');
//                             },
//                             child: Text(
//                               "Sign up",
//                               style: TextStyle(
//                                 color: Colors.blue[900],
//                                 fontWeight: FontWeight.bold,
//                                 decoration: TextDecoration.underline,
//                               ),
//                             ),
//                           ),
//                         ],
//                       ),
//                     ],
//                   ),
//                 ),
//                 SizedBox(height: 50), // Space at the bottom
//               ],
//             ),
//           ),
//         ],
//       ),
//     );
//   }
// }

import 'package:flutter/material.dart';
import 'package:tutor_nest/pages/forgot_password_page_content.dart';

class LoginPage extends StatefulWidget {
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  bool rememberMe = false;
  bool _isPasswordVisible = false; // Toggle password visibility

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false, // Prevent layout resizing when keyboard appears
      body: Stack(
        children: [
          // Background with image (fixed)
          Container(
            decoration: BoxDecoration(
              image: DecorationImage(
                image: AssetImage('assets/login_background.png'), // Replace with your background image
                fit: BoxFit.cover,
              ),
            ),
          ),
          // Foreground content (scrollable)
          Center(
            child: SingleChildScrollView(
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const SizedBox(height: 100), // Space from top
                    // Logo
                    Image.asset(
                      'assets/education_logo.png', // Replace with your logo asset
                      height: 100,
                    ),
                    const SizedBox(height: 20),
                    // Welcome Text
                    Text(
                      "Welcome back, User",
                      style: TextStyle(
                        fontSize: 24,
                        fontWeight: FontWeight.bold,
                        color: Colors.black,
                      ),
                    ),
                    const SizedBox(height: 30),
                    // Semi-transparent background container
                    Container(
                      margin: EdgeInsets.symmetric(horizontal: 20),
                      padding: EdgeInsets.fromLTRB(20, 20, 20, 30), // Adjust padding to add space below
                      decoration: BoxDecoration(
                        color: Colors.black.withOpacity(0.45), // Semi-transparent black background
                        borderRadius: BorderRadius.circular(20),
                      ),
                      child: Column(
                        children: [
                          // Username TextField
                          TextField(
                            decoration: InputDecoration(
                              prefixIcon: Icon(Icons.person, color: Colors.white),
                              hintText: "Username",
                              hintStyle: TextStyle(color: Colors.white70),
                              filled: true,
                              fillColor: Colors.white.withOpacity(0.5),
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(30.0),
                                borderSide: BorderSide.none,
                              ),
                            ),
                            style: TextStyle(color: Colors.white),
                          ),
                          const SizedBox(height: 15),
                          // Password TextField with show/hide icon
                          TextField(
                            obscureText: !_isPasswordVisible,
                            decoration: InputDecoration(
                              prefixIcon: Icon(Icons.lock, color: Colors.white),
                              hintText: "Password",
                              hintStyle: TextStyle(color: Colors.white70),
                              filled: true,
                              fillColor: Colors.white.withOpacity(0.5),
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(30.0),
                                borderSide: BorderSide.none,
                              ),
                              suffixIcon: IconButton(
                                icon: Icon(
                                  _isPasswordVisible
                                      ? Icons.visibility
                                      : Icons.visibility_off,
                                  color: Colors.white,
                                ),
                                onPressed: () {
                                  setState(() {
                                    _isPasswordVisible = !_isPasswordVisible;
                                  });
                                },
                              ),
                            ),
                            style: TextStyle(color: Colors.white),
                          ),
                          const SizedBox(height: 10),
                          // Remember Me and Forgot Password
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Row(
                                children: [
                                  Checkbox(
                                    value: rememberMe,
                                    onChanged: (bool? value) {
                                      setState(() {
                                        rememberMe = value!;
                                      });
                                    },
                                    checkColor: Colors.black,
                                    fillColor: MaterialStateProperty.all(Colors.white),
                                  ),
                                  Text("Remember me", style: TextStyle(color: Colors.white)),
                                ],
                              ),
                              GestureDetector(
                                onTap: () {
                                  Navigator.push(
                                    context,
                                    MaterialPageRoute(builder: (context) => ForgotPasswordPage()),
                                  );
                                },
                                child: Text(
                                  "Forgot Password?",
                                  style: TextStyle(
                                    color: Colors.blue,
                                    decoration: TextDecoration.underline,
                                  ),
                                ),
                              ),
                            ],
                          ),
                          const SizedBox(height: 20),
                          // Login Button
                          ElevatedButton(
                            onPressed: () {
                              // Handle login logic here
                              Navigator.pushReplacementNamed(context, '/main');
                            },
                            style: ElevatedButton.styleFrom(
                              backgroundColor: Colors.blue,
                              padding: const EdgeInsets.symmetric(horizontal: 40.0, vertical: 15.0),
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(30.0),
                              ),
                            ),
                            child: Text(
                              "Log in",
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 16,
                              ),
                            ),
                          ),
                          const SizedBox(height: 20),
                          // OR Login With
                          Text("or login with", style: TextStyle(color: Colors.white)),
                          const SizedBox(height: 10),
                          // Google Login Icon (Centered)
                          Center(
                            child: IconButton(
                              icon: Image.asset('assets/google_icon.png'), // Replace with Google icon asset
                              iconSize: 40, // Adjust the size as needed
                              onPressed: () {
                                // Handle Google login logic here
                              },
                            ),
                          ),
                          const SizedBox(height: 20),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text("Don't have an account? ", style: TextStyle(color: Colors.white)),
                              GestureDetector(
                                onTap: () {
                                  Navigator.pushNamed(context, '/signup');
                                },
                                child: Text(
                                  "Sign up",
                                  style: TextStyle(
                                    color: Colors.blue[900],
                                    fontWeight: FontWeight.bold,
                                    decoration: TextDecoration.underline,
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                    SizedBox(height: 50), // Space at the bottom
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}


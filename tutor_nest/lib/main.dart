// import 'package:flutter/material.dart';
// import 'pages/get_started_page.dart';
//
// void main() {
//   runApp(const MyApp());
// }
//
// class MyApp extends StatelessWidget {
//   const MyApp({Key? key}) : super(key: key);
//
//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       debugShowCheckedModeBanner: false,
//       home: GetStartedPage(),
//     );
//   }
// }

// import 'package:flutter/material.dart';
//
// import 'package:tutor_nest/pages/register_page.dart';
// import 'pages/get_started_page.dart';
// import 'pages/login_page.dart';
// import 'pages/home_page_content.dart';
//
//
// void main() {
//   runApp(const MyApp());
// }
//
// class MyApp extends StatelessWidget {
//   const MyApp({Key? key}) : super(key: key);
//
//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       debugShowCheckedModeBanner: false,
//       // Define routes for navigation
//       initialRoute: '/',
//       routes: {
//         '/': (context) => GetStartedPage(),
//         '/login': (context) => LoginPage(),
//         // '/forgot-password': (context) => ForgotPasswordPage(), // Replace with your Forgot Password page
//         '/signup': (context) => RegisterPage(),
//         '/homepage': (context) => HomePage(),// Add this line // Replace with your Sign Up page
//       },
//     );
//   }
// }

// import 'package:flutter/material.dart';
// import 'pages/get_started_page.dart';
// import 'pages/login_page.dart';
// import 'pages/register_page.dart';
// import 'pages/home_page_content.dart';
//
//
//
// // Global Navigator Key
// final GlobalKey<NavigatorState> navigatorKey = GlobalKey<NavigatorState>();
//
// void main() {
//   runApp(const MyApp());
// }
//
// class MyApp extends StatelessWidget {
//   const MyApp({Key? key}) : super(key: key);
//
//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       navigatorKey: navigatorKey, // Attach global navigator key
//       debugShowCheckedModeBanner: false,
//
//       // Define routes for navigation
//       initialRoute: '/',
//       routes: {
//         '/': (context) => GetStartedPage(),
//         '/login': (context) => LoginPage(),
//         '/register': (context) => RegisterPage(),
//         '/home': (context) => HomePage(),
//       },
//       onUnknownRoute: (settings) {
//         return MaterialPageRoute(
//           builder: (context) => Scaffold(
//             body: Center(
//               child: Text('404 - Page Not Found'),
//             ),
//           ),
//         );
//       },
//       theme: ThemeData(
//         primarySwatch: Colors.blue,
//       ),
//     );
//   }
// }
//
//
// import 'package:flutter/material.dart';
// import 'package:tutor_nest/pages/join_meeting_page_content.dart';
// import 'package:tutor_nest/pages/tutor_main_page.dart';
// import 'package:tutor_nest/pages/student_live_stream_page.dart';
// import 'package:tutor_nest/pages/profile_page_content.dart';
//
// import 'package:tutor_nest/pages/register_page.dart';
// import 'package:tutor_nest/pages/tutor_details_content.dart';
// import 'pages/get_started_page.dart';
// import 'pages/login_page.dart';
// import 'pages/home_page_content.dart';
//
//
// void main() {
//   runApp(const MyApp());
// }
//
// class MyApp extends StatelessWidget {
//   const MyApp({Key? key}) : super(key: key);
//   // Dummy Agora credentials for testing purposes
//   final String dummyAppId = 'YOUR_DUMMY_AGORA_APP_ID';
//   final String dummyToken = 'YOUR_DUMMY_AGORA_TOKEN';
//
//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       debugShowCheckedModeBanner: false,
//       // Define routes for navigation
//       initialRoute: '/',
//       routes: {
//         '/': (context) => GetStartedPage(),
//         '/login': (context) => LoginPage(),
//         // '/forgot-password': (context) => ForgotPasswordPage(),
//         '/signup': (context) => RegisterPage(),
//         // '/main': (context) => ProfilePageContent(),
//         // '/main': (context) => TutorDetailsContent(),
//         // '/main': (context) => MainPage(),
//         // '/main': (context) => JoinMeetingPage(),
//         '/main': (context) => MeetingPage(
//           channelName: 'test_channel', // Dummy channel name
//           appId: dummyAppId, // Dummy App ID
//           token: dummyToken, // Dummy Token
//         ),
//       },
//     );
//   }
// }

import 'package:flutter/material.dart';
import 'package:tutor_nest/pages/Admin/admin_dashboard_page.dart';
import 'package:tutor_nest/pages/Admin/admin_main_page.dart';
import 'package:tutor_nest/pages/get_started_page.dart';
import 'package:tutor_nest/pages/login_page.dart';
import 'package:tutor_nest/pages/Student/student_main_page.dart';
import 'package:tutor_nest/pages/Student/payment_page_content.dart';
import 'package:tutor_nest/pages/Student/profile_page_content.dart';
import 'package:tutor_nest/pages/register_page.dart';
import 'package:tutor_nest/pages/Student/student_live_stream_page.dart';
import 'package:tutor_nest/pages/Student/settings_page_content.dart';
import 'package:tutor_nest/pages/Student/tutor_details_content.dart';
import 'package:tutor_nest/pages/tutor/tutor_main_page.dart';


void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // Replace these with your actual Agora App ID and a valid Token
  final String agoraAppId = 'e852fa884df2463f83c3684bba401896';
  final String agoraToken = '007eJxTYDhs7lCdsTrer/XGHOdNF3fFXOosn3pa1LXpRGJcwqIr840UGFItTI3SEi0sTFLSjEzMjNMsjJONzSxMkpISTQwMLSzNmqyC0xsCGRmKuQ6xMjJAIIjPw1CSWlwSn5yRmJeXmsPAAACHFCKf';
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      // Define routes for navigation
      initialRoute: '/',
      routes: {
        '/': (context) => GetStartedPage(),
        '/login': (context) => LoginPage(),
        '/signup': (context) => RegisterPage(),
        // '/main': (context) => StudentLiveStreamPage(channelName: 'test_channel', appId: agoraAppId, token: agoraToken),
        // '/main': (context) => ProfilePageContent(),
        // '/main': (context) => MainPage(),
        // '/main': (context) => PaymentPage(),
        // '/main': (context) => SettingsPageContent(),
        '/main': (context) => TutorDetailsContent(),
        // '/main': (context) => TutorMainPage(),
        // '/main': (context) => WalletPage(),
        // '/main': (context) => AdminMainPage(),



      },
    );
  }
}




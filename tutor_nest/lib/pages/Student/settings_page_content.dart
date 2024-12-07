// import 'package:flutter/material.dart';
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
//       home: SettingsPageContent(),
//     );
//   }
// }
//
// class SettingsPageContent extends StatefulWidget {
//   @override
//   _SettingsPageContentState createState() => _SettingsPageContentState();
// }
//
// class _SettingsPageContentState extends State<SettingsPageContent> {
//   bool isDarkMode = false;
//   String selectedLanguage = "English";
//
//   final List<Map<String, String>> languages = [
//     {"name": "English", "image": "assets/us_flag.png"},
//     {"name": "Nepali", "image": "assets/np_flag.png"},
//     {"name": "Spain", "image": "assets/sp_flag.png"},
//   ];
//
//   void showPrivacyPolicy(BuildContext context) {
//     showDialog(
//       context: context,
//       builder: (context) => AlertDialog(
//         title: const Text("Privacy Policy"),
//         content: const Text("This is the privacy policy of the application."),
//         actions: [
//           TextButton(
//             onPressed: () => Navigator.pop(context),
//             child: const Text("Close"),
//           ),
//         ],
//       ),
//     );
//   }
//
//   void showTermsAndConditions(BuildContext context) {
//     showDialog(
//       context: context,
//       builder: (context) => AlertDialog(
//         title: const Text("Terms and Conditions"),
//         content: const Text("These are the terms and conditions of the app."),
//         actions: [
//           TextButton(
//             onPressed: () => Navigator.pop(context),
//             child: const Text("Close"),
//           ),
//         ],
//       ),
//     );
//   }
//
//   void showAboutDialog(BuildContext context) {
//     showDialog(
//       context: context,
//       builder: (context) => AlertDialog(
//         title: const Text("About"),
//         content: const Text("This application is designed to provide a seamless learning experience."),
//         actions: [
//           TextButton(
//             onPressed: () => Navigator.pop(context),
//             child: const Text("Close"),
//           ),
//         ],
//       ),
//     );
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: const Text("Settings"),
//         backgroundColor: Colors.blue,
//       ),
//       body: SingleChildScrollView(
//         padding: const EdgeInsets.all(16.0),
//         child: Column(
//           crossAxisAlignment: CrossAxisAlignment.start,
//           children: [
//             // User Profile Card
//             Card(
//               elevation: 4,
//               shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
//               child: Padding(
//                 padding: const EdgeInsets.all(16.0),
//                 child: Row(
//                   children: [
//                     const CircleAvatar(
//                       radius: 30,
//                       backgroundImage: AssetImage('assets/user_placeholder.png'),
//                     ),
//                     const SizedBox(width: 16),
//                     Column(
//                       crossAxisAlignment: CrossAxisAlignment.start,
//                       children: [
//                         const Text(
//                           "Dipesh Maharjan",
//                           style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
//                         ),
//                         const SizedBox(height: 4),
//                         const Text("Tap to change your profile."),
//                         IconButton(
//                           onPressed: () {
//                             // Navigate to Profile Edit Page
//                           },
//                           icon: const Icon(Icons.arrow_forward),
//                         ),
//                       ],
//                     ),
//                   ],
//                 ),
//               ),
//             ),
//             const SizedBox(height: 16),
//
//             // App Settings Section
//             const Text(
//               "App Settings",
//               style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
//             ),
//             const SizedBox(height: 16),
//
//             // Dark Mode
//             ListTile(
//               leading: const Icon(Icons.dark_mode),
//               title: const Text("Dark mode"),
//               trailing: Switch(
//                 value: isDarkMode,
//                 onChanged: (value) {
//                   setState(() {
//                     isDarkMode = value;
//                   });
//                 },
//               ),
//             ),
//
//             // Language Selection
//             ListTile(
//               leading: const Icon(Icons.language),
//               title: const Text("Language"),
//               trailing: DropdownButton<String>(
//                 value: selectedLanguage,
//                 items: languages.map((language) {
//                   return DropdownMenuItem<String>(
//                     value: language['name'],
//                     child: Row(
//                       children: [
//                         Image.asset(language['image']!, height: 20, width: 20),
//                         const SizedBox(width: 8),
//                         Text(language['name']!),
//                       ],
//                     ),
//                   );
//                 }).toList(),
//                 onChanged: (value) {
//                   setState(() {
//                     selectedLanguage = value!;
//                   });
//                 },
//               ),
//             ),
//
//             const SizedBox(height: 16),
//
//             // Account Section
//             const Text(
//               "Account",
//               style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
//             ),
//             const SizedBox(height: 16),
//
//             // Become a Tutor
//             ListTile(
//               leading: const Icon(Icons.school),
//               title: const Text("Become a tutor"),
//               trailing: const Icon(Icons.arrow_forward),
//               onTap: () {
//                 // Navigate to Become a Tutor Page
//               },
//             ),
//
//             // Wallet
//             ListTile(
//               leading: const Icon(Icons.wallet),
//               title: const Text("Wallet"),
//               trailing: const Icon(Icons.arrow_forward),
//               onTap: () {
//                 // Navigate to Wallet Page
//               },
//             ),
//
//             // Privacy Policy
//             ListTile(
//               leading: const Icon(Icons.lock),
//               title: const Text("Privacy policy"),
//               trailing: const Icon(Icons.arrow_forward),
//               onTap: () => showPrivacyPolicy(context),
//             ),
//
//             // Terms and Conditions
//             ListTile(
//               leading: const Icon(Icons.description),
//               title: const Text("Terms and conditions"),
//               trailing: const Icon(Icons.arrow_forward),
//               onTap: () => showTermsAndConditions(context),
//             ),
//
//             // About
//             ListTile(
//               leading: const Icon(Icons.info),
//               title: const Text("About"),
//               trailing: const Icon(Icons.arrow_forward),
//               onTap: () => showAboutDialog(context),
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }

// import 'package:flutter/material.dart';
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
//       home: SettingsPageContent(),
//     );
//   }
// }
//
// class SettingsPageContent extends StatefulWidget {
//   @override
//   _SettingsPageContentState createState() => _SettingsPageContentState();
// }
//
// class _SettingsPageContentState extends State<SettingsPageContent> {
//   bool isDarkMode = false;
//   String selectedLanguage = "English";
//
//   final List<Map<String, String>> languages = [
//     {"name": "English", "image": "assets/us_flag.png"},
//     {"name": "Nepali", "image": "assets/np_flag.png"},
//     {"name": "Spain", "image": "assets/sp_flag.png"},
//   ];
//
//   void showPrivacyPolicy(BuildContext context) {
//     showDialog(
//       context: context,
//       builder: (context) => Dialog(
//         shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
//         child: Container(
//           height: MediaQuery.of(context).size.height * 0.8, // 80% of the screen height
//           padding: const EdgeInsets.all(16.0),
//           child: Column(
//             children: [
//               const Text(
//                 "Privacy Policy",
//                 style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
//               ),
//               const SizedBox(height: 16),
//               Expanded(
//                 child: SingleChildScrollView(
//                   child: const Text(
//                     "This is the privacy policy of the application. You can write the complete details of the privacy policy here. This content is a placeholder. Add your actual privacy policy content here.",
//                     style: TextStyle(fontSize: 16),
//                   ),
//                 ),
//               ),
//               const SizedBox(height: 16),
//               Row(
//                 mainAxisAlignment: MainAxisAlignment.end,
//                 children: [
//                   ElevatedButton(
//                     onPressed: () {
//                       // Handle Do Not Accept
//                       Navigator.pop(context);
//                     },
//                     style: ElevatedButton.styleFrom(backgroundColor: Colors.red),
//                     child: const Text("Do Not Accept"),
//                   ),
//                   const SizedBox(width: 8),
//                   ElevatedButton(
//                     onPressed: () {
//                       // Handle Accept
//                       Navigator.pop(context);
//                     },
//                     style: ElevatedButton.styleFrom(backgroundColor: Colors.green),
//                     child: const Text("Accept"),
//                   ),
//                 ],
//               ),
//             ],
//           ),
//         ),
//       ),
//     );
//   }
//
//   void showTermsAndConditions(BuildContext context) {
//     showDialog(
//       context: context,
//       builder: (context) => Dialog(
//         shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
//         child: Container(
//           height: MediaQuery.of(context).size.height * 0.8, // 80% of the screen height
//           padding: const EdgeInsets.all(16.0),
//           child: Column(
//             children: [
//               const Text(
//                 "Terms and Conditions",
//                 style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
//               ),
//               const SizedBox(height: 16),
//               Expanded(
//                 child: SingleChildScrollView(
//                   child: const Text(
//                     "These are the terms and conditions of the application. Please provide the actual terms and conditions here. This content is a placeholder.",
//                     style: TextStyle(fontSize: 16),
//                   ),
//                 ),
//               ),
//               const SizedBox(height: 16),
//               Row(
//                 mainAxisAlignment: MainAxisAlignment.end,
//                 children: [
//                   ElevatedButton(
//                     onPressed: () {
//                       // Handle Do Not Accept
//                       Navigator.pop(context);
//                     },
//                     style: ElevatedButton.styleFrom(backgroundColor: Colors.red),
//                     child: const Text("Do Not Accept"),
//                   ),
//                   const SizedBox(width: 8),
//                   ElevatedButton(
//                     onPressed: () {
//                       // Handle Accept
//                       Navigator.pop(context);
//                     },
//                     style: ElevatedButton.styleFrom(backgroundColor: Colors.green),
//                     child: const Text("Accept"),
//                   ),
//                 ],
//               ),
//             ],
//           ),
//         ),
//       ),
//     );
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: const Text("Settings"),
//         backgroundColor: Colors.blue,
//       ),
//       body: SingleChildScrollView(
//         padding: const EdgeInsets.all(16.0),
//         child: Column(
//           crossAxisAlignment: CrossAxisAlignment.start,
//           children: [
//             const Text(
//               "App Settings",
//               style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
//             ),
//             const SizedBox(height: 16),
//             ListTile(
//               leading: const Icon(Icons.dark_mode),
//               title: const Text("Dark mode"),
//               trailing: Switch(
//                 value: isDarkMode,
//                 onChanged: (value) {
//                   setState(() {
//                     isDarkMode = value;
//                   });
//                 },
//               ),
//             ),
//             const SizedBox(height: 16),
//             const Text(
//               "Account",
//               style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
//             ),
//             const SizedBox(height: 16),
//             ListTile(
//               leading: const Icon(Icons.lock),
//               title: const Text("Privacy policy"),
//               trailing: const Icon(Icons.arrow_forward),
//               onTap: () => showPrivacyPolicy(context),
//             ),
//             ListTile(
//               leading: const Icon(Icons.description),
//               title: const Text("Terms and conditions"),
//               trailing: const Icon(Icons.arrow_forward),
//               onTap: () => showTermsAndConditions(context),
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }

// import 'package:flutter/material.dart';
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
//       home: SettingsPageContent(),
//     );
//   }
// }
//
// class SettingsPageContent extends StatefulWidget {
//   @override
//   _SettingsPageContentState createState() => _SettingsPageContentState();
// }
//
// class _SettingsPageContentState extends State<SettingsPageContent> {
//   bool isDarkMode = false;
//   String selectedLanguage = "English";
//
//   final List<Map<String, String>> languages = [
//     {"name": "English", "image": "assets/us_flag.png"},
//     {"name": "Nepali", "image": "assets/np_flag.png"},
//     {"name": "Spain", "image": "assets/sp_flag.png"},
//   ];
//
//   void showAboutDialog(BuildContext context) {
//     showDialog(
//       context: context,
//       builder: (context) => Dialog(
//         shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
//         child: Container(
//           height: MediaQuery.of(context).size.height * 0.5, // 50% height for About dialog
//           padding: const EdgeInsets.all(16.0),
//           child: Column(
//             crossAxisAlignment: CrossAxisAlignment.start,
//             children: [
//               const Text(
//                 "About",
//                 style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
//               ),
//               const SizedBox(height: 16),
//               const Expanded(
//                 child: SingleChildScrollView(
//                   child: Text(
//                     "This application is designed to help students connect with tutors and schedule lessons. It provides tools for managing lessons, accessing course materials, and more. This content is a placeholder for the About section.",
//                     style: TextStyle(fontSize: 16),
//                   ),
//                 ),
//               ),
//               const SizedBox(height: 16),
//               Align(
//                 alignment: Alignment.bottomRight,
//                 child: ElevatedButton(
//                   onPressed: () {
//                     Navigator.pop(context);
//                   },
//                   child: const Text("Close"),
//                 ),
//               ),
//             ],
//           ),
//         ),
//       ),
//     );
//   }
//
//   void navigateToNextPage(BuildContext context, String title) {
//     Navigator.push(
//       context,
//       MaterialPageRoute(
//         builder: (context) => Scaffold(
//           appBar: AppBar(
//             title: Text(title),
//           ),
//           body: Center(
//             child: Text(
//               "Welcome to the $title page!",
//               style: const TextStyle(fontSize: 24),
//             ),
//           ),
//         ),
//       ),
//     );
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: const Text("Settings"),
//         backgroundColor: Colors.blue,
//       ),
//       body: SingleChildScrollView(
//         padding: const EdgeInsets.all(16.0),
//         child: Column(
//           crossAxisAlignment: CrossAxisAlignment.start,
//           children: [
//             // Profile Card
//             Card(
//               shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
//               child: Padding(
//                 padding: const EdgeInsets.all(16.0),
//                 child: Row(
//                   children: [
//                     CircleAvatar(
//                       radius: 40,
//                       backgroundColor: Colors.grey.shade300,
//                       child: const Icon(Icons.person, size: 50, color: Colors.white),
//                     ),
//                     const SizedBox(width: 16),
//                     Column(
//                       crossAxisAlignment: CrossAxisAlignment.start,
//                       children: [
//                         const Text(
//                           "Dipesh Maharjan",
//                           style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
//                         ),
//                         const SizedBox(height: 8),
//                         ElevatedButton.icon(
//                           onPressed: () {
//                             // Handle profile edit
//                           },
//                           icon: const Icon(Icons.edit),
//                           label: const Text("Edit Profile"),
//                         ),
//                       ],
//                     ),
//                   ],
//                 ),
//               ),
//             ),
//             const SizedBox(height: 24),
//
//             // App Settings Section
//             const Text(
//               "App Settings",
//               style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
//             ),
//             const SizedBox(height: 16),
//             ListTile(
//               leading: const Icon(Icons.dark_mode),
//               title: const Text("Dark mode"),
//               trailing: Switch(
//                 value: isDarkMode,
//                 onChanged: (value) {
//                   setState(() {
//                     isDarkMode = value;
//                   });
//                 },
//               ),
//             ),
//             ListTile(
//               leading: const Icon(Icons.language),
//               title: const Text("Language"),
//               trailing: DropdownButton<String>(
//                 value: selectedLanguage,
//                 items: languages.map((lang) {
//                   return DropdownMenuItem(
//                     value: lang["name"],
//                     child: Row(
//                       children: [
//                         Image.asset(lang["image"]!, width: 24, height: 24),
//                         const SizedBox(width: 8),
//                         Text(lang["name"]!),
//                       ],
//                     ),
//                   );
//                 }).toList(),
//                 onChanged: (value) {
//                   setState(() {
//                     selectedLanguage = value!;
//                   });
//                 },
//               ),
//             ),
//             const SizedBox(height: 24),
//
//             // Account Section
//             const Text(
//               "Account",
//               style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
//             ),
//             const SizedBox(height: 16),
//             ListTile(
//               leading: const Icon(Icons.school),
//               title: const Text("Become a tutor"),
//               trailing: const Icon(Icons.arrow_forward),
//               onTap: () => navigateToNextPage(context, "Become a Tutor"),
//             ),
//             ListTile(
//               leading: const Icon(Icons.account_balance_wallet),
//               title: const Text("Wallet"),
//               trailing: const Icon(Icons.arrow_forward),
//               onTap: () => navigateToNextPage(context, "Wallet"),
//             ),
//             ListTile(
//               leading: const Icon(Icons.lock),
//               title: const Text("Privacy policy"),
//               trailing: const Icon(Icons.arrow_forward),
//               onTap: () => showAboutDialog(context),
//             ),
//             ListTile(
//               leading: const Icon(Icons.description),
//               title: const Text("Terms and conditions"),
//               trailing: const Icon(Icons.arrow_forward),
//               onTap: () => showAboutDialog(context),
//             ),
//             ListTile(
//               leading: const Icon(Icons.info),
//               title: const Text("About"),
//               trailing: const Icon(Icons.arrow_forward),
//               onTap: () => showAboutDialog(context),
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }

// import 'package:flutter/material.dart';
//
// void main() {
//   runApp(const MyApp());
// }
//
// class MyApp extends StatelessWidget {
//   const MyApp({Key? key}) : super(key: key);
//
//   // Entry point of the app
//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       debugShowCheckedModeBanner: false, // Remove debug banner
//       home: SettingsPageContent(),
//     );
//   }
// }
//
// class SettingsPageContent extends StatefulWidget {
//   @override
//   _SettingsPageContentState createState() => _SettingsPageContentState();
// }
//
// class _SettingsPageContentState extends State<SettingsPageContent> {
//   bool isDarkMode = false;
//   String selectedLanguage = "English";
//
//   final List<Map<String, String>> languages = [
//     {"name": "English", "image": "assets/us_flag.png"},
//     {"name": "Nepali", "image": "assets/np_flag.png"},
//     {"name": "Spanish", "image": "assets/sp_flag.png"},
//   ];
//
//   // Function to show Terms/Privacy dialog
//   void showTermsPrivacyDialog(BuildContext context, String title, String content) {
//     showDialog(
//       context: context,
//       builder: (context) => Dialog(
//         shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
//         child: Container(
//           // Cover 80% of the screen height
//           height: MediaQuery.of(context).size.height * 0.8,
//           padding: const EdgeInsets.all(16.0),
//           child: Column(
//             crossAxisAlignment: CrossAxisAlignment.start,
//             children: [
//               // Title
//               Text(
//                 title,
//                 style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
//               ),
//               const SizedBox(height: 16),
//               // Content
//               Expanded(
//                 child: SingleChildScrollView(
//                   child: Text(
//                     content,
//                     style: const TextStyle(fontSize: 16),
//                   ),
//                 ),
//               ),
//               const SizedBox(height: 16),
//               // Buttons
//               Row(
//                 mainAxisAlignment: MainAxisAlignment.end,
//                 children: [
//                   TextButton(
//                     onPressed: () {
//                       // Handle "Don't Accept" action
//                       Navigator.pop(context);
//                       // You can add additional logic here if needed
//                     },
//                     child: const Text("Don't Accept"),
//                   ),
//                   const SizedBox(width: 8),
//                   ElevatedButton(
//                     onPressed: () {
//                       // Handle "Accept" action
//                       Navigator.pop(context);
//                       // You can add additional logic here if needed
//                     },
//                     child: const Text("Accept"),
//                   ),
//                 ],
//               ),
//             ],
//           ),
//         ),
//       ),
//     );
//   }
//
//   // Function to show the About dialog (unchanged)
//   void showAboutDialog(BuildContext context) {
//     showDialog(
//       context: context,
//       builder: (context) => Dialog(
//         shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
//         child: Container(
//           height: MediaQuery.of(context).size.height * 0.5, // 50% height for About dialog
//           padding: const EdgeInsets.all(16.0),
//           child: Column(
//             crossAxisAlignment: CrossAxisAlignment.start,
//             children: [
//               const Text(
//                 "About",
//                 style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
//               ),
//               const SizedBox(height: 16),
//               const Expanded(
//                 child: SingleChildScrollView(
//                   child: Text(
//                     "This application is designed to help students connect with tutors and schedule lessons. It provides tools for managing lessons, accessing course materials, and more. This content is a placeholder for the About section.",
//                     style: TextStyle(fontSize: 16),
//                   ),
//                 ),
//               ),
//               const SizedBox(height: 16),
//               Align(
//                 alignment: Alignment.bottomRight,
//                 child: ElevatedButton(
//                   onPressed: () {
//                     Navigator.pop(context);
//                   },
//                   child: const Text("Close"),
//                 ),
//               ),
//             ],
//           ),
//         ),
//       ),
//     );
//   }
//
//   // Function to navigate to another page (unchanged)
//   void navigateToNextPage(BuildContext context, String title) {
//     Navigator.push(
//       context,
//       MaterialPageRoute(
//         builder: (context) => Scaffold(
//           appBar: AppBar(
//             title: Text(title),
//           ),
//           body: Center(
//             child: Text(
//               "Welcome to the $title page!",
//               style: const TextStyle(fontSize: 24),
//             ),
//           ),
//         ),
//       ),
//     );
//   }
//
//   // Main build method
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       // appBar: AppBar(
//       //   title: const Text("Settings"),
//       //   backgroundColor: Colors.blue,
//       // ),
//       body: SingleChildScrollView(
//         padding: const EdgeInsets.all(16.0),
//         child: Column(
//           crossAxisAlignment: CrossAxisAlignment.start,
//           children: [
//             // Profile Card
//             Card(
//               shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
//               elevation: 4,
//               child: Padding(
//                 padding: const EdgeInsets.all(16.0),
//                 child: Row(
//                   children: [
//                     // Profile Picture
//                     CircleAvatar(
//                       radius: 40,
//                       backgroundColor: Colors.grey.shade300,
//                       backgroundImage: AssetImage('assets/profile_picture.png'), // Dummy profile picture
//                       child: const Icon(Icons.person, size: 50, color: Colors.white),
//                     ),
//                     const SizedBox(width: 16),
//                     // User Details
//                     Column(
//                       crossAxisAlignment: CrossAxisAlignment.start,
//                       children: [
//                         const Text(
//                           "John Doe", // Dummy name
//                           style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
//                         ),
//                         const SizedBox(height: 4),
//                         const Text(
//                           "johndoe@example.com", // Dummy email
//                           style: TextStyle(fontSize: 16, color: Colors.grey),
//                         ),
//                         const SizedBox(height: 8),
//                         ElevatedButton.icon(
//                           onPressed: () {
//                             // Handle profile edit
//                           },
//                           icon: const Icon(Icons.edit),
//                           label: const Text("Edit Profile"),
//                         ),
//                       ],
//                     ),
//                   ],
//                 ),
//               ),
//             ),
//             const SizedBox(height: 24),
//
//             // App Settings Section
//             const Text(
//               "App Settings",
//               style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
//             ),
//             const SizedBox(height: 16),
//             // Dark Mode Toggle
//             ListTile(
//               leading: const Icon(Icons.dark_mode),
//               title: const Text("Dark mode"),
//               trailing: Switch(
//                 value: isDarkMode,
//                 onChanged: (value) {
//                   setState(() {
//                     isDarkMode = value;
//                   });
//                 },
//               ),
//             ),
//             // Language Selection
//             ListTile(
//               leading: const Icon(Icons.language),
//               title: const Text("Language"),
//               trailing: DropdownButton<String>(
//                 value: selectedLanguage,
//                 items: languages.map((lang) {
//                   return DropdownMenuItem(
//                     value: lang["name"],
//                     child: Row(
//                       children: [
//                         Image.asset(lang["image"]!, width: 24, height: 24),
//                         const SizedBox(width: 8),
//                         Text(lang["name"]!),
//                       ],
//                     ),
//                   );
//                 }).toList(),
//                 onChanged: (value) {
//                   setState(() {
//                     selectedLanguage = value!;
//                   });
//                 },
//               ),
//             ),
//             const SizedBox(height: 24),
//
//             // Account Section
//             const Text(
//               "Account",
//               style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
//             ),
//             const SizedBox(height: 16),
//             // Become a Tutor
//             ListTile(
//               leading: const Icon(Icons.school),
//               title: const Text("Become a tutor"),
//               trailing: const Icon(Icons.arrow_forward),
//               onTap: () => navigateToNextPage(context, "Become a Tutor"),
//             ),
//             // Wallet
//             ListTile(
//               leading: const Icon(Icons.account_balance_wallet),
//               title: const Text("Wallet"),
//               trailing: const Icon(Icons.arrow_forward),
//               onTap: () => navigateToNextPage(context, "Wallet"),
//             ),
//             // Privacy Policy
//             ListTile(
//               leading: const Icon(Icons.lock),
//               title: const Text("Privacy Policy"),
//               trailing: const Icon(Icons.arrow_forward),
//               onTap: () => showTermsPrivacyDialog(
//                 context,
//                 "Privacy Policy",
//                 "This is the Privacy Policy content. Here you can explain how user data is handled. This is placeholder text for demonstration purposes.",
//               ),
//             ),
//             // Terms and Conditions
//             ListTile(
//               leading: const Icon(Icons.description),
//               title: const Text("Terms and Conditions"),
//               trailing: const Icon(Icons.arrow_forward),
//               onTap: () => showTermsPrivacyDialog(
//                 context,
//                 "Terms and Conditions",
//                 "These are the Terms and Conditions. Users must agree to these terms to use the app. This is placeholder text for demonstration purposes.",
//               ),
//             ),
//             // About
//             ListTile(
//               leading: const Icon(Icons.info),
//               title: const Text("About"),
//               trailing: const Icon(Icons.arrow_forward),
//               onTap: () => showAboutDialog(context),
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }

// // lib/pages/settings_page_content.dart
// import 'package:flutter/material.dart';
// import '../services/settings_service.dart'; // Import the service
// import '../widgets/profile_card.dart';     // Import the ProfileCard widget
//
// class SettingsPageContent extends StatefulWidget {
//   @override
//   _SettingsPageContentState createState() => _SettingsPageContentState();
// }
//
// class _SettingsPageContentState extends State<SettingsPageContent> {
//   final SettingsService _settingsService = SettingsService(); // Instantiate the service
//
//   bool isDarkMode = false;
//   String selectedLanguage = "English";
//
//   final List<Map<String, String>> languages = [
//     {"name": "English", "image": "assets/us_flag.png"},
//     {"name": "Nepali", "image": "assets/np_flag.png"},
//     {"name": "Spanish", "image": "assets/sp_flag.png"},
//   ];
//
//   // Function to show Terms/Privacy dialog
//   void showTermsPrivacyDialog(BuildContext context, String title, String content) {
//     showDialog(
//       context: context,
//       builder: (context) => Dialog(
//         shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
//         child: Container(
//           // Cover 80% of the screen height
//           height: MediaQuery.of(context).size.height * 0.8,
//           padding: const EdgeInsets.all(16.0),
//           child: Column(
//             crossAxisAlignment: CrossAxisAlignment.start,
//             children: [
//               // Title
//               Text(
//                 title,
//                 style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
//               ),
//               const SizedBox(height: 16),
//               // Content
//               Expanded(
//                 child: SingleChildScrollView(
//                   child: Text(
//                     content,
//                     style: const TextStyle(fontSize: 16),
//                   ),
//                 ),
//               ),
//               const SizedBox(height: 16),
//               // Buttons
//               Row(
//                 mainAxisAlignment: MainAxisAlignment.end,
//                 children: [
//                   TextButton(
//                     onPressed: () {
//                       // Handle "Don't Accept" action
//                       Navigator.pop(context);
//                       // You can add additional logic here if needed
//                     },
//                     child: const Text("Don't Accept"),
//                   ),
//                   const SizedBox(width: 8),
//                   ElevatedButton(
//                     onPressed: () {
//                       // Handle "Accept" action
//                       Navigator.pop(context);
//                       // You can add additional logic here if needed
//                     },
//                     child: const Text("Accept"),
//                   ),
//                 ],
//               ),
//             ],
//           ),
//         ),
//       ),
//     );
//   }
//
//   // Function to show the About dialog
//   void showAboutDialog(BuildContext context) {
//     showDialog(
//       context: context,
//       builder: (context) => Dialog(
//         shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
//         child: Container(
//           height: MediaQuery.of(context).size.height * 0.5, // 50% height for About dialog
//           padding: const EdgeInsets.all(16.0),
//           child: Column(
//             crossAxisAlignment: CrossAxisAlignment.start,
//             children: [
//               const Text(
//                 "About",
//                 style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
//               ),
//               const SizedBox(height: 16),
//               const Expanded(
//                 child: SingleChildScrollView(
//                   child: Text(
//                     "This application is designed to help students connect with tutors and schedule lessons. It provides tools for managing lessons, accessing course materials, and more. This content is a placeholder for the About section.",
//                     style: TextStyle(fontSize: 16),
//                   ),
//                 ),
//               ),
//               const SizedBox(height: 16),
//               Align(
//                 alignment: Alignment.bottomRight,
//                 child: ElevatedButton(
//                   onPressed: () {
//                     Navigator.pop(context);
//                   },
//                   child: const Text("Close"),
//                 ),
//               ),
//             ],
//           ),
//         ),
//       ),
//     );
//   }
//
//   // Function to navigate to another page
//   void navigateToNextPage(BuildContext context, String title) {
//     Navigator.push(
//       context,
//       MaterialPageRoute(
//         builder: (context) => Scaffold(
//           appBar: AppBar(
//             title: Text(title),
//           ),
//           body: Center(
//             child: Text(
//               "Welcome to the $title page!",
//               style: const TextStyle(fontSize: 24),
//             ),
//           ),
//         ),
//       ),
//     );
//   }
//
//   // Main build method
//   @override
//   Widget build(BuildContext context) {
//     // Removed Scaffold, as this will be handled by MainPage
//     return SingleChildScrollView(
//       padding: const EdgeInsets.all(16.0),
//       child: Column(
//         crossAxisAlignment: CrossAxisAlignment.start,
//         children: [
//           // Use FutureBuilder to fetch user profile data
//           FutureBuilder<Map<String, String>>(
//             future: _settingsService.fetchUserProfile(),
//             builder: (context, snapshot) {
//               if (snapshot.connectionState == ConnectionState.waiting) {
//                 // Show loading indicator while data is loading
//                 return Center(child: CircularProgressIndicator());
//               } else if (snapshot.hasError) {
//                 // Show error message if something went wrong
//                 return Center(child: Text("Failed to load user profile."));
//               } else if (snapshot.hasData) {
//                 // Display the ProfileCard
//                 return ProfileCard(
//                   userData: snapshot.data!,
//                   onEditProfile: () {
//                     // Handle profile edit
//                   },
//                 );
//               } else {
//                 // If data is null
//                 return Center(child: Text("No user data available."));
//               }
//             },
//           ),
//           const SizedBox(height: 24),
//
//           // App Settings Section
//           const Text(
//             "App Settings",
//             style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
//           ),
//           const SizedBox(height: 16),
//           // Dark Mode Toggle
//           ListTile(
//             leading: const Icon(Icons.dark_mode),
//             title: const Text("Dark mode"),
//             trailing: Switch(
//               value: isDarkMode,
//               onChanged: (value) {
//                 setState(() {
//                   isDarkMode = value;
//                 });
//               },
//             ),
//           ),
//           // Language Selection
//           ListTile(
//             leading: const Icon(Icons.language),
//             title: const Text("Language"),
//             trailing: DropdownButton<String>(
//               value: selectedLanguage,
//               items: languages.map((lang) {
//                 return DropdownMenuItem(
//                   value: lang["name"],
//                   child: Row(
//                     children: [
//                       Image.asset(lang["image"]!, width: 24, height: 24),
//                       const SizedBox(width: 8),
//                       Text(lang["name"]!),
//                     ],
//                   ),
//                 );
//               }).toList(),
//               onChanged: (value) {
//                 setState(() {
//                   selectedLanguage = value!;
//                 });
//               },
//             ),
//           ),
//           const SizedBox(height: 24),
//
//           // Account Section
//           const Text(
//             "Account",
//             style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
//           ),
//           const SizedBox(height: 16),
//           // Become a Tutor
//           ListTile(
//             leading: const Icon(Icons.school),
//             title: const Text("Become a tutor"),
//             trailing: const Icon(Icons.arrow_forward),
//             onTap: () => navigateToNextPage(context, "Become a Tutor"),
//           ),
//           // Wallet
//           ListTile(
//             leading: const Icon(Icons.account_balance_wallet),
//             title: const Text("Wallet"),
//             trailing: const Icon(Icons.arrow_forward),
//             onTap: () => navigateToNextPage(context, "Wallet"),
//           ),
//           // Privacy Policy
//           ListTile(
//             leading: const Icon(Icons.lock),
//             title: const Text("Privacy Policy"),
//             trailing: const Icon(Icons.arrow_forward),
//             onTap: () => showTermsPrivacyDialog(
//               context,
//               "Privacy Policy",
//               "This is the Privacy Policy content. Here you can explain how user data is handled. This is placeholder text for demonstration purposes.",
//             ),
//           ),
//           // Terms and Conditions
//           ListTile(
//             leading: const Icon(Icons.description),
//             title: const Text("Terms and Conditions"),
//             trailing: const Icon(Icons.arrow_forward),
//             onTap: () => showTermsPrivacyDialog(
//               context,
//               "Terms and Conditions",
//               "These are the Terms and Conditions. Users must agree to these terms to use the app. This is placeholder text for demonstration purposes.",
//             ),
//           ),
//           // About
//           ListTile(
//             leading: const Icon(Icons.info),
//             title: const Text("About"),
//             trailing: const Icon(Icons.arrow_forward),
//             onTap: () => showAboutDialog(context),
//           ),
//         ],
//       ),
//     );
//   }
// }

// lib/pages/settings_page_content.dart

// import 'package:flutter/material.dart';
// import '../services/settings_service.dart'; // Import the service
// import '../widgets/profile_card.dart';     // Import the ProfileCard widget
// import '../models/user_profile.dart';     // Import the UserProfile model
//
// class SettingsPageContent extends StatefulWidget {
//   @override
//   _SettingsPageContentState createState() => _SettingsPageContentState();
// }
//
// class _SettingsPageContentState extends State<SettingsPageContent> {
//   final SettingsService _settingsService = SettingsService(); // Instantiate the service
//
//   bool isDarkMode = false;
//   String selectedLanguage = "English";
//
//   final List<Map<String, String>> languages = [
//     {"name": "English", "image": "assets/us_flag.png"},
//     {"name": "Nepali", "image": "assets/np_flag.png"},
//     {"name": "Spanish", "image": "assets/sp_flag.png"},
//   ];
//
//   // Function to show Terms/Privacy dialog
//   void showTermsPrivacyDialog(BuildContext context, String title, String content) {
//     showDialog(
//       context: context,
//       builder: (context) => Dialog(
//         shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
//         child: Container(
//           // Cover 80% of the screen height
//           height: MediaQuery.of(context).size.height * 0.8,
//           padding: const EdgeInsets.all(16.0),
//           child: Column(
//             crossAxisAlignment: CrossAxisAlignment.start,
//             children: [
//               // Title
//               Text(
//                 title,
//                 style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
//               ),
//               const SizedBox(height: 16),
//               // Content
//               Expanded(
//                 child: SingleChildScrollView(
//                   child: Text(
//                     content,
//                     style: const TextStyle(fontSize: 16),
//                   ),
//                 ),
//               ),
//               const SizedBox(height: 16),
//               // Buttons
//               Row(
//                 mainAxisAlignment: MainAxisAlignment.end,
//                 children: [
//                   TextButton(
//                     onPressed: () {
//                       // Handle "Don't Accept" action
//                       Navigator.pop(context);
//                       // You can add additional logic here if needed
//                     },
//                     child: const Text("Don't Accept"),
//                   ),
//                   const SizedBox(width: 8),
//                   ElevatedButton(
//                     onPressed: () {
//                       // Handle "Accept" action
//                       Navigator.pop(context);
//                       // You can add additional logic here if needed
//                     },
//                     child: const Text("Accept"),
//                   ),
//                 ],
//               ),
//             ],
//           ),
//         ),
//       ),
//     );
//   }
//
//   // Function to show the About dialog
//   void showAboutDialog(BuildContext context) {
//     showDialog(
//       context: context,
//       builder: (context) => Dialog(
//         shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
//         child: Container(
//           height: MediaQuery.of(context).size.height * 0.5, // 50% height for About dialog
//           padding: const EdgeInsets.all(16.0),
//           child: Column(
//             crossAxisAlignment: CrossAxisAlignment.start,
//             children: [
//               const Text(
//                 "About",
//                 style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
//               ),
//               const SizedBox(height: 16),
//               const Expanded(
//                 child: SingleChildScrollView(
//                   child: Text(
//                     "This application is designed to help students connect with tutors and schedule lessons. It provides tools for managing lessons, accessing course materials, and more. This content is a placeholder for the About section.",
//                     style: TextStyle(fontSize: 16),
//                   ),
//                 ),
//               ),
//               const SizedBox(height: 16),
//               Align(
//                 alignment: Alignment.bottomRight,
//                 child: ElevatedButton(
//                   onPressed: () {
//                     Navigator.pop(context);
//                   },
//                   child: const Text("Close"),
//                 ),
//               ),
//             ],
//           ),
//         ),
//       ),
//     );
//   }
//
//   // Function to navigate to another page
//   void navigateToNextPage(BuildContext context, String title) {
//     Navigator.push(
//       context,
//       MaterialPageRoute(
//         builder: (context) => Scaffold(
//           appBar: AppBar(
//             title: Text(title),
//           ),
//           body: Center(
//             child: Text(
//               "Welcome to the $title page!",
//               style: const TextStyle(fontSize: 24),
//             ),
//           ),
//         ),
//       ),
//     );
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     // Removed Scaffold, as this will be handled by MainPage
//     return SingleChildScrollView(
//       padding: const EdgeInsets.all(16.0),
//       child: Column(
//         crossAxisAlignment: CrossAxisAlignment.start,
//         children: [
//           // Use FutureBuilder to fetch user profile data
//           FutureBuilder<UserProfile>(
//             future: _settingsService.fetchUserProfile(),
//             builder: (context, snapshot) {
//               if (snapshot.connectionState == ConnectionState.waiting) {
//                 // Show loading indicator while data is loading
//                 return Center(child: CircularProgressIndicator());
//               } else if (snapshot.hasError) {
//                 // Show error message if something went wrong
//                 return Center(child: Text("Failed to load user profile."));
//               } else if (snapshot.hasData) {
//                 // Display the ProfileCard
//                 return ProfileCard(
//                   userProfile: snapshot.data!,
//                   onEditProfile: () {
//                     // Handle profile edit
//                   },
//                 );
//               } else {
//                 // If data is null
//                 return Center(child: Text("No user data available."));
//               }
//             },
//           ),
//           const SizedBox(height: 24),
//
//           // App Settings Section
//           const Text(
//             "App Settings",
//             style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
//           ),
//           const SizedBox(height: 16),
//           // Dark Mode Toggle
//           ListTile(
//             leading: const Icon(Icons.dark_mode),
//             title: const Text("Dark mode"),
//             trailing: Switch(
//               value: isDarkMode,
//               onChanged: (value) {
//                 setState(() {
//                   isDarkMode = value;
//                 });
//               },
//             ),
//           ),
//           // Language Selection
//           ListTile(
//             leading: const Icon(Icons.language),
//             title: const Text("Language"),
//             trailing: DropdownButton<String>(
//               value: selectedLanguage,
//               items: languages.map((lang) {
//                 return DropdownMenuItem(
//                   value: lang["name"],
//                   child: Row(
//                     children: [
//                       Image.asset(lang["image"]!, width: 24, height: 24),
//                       const SizedBox(width: 8),
//                       Text(lang["name"]!),
//                     ],
//                   ),
//                 );
//               }).toList(),
//               onChanged: (value) {
//                 setState(() {
//                   selectedLanguage = value!;
//                 });
//               },
//             ),
//           ),
//           const SizedBox(height: 24),
//
//           // Account Section
//           const Text(
//             "Account",
//             style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
//           ),
//           const SizedBox(height: 16),
//           // Become a Tutor
//           ListTile(
//             leading: const Icon(Icons.school),
//             title: const Text("Become a tutor"),
//             trailing: const Icon(Icons.arrow_forward),
//             onTap: () => navigateToNextPage(context, "Become a Tutor"),
//           ),
//           // Wallet
//           ListTile(
//             leading: const Icon(Icons.account_balance_wallet),
//             title: const Text("Wallet"),
//             trailing: const Icon(Icons.arrow_forward),
//             onTap: () => navigateToNextPage(context, "Wallet"),
//           ),
//           // Privacy Policy
//           ListTile(
//             leading: const Icon(Icons.lock),
//             title: const Text("Privacy Policy"),
//             trailing: const Icon(Icons.arrow_forward),
//             onTap: () => showTermsPrivacyDialog(
//               context,
//               "Privacy Policy",
//               "This is the Privacy Policy content. Here you can explain how user data is handled. This is placeholder text for demonstration purposes.",
//             ),
//           ),
//           // Terms and Conditions
//           ListTile(
//             leading: const Icon(Icons.description),
//             title: const Text("Terms and Conditions"),
//             trailing: const Icon(Icons.arrow_forward),
//             onTap: () => showTermsPrivacyDialog(
//               context,
//               "Terms and Conditions",
//               "These are the Terms and Conditions. Users must agree to these terms to use the app. This is placeholder text for demonstration purposes.",
//             ),
//           ),
//           // About
//           ListTile(
//             leading: const Icon(Icons.info),
//             title: const Text("About"),
//             trailing: const Icon(Icons.arrow_forward),
//             onTap: () => showAboutDialog(context),
//           ),
//         ],
//       ),
//     );
//   }
// }

// pages/settings_page_content.dart

// import 'package:flutter/material.dart';
// import '../services/settings_service.dart'; // Import the service
// import '../widgets/profile_card.dart';     // Import the ProfileCard widget
// import '../models/user_profile.dart';     // Import the UserProfile model
//
// class SettingsPageContent extends StatefulWidget {
//   @override
//   _SettingsPageContentState createState() => _SettingsPageContentState();
// }
//
// class _SettingsPageContentState extends State<SettingsPageContent> {
//   final SettingsService _settingsService = SettingsService(); // Instantiate the service
//
//   bool isDarkMode = false;
//   String selectedLanguage = "English";
//
//   final List<Map<String, String>> languages = [
//     {"name": "English", "image": "assets/us_flag.png"},
//     {"name": "Nepali", "image": "assets/np_flag.png"},
//     {"name": "Spanish", "image": "assets/sp_flag.png"},
//   ];
//
//   // Function to show Terms/Privacy dialog
//   void showTermsPrivacyDialog(BuildContext context, String title, String content) {
//     showDialog(
//       context: context,
//       builder: (context) => Dialog(
//         shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
//         child: Container(
//           // Cover 80% of the screen height
//           height: MediaQuery.of(context).size.height * 0.8,
//           padding: const EdgeInsets.all(16.0),
//           child: Column(
//             crossAxisAlignment: CrossAxisAlignment.start,
//             children: [
//               // Title
//               Text(
//                 title,
//                 style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
//               ),
//               const SizedBox(height: 16),
//               // Content
//               Expanded(
//                 child: SingleChildScrollView(
//                   child: Text(
//                     content,
//                     style: const TextStyle(fontSize: 16),
//                   ),
//                 ),
//               ),
//               const SizedBox(height: 16),
//               // Buttons
//               Row(
//                 mainAxisAlignment: MainAxisAlignment.end,
//                 children: [
//                   TextButton(
//                     onPressed: () {
//                       // Handle "Don't Accept" action
//                       Navigator.pop(context);
//                       // You can add additional logic here if needed
//                     },
//                     child: const Text("Don't Accept"),
//                   ),
//                   const SizedBox(width: 8),
//                   ElevatedButton(
//                     onPressed: () {
//                       // Handle "Accept" action
//                       Navigator.pop(context);
//                       // You can add additional logic here if needed
//                     },
//                     child: const Text("Accept"),
//                   ),
//                 ],
//               ),
//             ],
//           ),
//         ),
//       ),
//     );
//   }
//
//   // Function to show the About dialog
//   void showAboutDialog(BuildContext context) {
//     showDialog(
//       context: context,
//       builder: (context) => Dialog(
//         shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
//         child: Container(
//           height: MediaQuery.of(context).size.height * 0.5, // 50% height for About dialog
//           padding: const EdgeInsets.all(16.0),
//           child: Column(
//             crossAxisAlignment: CrossAxisAlignment.start,
//             children: [
//               const Text(
//                 "About",
//                 style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
//               ),
//               const SizedBox(height: 16),
//               const Expanded(
//                 child: SingleChildScrollView(
//                   child: Text(
//                     "This application is designed to help students connect with tutors and schedule lessons. It provides tools for managing lessons, accessing course materials, and more. This content is a placeholder for the About section.",
//                     style: TextStyle(fontSize: 16),
//                   ),
//                 ),
//               ),
//               const SizedBox(height: 16),
//               Align(
//                 alignment: Alignment.bottomRight,
//                 child: ElevatedButton(
//                   onPressed: () {
//                     Navigator.pop(context);
//                   },
//                   child: const Text("Close"),
//                 ),
//               ),
//             ],
//           ),
//         ),
//       ),
//     );
//   }
//
//   // Function to navigate to another page
//   void navigateToNextPage(BuildContext context, String title) {
//     Navigator.push(
//       context,
//       MaterialPageRoute(
//         builder: (context) => Scaffold(
//           appBar: AppBar(
//             title: Text(title),
//           ),
//           body: Center(
//             child: Text(
//               "Welcome to the $title page!",
//               style: const TextStyle(fontSize: 24),
//             ),
//           ),
//         ),
//       ),
//     );
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     // Removed Scaffold, as this will be handled by MainPage
//     return SingleChildScrollView(
//       padding: const EdgeInsets.all(16.0),
//       child: Column(
//         crossAxisAlignment: CrossAxisAlignment.start,
//         children: [
//           // Use FutureBuilder to fetch user profile data
//           FutureBuilder<UserProfile>(
//             future: _settingsService.fetchUserProfile(),
//             builder: (context, snapshot) {
//               if (snapshot.connectionState == ConnectionState.waiting) {
//                 // Show loading indicator while data is loading
//                 return Center(child: CircularProgressIndicator());
//               } else if (snapshot.hasError) {
//                 // Show error message if something went wrong
//                 return Center(child: Text("Failed to load user profile."));
//               } else if (snapshot.hasData) {
//                 // Display the ProfileCard
//                 return ProfileCard(
//                   userProfile: snapshot.data!,
//                   onEditProfile: () {
//                     // Handle profile edit
//                     // For example, navigate to an Edit Profile page
//                   },
//                 );
//               } else {
//                 // If data is null
//                 return Center(child: Text("No user data available."));
//               }
//             },
//           ),
//           const SizedBox(height: 24),
//
//           // App Settings Section
//           const Text(
//             "App Settings",
//             style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
//           ),
//           const SizedBox(height: 16),
//           // Dark Mode Toggle
//           ListTile(
//             leading: const Icon(Icons.dark_mode),
//             title: const Text("Dark mode"),
//             trailing: Switch(
//               value: isDarkMode,
//               onChanged: (value) {
//                 setState(() {
//                   isDarkMode = value;
//                   // Optionally, update the app's theme here
//                 });
//               },
//             ),
//           ),
//           // Language Selection
//           ListTile(
//             leading: const Icon(Icons.language),
//             title: const Text("Language"),
//             trailing: DropdownButton<String>(
//               value: selectedLanguage,
//               items: languages.map((lang) {
//                 return DropdownMenuItem(
//                   value: lang["name"],
//                   child: Row(
//                     children: [
//                       Image.asset(lang["image"]!, width: 24, height: 24),
//                       const SizedBox(width: 8),
//                       Text(lang["name"]!),
//                     ],
//                   ),
//                 );
//               }).toList(),
//               onChanged: (value) {
//                 setState(() {
//                   selectedLanguage = value!;
//                   // Optionally, handle language change here
//                 });
//               },
//             ),
//           ),
//           const SizedBox(height: 24),
//
//           // Account Section
//           const Text(
//             "Account",
//             style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
//           ),
//           const SizedBox(height: 16),
//           // Become a Tutor
//           ListTile(
//             leading: const Icon(Icons.school),
//             title: const Text("Become a tutor"),
//             trailing: const Icon(Icons.arrow_forward),
//             onTap: () => navigateToNextPage(context, "Become a Tutor"),
//           ),
//           // Wallet
//           ListTile(
//             leading: const Icon(Icons.account_balance_wallet),
//             title: const Text("Wallet"),
//             trailing: const Icon(Icons.arrow_forward),
//             onTap: () => navigateToNextPage(context, "Wallet"),
//           ),
//           // Privacy Policy
//           ListTile(
//             leading: const Icon(Icons.lock),
//             title: const Text("Privacy Policy"),
//             trailing: const Icon(Icons.arrow_forward),
//             onTap: () => showTermsPrivacyDialog(
//               context,
//               "Privacy Policy",
//               "This is the Privacy Policy content. Here you can explain how user data is handled. This is placeholder text for demonstration purposes.",
//             ),
//           ),
//           // Terms and Conditions
//           ListTile(
//             leading: const Icon(Icons.description),
//             title: const Text("Terms and Conditions"),
//             trailing: const Icon(Icons.arrow_forward),
//             onTap: () => showTermsPrivacyDialog(
//               context,
//               "Terms and Conditions",
//               "These are the Terms and Conditions. Users must agree to these terms to use the app. This is placeholder text for demonstration purposes.",
//             ),
//           ),
//           // About
//           ListTile(
//             leading: const Icon(Icons.info),
//             title: const Text("About"),
//             trailing: const Icon(Icons.arrow_forward),
//             onTap: () => showAboutDialog(context),
//           ),
//         ],
//       ),
//     );
//   }
// }
//
// import 'package:flutter/material.dart';
// import 'package:tutor_nest/pages/active_payment_page_content.dart';
// import '../services/settings_service.dart'; // Import the service
// import '../widgets/profile_card.dart'; // Import the ProfileCard widget
// import '../models/user_profile.dart'; // Import the UserProfile model
// import '../pages/payment_page_content.dart'; // Import the PaymentPage
//
// class SettingsPageContent extends StatefulWidget {
//   @override
//   _SettingsPageContentState createState() => _SettingsPageContentState();
// }
//
// class _SettingsPageContentState extends State<SettingsPageContent> {
//   final SettingsService _settingsService = SettingsService(); // Instantiate the service
//
//   bool isDarkMode = false;
//   String selectedLanguage = "English";
//
//   final List<Map<String, String>> languages = [
//     {"name": "English", "image": "assets/us_flag.png"},
//     {"name": "Nepali", "image": "assets/np_flag.png"},
//     {"name": "Spanish", "image": "assets/sp_flag.png"},
//   ];
//
//   // Function to show Terms/Privacy dialog
//   void showTermsPrivacyDialog(BuildContext context, String title, String content) {
//     showDialog(
//       context: context,
//       builder: (context) => Dialog(
//         shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
//         child: Container(
//           // Cover 80% of the screen height
//           height: MediaQuery.of(context).size.height * 0.8,
//           padding: const EdgeInsets.all(16.0),
//           child: Column(
//             crossAxisAlignment: CrossAxisAlignment.start,
//             children: [
//               // Title
//               Text(
//                 title,
//                 style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
//               ),
//               const SizedBox(height: 16),
//               // Content
//               Expanded(
//                 child: SingleChildScrollView(
//                   child: Text(
//                     content,
//                     style: const TextStyle(fontSize: 16),
//                   ),
//                 ),
//               ),
//               const SizedBox(height: 16),
//               // Buttons
//               Row(
//                 mainAxisAlignment: MainAxisAlignment.end,
//                 children: [
//                   TextButton(
//                     onPressed: () {
//                       // Handle "Don't Accept" action
//                       Navigator.pop(context);
//                       // You can add additional logic here if needed
//                     },
//                     child: const Text("Don't Accept"),
//                   ),
//                   const SizedBox(width: 8),
//                   ElevatedButton(
//                     onPressed: () {
//                       // Handle "Accept" action
//                       Navigator.pop(context);
//                       // You can add additional logic here if needed
//                     },
//                     child: const Text("Accept"),
//                   ),
//                 ],
//               ),
//             ],
//           ),
//         ),
//       ),
//     );
//   }
//
//   // Function to show the About dialog
//   void showAboutDialog(BuildContext context) {
//     showDialog(
//       context: context,
//       builder: (context) => Dialog(
//         shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
//         child: Container(
//           height: MediaQuery.of(context).size.height * 0.5, // 50% height for About dialog
//           padding: const EdgeInsets.all(16.0),
//           child: Column(
//             crossAxisAlignment: CrossAxisAlignment.start,
//             children: [
//               const Text(
//                 "About",
//                 style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
//               ),
//               const SizedBox(height: 16),
//               const Expanded(
//                 child: SingleChildScrollView(
//                   child: Text(
//                     "This application is designed to help students connect with tutors and schedule lessons. It provides tools for managing lessons, accessing course materials, and more. This content is a placeholder for the About section.",
//                     style: TextStyle(fontSize: 16),
//                   ),
//                 ),
//               ),
//               const SizedBox(height: 16),
//               Align(
//                 alignment: Alignment.bottomRight,
//                 child: ElevatedButton(
//                   onPressed: () {
//                     Navigator.pop(context);
//                   },
//                   child: const Text("Close"),
//                 ),
//               ),
//             ],
//           ),
//         ),
//       ),
//     );
//   }
//
//   // Function to navigate to another page
//   void navigateToNextPage(BuildContext context, String title) {
//     Navigator.push(
//       context,
//       MaterialPageRoute(
//         builder: (context) => Scaffold(
//           appBar: AppBar(
//             title: Text(title),
//           ),
//           body: Center(
//             child: Text(
//               "Welcome to the $title page!",
//               style: const TextStyle(fontSize: 24),
//             ),
//           ),
//         ),
//       ),
//     );
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     // Removed Scaffold, as this will be handled by MainPage
//     return SingleChildScrollView(
//       padding: const EdgeInsets.all(16.0),
//       child: Column(
//         crossAxisAlignment: CrossAxisAlignment.start,
//         children: [
//           // Use FutureBuilder to fetch user profile data
//           FutureBuilder<UserProfile>(
//             future: _settingsService.fetchUserProfile(),
//             builder: (context, snapshot) {
//               if (snapshot.connectionState == ConnectionState.waiting) {
//                 // Show loading indicator while data is loading
//                 return Center(child: CircularProgressIndicator());
//               } else if (snapshot.hasError) {
//                 // Show error message if something went wrong
//                 return Center(child: Text("Failed to load user profile."));
//               } else if (snapshot.hasData) {
//                 // Display the ProfileCard
//                 return ProfileCard(
//                   userProfile: snapshot.data!,
//                   onEditProfile: () {
//                     // Handle profile edit
//                     // For example, navigate to an Edit Profile page
//                   },
//                 );
//               } else {
//                 // If data is null
//                 return Center(child: Text("No user data available."));
//               }
//             },
//           ),
//           const SizedBox(height: 24),
//
//           // App Settings Section
//           const Text(
//             "App Settings",
//             style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
//           ),
//           const SizedBox(height: 16),
//           // Dark Mode Toggle
//           ListTile(
//             leading: const Icon(Icons.dark_mode),
//             title: const Text("Dark mode"),
//             trailing: Switch(
//               value: isDarkMode,
//               onChanged: (value) {
//                 setState(() {
//                   isDarkMode = value;
//                   // Optionally, update the app's theme here
//                 });
//               },
//             ),
//           ),
//           // Language Selection
//           ListTile(
//             leading: const Icon(Icons.language),
//             title: const Text("Language"),
//             trailing: DropdownButton<String>(
//               value: selectedLanguage,
//               items: languages.map((lang) {
//                 return DropdownMenuItem(
//                   value: lang["name"],
//                   child: Row(
//                     children: [
//                       Image.asset(lang["image"]!, width: 24, height: 24),
//                       const SizedBox(width: 8),
//                       Text(lang["name"]!),
//                     ],
//                   ),
//                 );
//               }).toList(),
//               onChanged: (value) {
//                 setState(() {
//                   selectedLanguage = value!;
//                   // Optionally, handle language change here
//                 });
//               },
//             ),
//           ),
//           const SizedBox(height: 24),
//
//           // Account Section
//           const Text(
//             "Account",
//             style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
//           ),
//           const SizedBox(height: 16),
//           // Become a Tutor
//           ListTile(
//             leading: const Icon(Icons.school),
//             title: const Text("Become a tutor"),
//             trailing: const Icon(Icons.arrow_forward),
//             onTap: () => navigateToNextPage(context, "Become a Tutor"),
//           ),
//           // Payment (Replaced Wallet)
//           ListTile(
//             leading: const Icon(Icons.payment), // Changed icon to payment
//             title: const Text("Payment"), // Changed title to Payment
//             trailing: const Icon(Icons.arrow_forward),
//             onTap: () {
//               // Navigate to PaymentPage
//               Navigator.push(
//                 context,
//                 MaterialPageRoute(builder: (context) => ActiveSubscriptionPage(subscriptionType: "Monthly", purchaseDate: DateTime.now())),
//               );
//             },
//           ),
//           // Privacy Policy
//           ListTile(
//             leading: const Icon(Icons.lock),
//             title: const Text("Privacy Policy"),
//             trailing: const Icon(Icons.arrow_forward),
//             onTap: () => showTermsPrivacyDialog(
//               context,
//               "Privacy Policy",
//               "This is the Privacy Policy content. Here you can explain how user data is handled. This is placeholder text for demonstration purposes.",
//             ),
//           ),
//           // Terms and Conditions
//           ListTile(
//             leading: const Icon(Icons.description),
//             title: const Text("Terms and Conditions"),
//             trailing: const Icon(Icons.arrow_forward),
//             onTap: () => showTermsPrivacyDialog(
//               context,
//               "Terms and Conditions",
//               "These are the Terms and Conditions. Users must agree to these terms to use the app. This is placeholder text for demonstration purposes.",
//             ),
//           ),
//           // About
//           ListTile(
//             leading: const Icon(Icons.info),
//             title: const Text("About"),
//             trailing: const Icon(Icons.arrow_forward),
//             onTap: () => showAboutDialog(context),
//           ),
//         ],
//       ),
//     );
//   }
// }

import 'package:flutter/material.dart';
import 'package:tutor_nest/pages/Student/active_payment_page_content.dart';
import 'package:tutor_nest/pages/Student/become_a_tutor.dart';
import '../../services/settings_service.dart'; // Import the service
import '../../widgets/profile_card.dart'; // Import the ProfileCard widget
import '../../models/user_profile.dart'; // Import the UserProfile model
import 'payment_page_content.dart'; // Import the PaymentPage
import 'lesson_report_page.dart'; // Import the LessonReportPage
import 'package:tutor_nest/pages/Student/become_a_tutor.dart';

class SettingsPageContent extends StatefulWidget {
  @override
  _SettingsPageContentState createState() => _SettingsPageContentState();
}

class _SettingsPageContentState extends State<SettingsPageContent> {
  final SettingsService _settingsService = SettingsService(); // Instantiate the service

  bool isDarkMode = false;
  String selectedLanguage = "English";

  final List<Map<String, String>> languages = [
    {"name": "English", "image": "assets/us_flag.png"},
    {"name": "Nepali", "image": "assets/np_flag.png"},
    {"name": "Spanish", "image": "assets/sp_flag.png"},
  ];

  // Function to show Terms/Privacy dialog
  void showTermsPrivacyDialog(BuildContext context, String title, String content) {
    showDialog(
      context: context,
      builder: (context) => Dialog(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
        child: Container(
          // Cover 80% of the screen height
          height: MediaQuery.of(context).size.height * 0.8,
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Title
              Text(
                title,
                style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 16),
              // Content
              Expanded(
                child: SingleChildScrollView(
                  child: Text(
                    content,
                    style: const TextStyle(fontSize: 16),
                  ),
                ),
              ),
              const SizedBox(height: 16),
              // Buttons
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  TextButton(
                    onPressed: () {
                      // Handle "Don't Accept" action
                      Navigator.pop(context);
                      // You can add additional logic here if needed
                    },
                    child: const Text("Don't Accept"),
                  ),
                  const SizedBox(width: 8),
                  ElevatedButton(
                    onPressed: () {
                      // Handle "Accept" action
                      Navigator.pop(context);
                      // You can add additional logic here if needed
                    },
                    child: const Text("Accept"),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }

  // Function to show the About dialog
  void showAboutDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (context) => Dialog(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
        child: Container(
          height: MediaQuery.of(context).size.height * 0.5, // 50% height for About dialog
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text(
                "About",
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 16),
              const Expanded(
                child: SingleChildScrollView(
                  child: Text(
                    "This application is designed to help students connect with tutors and schedule lessons. It provides tools for managing lessons, accessing course materials, and more. This content is a placeholder for the About section.",
                    style: TextStyle(fontSize: 16),
                  ),
                ),
              ),
              const SizedBox(height: 16),
              Align(
                alignment: Alignment.bottomRight,
                child: ElevatedButton(
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  child: const Text("Close"),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  // Function to navigate to another page
  void navigateToNextPage(BuildContext context, String title) {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => Scaffold(
          appBar: AppBar(
            title: Text(title),
          ),
          body: Center(
            child: Text(
              "Welcome to the $title page!",
              style: const TextStyle(fontSize: 24),
            ),
          ),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    // Removed Scaffold, as this will be handled by MainPage
    return SingleChildScrollView(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Use FutureBuilder to fetch user profile data
          FutureBuilder<UserProfile>(
            future: _settingsService.fetchUserProfile(),
            builder: (context, snapshot) {
              if (snapshot.connectionState == ConnectionState.waiting) {
                // Show loading indicator while data is loading
                return Center(child: CircularProgressIndicator());
              } else if (snapshot.hasError) {
                // Show error message if something went wrong
                return Center(child: Text("Failed to load user profile."));
              } else if (snapshot.hasData) {
                // Display the ProfileCard
                return ProfileCard(
                  userProfile: snapshot.data!,
                  onEditProfile: () {
                    // Handle profile edit
                    // For example, navigate to an Edit Profile page
                  },
                );
              } else {
                // If data is null
                return Center(child: Text("No user data available."));
              }
            },
          ),
          const SizedBox(height: 24),

          // App Settings Section
          const Text(
            "App Settings",
            style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 16),
          // Dark Mode Toggle
          ListTile(
            leading: const Icon(Icons.dark_mode),
            title: const Text("Dark mode"),
            trailing: Switch(
              value: isDarkMode,
              onChanged: (value) {
                setState(() {
                  isDarkMode = value;
                  // Optionally, update the app's theme here
                });
              },
            ),
          ),
          // Language Selection
          ListTile(
            leading: const Icon(Icons.language),
            title: const Text("Language"),
            trailing: DropdownButton<String>(
              value: selectedLanguage,
              items: languages.map((lang) {
                return DropdownMenuItem(
                  value: lang["name"],
                  child: Row(
                    children: [
                      Image.asset(lang["image"]!, width: 24, height: 24),
                      const SizedBox(width: 8),
                      Text(lang["name"]!),
                    ],
                  ),
                );
              }).toList(),
              onChanged: (value) {
                setState(() {
                  selectedLanguage = value!;
                  // Optionally, handle language change here
                });
              },
            ),
          ),
          const SizedBox(height: 24),

          // Account Section
          const Text(
            "Account",
            style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 16),
          // Become a Tutor
          ListTile(
            leading: const Icon(Icons.school),
            title: const Text("Become a tutor"),
            trailing: const Icon(Icons.arrow_forward),
            onTap: () {
              // Navigate to PaymentPage
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => BecomeATutorPage(),
                )
                );
              },
          ),
          // Payment (Replaced Wallet)
          ListTile(
            leading: const Icon(Icons.payment), // Changed icon to payment
            title: const Text("Payment"), // Changed title to Payment
            trailing: const Icon(Icons.arrow_forward),
            onTap: () {
              // Navigate to PaymentPage
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => ActiveSubscriptionPage(subscriptionType: "Monthly", purchaseDate: DateTime.now())),
              );
            },
          ),
          // **Lesson Report**
          ListTile(
            leading: const Icon(Icons.report),
            title: const Text("Lesson Report"),
            trailing: const Icon(Icons.arrow_forward),
            onTap: () {
              // Navigate to LessonReportPage
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => LessonReportPage(isTutor: false)),
              );
            },
          ),
          // Privacy Policy
          ListTile(
            leading: const Icon(Icons.lock),
            title: const Text("Privacy Policy"),
            trailing: const Icon(Icons.arrow_forward),
            onTap: () => showTermsPrivacyDialog(
              context,
              "Privacy Policy",
              "This is the Privacy Policy content. Here you can explain how user data is handled. This is placeholder text for demonstration purposes.",
            ),
          ),
          // Terms and Conditions
          ListTile(
            leading: const Icon(Icons.description),
            title: const Text("Terms and Conditions"),
            trailing: const Icon(Icons.arrow_forward),
            onTap: () => showTermsPrivacyDialog(
              context,
              "Terms and Conditions",
              "These are the Terms and Conditions. Users must agree to these terms to use the app. This is placeholder text for demonstration purposes.",
            ),
          ),
          // About
          ListTile(
            leading: const Icon(Icons.info),
            title: const Text("About"),
            trailing: const Icon(Icons.arrow_forward),
            onTap: () => showAboutDialog(context),
          ),
        ],
      ),
    );
  }
}

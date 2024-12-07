// import 'package:flutter/material.dart';
// import 'package:tutor_nest/pages/home_page_content.dart';
// import 'package:tutor_nest/pages/schedule_page_content.dart'; // Import SchedulePage if needed
//
// class HistoryPage extends StatefulWidget {
//   @override
//   _HistoryPageState createState() => _HistoryPageState();
// }
//
// class _HistoryPageState extends State<HistoryPage> {
//   final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();
//
//   Map<String, String> selectedLanguage = {
//     "name": "English",
//     "image": "assets/us_flag.png"
//   };
//
//   int _currentIndex = 2; // Default to "History" tab
//
//   final List<Map<String, String>> languages = [
//     {"name": "English", "image": "assets/us_flag.png"},
//     {"name": "Nepali", "image": "assets/np_flag.png"},
//     {"name": "Spanish", "image": "assets/sp_flag.png"},
//   ];
//
//   // Fetch history data from backend (Commented out for now)
//   // Future<List<Map<String, dynamic>>> fetchHistory() async {
//   //   // Fetch data from backend
//   // }
//
//   // Dummy history data
//   Future<List<Map<String, dynamic>>> fetchHistory() async {
//     // Simulate delay
//     await Future.delayed(Duration(seconds: 1));
//     // Dummy data with image URLs from Firebase Storage
//     return [
//       {
//         "name": "Dipesh Maharjan",
//         "rating": 5,
//         "date": "Saturday December 31 2022",
//         "time": "09:00 - 10:00",
//         "feedback": "Great lesson, learned a lot!",
//         "image":
//         "https://firebasestorage.googleapis.com/v0/b/your-project-id.appspot.com/o/profile_pictures%2Fdipesh_maharjan.jpg?alt=media",
//       },
//       {
//         "name": "Dinesh Adhikari",
//         "rating": 4,
//         "date": "Friday December 30 2022",
//         "time": "14:00 - 15:00",
//         "feedback": "Very helpful session.",
//         "image":
//         "https://firebasestorage.googleapis.com/v0/b/your-project-id.appspot.com/o/profile_pictures%2Fdinesh_adhikari.jpg?alt=media",
//       },
//     ];
//   }
//
//   void selectLanguage(Map<String, String> language) {
//     setState(() {
//       selectedLanguage = language; // Update the selected language
//     });
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       key: _scaffoldKey,
//       appBar: PreferredSize(
//         preferredSize: const Size.fromHeight(60),
//         child: AppBar(
//           automaticallyImplyLeading: false,
//           backgroundColor: Colors.white,
//           elevation: 0,
//           title: Row(
//             children: [
//               Image.asset(
//                 'assets/education_logo.png', // Replace with your logo path
//                 height: 70,
//               ),
//             ],
//           ),
//           actions: [
//             PopupMenuButton<Map<String, String>>(
//               icon: Image.asset(
//                 selectedLanguage['image']!, // Dynamically display flag icon
//                 height: 24,
//                 width: 24,
//               ),
//               onSelected: (Map<String, String> language) {
//                 selectLanguage(language);
//               },
//               itemBuilder: (BuildContext context) {
//                 return languages.map((language) {
//                   return PopupMenuItem<Map<String, String>>(
//                     value: language,
//                     child: Row(
//                       children: [
//                         Image.asset(
//                           language['image']!,
//                           width: 24,
//                           height: 24,
//                         ),
//                         const SizedBox(width: 8),
//                         Text(language['name']!),
//                       ],
//                     ),
//                   );
//                 }).toList();
//               },
//             ),
//             IconButton(
//               icon: const Icon(Icons.menu, color: Colors.black, size: 28),
//               onPressed: () {
//                 _scaffoldKey.currentState?.openEndDrawer();
//               },
//             ),
//           ],
//         ),
//       ),
//       endDrawer: Drawer(
//         child: ListView(
//           children: [
//             DrawerHeader(
//               decoration: const BoxDecoration(color: Colors.blue),
//               child: Center(
//                 child: Text(
//                   'Menu',
//                   style: TextStyle(color: Colors.white, fontSize: 24),
//                 ),
//               ),
//             ),
//             ListTile(
//               leading: Icon(Icons.home),
//               title: Text("Home"),
//               selected: _currentIndex == 0,
//               selectedTileColor: Colors.blue[100],
//               onTap: () {
//                 setState(() {
//                   _currentIndex = 0;
//                 });
//                 Navigator.pop(context);
//                 Navigator.push(
//                     context, MaterialPageRoute(builder: (context) => HomePage()));
//               },
//             ),
//             ListTile(
//               leading: Icon(Icons.schedule),
//               title: Text("Schedule"),
//               selected: _currentIndex == 1,
//               selectedTileColor: Colors.blue[100],
//               onTap: () {
//                 setState(() {
//                   _currentIndex = 1;
//                 });
//                 Navigator.pop(context);
//                 Navigator.push(
//                     context, MaterialPageRoute(builder: (context) => SchedulePage()));
//               },
//             ),
//             ListTile(
//               leading: Icon(Icons.history),
//               title: Text("History"),
//               selected: _currentIndex == 2,
//               selectedTileColor: Colors.blue[100],
//               onTap: () {
//                 setState(() {
//                   _currentIndex = 2;
//                 });
//                 Navigator.pop(context);
//                 // Already on HistoryPage, do nothing
//               },
//             ),
//             ListTile(
//               leading: Icon(Icons.menu_book),
//               title: Text("Courses"),
//               selected: _currentIndex == 3,
//               selectedTileColor: Colors.blue[100],
//               onTap: () {
//                 setState(() {
//                   _currentIndex = 3;
//                 });
//                 Navigator.pop(context);
//                 // Navigate to CoursesPage
//               },
//             ),
//             ListTile(
//               leading: Icon(Icons.settings),
//               title: Text("Settings"),
//               selected: _currentIndex == 4,
//               selectedTileColor: Colors.blue[100],
//               onTap: () {
//                 setState(() {
//                   _currentIndex = 4;
//                 });
//                 Navigator.pop(context);
//                 // Navigate to SettingsPage
//               },
//             ),
//             const Divider(),
//             ListTile(
//               leading: const Icon(Icons.logout, color: Colors.red),
//               title: const Text("Logout", style: TextStyle(color: Colors.red)),
//               onTap: () {
//                 // Handle logout
//               },
//             ),
//           ],
//         ),
//       ),
//       body: FutureBuilder<List<Map<String, dynamic>>>(
//         future: fetchHistory(),
//         builder: (context, snapshot) {
//           if (snapshot.connectionState == ConnectionState.waiting) {
//             // Show a loading indicator while the data is loading
//             return Center(child: CircularProgressIndicator());
//           } else if (snapshot.hasError) {
//             // Show an error message if something went wrong
//             return Center(child: Text("Failed to load history."));
//           } else if (snapshot.hasData && snapshot.data!.isNotEmpty) {
//             // Display the history items
//             return Padding(
//               padding: const EdgeInsets.all(16.0),
//               child: Column(
//                 crossAxisAlignment: CrossAxisAlignment.start,
//                 children: [
//                   // History Title and Icon
//                   Row(
//                     children: [
//                       Icon(Icons.history, size: 50, color: Colors.blue),
//                       const SizedBox(width: 16),
//                       const Text(
//                         "History",
//                         style: TextStyle(
//                           fontSize: 24,
//                           fontWeight: FontWeight.bold,
//                         ),
//                       ),
//                     ],
//                   ),
//                   const SizedBox(height: 16),
//                   const Text(
//                     "Here are your past lessons. You can review feedback and ratings.",
//                     style: TextStyle(fontSize: 16),
//                   ),
//                   const SizedBox(height: 16),
//                   // History List
//                   Expanded(
//                     child: ListView.builder(
//                       itemCount: snapshot.data!.length,
//                       itemBuilder: (context, index) {
//                         final data = snapshot.data![index];
//                         return HistoryCard(data: data);
//                       },
//                     ),
//                   ),
//                 ],
//               ),
//             );
//           } else {
//             // If there is no history
//             return Center(child: Text("No history available."));
//           }
//         },
//       ),
//       bottomNavigationBar: BottomNavigationBar(
//         items: [
//           BottomNavigationBarItem(
//             icon: Icon(Icons.home),
//             label: "Home",
//           ),
//           BottomNavigationBarItem(
//             icon: Icon(Icons.schedule),
//             label: "Schedule",
//           ),
//           BottomNavigationBarItem(
//             icon: Icon(Icons.history),
//             label: "History",
//           ),
//           BottomNavigationBarItem(
//             icon: Icon(Icons.menu_book),
//             label: "Courses",
//           ),
//           BottomNavigationBarItem(
//             icon: Icon(Icons.settings),
//             label: "Settings",
//           ),
//         ],
//         currentIndex: _currentIndex,
//         selectedItemColor: Colors.blue,
//         unselectedItemColor: Colors.grey,
//         selectedLabelStyle:
//         const TextStyle(fontSize: 12, fontWeight: FontWeight.bold),
//         unselectedLabelStyle: const TextStyle(fontSize: 12),
//         iconSize: 24,
//         type: BottomNavigationBarType.fixed,
//         showUnselectedLabels: true,
//         onTap: (index) {
//           if (index != _currentIndex) {
//             setState(() {
//               _currentIndex = index;
//             });
//             if (index == 0) {
//               Navigator.push(
//                 context,
//                 MaterialPageRoute(builder: (context) => HomePage()),
//               );
//             } else if (index == 1) {
//               Navigator.push(
//                 context,
//                 MaterialPageRoute(builder: (context) => SchedulePage()),
//               );
//             } else if (index == 2) {
//               // Already on HistoryPage, do nothing
//             }
//             // Add navigation for other pages when available
//           }
//         },
//       ),
//     );
//   }
// }
//
// class HistoryCard extends StatelessWidget {
//   final Map<String, dynamic> data;
//
//   const HistoryCard({Key? key, required this.data}) : super(key: key);
//
//   @override
//   Widget build(BuildContext context) {
//     return Card(
//       margin: const EdgeInsets.symmetric(vertical: 8),
//       child: Padding(
//         padding: const EdgeInsets.all(16.0),
//         child: Column(
//           crossAxisAlignment: CrossAxisAlignment.start,
//           children: [
//             Row(
//               children: [
//                 CircleAvatar(
//                   radius: 20,
//                   backgroundImage: NetworkImage(data['image']), // Load image
//                   backgroundColor: Colors.grey,
//                   child: data['image'] == ""
//                       ? Icon(
//                     Icons.person,
//                     color: Colors.white,
//                   )
//                       : null,
//                 ),
//                 const SizedBox(width: 8),
//                 Text(
//                   data['name'],
//                   style: const TextStyle(fontWeight: FontWeight.bold),
//                 ),
//                 const Spacer(),
//                 Text(
//                   "⭐ ${data['rating']}",
//                   style: const TextStyle(fontWeight: FontWeight.bold),
//                 ),
//               ],
//             ),
//             const SizedBox(height: 8),
//             Text(
//               data['date'],
//               style: const TextStyle(fontWeight: FontWeight.bold),
//             ),
//             Text(data['time']),
//             const SizedBox(height: 8),
//             const Text(
//               "Feedback:",
//               style: TextStyle(fontWeight: FontWeight.bold),
//             ),
//             Text(data['feedback']),
//             // Optionally, you can add buttons for further actions
//           ],
//         ),
//       ),
//     );
//   }
// }

// import 'package:flutter/material.dart';
// import 'package:tutor_nest/pages/home_page_content.dart';
// import 'package:tutor_nest/pages/schedule_page_content.dart'; // Import SchedulePage if needed
//
// class HistoryPage extends StatefulWidget {
//   @override
//   _HistoryPageState createState() => _HistoryPageState();
// }
//
// class _HistoryPageState extends State<HistoryPage> {
//   final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();
//
//   Map<String, String> selectedLanguage = {
//     "name": "English",
//     "image": "assets/us_flag.png"
//   };
//
//   int _currentIndex = 2; // Default to "History" tab
//
//   final List<Map<String, String>> languages = [
//     {"name": "English", "image": "assets/us_flag.png"},
//     {"name": "Nepali", "image": "assets/np_flag.png"},
//     {"name": "Spanish", "image": "assets/sp_flag.png"},
//   ];
//
//   void selectLanguage(Map<String, String> language) {
//     setState(() {
//       selectedLanguage = language; // Update the selected language
//     });
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       key: _scaffoldKey,
//       appBar: PreferredSize(
//         preferredSize: const Size.fromHeight(60),
//         child: AppBar(
//           automaticallyImplyLeading: false,
//           backgroundColor: Colors.white,
//           elevation: 0,
//           title: Row(
//             children: [
//               Image.asset(
//                 'assets/education_logo.png', // Replace with your logo path
//                 height: 70,
//               ),
//             ],
//           ),
//           actions: [
//             PopupMenuButton<Map<String, String>>(
//               icon: Image.asset(
//                 selectedLanguage['image']!, // Dynamically display flag icon
//                 height: 24,
//                 width: 24,
//               ),
//               onSelected: (Map<String, String> language) {
//                 selectLanguage(language);
//               },
//               itemBuilder: (BuildContext context) {
//                 return languages.map((language) {
//                   return PopupMenuItem<Map<String, String>>(
//                     value: language,
//                     child: Row(
//                       children: [
//                         Image.asset(
//                           language['image']!,
//                           width: 24,
//                           height: 24,
//                         ),
//                         const SizedBox(width: 8),
//                         Text(language['name']!),
//                       ],
//                     ),
//                   );
//                 }).toList();
//               },
//             ),
//             IconButton(
//               icon: const Icon(Icons.menu, color: Colors.black, size: 28),
//               onPressed: () {
//                 _scaffoldKey.currentState?.openEndDrawer();
//               },
//             ),
//           ],
//         ),
//       ),
//       endDrawer: Drawer(
//         child: ListView(
//           children: [
//             DrawerHeader(
//               decoration: const BoxDecoration(color: Colors.blue),
//               child: Center(
//                 child: Text(
//                   'Menu',
//                   style: TextStyle(color: Colors.white, fontSize: 24),
//                 ),
//               ),
//             ),
//             ListTile(
//               leading: Icon(Icons.home),
//               title: Text("Home"),
//               selected: _currentIndex == 0,
//               selectedTileColor: Colors.blue[100],
//               onTap: () {
//                 setState(() {
//                   _currentIndex = 0;
//                 });
//                 Navigator.pop(context);
//                 Navigator.push(
//                     context, MaterialPageRoute(builder: (context) => HomePage()));
//               },
//             ),
//             ListTile(
//               leading: Icon(Icons.schedule),
//               title: Text("Schedule"),
//               selected: _currentIndex == 1,
//               selectedTileColor: Colors.blue[100],
//               onTap: () {
//                 setState(() {
//                   _currentIndex = 1;
//                 });
//                 Navigator.pop(context);
//                 Navigator.push(
//                     context, MaterialPageRoute(builder: (context) => SchedulePage()));
//               },
//             ),
//             ListTile(
//               leading: Icon(Icons.history),
//               title: Text("History"),
//               selected: _currentIndex == 2,
//               selectedTileColor: Colors.blue[100],
//               onTap: () {
//                 setState(() {
//                   _currentIndex = 2;
//                 });
//                 Navigator.pop(context);
//                 // Already on HistoryPage, do nothing
//               },
//             ),
//             ListTile(
//               leading: Icon(Icons.menu_book),
//               title: Text("Courses"),
//               selected: _currentIndex == 3,
//               selectedTileColor: Colors.blue[100],
//               onTap: () {
//                 setState(() {
//                   _currentIndex = 3;
//                 });
//                 Navigator.pop(context);
//                 // Navigate to CoursesPage
//               },
//             ),
//             ListTile(
//               leading: Icon(Icons.settings),
//               title: Text("Settings"),
//               selected: _currentIndex == 4,
//               selectedTileColor: Colors.blue[100],
//               onTap: () {
//                 setState(() {
//                   _currentIndex = 4;
//                 });
//                 Navigator.pop(context);
//                 // Navigate to SettingsPage
//               },
//             ),
//             const Divider(),
//             ListTile(
//               leading: const Icon(Icons.logout, color: Colors.red),
//               title: const Text("Logout", style: TextStyle(color: Colors.red)),
//               onTap: () {
//                 // Handle logout
//               },
//             ),
//           ],
//         ),
//       ),
//       body: Center(
//         child: Text(
//           "History Page Content Goes Here",
//           style: TextStyle(fontSize: 18, color: Colors.grey),
//         ),
//       ),
//       bottomNavigationBar: BottomNavigationBar(
//         items: [
//           BottomNavigationBarItem(
//             icon: Icon(Icons.home),
//             label: "Home",
//           ),
//           BottomNavigationBarItem(
//             icon: Icon(Icons.schedule),
//             label: "Schedule",
//           ),
//           BottomNavigationBarItem(
//             icon: Icon(Icons.history),
//             label: "History",
//           ),
//           BottomNavigationBarItem(
//             icon: Icon(Icons.menu_book),
//             label: "Courses",
//           ),
//           BottomNavigationBarItem(
//             icon: Icon(Icons.settings),
//             label: "Settings",
//           ),
//         ],
//         currentIndex: _currentIndex,
//         selectedItemColor: Colors.blue,
//         unselectedItemColor: Colors.grey,
//         selectedLabelStyle:
//         const TextStyle(fontSize: 12, fontWeight: FontWeight.bold),
//         unselectedLabelStyle: const TextStyle(fontSize: 12),
//         iconSize: 24,
//         type: BottomNavigationBarType.fixed,
//         showUnselectedLabels: true,
//         onTap: (index) {
//           if (index != _currentIndex) {
//             setState(() {
//               _currentIndex = index;
//             });
//             if (index == 0) {
//               Navigator.push(
//                 context,
//                 MaterialPageRoute(builder: (context) => HomePage()),
//               );
//             } else if (index == 1) {
//               Navigator.push(
//                 context,
//                 MaterialPageRoute(builder: (context) => SchedulePage()),
//               );
//             } else if (index == 2) {
//               // Already on HistoryPage, do nothing
//             }
//             // Add navigation for other pages when available
//           }
//         },
//       ),
//     );
//   }
// }



// import 'package:flutter/material.dart';
// import 'package:tutor_nest/pages/courses_page_content.dart';
// // import 'package:cloud_firestore/cloud_firestore.dart';
// // import 'package:firebase_core/firebase_core.dart';
// import 'package:tutor_nest/pages/home_page_content.dart';
// import 'package:tutor_nest/pages/schedule_page_content.dart'; // Import SchedulePage if needed
//
// class HistoryPageContent extends StatefulWidget {
//   @override
//   _HistoryPageContentState createState() => _HistoryPageContentState();
// }
//
// class _HistoryPageContentState extends State<HistoryPageContent> {
//   final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();
//
//   Map<String, String> selectedLanguage = {
//     "name": "English",
//     "image": "assets/us_flag.png"
//   };
//
//   int _currentIndex = 2; // Default to "History" tab
//
//   final List<Map<String, String>> languages = [
//     {"name": "English", "image": "assets/us_flag.png"},
//     {"name": "Nepali", "image": "assets/np_flag.png"},
//     {"name": "Spanish", "image": "assets/sp_flag.png"},
//   ];
//
//   // Fetch history data from backend (Commented out for now)
//   // Future<List<Map<String, dynamic>>> fetchHistory() async {
//   //   // Initialize Firebase if not already initialized
//   //   // WidgetsFlutterBinding.ensureInitialized();
//   //   // await Firebase.initializeApp();
//   //   // QuerySnapshot snapshot = await FirebaseFirestore.instance.collection('history').get();
//   //   // return snapshot.docs.map((doc) {
//   //   //   return {
//   //   //     "name": doc['name'],
//   //   //     "rating": doc['rating'],
//   //   //     "date": doc['date'],
//   //   //     "time": doc['time'],
//   //   //     "feedback": doc['feedback'],
//   //   //     "image": doc['image'],
//   //   //   };
//   //   // }).toList();
//   // }
//
//   // Dummy history data
//   Future<List<Map<String, dynamic>>> fetchHistory() async {
//     // Simulate delay
//     await Future.delayed(Duration(seconds: 1));
//     // Dummy data with image URLs from Firebase Storage
//     return [
//       {
//         "name": "Dipesh Maharjan",
//         "rating": 5,
//         "date": "Saturday December 31 2022",
//         "time": "09:00 - 10:00",
//         "feedback": "Great lesson, learned a lot!",
//         "image":
//         "https://firebasestorage.googleapis.com/v0/b/your-project-id.appspot.com/o/profile_pictures%2Fdipesh_maharjan.jpg?alt=media",
//       },
//       {
//         "name": "Dinesh Adhikari",
//         "rating": 4,
//         "date": "Friday December 30 2022",
//         "time": "14:00 - 15:00",
//         "feedback": "Very helpful session.",
//         "image":
//         "https://firebasestorage.googleapis.com/v0/b/your-project-id.appspot.com/o/profile_pictures%2Fdinesh_adhikari.jpg?alt=media",
//       },
//     ];
//   }
//
//   void selectLanguage(Map<String, String> language) {
//     setState(() {
//       selectedLanguage = language; // Update the selected language
//     });
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       key: _scaffoldKey,
//       appBar: PreferredSize(
//         preferredSize: const Size.fromHeight(60),
//         child: AppBar(
//           automaticallyImplyLeading: false,
//           backgroundColor: Colors.white,
//           elevation: 0,
//           title: Row(
//             children: [
//               Image.asset(
//                 'assets/education_logo.png', // Replace with your logo path
//                 height: 70,
//               ),
//             ],
//           ),
//           actions: [
//             PopupMenuButton<Map<String, String>>(
//               icon: Image.asset(
//                 selectedLanguage['image']!, // Dynamically display flag icon
//                 height: 24,
//                 width: 24,
//               ),
//               onSelected: (Map<String, String> language) {
//                 selectLanguage(language);
//               },
//               itemBuilder: (BuildContext context) {
//                 return languages.map((language) {
//                   return PopupMenuItem<Map<String, String>>(
//                     value: language,
//                     child: Row(
//                       children: [
//                         Image.asset(
//                           language['image']!,
//                           width: 24,
//                           height: 24,
//                         ),
//                         const SizedBox(width: 8),
//                         Text(language['name']!),
//                       ],
//                     ),
//                   );
//                 }).toList();
//               },
//             ),
//             IconButton(
//               icon: const Icon(Icons.menu, color: Colors.black, size: 28),
//               onPressed: () {
//                 _scaffoldKey.currentState?.openEndDrawer();
//               },
//             ),
//           ],
//         ),
//       ),
//       endDrawer: Drawer(
//         child: ListView(
//           children: [
//             DrawerHeader(
//               decoration: const BoxDecoration(color: Colors.blue),
//               child: Center(
//                 child: Text(
//                   'Menu',
//                   style: TextStyle(color: Colors.white, fontSize: 24),
//                 ),
//               ),
//             ),
//             ListTile(
//               leading: Icon(Icons.home),
//               title: Text("Home"),
//               selected: _currentIndex == 0,
//               selectedTileColor: Colors.blue[100],
//               onTap: () {
//                 setState(() {
//                   _currentIndex = 0;
//                 });
//                 Navigator.pop(context);
//                 Navigator.push(
//                     context, MaterialPageRoute(builder: (context) => HomePageContent()));
//               },
//             ),
//             ListTile(
//               leading: Icon(Icons.schedule),
//               title: Text("Schedule"),
//               selected: _currentIndex == 1,
//               selectedTileColor: Colors.blue[100],
//               onTap: () {
//                 setState(() {
//                   _currentIndex = 1;
//                 });
//                 Navigator.pop(context);
//                 Navigator.push(
//                     context, MaterialPageRoute(builder: (context) => SchedulePageContent()));
//               },
//             ),
//             ListTile(
//               leading: Icon(Icons.history),
//               title: Text("History"),
//               selected: _currentIndex == 2,
//               selectedTileColor: Colors.blue[100],
//               onTap: () {
//                 setState(() {
//                   _currentIndex = 2;
//                 });
//                 Navigator.pop(context);
//                 // Already on HistoryPage, do nothing
//               },
//             ),
//             ListTile(
//               leading: Icon(Icons.menu_book),
//               title: Text("Courses"),
//               selected: _currentIndex == 3,
//               selectedTileColor: Colors.blue[100],
//               onTap: () {
//                 setState(() {
//                   _currentIndex = 3;
//                 });
//                 Navigator.pop(context);
//                 Navigator.push(
//                     context, MaterialPageRoute(builder: (context) => CoursesPageContent()));
//                 // Navigate to CoursesPage
//               },
//             ),
//             ListTile(
//               leading: Icon(Icons.settings),
//               title: Text("Settings"),
//               selected: _currentIndex == 4,
//               selectedTileColor: Colors.blue[100],
//               onTap: () {
//                 setState(() {
//                   _currentIndex = 4;
//                 });
//                 Navigator.pop(context);
//                 // Navigate to SettingsPage
//               },
//             ),
//             const Divider(),
//             ListTile(
//               leading: const Icon(Icons.logout, color: Colors.red),
//               title: const Text("Logout", style: TextStyle(color: Colors.red)),
//               onTap: () {
//                 // Handle logout
//               },
//             ),
//           ],
//         ),
//       ),
//       body: FutureBuilder<List<Map<String, dynamic>>>(
//         future: fetchHistory(),
//         builder: (context, snapshot) {
//           if (snapshot.connectionState == ConnectionState.waiting) {
//             // Show a loading indicator while the data is loading
//             return Center(child: CircularProgressIndicator());
//           } else if (snapshot.hasError) {
//             // Show an error message if something went wrong
//             return Center(child: Text("Failed to load history."));
//           } else if (snapshot.hasData && snapshot.data!.isNotEmpty) {
//             // Display the history items
//             return Padding(
//               padding: const EdgeInsets.all(16.0),
//               child: Column(
//                 crossAxisAlignment: CrossAxisAlignment.start,
//                 children: [
//                   // History Title and Icon
//                   Row(
//                     children: [
//                       Icon(Icons.history, size: 50, color: Colors.blue),
//                       const SizedBox(width: 16),
//                       const Text(
//                         "History",
//                         style: TextStyle(
//                           fontSize: 24,
//                           fontWeight: FontWeight.bold,
//                         ),
//                       ),
//                     ],
//                   ),
//                   const SizedBox(height: 16),
//                   const Text(
//                     "Here are your past lessons. You can review feedback and ratings.",
//                     style: TextStyle(fontSize: 16),
//                   ),
//                   const SizedBox(height: 16),
//                   // History List
//                   Expanded(
//                     child: ListView.builder(
//                       itemCount: snapshot.data!.length,
//                       itemBuilder: (context, index) {
//                         final data = snapshot.data![index];
//                         return HistoryCard(data: data);
//                       },
//                     ),
//                   ),
//                 ],
//               ),
//             );
//           } else {
//             // If there is no history
//             return Center(child: Text("No history available."));
//           }
//         },
//       ),
//       bottomNavigationBar: BottomNavigationBar(
//         items: [
//           BottomNavigationBarItem(
//             icon: Icon(Icons.home),
//             label: "Home",
//           ),
//           BottomNavigationBarItem(
//             icon: Icon(Icons.schedule),
//             label: "Schedule",
//           ),
//           BottomNavigationBarItem(
//             icon: Icon(Icons.history),
//             label: "History",
//           ),
//           BottomNavigationBarItem(
//             icon: Icon(Icons.menu_book),
//             label: "Courses",
//           ),
//           BottomNavigationBarItem(
//             icon: Icon(Icons.settings),
//             label: "Settings",
//           ),
//         ],
//         currentIndex: _currentIndex,
//         selectedItemColor: Colors.blue,
//         unselectedItemColor: Colors.grey,
//         selectedLabelStyle:
//         const TextStyle(fontSize: 12, fontWeight: FontWeight.bold),
//         unselectedLabelStyle: const TextStyle(fontSize: 12),
//         iconSize: 24,
//         type: BottomNavigationBarType.fixed,
//         showUnselectedLabels: true,
//         onTap: (index) {
//           if (index != _currentIndex) {
//             setState(() {
//               _currentIndex = index;
//             });
//             if (index == 0) {
//               Navigator.push(
//                 context,
//                 MaterialPageRoute(builder: (context) => HomePageContent()),
//               );
//             } else if (index == 1) {
//               Navigator.push(
//                 context,
//                 MaterialPageRoute(builder: (context) => SchedulePageContent()),
//               );
//             } else if (index == 2) {
//               // Already on HistoryPage, do nothing
//             }
//             else if (index == 3) {
//               Navigator.push(
//                 context,
//                 MaterialPageRoute(builder: (context) => CoursesPageContent()),
//               );
//             }
//             // Add navigation for other pages when available
//           }
//         },
//       ),
//     );
//   }
// }
//
// class HistoryCard extends StatelessWidget {
//   final Map<String, dynamic> data;
//
//   const HistoryCard({Key? key, required this.data}) : super(key: key);
//
//   @override
//   Widget build(BuildContext context) {
//     return Card(
//       margin: const EdgeInsets.symmetric(vertical: 8),
//       child: Padding(
//         padding: const EdgeInsets.all(16.0),
//         child: Column(
//           crossAxisAlignment: CrossAxisAlignment.start,
//           children: [
//             Row(
//               children: [
//                 CircleAvatar(
//                   radius: 20,
//                   backgroundImage: NetworkImage(data['image']), // Load image
//                   backgroundColor: Colors.grey,
//                   child: data['image'] == ""
//                       ? Icon(
//                     Icons.person,
//                     color: Colors.white,
//                   )
//                       : null,
//                 ),
//                 const SizedBox(width: 8),
//                 Text(
//                   data['name'],
//                   style: const TextStyle(fontWeight: FontWeight.bold),
//                 ),
//                 const Spacer(),
//                 Text(
//                   "⭐ ${data['rating']}",
//                   style: const TextStyle(fontWeight: FontWeight.bold),
//                 ),
//               ],
//             ),
//             const SizedBox(height: 8),
//             Text(
//               data['date'],
//               style: const TextStyle(fontWeight: FontWeight.bold),
//             ),
//             Text(data['time']),
//             const SizedBox(height: 8),
//             const Text(
//               "Feedback:",
//               style: TextStyle(fontWeight: FontWeight.bold),
//             ),
//             Text(data['feedback']),
//             // Optionally, you can add buttons for further actions
//           ],
//         ),
//       ),
//     );
//   }
// }

// // lib/pages/history_page_content.dart
// import 'package:flutter/material.dart';
// import '../services/history_service.dart'; // Import the service
// import '../widgets/student_history_card.dart';    // Import the HistoryCard widget
//
// class HistoryPageContent extends StatefulWidget {
//   @override
//   _HistoryPageContentState createState() => _HistoryPageContentState();
// }
//
// class _HistoryPageContentState extends State<HistoryPageContent> {
//   final HistoryService _historyService = HistoryService(); // Instantiate the service
//
//   @override
//   Widget build(BuildContext context) {
//     // Removed Scaffold and navigation elements
//     return FutureBuilder<List<Map<String, dynamic>>>(
//       future: _historyService.fetchHistory(),
//       builder: (context, snapshot) {
//         if (snapshot.connectionState == ConnectionState.waiting) {
//           // Show a loading indicator while the data is loading
//           return Center(child: CircularProgressIndicator());
//         } else if (snapshot.hasError) {
//           // Show an error message if something went wrong
//           return Center(child: Text("Failed to load history."));
//         } else if (snapshot.hasData && snapshot.data!.isNotEmpty) {
//           // Display the history items
//           return Padding(
//             padding: const EdgeInsets.all(16.0),
//             child: Column(
//               crossAxisAlignment: CrossAxisAlignment.start,
//               children: [
//                 // History Title and Icon
//                 Row(
//                   children: [
//                     Icon(Icons.history, size: 50, color: Colors.blue),
//                     const SizedBox(width: 16),
//                     const Text(
//                       "History",
//                       style: TextStyle(
//                         fontSize: 24,
//                         fontWeight: FontWeight.bold,
//                       ),
//                     ),
//                   ],
//                 ),
//                 const SizedBox(height: 16),
//                 const Text(
//                   "Here are your past lessons. You can review feedback and ratings.",
//                   style: TextStyle(fontSize: 16),
//                 ),
//                 const SizedBox(height: 16),
//                 // History List
//                 Expanded(
//                   child: ListView.builder(
//                     itemCount: snapshot.data!.length,
//                     itemBuilder: (context, index) {
//                       final data = snapshot.data![index];
//                       return HistoryCard(data: data);
//                     },
//                   ),
//                 ),
//               ],
//             ),
//           );
//         } else {
//           // If there is no history
//           return Center(child: Text("No history available."));
//         }
//       },
//     );
//   }
// }

// lib/pages/history_page_content.dart
import 'package:flutter/material.dart';
import '../../services/history_service.dart'; // Import the service
import '../../widgets/student_history_card.dart';    // Import the HistoryCard widget
import '../../models/history_item.dart';     // Import the HistoryItem model

class HistoryPageContent extends StatefulWidget {
  @override
  _HistoryPageContentState createState() => _HistoryPageContentState();
}

class _HistoryPageContentState extends State<HistoryPageContent> {
  final HistoryService _historyService = HistoryService(); // Instantiate the service

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<List<HistoryItem>>(
      future: _historyService.fetchHistory(),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          // Show a loading indicator while the data is loading
          return Center(child: CircularProgressIndicator());
        } else if (snapshot.hasError) {
          // Show an error message if something went wrong
          return Center(child: Text("Failed to load history."));
        } else if (snapshot.hasData && snapshot.data!.isNotEmpty) {
          // Display the history items
          return Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // History Title and Icon
                Row(
                  children: [
                    Icon(Icons.history, size: 50, color: Colors.blue),
                    const SizedBox(width: 16),
                    const Text(
                      "History",
                      style: TextStyle(
                        fontSize: 24,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 16),
                const Text(
                  "Here are your past lessons. You can review feedback and ratings.",
                  style: TextStyle(fontSize: 16),
                ),
                const SizedBox(height: 16),
                // History List
                Expanded(
                  child: ListView.builder(
                    itemCount: snapshot.data!.length,
                    itemBuilder: (context, index) {
                      final HistoryItem data = snapshot.data![index];
                      return HistoryCard(data: data);
                    },
                  ),
                ),
              ],
            ),
          );
        } else {
          // If there is no history
          return Center(child: Text("No history available."));
        }
      },
    );
  }
}

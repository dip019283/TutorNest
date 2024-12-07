// import 'package:flutter/material.dart';
// import 'package:firebase_core/firebase_core.dart';
// import 'package:cloud_firestore/cloud_firestore.dart';
//
// void main() async {
//   WidgetsFlutterBinding.ensureInitialized();
//   await Firebase.initializeApp();
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
//       home: SchedulePage(),
//     );
//   }
// }
//
// class SchedulePage extends StatelessWidget {
//   final CollectionReference bookings =
//   FirebaseFirestore.instance.collection('bookings');
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: const Text('Schedule'),
//       ),
//       body: Padding(
//         padding: const EdgeInsets.all(8.0),
//         child: Column(
//           crossAxisAlignment: CrossAxisAlignment.start,
//           children: [
//             const Text(
//               "Here are the list of booked lessons. You can track when the meeting starts, cancel the lesson before 2 hours.",
//               style: TextStyle(fontSize: 16),
//             ),
//             const SizedBox(height: 16),
//             Expanded(
//               child: FutureBuilder<QuerySnapshot>(
//                 future: bookings.get(),
//                 builder: (context, snapshot) {
//                   if (snapshot.connectionState == ConnectionState.waiting) {
//                     return const Center(child: CircularProgressIndicator());
//                   }
//
//                   if (!snapshot.hasData || snapshot.data!.docs.isEmpty) {
//                     return const Center(
//                       child: Text("No bookings found."),
//                     );
//                   }
//
//                   final docs = snapshot.data!.docs;
//
//                   return ListView.builder(
//                     itemCount: docs.length,
//                     itemBuilder: (context, index) {
//                       final data = docs[index].data() as Map<String, dynamic>;
//                       return BookingCard(data: data);
//                     },
//                   );
//                 },
//               ),
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }
//
// class BookingCard extends StatelessWidget {
//   final Map<String, dynamic> data;
//
//   const BookingCard({Key? key, required this.data}) : super(key: key);
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
//             // Display course details
//             Text(
//               "Course: ${data['course']['name']} (Page: ${data['course']['page']})",
//               style: const TextStyle(fontWeight: FontWeight.bold),
//             ),
//             Text("Description: ${data['course']['description']}"),
//             const SizedBox(height: 8),
//
//             // Display instructor details
//             Row(
//               children: [
//                 const CircleAvatar(
//                   radius: 20,
//                   backgroundImage: AssetImage('assets/user_placeholder.png'),
//                 ),
//                 const SizedBox(width: 8),
//                 Text(
//                   data['name'],
//                   style: const TextStyle(fontWeight: FontWeight.bold),
//                 ),
//                 const Spacer(),
//                 Text("⭐ ${data['rating']}"),
//               ],
//             ),
//             const SizedBox(height: 8),
//
//             // Display date and time
//             Text("Date: ${data['date']}"),
//             Text("Time: ${data['time']}"),
//             const SizedBox(height: 8),
//
//             // Display request
//             Text("Request: ${data['request']}"),
//             const SizedBox(height: 8),
//
//             // Action buttons
//             Row(
//               children: [
//                 ElevatedButton(
//                   onPressed: () {
//                     // Handle cancel logic
//                   },
//                   style: ElevatedButton.styleFrom(
//                     backgroundColor: Colors.red,
//                   ),
//                   child: const Text("Cancel"),
//                 ),
//                 const Spacer(),
//                 ElevatedButton.icon(
//                   onPressed: () {
//                     // Handle go to class logic
//                   },
//                   icon: const Icon(Icons.video_call),
//                   label: const Text("Go to class"),
//                 ),
//               ],
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }
//
//
//


// import 'package:flutter/material.dart';
//
// // Dummy model for schedule data
// class Schedule {
//   final String name;
//   final String page;
//   final String description;
//   final String photo;
//   final String instructorName;
//   final String rating;
//   final String date;
//   final String time;
//   final String request;
//
//   Schedule({
//     required this.name,
//     required this.page,
//     required this.description,
//     required this.photo,
//     required this.instructorName,
//     required this.rating,
//     required this.date,
//     required this.time,
//     required this.request,
//   });
// }
//
// class SchedulePage extends StatefulWidget {
//   @override
//   _SchedulePageState createState() => _SchedulePageState();
// }
//
// class _SchedulePageState extends State<SchedulePage> {
//   // Simulate fetching data with async/await
//   Future<List<Schedule>> fetchScheduleData() async {
//     await Future.delayed(Duration(seconds: 2)); // Simulate network delay
//
//     // Example of dummy data
//     return [
//       Schedule(
//         name: 'C#',
//         page: '30',
//         description: 'Comprehensive lesson tools',
//         photo: 'assets/profile_placeholder.png', // Replace with actual image asset path
//         instructorName: 'Dipesh Maharjan',
//         rating: '★★★★★',
//         date: 'Sunday, January 1, 2023',
//         time: '10:45 - 11:30',
//         request: 'Please bring necessary course materials for the class.',
//       ),
//       Schedule(
//         name: 'Python',
//         page: '45',
//         description: 'Advanced Python concepts',
//         photo: 'assets/profile_placeholder.png',
//         instructorName: 'Dinesh Adhikari',
//         rating: '★★★★',
//         date: 'Sunday, January 1, 2023',
//         time: '12:00 - 12:45',
//         request: 'Please maintain silence while teaching to better focus.',
//       ),
//     ];
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text("Schedule"),
//         centerTitle: true,
//       ),
//       body: FutureBuilder<List<Schedule>>(
//         future: fetchScheduleData(),
//         builder: (context, snapshot) {
//           if (snapshot.connectionState == ConnectionState.waiting) {
//             // Show a loading spinner while fetching data
//             return Center(child: CircularProgressIndicator());
//           } else if (snapshot.hasError) {
//             // Handle errors
//             return Center(child: Text("Error loading data."));
//           } else if (!snapshot.hasData || snapshot.data!.isEmpty) {
//             // Handle empty data
//             return Center(child: Text("No schedules available."));
//           } else {
//             // Build the page with fetched data
//             List<Schedule> schedules = snapshot.data!;
//             return SingleChildScrollView(
//               child: Padding(
//                 padding: const EdgeInsets.all(16.0),
//                 child: Column(
//                   crossAxisAlignment: CrossAxisAlignment.start,
//                   children: [
//                     Text(
//                       "Here are the list of booked lessons. You can track when the meeting starts or cancel the lesson before 2 hours.",
//                       style: TextStyle(fontSize: 16),
//                     ),
//                     SizedBox(height: 20),
//                     Table(
//                       border: TableBorder.all(color: Colors.blue),
//                       children: [
//                         TableRow(
//                           decoration: BoxDecoration(color: Colors.blue[100]),
//                           children: [
//                             _buildTableCell('Name', isHeader: true),
//                             _buildTableCell('Page', isHeader: true),
//                             _buildTableCell('Description', isHeader: true),
//                           ],
//                         ),
//                         ...schedules.map((schedule) {
//                           return TableRow(
//                             children: [
//                               _buildTableCell(schedule.name),
//                               _buildTableCell(schedule.page),
//                               _buildTableCell(schedule.description),
//                             ],
//                           );
//                         }).toList(),
//                       ],
//                     ),
//                     SizedBox(height: 20),
//                     ...schedules.map((schedule) => _buildCard(schedule)).toList(),
//                   ],
//                 ),
//               ),
//             );
//           }
//         },
//       ),
//     );
//   }
//
//   // Helper method to build table cells
//   Widget _buildTableCell(String content, {bool isHeader = false}) {
//     return Padding(
//       padding: const EdgeInsets.all(8.0),
//       child: Text(
//         content,
//         style: TextStyle(
//           fontWeight: isHeader ? FontWeight.bold : FontWeight.normal,
//           fontSize: 14,
//         ),
//       ),
//     );
//   }
//
//   // Helper method to build individual cards
//   Widget _buildCard(Schedule schedule) {
//     return Card(
//       elevation: 4,
//       margin: const EdgeInsets.only(bottom: 16),
//       child: Padding(
//         padding: const EdgeInsets.all(16.0),
//         child: Column(
//           crossAxisAlignment: CrossAxisAlignment.start,
//           children: [
//             Row(
//               children: [
//                 CircleAvatar(
//                   radius: 30,
//                   backgroundImage: AssetImage(schedule.photo), // Replace with actual image asset
//                 ),
//                 SizedBox(width: 16),
//                 Column(
//                   crossAxisAlignment: CrossAxisAlignment.start,
//                   children: [
//                     Text(
//                       schedule.instructorName,
//                       style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
//                     ),
//                     Text(schedule.rating, style: TextStyle(fontSize: 14)),
//                     SizedBox(height: 4),
//                     Text(
//                       "${schedule.date}\n${schedule.time}",
//                       style: TextStyle(fontSize: 12),
//                     ),
//                   ],
//                 ),
//               ],
//             ),
//             SizedBox(height: 16),
//             Text(
//               "Request:",
//               style: TextStyle(fontWeight: FontWeight.bold),
//             ),
//             Text(
//               schedule.request,
//               style: TextStyle(fontSize: 14),
//             ),
//             SizedBox(height: 16),
//             Row(
//               children: [
//                 ElevatedButton(
//                   onPressed: () {
//                     // Handle cancel action
//                   },
//                   style: ElevatedButton.styleFrom(
//                     backgroundColor: Colors.red,
//                   ),
//                   child: Text("Cancel"),
//                 ),
//                 Spacer(),
//                 ElevatedButton.icon(
//                   onPressed: () {
//                     // Handle Go to class action
//                   },
//                   icon: Icon(Icons.play_arrow),
//                   label: Text("Go to class"),
//                 ),
//               ],
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }
//
//

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
//       home: SchedulePage(),
//     );
//   }
// }
//
// class SchedulePage extends StatelessWidget {
//   // Simulated Firebase data for now (replace this with real Firebase fetch later)
//
//
//   Map<String, String> selectedLanguage = {
//   "name": "English",
//   "image": "assets/us_flag.png"
//   };
//
//   int _currentIndex = 0;
//   bool _isLanguageSelectorVisible = false;
//
//   final List<Map<String, String>> languages = [
//   {"name": "English", "image": "assets/us_flag.png"},
//   {"name": "Nepali", "image": "assets/np_flag.png"},
//   {"name": "Spain", "image": "assets/sp_flag.png"},
//   ];
//
//   final List<Map<String, dynamic>> bookings = [
//     {
//       "name": "Dipesh Maharjan",
//       "rating": 5,
//       "date": "Sunday January 1 2023",
//       "time": "10:45 - 11:50",
//       "request": "Please bring necessary course materials for the class...",
//       "course": {
//         "name": "C#",
//         "page": 30,
//         "description": "Comprehensive lesson tools",
//       },
//     },
//     {
//       "name": "Dinesh Adhikari",
//       "rating": 4,
//       "date": "Sunday January 1 2023",
//       "time": "10:45 - 11:50",
//       "request":
//       "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Ut aliquam.",
//       "course": {
//         "name": "Python",
//         "page": 45,
//         "description": "Advanced programming techniques",
//       },
//     },
//   ];
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: const Text('Schedule'),
//         backgroundColor: Colors.blue,
//       ),
//       body: Padding(
//         padding: const EdgeInsets.all(8.0),
//         child: Column(
//           crossAxisAlignment: CrossAxisAlignment.start,
//           children: [
//             // Heading
//             const Text(
//               "Here are the list of booked lessons. You can track when the meeting starts, cancel the lesson before 2 hours.",
//               style: TextStyle(fontSize: 16),
//             ),
//             const SizedBox(height: 16),
//
//             // Table Header
//             Container(
//               padding: const EdgeInsets.all(8.0),
//               color: Colors.grey.shade200,
//               child: Row(
//                 children: const [
//                   Expanded(flex: 2, child: Text("Name", style: TextStyle(fontWeight: FontWeight.bold))),
//                   Expanded(flex: 1, child: Text("Page", style: TextStyle(fontWeight: FontWeight.bold))),
//                   Expanded(flex: 2, child: Text("Description", style: TextStyle(fontWeight: FontWeight.bold))),
//                 ],
//               ),
//             ),
//
//             // Table Row (Static for Now)
//             Container(
//               padding: const EdgeInsets.all(8.0),
//               decoration: BoxDecoration(
//                 border: Border(
//                   bottom: BorderSide(color: Colors.grey.shade300),
//                 ),
//               ),
//               child: Row(
//                 children: const [
//                   Expanded(flex: 2, child: Text("C#")),
//                   Expanded(flex: 1, child: Text("30")),
//                   Expanded(flex: 2, child: Text("Comprehensive lesson tools")),
//                 ],
//               ),
//             ),
//
//             const SizedBox(height: 16),
//
//             // Booking List
//             Expanded(
//               child: ListView.builder(
//                 itemCount: bookings.length,
//                 itemBuilder: (context, index) {
//                   final data = bookings[index];
//                   return BookingCard(data: data);
//                 },
//               ),
//             ),
//           ],
//         ),
//       ),
//       bottomNavigationBar: BottomNavigationBar(
//         items: const [
//           BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Home'),
//           BottomNavigationBarItem(icon: Icon(Icons.schedule), label: 'Schedule'),
//           BottomNavigationBarItem(icon: Icon(Icons.history), label: 'History'),
//           BottomNavigationBarItem(icon: Icon(Icons.book), label: 'Courses'),
//           BottomNavigationBarItem(icon: Icon(Icons.settings), label: 'Settings'),
//         ],
//       ),
//     );
//   }
// }
//
// class BookingCard extends StatelessWidget {
//   final Map<String, dynamic> data;
//
//   const BookingCard({Key? key, required this.data}) : super(key: key);
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
//             // Course Details
//             Text(
//               "Course: ${data['course']['name']} (Page: ${data['course']['page']})",
//               style: const TextStyle(fontWeight: FontWeight.bold),
//             ),
//             Text("Description: ${data['course']['description']}"),
//             const SizedBox(height: 8),
//
//             // Instructor Information
//             Row(
//               children: [
//                 const CircleAvatar(
//                   radius: 20,
//                   backgroundImage: AssetImage('assets/user_placeholder.png'), // Replace with Firebase photo if needed
//                 ),
//                 const SizedBox(width: 8),
//                 Text(
//                   data['name'],
//                   style: const TextStyle(fontWeight: FontWeight.bold),
//                 ),
//                 const Spacer(),
//                 Text("⭐ ${data['rating']}"),
//               ],
//             ),
//             const SizedBox(height: 8),
//
//             // Date and Time
//             Text("Date: ${data['date']}"),
//             Text("Time: ${data['time']}"),
//             const SizedBox(height: 8),
//
//             // Request
//             Text("Request: ${data['request']}"),
//             const SizedBox(height: 8),
//
//             // Action Buttons
//             Row(
//               children: [
//                 ElevatedButton(
//                   onPressed: () {
//                     // Cancel logic here
//                   },
//                   style: ElevatedButton.styleFrom(
//                     backgroundColor: Colors.red,
//                   ),
//                   child: const Text("Cancel"),
//                 ),
//                 const Spacer(),
//                 ElevatedButton.icon(
//                   onPressed: () {
//                     // Go to class logic here
//                   },
//                   icon: const Icon(Icons.video_call),
//                   label: const Text("Go to class"),
//                 ),
//               ],
//             ),
//           ],
//         ),
//       ),
//     );
//   }


// import 'package:flutter/material.dart';
//
//
//
// class SchedulePage extends StatefulWidget {
//   @override
//   _SchedulePageState createState() => _SchedulePageState();
// }
//
// class _SchedulePageState extends State<SchedulePage> {
//   final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();
//   Map<String, String> selectedLanguage = {
//     "name": "English",
//     "image": "assets/us_flag.png"
//   };
//
//   int _currentIndex = 0; // Track bottom navigation index
//
//   final List<Map<String, dynamic>> bookings = [
//     {
//       "name": "Dipesh Maharjan",
//       "rating": 5,
//       "date": "Sunday January 1 2023",
//       "time": "10:45 - 11:50",
//       "request":
//       "Please bring necessary course materials for the class and maintain silence while teaching to better.",
//     },
//     {
//       "name": "Dinesh Adhikari",
//       "rating": 4,
//       "date": "Sunday January 1 2023",
//       "time": "10:45 - 11:50",
//       "request":
//       "Lorem ipsum to whom it may concern and lapo do the fall of the guys of the mariana trench for got the nomnom last.",
//     },
//   ];
//
//   void toggleLanguageSelector() {
//     setState(() {
//       // Implement toggle for language dropdown (future functionality)
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
//             GestureDetector(
//               onTap: toggleLanguageSelector, // Toggle dropdown visibility
//               child: Padding(
//                 padding: const EdgeInsets.only(right: 16.0),
//                 child: Image.asset(
//                   selectedLanguage['image']!, // Dynamically display flag icon
//                   height: 24,
//                   width: 24,
//                 ),
//               ),
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
//               leading: const Icon(Icons.home),
//               title: const Text("Home"),
//               onTap: () {
//                 setState(() {
//                   _currentIndex = 0;
//                 });
//                 Navigator.pop(context);
//               },
//             ),
//             ListTile(
//               leading: const Icon(Icons.schedule),
//               title: const Text("Schedule"),
//               onTap: () {
//                 Navigator.pop(context); // Close the drawer first
//                 Navigator.push(
//                   context,
//                   MaterialPageRoute(builder: (context) => SchedulePage()),
//                 );
//               },
//             ),
//             ListTile(
//               leading: const Icon(Icons.history),
//               title: const Text("History"),
//               onTap: () {
//                 setState(() {
//                   _currentIndex = 2;
//                 });
//                 Navigator.pop(context);
//               },
//             ),
//             ListTile(
//               leading: const Icon(Icons.menu_book),
//               title: const Text("Courses"),
//               onTap: () {
//                 setState(() {
//                   _currentIndex = 3;
//                 });
//                 Navigator.pop(context);
//               },
//             ),
//             ListTile(
//               leading: const Icon(Icons.settings),
//               title: const Text("Settings"),
//               onTap: () {
//                 setState(() {
//                   _currentIndex = 4;
//                 });
//                 Navigator.pop(context);
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
//       body: Padding(
//         padding: const EdgeInsets.all(16.0),
//         child: Column(
//           crossAxisAlignment: CrossAxisAlignment.start,
//           children: [
//             const Text(
//               "Here are the list of booked lessons. You can track when the meeting starts, cancel the lesson before 2 hours.",
//               style: TextStyle(fontSize: 16),
//             ),
//             const SizedBox(height: 16),
//             Expanded(
//               child: ListView.builder(
//                 itemCount: bookings.length,
//                 itemBuilder: (context, index) {
//                   final data = bookings[index];
//                   return BookingCard(data: data);
//                 },
//               ),
//             ),
//           ],
//         ),
//       ),
//       bottomNavigationBar: BottomNavigationBar(
//         currentIndex: _currentIndex,
//         onTap: (index) {
//           setState(() {
//             _currentIndex = index;
//           });
//         },
//         items: const [
//           BottomNavigationBarItem(icon: Icon(Icons.home), label: "Home"),
//           BottomNavigationBarItem(
//               icon: Icon(Icons.schedule), label: "Schedule"),
//           BottomNavigationBarItem(icon: Icon(Icons.history), label: "History"),
//           BottomNavigationBarItem(
//               icon: Icon(Icons.menu_book), label: "Courses"),
//           BottomNavigationBarItem(icon: Icon(Icons.settings), label: "Settings"),
//         ],
//       ),
//     );
//   }
// }
//
// class BookingCard extends StatelessWidget {
//   final Map<String, dynamic> data;
//
//   const BookingCard({Key? key, required this.data}) : super(key: key);
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
//                 const CircleAvatar(
//                   radius: 20,
//                   backgroundImage: AssetImage('assets/user_placeholder.png'),
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
//               "Request:",
//               style: TextStyle(fontWeight: FontWeight.bold),
//             ),
//             Text(data['request']),
//             const SizedBox(height: 8),
//             Row(
//               children: [
//                 ElevatedButton(
//                   onPressed: () {},
//                   style: ElevatedButton.styleFrom(backgroundColor: Colors.red),
//                   child: const Text("Cancel"),
//                 ),
//                 const Spacer(),
//                 ElevatedButton.icon(
//                   onPressed: () {},
//                   icon: const Icon(Icons.video_call),
//                   label: const Text("Go to class"),
//                 ),
//               ],
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }
//

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
//       home: SchedulePage(),
//     );
//   }
// }
//
// class SchedulePage extends StatefulWidget {
//   @override
//   _SchedulePageState createState() => _SchedulePageState();
// }
//
// class _SchedulePageState extends State<SchedulePage> {
//   final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();
//
//   int _currentIndex = 0;
//
//   Map<String, String> selectedLanguage = {
//     "name": "English",
//     "image": "assets/us_flag.png"
//   };
//
//   bool _isLanguageSelectorVisible = false;
//
//   final List<Map<String, String>> languages = [
//     {"name": "English", "image": "assets/us_flag.png"},
//     {"name": "Nepali", "image": "assets/np_flag.png"},
//     {"name": "Spain", "image": "assets/sp_flag.png"},
//   ];
//
//   final List<Map<String, dynamic>> bookings = [
//     {
//       "name": "Dipesh Maharjan",
//       "rating": 5,
//       "date": "Sunday January 1 2023",
//       "time": "10:45 - 11:50",
//       "request":
//       "Please bring necessary course materials for the class and maintain silence while teaching to better.",
//     },
//     {
//       "name": "Dinesh Adhikari",
//       "rating": 4,
//       "date": "Sunday January 1 2023",
//       "time": "10:45 - 11:50",
//       "request":
//       "Lorem ipsum to whom it may concern and lapo do the fall of the guys of the mariana trench for got the nomnom last.",
//     },
//   ];
//
//   void toggleLanguageSelector() {
//     setState(() {
//       _isLanguageSelectorVisible = !_isLanguageSelectorVisible;
//     });
//   }
//
//   void selectLanguage(Map<String, String> language) {
//     setState(() {
//       selectedLanguage = language; // Update the selected language
//       _isLanguageSelectorVisible = false; // Hide the dropdown menu
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
//             // Language Selector
//             GestureDetector(
//               onTap: toggleLanguageSelector, // Toggle dropdown visibility
//               child: Padding(
//                 padding: const EdgeInsets.only(right: 16.0),
//                 child: Image.asset(
//                   selectedLanguage['image']!, // Dynamically display flag icon
//                   height: 24,
//                   width: 24,
//                 ),
//               ),
//             ),
//             // Menu Icon
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
//               leading: const Icon(Icons.home),
//               title: const Text("Home"),
//               onTap: () {
//                 Navigator.pop(context);
//               },
//             ),
//             ListTile(
//               leading: const Icon(Icons.schedule),
//               title: const Text("Schedule"),
//               onTap: () {
//                 Navigator.pop(context);
//               },
//             ),
//             ListTile(
//               leading: const Icon(Icons.history),
//               title: const Text("History"),
//               onTap: () {
//                 Navigator.pop(context);
//               },
//             ),
//             ListTile(
//               leading: const Icon(Icons.menu_book),
//               title: const Text("Courses"),
//               onTap: () {
//                 Navigator.pop(context);
//               },
//             ),
//             ListTile(
//               leading: const Icon(Icons.settings),
//               title: const Text("Settings"),
//               onTap: () {
//                 Navigator.pop(context);
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
//       body: Stack(
//         children: [
//           Padding(
//             padding: const EdgeInsets.all(16.0),
//             child: Column(
//               crossAxisAlignment: CrossAxisAlignment.start,
//               children: [
//                 const Text(
//                   "Here are the list of booked lessons. You can track when the meeting starts, cancel the lesson before 2 hours.",
//                   style: TextStyle(fontSize: 16),
//                 ),
//                 const SizedBox(height: 16),
//                 Expanded(
//                   child: ListView.builder(
//                     itemCount: bookings.length,
//                     itemBuilder: (context, index) {
//                       final data = bookings[index];
//                       return BookingCard(data: data);
//                     },
//                   ),
//                 ),
//               ],
//             ),
//           ),
//           if (_isLanguageSelectorVisible)
//             Positioned(
//               top: 0,
//               right: 30,
//               child: Material(
//                 elevation: 4,
//                 borderRadius: BorderRadius.circular(8),
//                 child: Column(
//                   children: languages.map((language) {
//                     return GestureDetector(
//                       onTap: () => selectLanguage(language), // Call selectLanguage
//                       child: Container(
//                         padding: const EdgeInsets.all(8),
//                         child: Row(
//                           children: [
//                             Image.asset(
//                               language['image']!,
//                               width: 24,
//                               height: 24,
//                             ),
//                             const SizedBox(width: 8),
//                             Text(language['name']!),
//                           ],
//                         ),
//                       ),
//                     );
//                   }).toList(),
//                 ),
//               ),
//             ),
//         ],
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
//         selectedLabelStyle: TextStyle(fontSize: 12, fontWeight: FontWeight.bold),
//         unselectedLabelStyle: TextStyle(fontSize: 12),
//         iconSize: 24,
//         type: BottomNavigationBarType.fixed,
//         showUnselectedLabels: true,
//         onTap: (index) {
//           setState(() {
//             _currentIndex = index;
//           });
//         },
//       ),
//     );
//   }
// }
//
// class BookingCard extends StatelessWidget {
//   final Map<String, dynamic> data;
//
//   const BookingCard({Key? key, required this.data}) : super(key: key);
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
//                 const CircleAvatar(
//                   radius: 20,
//                   backgroundImage: AssetImage('assets/user_placeholder.png'),
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
//               "Request:",
//               style: TextStyle(fontWeight: FontWeight.bold),
//             ),
//             Text(data['request']),
//             const SizedBox(height: 8),
//             Row(
//               children: [
//                 ElevatedButton(
//                   onPressed: () {},
//                   style: ElevatedButton.styleFrom(backgroundColor: Colors.red),
//                   child: const Text("Cancel"),
//                 ),
//                 const Spacer(),
//                 ElevatedButton.icon(
//                   onPressed: () {},
//                   icon: const Icon(Icons.video_call),
//                   label: const Text("Go to class"),
//                 ),
//               ],
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }

// import 'package:flutter/material.dart';
// import 'package:tutor_nest/pages/home_page_content.dart';
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
//       home: SchedulePage(),
//     );
//   }
// }
//
// class SchedulePage extends StatefulWidget {
//   @override
//   _SchedulePageState createState() => _SchedulePageState();
// }
//
// class _SchedulePageState extends State<SchedulePage> {
//   final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();
//
//   Map<String, String> selectedLanguage = {
//     "name": "English",
//     "image": "assets/us_flag.png"
//   };
//
//   int _currentIndex = 1; // Default to "Schedule" tab
//   bool _isLanguageSelectorVisible = false;
//
//   final List<Map<String, String>> languages = [
//     {"name": "English", "image": "assets/us_flag.png"},
//     {"name": "Nepali", "image": "assets/np_flag.png"},
//     {"name": "Spain", "image": "assets/sp_flag.png"},
//   ];
//
//   final List<Map<String, dynamic>> bookings = [
//     {
//       "name": "Dipesh Maharjan",
//       "rating": 5,
//       "date": "Sunday January 1 2023",
//       "time": "10:45 - 11:50",
//       "request":
//       "Please bring necessary course materials for the class and maintain silence while teaching to better.",
//     },
//     {
//       "name": "Dinesh Adhikari",
//       "rating": 4,
//       "date": "Sunday January 1 2023",
//       "time": "10:45 - 11:50",
//       "request":
//       "Lorem ipsum to whom it may concern and lapo do the fall of the guys of the mariana trench for got the nomnom last.",
//     },
//   ];
//
//   void toggleLanguageSelector() {
//     setState(() {
//       _isLanguageSelectorVisible = !_isLanguageSelectorVisible;
//     });
//   }
//
//   void selectLanguage(Map<String, String> language) {
//     setState(() {
//       selectedLanguage = language; // Update the selected language
//       _isLanguageSelectorVisible = false; // Hide the dropdown menu
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
//             GestureDetector(
//               onTap: toggleLanguageSelector, // Toggle dropdown visibility
//               child: Padding(
//                 padding: const EdgeInsets.only(right: 16.0),
//                 child: Image.asset(
//                   selectedLanguage['image']!, // Dynamically display flag icon
//                   height: 24,
//                   width: 24,
//                 ),
//               ),
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
//               selected: _currentIndex == 0, // Highlight if _currentIndex is 0
//               selectedTileColor: Colors.blue[100], // Background color when selected
//               onTap: () {
//                 setState(() {
//                   _currentIndex = 0;
//                 });
//                 Navigator.pop(context);
//                 Navigator.push(
//                     context,
//                     MaterialPageRoute(builder: (context) => HomePage())
//                 );
//               },
//             ),
//             ListTile(
//               leading: Icon(Icons.schedule),
//               title: Text("Schedule"),
//               selected: _currentIndex == 1, // Highlight if _currentIndex is 1
//               selectedTileColor: Colors.blue[100], // Background color when selected
//               onTap: () {
//                 setState(() {
//                   _currentIndex = 1;
//                 });
//                 Navigator.pop(context); // Close the drawer first
//                 Navigator.push(
//                   context,
//                   MaterialPageRoute(builder: (context) => SchedulePage()),
//                 );
//               },
//             ),
//
//
//
//             ListTile(
//               leading: Icon(Icons.history),
//               title: Text("History"),
//               selected: _currentIndex == 2, // Highlight if _currentIndex is 2
//               selectedTileColor: Colors.blue[100], // Background color when selected // Background color when selected
//               onTap: () {
//                 setState(() {
//                   _currentIndex = 2;
//                 });
//                 Navigator.pop(context);
//               },
//             ),
//             ListTile(
//               leading: Icon(Icons.menu_book),
//               title: Text("Courses"),
//               selected: _currentIndex == 3, // Highlight if _currentIndex is 3
//               selectedTileColor: Colors.blue[100], // Background color when selected
//               onTap: () {
//                 setState(() {
//                   _currentIndex = 3;
//                 });
//                 Navigator.pop(context);
//               },
//             ),
//             ListTile(
//               leading: Icon(Icons.settings),
//               title: Text("Settings"),
//               selected: _currentIndex == 4, // Highlight if _currentIndex is 4
//               selectedTileColor: Colors.blue[100], // Background color when selected
//               onTap: () {
//                 setState(() {
//                   _currentIndex = 4;
//                 });
//                 Navigator.pop(context);
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
//
//       body: Stack(
//         children: [
//           Padding(
//             padding: const EdgeInsets.all(16.0),
//             child: Column(
//               crossAxisAlignment: CrossAxisAlignment.start,
//               children: [
//                 // Schedule Title and Icon
//                 Row(
//                   children: [
//                     Image.asset(
//                       'assets/schedule.png', // Replace with your calendar icon path
//                       height: 50,
//                       width: 50,
//                     ),
//                     const SizedBox(width: 16),
//                     const Text(
//                       "Schedule",
//                       style: TextStyle(
//                         fontSize: 24,
//                         fontWeight: FontWeight.bold,
//                       ),
//                     ),
//                   ],
//                 ),
//                 const SizedBox(height: 16),
//                 const Text(
//                   "Here are the list of booked lessons. You can track when the meeting starts, cancel the lesson before 2 hours.",
//                   style: TextStyle(fontSize: 16),
//                 ),
//                 const SizedBox(height: 16),
//                 // Booking List
//                 Expanded(
//                   child: ListView.builder(
//                     itemCount: bookings.length,
//                     itemBuilder: (context, index) {
//                       final data = bookings[index];
//                       return BookingCard(data: data);
//                     },
//                   ),
//                 ),
//               ],
//             ),
//           ),
//           if (_isLanguageSelectorVisible)
//             Positioned(
//               top: 0,
//               right: 30,
//               child: Material(
//                 elevation: 4,
//                 borderRadius: BorderRadius.circular(8),
//                 child: Column(
//                   children: languages.map((language) {
//                     return GestureDetector(
//                       onTap: () => selectLanguage(language), // Call selectLanguage
//                       child: Container(
//                         padding: const EdgeInsets.all(8),
//                         child: Row(
//                           children: [
//                             Image.asset(
//                               language['image']!,
//                               width: 24,
//                               height: 24,
//                             ),
//                             const SizedBox(width: 8),
//                             Text(language['name']!),
//                           ],
//                         ),
//                       ),
//                     );
//                   }).toList(),
//                 ),
//               ),
//             ),
//         ],
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
//           setState(() {
//             _currentIndex = index;
//           });
//           if (index == 0) {
//             Navigator.push(
//               context,
//               MaterialPageRoute(builder: (context) => HomePage()),
//             );
//           } else if (index == 1) {
//             Navigator.push(
//               context,
//               MaterialPageRoute(builder: (context) => SchedulePage()),
//             );
//           }
//           // else if (index == 2) {
//           //   Navigator.push(
//           //     context,
//           //     MaterialPageRoute(builder: (context) => HistoryPage()),
//           //   );
//           // } else if (index == 3) {
//           //   Navigator.push(
//           //     context,
//           //     MaterialPageRoute(builder: (context) => CoursesPage()),
//           //   );
//           // } else if (index == 4) {
//           //   Navigator.push(
//           //     context,
//           //     MaterialPageRoute(builder: (context) => SettingsPage()),
//           //   );
//           // }
//
//
//         },
//       ),
//     );
//   }
// }
//
// class BookingCard extends StatelessWidget {
//   final Map<String, dynamic> data;
//
//   const BookingCard({Key? key, required this.data}) : super(key: key);
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
//                 const CircleAvatar(
//                   radius: 20,
//                   backgroundImage: AssetImage('assets/user_placeholder.png'),
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
//               "Request:",
//               style: TextStyle(fontWeight: FontWeight.bold),
//             ),
//             Text(data['request']),
//             const SizedBox(height: 8),
//             Row(
//               children: [
//                 ElevatedButton(
//                   onPressed: () {},
//                   style: ElevatedButton.styleFrom(backgroundColor: Colors.red),
//                   child: const Text("Cancel"),
//                 ),
//                 const Spacer(),
//                 ElevatedButton.icon(
//                   onPressed: () {},
//                   icon: const Icon(Icons.video_call),
//                   label: const Text("Go to class"),
//                 ),
//               ],
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }

// import 'package:flutter/material.dart';
// import 'package:tutor_nest/pages/home_page_content.dart';
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
//       home: SchedulePage(),
//     );
//   }
// }
//
// class SchedulePage extends StatefulWidget {
//   @override
//   _SchedulePageState createState() => _SchedulePageState();
// }
//
// class _SchedulePageState extends State<SchedulePage> {
//   final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();
//
//   Map<String, String> selectedLanguage = {
//     "name": "English",
//     "image": "assets/us_flag.png"
//   };
//
//   int _currentIndex = 1; // Default to "Schedule" tab
//   bool _isLanguageSelectorVisible = false;
//
//   final List<Map<String, String>> languages = [
//     {"name": "English", "image": "assets/us_flag.png"},
//     {"name": "Nepali", "image": "assets/np_flag.png"},
//     {"name": "Spain", "image": "assets/sp_flag.png"},
//   ];
//
//   // Updated bookings with `image` data
//   final List<Map<String, dynamic>> bookings = [
//     {
//       "name": "Dipesh Maharjan",
//       "rating": 5,
//       "date": "Sunday January 1 2023",
//       "time": "10:45 - 11:50",
//       "request":
//       "Please bring necessary course materials for the class and maintain silence while teaching to better.",
//       "image": "https://via.placeholder.com/150", // Dummy image URL
//     },
//     {
//       "name": "Dinesh Adhikari",
//       "rating": 4,
//       "date": "Sunday January 1 2023",
//       "time": "10:45 - 11:50",
//       "request":
//       "Lorem ipsum to whom it may concern and lapo do the fall of the guys of the mariana trench for got the nomnom last.",
//       "image": "https://via.placeholder.com/150", // Dummy image URL
//     },
//   ];
//
//   void toggleLanguageSelector() {
//     setState(() {
//       _isLanguageSelectorVisible = !_isLanguageSelectorVisible;
//     });
//   }
//
//   void selectLanguage(Map<String, String> language) {
//     setState(() {
//       selectedLanguage = language; // Update the selected language
//       _isLanguageSelectorVisible = false; // Hide the dropdown menu
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
//             GestureDetector(
//               onTap: toggleLanguageSelector, // Toggle dropdown visibility
//               child: Padding(
//                 padding: const EdgeInsets.only(right: 16.0),
//                 child: Image.asset(
//                   selectedLanguage['image']!, // Dynamically display flag icon
//                   height: 24,
//                   width: 24,
//                 ),
//               ),
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
//               selected: _currentIndex == 0, // Highlight if _currentIndex is 0
//               selectedTileColor: Colors.blue[100], // Background color when selected
//               onTap: () {
//                 setState(() {
//                   _currentIndex = 0;
//                 });
//                 Navigator.pop(context);
//                 Navigator.push(
//                     context,
//                     MaterialPageRoute(builder: (context) => HomePage()));
//               },
//             ),
//             ListTile(
//               leading: Icon(Icons.schedule),
//               title: Text("Schedule"),
//               selected: _currentIndex == 1, // Highlight if _currentIndex is 1
//               selectedTileColor: Colors.blue[100], // Background color when selected
//               onTap: () {
//                 setState(() {
//                   _currentIndex = 1;
//                 });
//                 Navigator.pop(context); // Close the drawer first
//                 Navigator.push(
//                   context,
//                   MaterialPageRoute(builder: (context) => SchedulePage()),
//                 );
//               },
//             ),
//             // Additional list tiles for other pages
//           ],
//         ),
//       ),
//
//       body: Stack(
//         children: [
//           Padding(
//             padding: const EdgeInsets.all(16.0),
//             child: Column(
//               crossAxisAlignment: CrossAxisAlignment.start,
//               children: [
//                 // Schedule Title and Icon
//                 Row(
//                   children: [
//                     Image.asset(
//                       'assets/schedule.png', // Replace with your calendar icon path
//                       height: 50,
//                       width: 50,
//                     ),
//                     const SizedBox(width: 16),
//                     const Text(
//                       "Schedule",
//                       style: TextStyle(
//                         fontSize: 24,
//                         fontWeight: FontWeight.bold,
//                       ),
//                     ),
//                   ],
//                 ),
//                 const SizedBox(height: 16),
//                 const Text(
//                   "Here are the list of booked lessons. You can track when the meeting starts, cancel the lesson before 2 hours.",
//                   style: TextStyle(fontSize: 16),
//                 ),
//                 const SizedBox(height: 16),
//                 // Booking List
//                 Expanded(
//                   child: ListView.builder(
//                     itemCount: bookings.length,
//                     itemBuilder: (context, index) {
//                       final data = bookings[index];
//                       return BookingCard(data: data);
//                     },
//                   ),
//                 ),
//               ],
//             ),
//           ),
//           if (_isLanguageSelectorVisible)
//             Positioned(
//               top: 0,
//               right: 30,
//               child: Material(
//                 elevation: 4,
//                 borderRadius: BorderRadius.circular(8),
//                 child: Column(
//                   children: languages.map((language) {
//                     return GestureDetector(
//                       onTap: () => selectLanguage(language), // Call selectLanguage
//                       child: Container(
//                         padding: const EdgeInsets.all(8),
//                         child: Row(
//                           children: [
//                             Image.asset(
//                               language['image']!,
//                               width: 24,
//                               height: 24,
//                             ),
//                             const SizedBox(width: 8),
//                             Text(language['name']!),
//                           ],
//                         ),
//                       ),
//                     );
//                   }).toList(),
//                 ),
//               ),
//             ),
//         ],
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
//           setState(() {
//             _currentIndex = index;
//           });
//           if (index == 0) {
//             Navigator.push(
//               context,
//               MaterialPageRoute(builder: (context) => HomePage()),
//             );
//           } else if (index == 1) {
//             Navigator.push(
//               context,
//               MaterialPageRoute(builder: (context) => SchedulePage()),
//             );
//           }
//         },
//       ),
//     );
//   }
// }
//
// class BookingCard extends StatelessWidget {
//   final Map<String, dynamic> data;
//
//   const BookingCard({Key? key, required this.data}) : super(key: key);
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
//               "Request:",
//               style: TextStyle(fontWeight: FontWeight.bold),
//             ),
//             Text(data['request']),
//             const SizedBox(height: 8),
//             Row(
//               children: [
//                 ElevatedButton(
//                   onPressed: () {},
//                   style: ElevatedButton.styleFrom(backgroundColor: Colors.red),
//                   child: const Text("Cancel"),
//                 ),
//                 const Spacer(),
//                 ElevatedButton.icon(
//                   onPressed: () {},
//                   icon: const Icon(Icons.video_call),
//                   label: const Text("Go to class"),
//                 ),
//               ],
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }

// import 'package:flutter/material.dart';
// import 'package:tutor_nest/pages/home_page_content.dart';
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
//       home: SchedulePage(),
//     );
//   }
// }
//
// class SchedulePage extends StatefulWidget {
//   @override
//   _SchedulePageState createState() => _SchedulePageState();
// }
//
// class _SchedulePageState extends State<SchedulePage> {
//   final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();
//
//   Map<String, String> selectedLanguage = {
//     "name": "English",
//     "image": "assets/us_flag.png"
//   };
//
//   int _currentIndex = 1; // Default to "Schedule" tab
//   // Removed _isLanguageSelectorVisible as it's no longer needed
//   // bool _isLanguageSelectorVisible = false;
//
//   final List<Map<String, String>> languages = [
//     {"name": "English", "image": "assets/us_flag.png"},
//     {"name": "Nepali", "image": "assets/np_flag.png"},
//     {"name": "Spain", "image": "assets/sp_flag.png"},
//   ];
//
//   // Updated bookings with `image` data
//   final List<Map<String, dynamic>> bookings = [
//     {
//       "name": "Dipesh Maharjan",
//       "rating": 5,
//       "date": "Sunday January 1 2023",
//       "time": "10:45 - 11:50",
//       "request":
//       "Please bring necessary course materials for the class and maintain silence while teaching to better.",
//       "image": "https://via.placeholder.com/150", // Dummy image URL
//     },
//     {
//       "name": "Dinesh Adhikari",
//       "rating": 4,
//       "date": "Sunday January 1 2023",
//       "time": "10:45 - 11:50",
//       "request":
//       "Lorem ipsum to whom it may concern and lapo do the fall of the guys of the mariana trench for got the nomnom last.",
//       "image": "https://via.placeholder.com/150", // Dummy image URL
//     },
//   ];
//
//   // Removed toggleLanguageSelector as it's no longer needed
//   // void toggleLanguageSelector() {
//   //   setState(() {
//   //     _isLanguageSelectorVisible = !_isLanguageSelectorVisible;
//   //   });
//   // }
//
//   void selectLanguage(Map<String, String> language) {
//     setState(() {
//       selectedLanguage = language; // Update the selected language
//       // No need to hide the dropdown menu manually
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
//             // Replaced GestureDetector with PopupMenuButton
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
//               selected: _currentIndex == 0, // Highlight if _currentIndex is 0
//               selectedTileColor:
//               Colors.blue[100], // Background color when selected
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
//               selected: _currentIndex == 1, // Highlight if _currentIndex is 1
//               selectedTileColor:
//               Colors.blue[100], // Background color when selected
//               onTap: () {
//                 setState(() {
//                   _currentIndex = 1;
//                 });
//                 Navigator.pop(context); // Close the drawer first
//                 // Avoid pushing the same page onto the stack
//               },
//             ),
//             // Additional list tiles for other pages
//           ],
//         ),
//       ),
//
//       // Removed Stack and _isLanguageSelectorVisible logic
//       body: Padding(
//         padding: const EdgeInsets.all(16.0),
//         child: Column(
//           crossAxisAlignment: CrossAxisAlignment.start,
//           children: [
//             // Schedule Title and Icon
//             Row(
//               children: [
//                 Image.asset(
//                   'assets/schedule.png', // Replace with your calendar icon path
//                   height: 50,
//                   width: 50,
//                 ),
//                 const SizedBox(width: 16),
//                 const Text(
//                   "Schedule",
//                   style: TextStyle(
//                     fontSize: 24,
//                     fontWeight: FontWeight.bold,
//                   ),
//                 ),
//               ],
//             ),
//             const SizedBox(height: 16),
//             const Text(
//               "Here are the list of booked lessons. You can track when the meeting starts, cancel the lesson before 2 hours.",
//               style: TextStyle(fontSize: 16),
//             ),
//             const SizedBox(height: 16),
//             // Booking List
//             Expanded(
//               child: ListView.builder(
//                 itemCount: bookings.length,
//                 itemBuilder: (context, index) {
//                   final data = bookings[index];
//                   return BookingCard(data: data);
//                 },
//               ),
//             ),
//           ],
//         ),
//       ),
//       // Removed the Positioned language selector overlay
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
//           setState(() {
//             _currentIndex = index;
//           });
//           if (index == 0) {
//             Navigator.push(
//               context,
//               MaterialPageRoute(builder: (context) => HomePage()),
//             );
//           } else if (index == 1) {
//             // Do nothing as we are already on the SchedulePage
//           }
//         },
//       ),
//     );
//   }
// }
//
// class BookingCard extends StatelessWidget {
//   final Map<String, dynamic> data;
//
//   const BookingCard({Key? key, required this.data}) : super(key: key);
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
//               "Request:",
//               style: TextStyle(fontWeight: FontWeight.bold),
//             ),
//             Text(data['request']),
//             const SizedBox(height: 8),
//             Row(
//               children: [
//                 ElevatedButton(
//                   onPressed: () {},
//                   style: ElevatedButton.styleFrom(backgroundColor: Colors.red),
//                   child: const Text("Cancel"),
//                 ),
//                 const Spacer(),
//                 ElevatedButton.icon(
//                   onPressed: () {},
//                   icon: const Icon(Icons.video_call),
//                   label: const Text("Go to class"),
//                 ),
//               ],
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }

// import 'package:flutter/material.dart';
// import 'package:tutor_nest/pages/courses_page_content.dart';
// import 'package:tutor_nest/pages/history_page_content.dart';
// // import 'package:cloud_firestore/cloud_firestore.dart';
// // import 'package:firebase_core/firebase_core.dart';
// import 'package:tutor_nest/pages/home_page_content.dart';
//
// // void main() {
// //   // WidgetsFlutterBinding.ensureInitialized();
// //   // await Firebase.initializeApp();
// //   runApp(const MyApp());
// // }
// //
// // class MyApp extends StatelessWidget {
// //   const MyApp({Key? key}) : super(key: key);
// //
// //   @override
// //   Widget build(BuildContext context) {
// //     return MaterialApp(
// //       debugShowCheckedModeBanner: false,
// //       home: SchedulePage(),
// //     );
// //   }
// // }
//
// class SchedulePageContent extends StatefulWidget {
//   @override
//   _SchedulePageContentState createState() => _SchedulePageContentState();
// }
//
// class _SchedulePageContentState extends State<SchedulePageContent> {
//   final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();
//
//   Map<String, String> selectedLanguage = {
//     "name": "English",
//     "image": "assets/us_flag.png"
//   };
//
//   int _currentIndex = 1; // Default to "Schedule" tab
//
//   final List<Map<String, String>> languages = [
//     {"name": "English", "image": "assets/us_flag.png"},
//     {"name": "Nepali", "image": "assets/np_flag.png"},
//     {"name": "Spain", "image": "assets/sp_flag.png"},
//   ];
//
//   // Fetch bookings from Firebase Firestore (Commented out for now)
//   // Future<List<Map<String, dynamic>>> fetchBookings() async {
//   //   QuerySnapshot snapshot = await FirebaseFirestore.instance
//   //       .collection('bookings')
//   //       .get();
//   //   return snapshot.docs.map((doc) {
//   //     return {
//   //       "name": doc['name'],
//   //       "rating": doc['rating'],
//   //       "date": doc['date'],
//   //       "time": doc['time'],
//   //       "request": doc['request'],
//   //       "image": doc['image'],
//   //     };
//   //   }).toList();
//   // }
//
//   // Dummy bookings data
//   Future<List<Map<String, dynamic>>> fetchBookings() async {
//     // Simulate delay
//     await Future.delayed(Duration(seconds: 1));
//     // Dummy data with image URLs from Firebase Storage
//     return [
//       {
//         "name": "Dipesh Maharjan",
//         "rating": 5,
//         "date": "Sunday January 1 2023",
//         "time": "10:45 - 11:50",
//         "request":
//         "Please bring necessary course materials for the class and maintain silence while teaching to better.",
//         "image":
//         "https://firebasestorage.googleapis.com/v0/b/your-project-id.appspot.com/o/profile_pictures%2Fdipesh_maharjan.jpg?alt=media",
//       },
//       {
//         "name": "Dinesh Adhikari",
//         "rating": 4,
//         "date": "Sunday January 1 2023",
//         "time": "12:00 - 13:00",
//         "request":
//         "Looking forward to our session on advanced mathematics.",
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
//               selected: _currentIndex == 0, // Highlight if _currentIndex is 0
//               selectedTileColor:
//               Colors.blue[100], // Background color when selected
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
//               selected: _currentIndex == 1, // Highlight if _currentIndex is 1
//               selectedTileColor:
//               Colors.blue[100], // Background color when selected
//               onTap: () {
//                 setState(() {
//                   _currentIndex = 1;
//                 });
//                 Navigator.pop(context); // Close the drawer first
//                 // Avoid pushing the same page onto the stack
//               },
//             ),
//             ListTile(
//               leading: Icon(Icons.history),
//               title: Text("History"),
//               selected: _currentIndex == 2, // Highlight if _currentIndex is 2
//               selectedTileColor: Colors.blue[100], // Background color when selected // Background color when selected
//               onTap: () {
//                 setState(() {
//                   _currentIndex = 2;
//                 });
//                 Navigator.pop(context);
//                 Navigator.push(
//                     context, MaterialPageRoute(builder: (context) => HistoryPageContent()));
//               },
//             ),
//             ListTile(
//               leading: Icon(Icons.menu_book),
//               title: Text("Courses"),
//               selected: _currentIndex == 3, // Highlight if _currentIndex is 3
//               selectedTileColor: Colors.blue[100], // Background color when selected
//               onTap: () {
//                 setState(() {
//                   _currentIndex = 3;
//                 });
//                 Navigator.pop(context);
//                 Navigator.push(
//                     context, MaterialPageRoute(builder: (context) => CoursesPageContent()));
//               },
//             ),
//             ListTile(
//               leading: Icon(Icons.settings),
//               title: Text("Settings"),
//               selected: _currentIndex == 4, // Highlight if _currentIndex is 4
//               selectedTileColor: Colors.blue[100], // Background color when selected
//               onTap: () {
//                 setState(() {
//                   _currentIndex = 4;
//                 });
//                 Navigator.pop(context);
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
//       ),// Additional list tiles for other pages
//
//       body: FutureBuilder<List<Map<String, dynamic>>>(
//         future: fetchBookings(),
//         builder: (context, snapshot) {
//           if (snapshot.connectionState == ConnectionState.waiting) {
//             // Show a loading indicator while the data is loading
//             return Center(child: CircularProgressIndicator());
//           } else if (snapshot.hasError) {
//             // Show an error message if something went wrong
//             return Center(child: Text("Failed to load bookings."));
//           } else if (snapshot.hasData && snapshot.data!.isNotEmpty) {
//             // Display the bookings
//             return Padding(
//               padding: const EdgeInsets.all(16.0),
//               child: Column(
//                 crossAxisAlignment: CrossAxisAlignment.start,
//                 children: [
//                   // Schedule Title and Icon
//                   Row(
//                     children: [
//                       Image.asset(
//                         'assets/schedule.png', // Replace with your calendar icon path
//                         height: 50,
//                         width: 50,
//                       ),
//                       const SizedBox(width: 16),
//                       const Text(
//                         "Schedule",
//                         style: TextStyle(
//                           fontSize: 24,
//                           fontWeight: FontWeight.bold,
//                         ),
//                       ),
//                     ],
//                   ),
//                   const SizedBox(height: 16),
//                   const Text(
//                     "Here are the list of booked lessons. You can track when the meeting starts, cancel the lesson before 2 hours.",
//                     style: TextStyle(fontSize: 16),
//                   ),
//                   const SizedBox(height: 16),
//                   // Booking List
//                   Expanded(
//                     child: ListView.builder(
//                       itemCount: snapshot.data!.length,
//                       itemBuilder: (context, index) {
//                         final data = snapshot.data![index];
//                         return BookingCard(data: data);
//                       },
//                     ),
//                   ),
//                 ],
//               ),
//             );
//           } else {
//             // If there are no bookings
//             return Center(child: Text("No bookings available."));
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
//           setState(() {
//             _currentIndex = index;
//           });
//           if (index == 0) {
//             Navigator.push(
//               context,
//               MaterialPageRoute(builder: (context) => HomePageContent()),
//             );
//           } else if (index == 1) {
//             // Do nothing as we are already on the SchedulePage
//           }else if (index == 2) {
//             Navigator.push(
//               context,
//               MaterialPageRoute(builder: (context) => HistoryPageContent()),
//             );
//           }else if (index == 3) {
//             Navigator.push(
//               context,
//               MaterialPageRoute(builder: (context) => CoursesPageContent()),
//             );
//           }
//
//         },
//       ),
//     );
//   }
// }
//
// class BookingCard extends StatelessWidget {
//   final Map<String, dynamic> data;
//
//   const BookingCard({Key? key, required this.data}) : super(key: key);
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
//               "Request:",
//               style: TextStyle(fontWeight: FontWeight.bold),
//             ),
//             Text(data['request']),
//             const SizedBox(height: 8),
//             Row(
//               children: [
//                 ElevatedButton(
//                   onPressed: () {},
//                   style: ElevatedButton.styleFrom(backgroundColor: Colors.red),
//                   child: const Text("Cancel"),
//                 ),
//                 const Spacer(),
//                 ElevatedButton.icon(
//                   onPressed: () {},
//                   icon: const Icon(Icons.video_call),
//                   label: const Text("Go to class"),
//                 ),
//               ],
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }

// import 'package:flutter/material.dart';
// import '../services/schedule_service.dart'; // Import the service
// import '../widgets/booking_card.dart'; // Import the BookingCard widget
//
// class SchedulePageContent extends StatefulWidget {
//   @override
//   _SchedulePageContentState createState() => _SchedulePageContentState();
// }
//
// class _SchedulePageContentState extends State<SchedulePageContent> {
//   final ScheduleService _scheduleService = ScheduleService(); // Instantiate the service
//
//   @override
//   Widget build(BuildContext context) {
//     // Removed Scaffold and navigation elements
//     return FutureBuilder<List<Map<String, dynamic>>>(
//       future: _scheduleService.fetchBookings(),
//       builder: (context, snapshot) {
//         if (snapshot.connectionState == ConnectionState.waiting) {
//           // Show a loading indicator while the data is loading
//           return Center(child: CircularProgressIndicator());
//         } else if (snapshot.hasError) {
//           // Show an error message if something went wrong
//           return Center(child: Text("Failed to load bookings."));
//         } else if (snapshot.hasData && snapshot.data!.isNotEmpty) {
//           // Display the bookings
//           return Padding(
//             padding: const EdgeInsets.all(16.0),
//             child: Column(
//               crossAxisAlignment: CrossAxisAlignment.start,
//               children: [
//                 // Schedule Title and Icon
//                 Row(
//                   children: [
//                     Image.asset(
//                       'assets/schedule.png', // Replace with your calendar icon path
//                       height: 50,
//                       width: 50,
//                     ),
//                     const SizedBox(width: 16),
//                     const Text(
//                       "Schedule",
//                       style: TextStyle(
//                         fontSize: 24,
//                         fontWeight: FontWeight.bold,
//                       ),
//                     ),
//                   ],
//                 ),
//                 const SizedBox(height: 16),
//                 const Text(
//                   "Here are the list of booked lessons. You can track when the meeting starts, cancel the lesson before 2 hours.",
//                   style: TextStyle(fontSize: 16),
//                 ),
//                 const SizedBox(height: 16),
//                 // Booking List
//                 Expanded(
//                   child: ListView.builder(
//                     itemCount: snapshot.data!.length,
//                     itemBuilder: (context, index) {
//                       final data = snapshot.data![index];
//                       return BookingCard(data: data);
//                     },
//                   ),
//                 ),
//               ],
//             ),
//           );
//         } else {
//           // If there are no bookings
//           return Center(child: Text("No bookings available."));
//         }
//       },
//     );
//   }
// }

// class BookingCard extends StatelessWidget {
//   final Map<String, dynamic> data;
//
//   const BookingCard({Key? key, required this.data}) : super(key: key);
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
//               "Request:",
//               style: TextStyle(fontWeight: FontWeight.bold),
//             ),
//             Text(data['request']),
//             const SizedBox(height: 8),
//             Row(
//               children: [
//                 ElevatedButton(
//                   onPressed: () {},
//                   style: ElevatedButton.styleFrom(backgroundColor: Colors.red),
//                   child: const Text("Cancel"),
//                 ),
//                 const Spacer(),
//                 ElevatedButton.icon(
//                   onPressed: () {},
//                   icon: const Icon(Icons.video_call),
//                   label: const Text("Go to class"),
//                 ),
//               ],
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }

// lib/pages/schedule_page_content.dart

import 'package:flutter/material.dart';
import '../../services/schedule_service.dart'; // Import the service
import '../../widgets/booking_card.dart'; // Import the BookingCard widget
import '../../models/booking_item.dart'; // Import the BookingItem model

class SchedulePageContent extends StatefulWidget {
  @override
  _SchedulePageContentState createState() => _SchedulePageContentState();
}

class _SchedulePageContentState extends State<SchedulePageContent> {
  final ScheduleService _scheduleService = ScheduleService(); // Instantiate the service

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<List<BookingItem>>(
      future: _scheduleService.fetchBookings(),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          // Show a loading indicator while the data is loading
          return Center(child: CircularProgressIndicator());
        } else if (snapshot.hasError) {
          // Show an error message if something went wrong
          return Center(child: Text("Failed to load bookings."));
        } else if (snapshot.hasData && snapshot.data!.isNotEmpty) {
          // Display the bookings
          return Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // Schedule Title and Icon
                Row(
                  children: [
                    Image.asset(
                      'assets/schedule.png', // Replace with your calendar icon path
                      height: 50,
                      width: 50,
                    ),
                    const SizedBox(width: 16),
                    const Text(
                      "Schedule",
                      style: TextStyle(
                        fontSize: 24,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 16),
                const Text(
                  "Here are the list of booked lessons. You can track when the meeting starts, cancel the lesson before 2 hours.",
                  style: TextStyle(fontSize: 16),
                ),
                const SizedBox(height: 16),
                // Booking List
                Expanded(
                  child: ListView.builder(
                    itemCount: snapshot.data!.length,
                    itemBuilder: (context, index) {
                      final BookingItem data = snapshot.data![index];
                      return BookingCard(data: data);
                    },
                  ),
                ),
              ],
            ),
          );
        } else {
          // If there are no bookings
          return Center(child: Text("No bookings available."));
        }
      },
    );
  }
}


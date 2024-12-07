// // admin_dashboard_page.dart
// import 'package:flutter/material.dart';
//
// class AdminDashboardPage extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return Center(
//       child: Text(
//         'Admin Dashboard',
//         style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
//       ),
//     );
//   }
// }


// // admin_dashboard_page.dart
// import 'package:flutter/material.dart';
// import 'package:cloud_firestore/cloud_firestore.dart';
// import 'add_tutor_page.dart';    // Import AddTutorPage
// import 'add_course_page.dart';  // Import AddCoursePage
//
// class AdminDashboardPage extends StatefulWidget {
//   @override
//   _AdminDashboardPageState createState() => _AdminDashboardPageState();
// }
//
// class _AdminDashboardPageState extends State<AdminDashboardPage> {
//   // State variables with dummy data
//   int totalStudents = 1200;
//   int totalTutors = 150;
//   double totalRevenue = 35000.75;
//
//   @override
//   void initState() {
//     super.initState();
//     _fetchDashboardData(); // Fetch data on initialization
//   }
//
//   // Fetch data from Firestore
//   Future<void> _fetchDashboardData() async {
//     try {
//       // Fetch total students
//       QuerySnapshot studentsSnapshot = await FirebaseFirestore.instance.collection('students').get();
//       int fetchedTotalStudents = studentsSnapshot.size;
//
//       // Fetch total tutors
//       QuerySnapshot tutorsSnapshot = await FirebaseFirestore.instance.collection('tutors').get();
//       int fetchedTotalTutors = tutorsSnapshot.size;
//
//       // Fetch total revenue
//       DocumentSnapshot revenueSnapshot = await FirebaseFirestore.instance.collection('revenue').doc('current').get();
//       double fetchedTotalRevenue = revenueSnapshot.data()?['amount']?.toDouble() ?? 0.0;
//
//       setState(() {
//         totalStudents = fetchedTotalStudents;
//         totalTutors = fetchedTotalTutors;
//         totalRevenue = fetchedTotalRevenue;
//       });
//     } catch (e) {
//       // Handle errors
//       ScaffoldMessenger.of(context).showSnackBar(
//         SnackBar(content: Text('Error fetching data: $e')),
//       );
//     }
//   }
//
//   // Refresh function to re-fetch data
//   Future<void> _refreshDashboardData() async {
//     await _fetchDashboardData();
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return RefreshIndicator(
//       onRefresh: _refreshDashboardData,
//       child: SingleChildScrollView(
//         physics: AlwaysScrollableScrollPhysics(),
//         padding: EdgeInsets.all(16.0),
//         child: Column(
//           children: [
//             // First Row: Total Students and Total Tutors
//             Row(
//               children: [
//                 _buildStatisticCard(
//                   title: 'Total Students',
//                   count: totalStudents.toString(),
//                   icon: Icons.person,
//                   color: Colors.blue,
//                 ),
//                 SizedBox(width: 16.0),
//                 _buildStatisticCard(
//                   title: 'Total Tutors',
//                   count: totalTutors.toString(),
//                   icon: Icons.school,
//                   color: Colors.green,
//                 ),
//               ],
//             ),
//             SizedBox(height: 16.0),
//
//             // Second Row: Total Revenue
//             _buildStatisticCard(
//               title: 'Total Revenue',
//               count: '\$${totalRevenue.toStringAsFixed(2)}',
//               icon: Icons.attach_money,
//               color: Colors.orange,
//               // Span the full width
//               isFullWidth: true,
//             ),
//             SizedBox(height: 16.0),
//
//             // Third Row: Add Tutor (Clickable)
//             Row(
//               children: [
//                 Expanded(
//                   child: InkWell(
//                     onTap: () {
//                       // Navigate to AddTutorPage
//                       Navigator.push(
//                         context,
//                         MaterialPageRoute(builder: (context) => AddTutorPage()),
//                       );
//                     },
//                     child: _buildActionCard(
//                       title: 'Add Tutor',
//                       icon: Icons.add,
//                       color: Colors.purple,
//                     ),
//                   ),
//                 ),
//                 SizedBox(width: 16.0),
//                 // Optional: Add another action card here if needed
//               ],
//             ),
//             SizedBox(height: 16.0),
//
//             // Fourth Row: Add Course (Clickable)
//             Row(
//               children: [
//                 Expanded(
//                   child: InkWell(
//                     onTap: () {
//                       // Navigate to AddCoursePage
//                       Navigator.push(
//                         context,
//                         MaterialPageRoute(builder: (context) => AddCoursePage()),
//                       );
//                     },
//                     child: _buildActionCard(
//                       title: 'Add Course',
//                       icon: Icons.book,
//                       color: Colors.teal,
//                     ),
//                   ),
//                 ),
//                 SizedBox(width: 16.0),
//                 // Optional: Add another action card here if needed
//               ],
//             ),
//           ],
//         ),
//       ),
//     );
//   }
//
//   // Helper method to build statistic cards
//   Widget _buildStatisticCard({
//     required String title,
//     required String count,
//     required IconData icon,
//     required Color color,
//     bool isFullWidth = false,
//   }) {
//     return Expanded(
//       child: Card(
//         color: Colors.white,
//         elevation: 4.0,
//         shape: RoundedRectangleBorder(
//           borderRadius: BorderRadius.circular(12.0),
//         ),
//         child: Container(
//           padding: EdgeInsets.all(16.0),
//           width: isFullWidth ? double.infinity : null,
//           child: Column(
//             children: [
//               Icon(icon, size: 40.0, color: color),
//               SizedBox(height: 10.0),
//               Text(
//                 count,
//                 style: TextStyle(
//                   fontSize: 22.0,
//                   fontWeight: FontWeight.bold,
//                   color: color,
//                 ),
//               ),
//               SizedBox(height: 5.0),
//               Text(
//                 title,
//                 style: TextStyle(
//                   fontSize: 16.0,
//                   color: Colors.grey[700],
//                 ),
//                 textAlign: TextAlign.center,
//               ),
//             ],
//           ),
//         ),
//       ),
//     );
//   }
//
//   // Helper method to build action cards
//   Widget _buildActionCard({
//     required String title,
//     required IconData icon,
//     required Color color,
//     VoidCallback? onTap,
//   }) {
//     return Card(
//       color: Colors.white,
//       elevation: 4.0,
//       shape: RoundedRectangleBorder(
//         borderRadius: BorderRadius.circular(12.0),
//       ),
//       child: Container(
//         height: 100.0,
//         padding: EdgeInsets.all(16.0),
//         child: Column(
//           mainAxisAlignment: MainAxisAlignment.center,
//           children: [
//             Icon(icon, size: 30.0, color: color),
//             SizedBox(height: 10.0),
//             Text(
//               title,
//               style: TextStyle(
//                 fontSize: 16.0,
//                 color: color,
//                 fontWeight: FontWeight.bold,
//               ),
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }

// // admin_dashboard_page.dart
// import 'package:flutter/material.dart';
// import 'package:cloud_firestore/cloud_firestore.dart';
// import 'add_tutor_page.dart';    // Import AddTutorPage
// import 'add_course_page.dart';  // Import AddCoursePage
//
// class AdminDashboardPage extends StatefulWidget {
//   @override
//   _AdminDashboardPageState createState() => _AdminDashboardPageState();
// }
//
// class _AdminDashboardPageState extends State<AdminDashboardPage> {
//   // State variables with dummy data
//   int totalStudents = 1200;
//   int totalTutors = 150;
//   double totalRevenue = 35000.75;
//
//   @override
//   void initState() {
//     super.initState();
//     _fetchDashboardData(); // Fetch data on initialization
//   }
//
//   // Fetch data from Firestore using typed snapshots
//   Future<void> _fetchDashboardData() async {
//     try {
//       // Fetch total students
//       QuerySnapshot<Map<String, dynamic>> studentsSnapshot = await FirebaseFirestore.instance
//           .collection('students')
//           .get();
//       int fetchedTotalStudents = studentsSnapshot.size;
//
//       // Fetch total tutors
//       QuerySnapshot<Map<String, dynamic>> tutorsSnapshot = await FirebaseFirestore.instance
//           .collection('tutors')
//           .get();
//       int fetchedTotalTutors = tutorsSnapshot.size;
//
//       // Fetch total revenue
//       DocumentSnapshot<Map<String, dynamic>> revenueSnapshot = await FirebaseFirestore.instance
//           .collection('revenue')
//           .doc('current')
//           .get();
//       double fetchedTotalRevenue = revenueSnapshot.data()?['amount']?.toDouble() ?? 0.0;
//
//       setState(() {
//         totalStudents = fetchedTotalStudents;
//         totalTutors = fetchedTotalTutors;
//         totalRevenue = fetchedTotalRevenue;
//       });
//     } catch (e) {
//       // Handle errors
//       ScaffoldMessenger.of(context).showSnackBar(
//         SnackBar(content: Text('Error fetching data: $e')),
//       );
//     }
//   }
//
//   // Refresh function to re-fetch data
//   Future<void> _refreshDashboardData() async {
//     await _fetchDashboardData();
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return RefreshIndicator(
//       onRefresh: _refreshDashboardData,
//       child: SingleChildScrollView(
//         physics: AlwaysScrollableScrollPhysics(),
//         padding: EdgeInsets.all(16.0),
//         child: Column(
//           children: [
//             // First Row: Total Students and Total Tutors
//             Row(
//               children: [
//                 _buildStatisticCard(
//                   title: 'Total Students',
//                   count: totalStudents.toString(),
//                   icon: Icons.person,
//                   color: Colors.blue,
//                 ),
//                 SizedBox(width: 16.0),
//                 _buildStatisticCard(
//                   title: 'Total Tutors',
//                   count: totalTutors.toString(),
//                   icon: Icons.school,
//                   color: Colors.green,
//                 ),
//               ],
//             ),
//             SizedBox(height: 16.0),
//
//             // Second Row: Total Revenue
//             _buildStatisticCard(
//               title: 'Total Revenue',
//               count: '\$${totalRevenue.toStringAsFixed(2)}',
//               icon: Icons.attach_money,
//               color: Colors.orange,
//               // Span the full width
//               isFullWidth: true,
//             ),
//             SizedBox(height: 16.0),
//
//             // Third Row: Add Tutor (Clickable)
//             Row(
//               children: [
//                 Expanded(
//                   child: InkWell(
//                     onTap: () {
//                       // Navigate to AddTutorPage
//                       Navigator.push(
//                         context,
//                         MaterialPageRoute(builder: (context) => AddTutorPage()),
//                       );
//                     },
//                     child: _buildActionCard(
//                       title: 'Add Tutor',
//                       icon: Icons.add,
//                       color: Colors.purple,
//                     ),
//                   ),
//                 ),
//                 SizedBox(width: 16.0),
//                 // Optional: Add another action card here if needed
//               ],
//             ),
//             SizedBox(height: 16.0),
//
//             // Fourth Row: Add Course (Clickable)
//             Row(
//               children: [
//                 Expanded(
//                   child: InkWell(
//                     onTap: () {
//                       // Navigate to AddCoursePage
//                       Navigator.push(
//                         context,
//                         MaterialPageRoute(builder: (context) => AddCoursePage()),
//                       );
//                     },
//                     child: _buildActionCard(
//                       title: 'Add Course',
//                       icon: Icons.book,
//                       color: Colors.teal,
//                     ),
//                   ),
//                 ),
//                 SizedBox(width: 16.0),
//                 // Optional: Add another action card here if needed
//               ],
//             ),
//           ],
//         ),
//       ),
//     );
//   }
//
//   // Helper method to build statistic cards
//   Widget _buildStatisticCard({
//     required String title,
//     required String count,
//     required IconData icon,
//     required Color color,
//     bool isFullWidth = false,
//   }) {
//     return Expanded(
//       child: Card(
//         color: Colors.white,
//         elevation: 4.0,
//         shape: RoundedRectangleBorder(
//           borderRadius: BorderRadius.circular(12.0),
//         ),
//         child: Container(
//           padding: EdgeInsets.all(16.0),
//           width: isFullWidth ? double.infinity : null,
//           child: Column(
//             children: [
//               Icon(icon, size: 40.0, color: color),
//               SizedBox(height: 10.0),
//               Text(
//                 count,
//                 style: TextStyle(
//                   fontSize: 22.0,
//                   fontWeight: FontWeight.bold,
//                   color: color,
//                 ),
//               ),
//               SizedBox(height: 5.0),
//               Text(
//                 title,
//                 style: TextStyle(
//                   fontSize: 16.0,
//                   color: Colors.grey[700],
//                 ),
//                 textAlign: TextAlign.center,
//               ),
//             ],
//           ),
//         ),
//       ),
//     );
//   }
//
//   // Helper method to build action cards
//   Widget _buildActionCard({
//     required String title,
//     required IconData icon,
//     required Color color,
//     VoidCallback? onTap,
//   }) {
//     return Card(
//       color: Colors.white,
//       elevation: 4.0,
//       shape: RoundedRectangleBorder(
//         borderRadius: BorderRadius.circular(12.0),
//       ),
//       child: Container(
//         height: 100.0,
//         padding: EdgeInsets.all(16.0),
//         child: Column(
//           mainAxisAlignment: MainAxisAlignment.center,
//           children: [
//             Icon(icon, size: 30.0, color: color),
//             SizedBox(height: 10.0),
//             Text(
//               title,
//               style: TextStyle(
//                 fontSize: 16.0,
//                 color: color,
//                 fontWeight: FontWeight.bold,
//               ),
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }

//
// // admin_dashboard_page.dart
// import 'package:flutter/material.dart';
// import 'package:cloud_firestore/cloud_firestore.dart';
// import 'add_tutor_page.dart';    // Import AddTutorPage
// import 'add_course_page.dart';  // Import AddCoursePage
//
// class AdminDashboardPage extends StatefulWidget {
//   @override
//   _AdminDashboardPageState createState() => _AdminDashboardPageState();
// }
//
// class _AdminDashboardPageState extends State<AdminDashboardPage> {
//   // State variables
//   int totalStudents = 1200;
//   int totalTutors = 150;
//   double totalRevenue = 35000.75;
//
//   @override
//   void initState() {
//     super.initState();
//     _fetchDashboardData(); // Fetch data on initialization
//   }
//
//   // Fetch data from Firestore using typed snapshots
//   Future<void> _fetchDashboardData() async {
//     try {
//       // Fetch total students
//       QuerySnapshot<Map<String, dynamic>> studentsSnapshot =
//       await FirebaseFirestore.instance.collection('students').get();
//       int fetchedTotalStudents = studentsSnapshot.size;
//
//       // Fetch total tutors
//       QuerySnapshot<Map<String, dynamic>> tutorsSnapshot =
//       await FirebaseFirestore.instance.collection('tutors').get();
//       int fetchedTotalTutors = tutorsSnapshot.size;
//
//       // Fetch total revenue
//       DocumentSnapshot<Map<String, dynamic>> revenueSnapshot =
//       await FirebaseFirestore.instance.collection('revenue').doc('current').get();
//       double fetchedTotalRevenue =
//           revenueSnapshot.data()?['amount']?.toDouble() ?? 0.0;
//
//       setState(() {
//         totalStudents = fetchedTotalStudents;
//         totalTutors = fetchedTotalTutors;
//         totalRevenue = fetchedTotalRevenue;
//       });
//     } catch (e) {
//       // Handle errors
//       ScaffoldMessenger.of(context).showSnackBar(
//         SnackBar(content: Text('Error fetching data: $e')),
//       );
//     }
//   }
//
//   // Refresh function to re-fetch data
//   Future<void> _refreshDashboardData() async {
//     await _fetchDashboardData();
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return RefreshIndicator(
//       onRefresh: _refreshDashboardData,
//       child: SingleChildScrollView(
//         physics: AlwaysScrollableScrollPhysics(),
//         padding: EdgeInsets.all(16.0),
//         child: Column(
//           children: [
//             // First Row: Total Students and Total Tutors
//             Row(
//               children: [
//                 Expanded(
//                   child: _buildStatisticCard(
//                     title: 'Total Students',
//                     count: totalStudents.toString(),
//                     icon: Icons.person,
//                     color: Colors.blue,
//                   ),
//                 ),
//                 SizedBox(width: 16.0),
//                 Expanded(
//                   child: _buildStatisticCard(
//                     title: 'Total Tutors',
//                     count: totalTutors.toString(),
//                     icon: Icons.school,
//                     color: Colors.green,
//                   ),
//                 ),
//               ],
//             ),
//             SizedBox(height: 16.0),
//
//             // Second Row: Total Revenue (Full Width)
//             _buildStatisticCard(
//               title: 'Total Revenue',
//               count: '\$${totalRevenue.toStringAsFixed(2)}',
//               icon: Icons.attach_money,
//               color: Colors.orange,
//               isFullWidth: true, // No Expanded needed here
//             ),
//             SizedBox(height: 16.0),
//
//             // Third Row: Add Tutor (Clickable)
//             Row(
//               children: [
//                 Expanded(
//                   child: InkWell(
//                     onTap: () {
//                       // Navigate to AddTutorPage
//                       Navigator.push(
//                         context,
//                         MaterialPageRoute(builder: (context) => AddTutorPage()),
//                       );
//                     },
//                     child: _buildActionCard(
//                       title: 'Add Tutor',
//                       icon: Icons.add,
//                       color: Colors.purple,
//                     ),
//                   ),
//                 ),
//                 SizedBox(width: 16.0),
//                 // Optional: Add another action card here if needed
//               ],
//             ),
//             SizedBox(height: 16.0),
//
//             // Fourth Row: Add Course (Clickable)
//             Row(
//               children: [
//                 Expanded(
//                   child: InkWell(
//                     onTap: () {
//                       // Navigate to AddCoursePage
//                       Navigator.push(
//                         context,
//                         MaterialPageRoute(builder: (context) => AddCoursePage()),
//                       );
//                     },
//                     child: _buildActionCard(
//                       title: 'Add Course',
//                       icon: Icons.book,
//                       color: Colors.teal,
//                     ),
//                   ),
//                 ),
//                 SizedBox(width: 16.0),
//                 // Optional: Add another action card here if needed
//               ],
//             ),
//           ],
//         ),
//       ),
//     );
//   }
//
//   // Helper method to build statistic cards
//   Widget _buildStatisticCard({
//     required String title,
//     required String count,
//     required IconData icon,
//     required Color color,
//     bool isFullWidth = false,
//   }) {
//     return Card(
//       color: Colors.white,
//       elevation: 4.0,
//       shape: RoundedRectangleBorder(
//         borderRadius: BorderRadius.circular(12.0),
//       ),
//       child: Container(
//         padding: EdgeInsets.all(16.0),
//         width: isFullWidth ? double.infinity : null,
//         child: Column(
//           children: [
//             Icon(icon, size: 40.0, color: color),
//             SizedBox(height: 10.0),
//             Text(
//               count,
//               style: TextStyle(
//                 fontSize: 22.0,
//                 fontWeight: FontWeight.bold,
//                 color: color,
//               ),
//             ),
//             SizedBox(height: 5.0),
//             Text(
//               title,
//               style: TextStyle(
//                 fontSize: 16.0,
//                 color: Colors.grey[700],
//               ),
//               textAlign: TextAlign.center,
//             ),
//           ],
//         ),
//       ),
//     );
//   }
//
//   // Helper method to build action cards
//   Widget _buildActionCard({
//     required String title,
//     required IconData icon,
//     required Color color,
//     VoidCallback? onTap,
//   }) {
//     return Card(
//       color: Colors.white,
//       elevation: 4.0,
//       shape: RoundedRectangleBorder(
//         borderRadius: BorderRadius.circular(12.0),
//       ),
//       child: Container(
//         height: 100.0,
//         padding: EdgeInsets.all(16.0),
//         child: Column(
//           mainAxisAlignment: MainAxisAlignment.center,
//           children: [
//             Icon(icon, size: 30.0, color: color),
//             SizedBox(height: 10.0),
//             Text(
//               title,
//               style: TextStyle(
//                 fontSize: 16.0,
//                 color: color,
//                 fontWeight: FontWeight.bold,
//               ),
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }


// // admin_dashboard_page.dart
// import 'package:flutter/material.dart';
// import 'package:cloud_firestore/cloud_firestore.dart';
// import 'add_tutor_page.dart';    // Import AddTutorPage
// import 'add_course_page.dart';  // Import AddCoursePage
//
// class AdminDashboardPage extends StatefulWidget {
//   @override
//   _AdminDashboardPageState createState() => _AdminDashboardPageState();
// }
//
// class _AdminDashboardPageState extends State<AdminDashboardPage> {
//   // State variables
//   int totalStudents = 1200;
//   int totalTutors = 150;
//   double totalRevenue = 35000.75;
//
//   @override
//   void initState() {
//     super.initState();
//     _fetchDashboardData(); // Fetch data on initialization
//   }
//
//   // Fetch data from Firestore using typed snapshots
//   Future<void> _fetchDashboardData() async {
//     try {
//       // Fetch total students
//       QuerySnapshot<Map<String, dynamic>> studentsSnapshot =
//       await FirebaseFirestore.instance.collection('students').get();
//       int fetchedTotalStudents = studentsSnapshot.size;
//
//       // Fetch total tutors
//       QuerySnapshot<Map<String, dynamic>> tutorsSnapshot =
//       await FirebaseFirestore.instance.collection('tutors').get();
//       int fetchedTotalTutors = tutorsSnapshot.size;
//
//       // Fetch total revenue
//       DocumentSnapshot<Map<String, dynamic>> revenueSnapshot =
//       await FirebaseFirestore.instance.collection('revenue').doc('current').get();
//       double fetchedTotalRevenue =
//           revenueSnapshot.data()?['amount']?.toDouble() ?? 0.0;
//
//       setState(() {
//         totalStudents = fetchedTotalStudents;
//         totalTutors = fetchedTotalTutors;
//         totalRevenue = fetchedTotalRevenue;
//       });
//     } catch (e) {
//       // Handle errors
//       ScaffoldMessenger.of(context).showSnackBar(
//         SnackBar(content: Text('Error fetching data: $e')),
//       );
//     }
//   }
//
//   // Refresh function to re-fetch data
//   Future<void> _refreshDashboardData() async {
//     await _fetchDashboardData();
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return RefreshIndicator(
//       onRefresh: _refreshDashboardData,
//       child: SingleChildScrollView(
//         physics: AlwaysScrollableScrollPhysics(),
//         padding: EdgeInsets.all(16.0),
//         child: Column(
//           children: [
//             // First Row: Total Students and Total Tutors
//             Row(
//               children: [
//                 Expanded(
//                   child: _buildStatisticCard(
//                     title: 'Total Students',
//                     count: totalStudents.toString(),
//                     icon: Icon(
//                       Icons.person,
//                       size: 40.0,
//                       color: Colors.blue,
//                     ),
//                     color: Colors.blue,
//                   ),
//                 ),
//                 SizedBox(width: 16.0),
//                 Expanded(
//                   child: _buildStatisticCard(
//                     title: 'Total Tutors',
//                     count: totalTutors.toString(),
//                     icon: Icon(
//                       Icons.school,
//                       size: 40.0,
//                       color: Colors.green,
//                     ),
//                     color: Colors.green,
//                   ),
//                 ),
//               ],
//             ),
//             SizedBox(height: 16.0),
//
//             // Second Row: Total Revenue (Full Width)
//             _buildStatisticCard(
//               title: 'Total Revenue',
//               count: 'रू ${totalRevenue.toStringAsFixed(2)}', // Updated currency symbol
//               icon: Text(
//                 'रू', // Nepali Rupee symbol
//                 style: TextStyle(
//                   fontSize: 40.0, // Adjust size as needed
//                   color: Colors.orange,
//                   fontWeight: FontWeight.bold,
//                 ),
//               ),
//               color: Colors.orange,
//               isFullWidth: true, // No Expanded needed here
//             ),
//             SizedBox(height: 16.0),
//
//             // Third Row: Add Tutor (Clickable)
//             Row(
//               children: [
//                 Expanded(
//                   child: InkWell(
//                     onTap: () {
//                       // Navigate to AddTutorPage
//                       Navigator.push(
//                         context,
//                         MaterialPageRoute(builder: (context) => AddTutorPage()),
//                       );
//                     },
//                     child: _buildActionCard(
//                       title: 'Add Tutor',
//                       icon: Icons.add,
//                       color: Colors.purple,
//                     ),
//                   ),
//                 ),
//                 SizedBox(width: 16.0),
//                 // Optional: Add another action card here if needed
//               ],
//             ),
//             SizedBox(height: 16.0),
//
//             // Fourth Row: Add Course (Clickable)
//             Row(
//               children: [
//                 Expanded(
//                   child: InkWell(
//                     onTap: () {
//                       // Navigate to AddCoursePage
//                       Navigator.push(
//                         context,
//                         MaterialPageRoute(builder: (context) => AddCoursePage()),
//                       );
//                     },
//                     child: _buildActionCard(
//                       title: 'Add Course',
//                       icon: Icons.book,
//                       color: Colors.teal,
//                     ),
//                   ),
//                 ),
//                 SizedBox(width: 16.0),
//                 // Optional: Add another action card here if needed
//               ],
//             ),
//           ],
//         ),
//       ),
//     );
//   }
//
//   // Helper method to build statistic cards
//   Widget _buildStatisticCard({
//     required String title,
//     required String count,
//     Widget? icon, // Changed from IconData to Widget
//     required Color color,
//     bool isFullWidth = false,
//   }) {
//     return Card(
//       color: Colors.white,
//       elevation: 4.0,
//       shape: RoundedRectangleBorder(
//         borderRadius: BorderRadius.circular(12.0),
//       ),
//       child: Container(
//         padding: EdgeInsets.all(16.0),
//         width: isFullWidth ? double.infinity : null,
//         child: Column(
//           children: [
//             if (icon != null) icon,
//             SizedBox(height: 10.0),
//             Text(
//               count,
//               style: TextStyle(
//                 fontSize: 22.0,
//                 fontWeight: FontWeight.bold,
//                 color: color,
//               ),
//             ),
//             SizedBox(height: 5.0),
//             Text(
//               title,
//               style: TextStyle(
//                 fontSize: 16.0,
//                 color: Colors.grey[700],
//               ),
//               textAlign: TextAlign.center,
//             ),
//           ],
//         ),
//       ),
//     );
//   }
//
//   // Helper method to build action cards
//   Widget _buildActionCard({
//     required String title,
//     required IconData icon,
//     required Color color,
//     VoidCallback? onTap,
//   }) {
//     return Card(
//       color: Colors.white,
//       elevation: 4.0,
//       shape: RoundedRectangleBorder(
//         borderRadius: BorderRadius.circular(12.0),
//       ),
//       child: Container(
//         height: 100.0,
//         padding: EdgeInsets.all(16.0),
//         child: Column(
//           mainAxisAlignment: MainAxisAlignment.center,
//           children: [
//             Icon(icon, size: 30.0, color: color),
//             SizedBox(height: 10.0),
//             Text(
//               title,
//               style: TextStyle(
//                 fontSize: 16.0,
//                 color: color,
//                 fontWeight: FontWeight.bold,
//               ),
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }

// admin_dashboard_page.dart
// import 'package:flutter/material.dart';
// import 'package:cloud_firestore/cloud_firestore.dart';
// import 'add_tutor_page.dart';    // Import AddTutorPage
// import 'add_course_page.dart';  // Import AddCoursePage
//
// class AdminDashboardPage extends StatefulWidget {
//   @override
//   _AdminDashboardPageState createState() => _AdminDashboardPageState();
// }
//
// class _AdminDashboardPageState extends State<AdminDashboardPage> {
//   // State variables
//   int totalStudents = 1200;
//   int totalTutors = 150;
//   double totalRevenue = 35000.75;
//
//   @override
//   void initState() {
//     super.initState();
//     // Schedule _fetchDashboardData to run after the first frame
//     WidgetsBinding.instance.addPostFrameCallback((_) {
//       _fetchDashboardData();
//     });
//   }
//
//   // Fetch data from Firestore using typed snapshots
//   Future<void> _fetchDashboardData() async {
//     try {
//       // Fetch total students
//       QuerySnapshot<Map<String, dynamic>> studentsSnapshot =
//       await FirebaseFirestore.instance.collection('students').get();
//       int fetchedTotalStudents = studentsSnapshot.size;
//
//       // Fetch total tutors
//       QuerySnapshot<Map<String, dynamic>> tutorsSnapshot =
//       await FirebaseFirestore.instance.collection('tutors').get();
//       int fetchedTotalTutors = tutorsSnapshot.size;
//
//       // Fetch total revenue
//       DocumentSnapshot<Map<String, dynamic>> revenueSnapshot =
//       await FirebaseFirestore.instance.collection('revenue').doc('current').get();
//       double fetchedTotalRevenue =
//           revenueSnapshot.data()?['amount']?.toDouble() ?? 0.0;
//
//       setState(() {
//         totalStudents = fetchedTotalStudents;
//         totalTutors = fetchedTotalTutors;
//         totalRevenue = fetchedTotalRevenue;
//       });
//     } catch (e) {
//       // Handle errors by showing a SnackBar
//       ScaffoldMessenger.of(context).showSnackBar(
//         SnackBar(content: Text('Error fetching data: $e')),
//       );
//     }
//   }
//
//   // Refresh function to re-fetch data
//   Future<void> _refreshDashboardData() async {
//     await _fetchDashboardData();
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return RefreshIndicator(
//       onRefresh: _refreshDashboardData,
//       child: SingleChildScrollView(
//         physics: AlwaysScrollableScrollPhysics(),
//         padding: EdgeInsets.all(16.0),
//         child: Column(
//           children: [
//             // First Row: Total Students and Total Tutors
//             Row(
//               children: [
//                 Expanded(
//                   child: _buildStatisticCard(
//                     title: 'Total Students',
//                     count: totalStudents.toString(),
//                     icon: Icon(
//                       Icons.person,
//                       size: 40.0,
//                       color: Colors.blue,
//                     ),
//                     color: Colors.blue,
//                   ),
//                 ),
//                 SizedBox(width: 16.0),
//                 Expanded(
//                   child: _buildStatisticCard(
//                     title: 'Total Tutors',
//                     count: totalTutors.toString(),
//                     icon: Icon(
//                       Icons.school,
//                       size: 40.0,
//                       color: Colors.green,
//                     ),
//                     color: Colors.green,
//                   ),
//                 ),
//               ],
//             ),
//             SizedBox(height: 16.0),
//
//             // Second Row: Total Revenue (Full Width)
//             _buildStatisticCard(
//               title: 'Total Revenue',
//               count: 'रू ${totalRevenue.toStringAsFixed(2)}', // Updated currency symbol
//               icon: Text(
//                 'रू', // Nepali Rupee symbol
//                 style: TextStyle(
//                   fontSize: 40.0, // Adjust size as needed
//                   color: Colors.orange,
//                   fontWeight: FontWeight.bold,
//                 ),
//               ),
//               color: Colors.orange,
//               isFullWidth: true, // No Expanded needed here
//             ),
//             SizedBox(height: 16.0),
//
//             // Third Row: Add Tutor (Clickable)
//             Row(
//               children: [
//                 Expanded(
//                   child: InkWell(
//                     onTap: () {
//                       // Navigate to AddTutorPage
//                       Navigator.push(
//                         context,
//                         MaterialPageRoute(builder: (context) => AddTutorPage()),
//                       );
//                     },
//                     child: _buildActionCard(
//                       title: 'Add Tutor',
//                       icon: Icons.add,
//                       color: Colors.purple,
//                     ),
//                   ),
//                 ),
//                 SizedBox(width: 16.0),
//                 // Optional: Add another action card here if needed
//               ],
//             ),
//             SizedBox(height: 16.0),
//
//             // Fourth Row: Add Course (Clickable)
//             Row(
//               children: [
//                 Expanded(
//                   child: InkWell(
//                     onTap: () {
//                       // Navigate to AddCoursePage
//                       Navigator.push(
//                         context,
//                         MaterialPageRoute(builder: (context) => AddCoursePage()),
//                       );
//                     },
//                     child: _buildActionCard(
//                       title: 'Add Course',
//                       icon: Icons.book,
//                       color: Colors.teal,
//                     ),
//                   ),
//                 ),
//                 SizedBox(width: 16.0),
//                 // Optional: Add another action card here if needed
//               ],
//             ),
//           ],
//         ),
//       ),
//     );
//   }
//
//   // Helper method to build statistic cards
//   Widget _buildStatisticCard({
//     required String title,
//     required String count,
//     Widget? icon, // Changed from IconData to Widget
//     required Color color,
//     bool isFullWidth = false,
//   }) {
//     return Card(
//       color: Colors.white,
//       elevation: 4.0,
//       shape: RoundedRectangleBorder(
//         borderRadius: BorderRadius.circular(12.0),
//       ),
//       child: Container(
//         padding: EdgeInsets.all(16.0),
//         width: isFullWidth ? double.infinity : null,
//         child: Column(
//           children: [
//             if (icon != null) icon,
//             SizedBox(height: 10.0),
//             Text(
//               count,
//               style: TextStyle(
//                 fontSize: 22.0,
//                 fontWeight: FontWeight.bold,
//                 color: color,
//               ),
//             ),
//             SizedBox(height: 5.0),
//             Text(
//               title,
//               style: TextStyle(
//                 fontSize: 16.0,
//                 color: Colors.grey[700],
//               ),
//               textAlign: TextAlign.center,
//             ),
//           ],
//         ),
//       ),
//     );
//   }
//
//   // Helper method to build action cards
//   Widget _buildActionCard({
//     required String title,
//     required IconData icon,
//     required Color color,
//     VoidCallback? onTap,
//   }) {
//     return Card(
//       color: Colors.white,
//       elevation: 4.0,
//       shape: RoundedRectangleBorder(
//         borderRadius: BorderRadius.circular(12.0),
//       ),
//       child: Container(
//         height: 100.0,
//         padding: EdgeInsets.all(16.0),
//         child: Column(
//           mainAxisAlignment: MainAxisAlignment.center,
//           children: [
//             Icon(icon, size: 30.0, color: color),
//             SizedBox(height: 10.0),
//             Text(
//               title,
//               style: TextStyle(
//                 fontSize: 16.0,
//                 color: color,
//                 fontWeight: FontWeight.bold,
//               ),
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }

// import 'package:flutter/material.dart';
// import 'package:cloud_firestore/cloud_firestore.dart';
// import 'add_tutor_page.dart';    // Import AddTutorPage
// import 'add_course_page.dart';  // Import AddCoursePage
// import 'tutor_requests_page.dart'; // Import TutorRequestsPage
//
// class AdminDashboardPage extends StatefulWidget {
//   @override
//   _AdminDashboardPageState createState() => _AdminDashboardPageState();
// }
//
// class _AdminDashboardPageState extends State<AdminDashboardPage> {
//   // State variables
//   int totalStudents = 1200;
//   int totalTutors = 150;
//   double totalRevenue = 35000.75;
//   int totalTutorRequests = 0; // New state variable
//
//   final FirebaseFirestore _firestore = FirebaseFirestore.instance;
//
//   @override
//   void initState() {
//     super.initState();
//     // Schedule _fetchDashboardData to run after the first frame
//     WidgetsBinding.instance.addPostFrameCallback((_) {
//       _fetchDashboardData();
//     });
//   }
//
//   // Fetch data from Firestore using typed snapshots
//   Future<void> _fetchDashboardData() async {
//     try {
//       // Fetch total students
//       QuerySnapshot<Map<String, dynamic>> studentsSnapshot =
//       await _firestore.collection('students').get();
//       int fetchedTotalStudents = studentsSnapshot.size;
//
//       // Fetch total tutors
//       QuerySnapshot<Map<String, dynamic>> tutorsSnapshot =
//       await _firestore.collection('tutors').get();
//       int fetchedTotalTutors = tutorsSnapshot.size;
//
//       // Fetch total revenue
//       DocumentSnapshot<Map<String, dynamic>> revenueSnapshot =
//       await _firestore.collection('revenue').doc('current').get();
//       double fetchedTotalRevenue =
//           revenueSnapshot.data()?['amount']?.toDouble() ?? 0.0;
//
//       // Fetch total tutor requests
//       QuerySnapshot<Map<String, dynamic>> requestsSnapshot =
//       await _firestore.collection('tutor_requests').get();
//       int fetchedTotalTutorRequests = requestsSnapshot.size;
//
//       setState(() {
//         totalStudents = fetchedTotalStudents;
//         totalTutors = fetchedTotalTutors;
//         totalRevenue = fetchedTotalRevenue;
//         totalTutorRequests = fetchedTotalTutorRequests;
//       });
//     } catch (e) {
//       // Handle errors by showing a SnackBar
//       ScaffoldMessenger.of(context).showSnackBar(
//         SnackBar(content: Text('Error fetching data: $e')),
//       );
//     }
//   }
//
//   // Refresh function to re-fetch data
//   Future<void> _refreshDashboardData() async {
//     await _fetchDashboardData();
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return RefreshIndicator(
//       onRefresh: _refreshDashboardData,
//       child: SingleChildScrollView(
//         physics: AlwaysScrollableScrollPhysics(),
//         padding: EdgeInsets.all(16.0),
//         child: Column(
//           children: [
//             // First Row: Total Students and Total Tutors
//             Row(
//               children: [
//                 Expanded(
//                   child: _buildStatisticCard(
//                     title: 'Total Students',
//                     count: totalStudents.toString(),
//                     icon: Icon(
//                       Icons.person,
//                       size: 40.0,
//                       color: Colors.blue,
//                     ),
//                     color: Colors.blue,
//                   ),
//                 ),
//                 SizedBox(width: 16.0),
//                 Expanded(
//                   child: _buildStatisticCard(
//                     title: 'Total Tutors',
//                     count: totalTutors.toString(),
//                     icon: Icon(
//                       Icons.school,
//                       size: 40.0,
//                       color: Colors.green,
//                     ),
//                     color: Colors.green,
//                   ),
//                 ),
//               ],
//             ),
//             SizedBox(height: 16.0),
//
//             // Second Row: Total Revenue (Full Width)
//             _buildStatisticCard(
//               title: 'Total Revenue',
//               count: 'रू ${totalRevenue.toStringAsFixed(2)}', // Updated currency symbol
//               icon: Text(
//                 'रू', // Nepali Rupee symbol
//                 style: TextStyle(
//                   fontSize: 40.0, // Adjust size as needed
//                   color: Colors.orange,
//                   fontWeight: FontWeight.bold,
//                 ),
//               ),
//               color: Colors.orange,
//               isFullWidth: true, // No Expanded needed here
//             ),
//             SizedBox(height: 16.0),
//
//             // Third Row: Add Tutor and Add Course
//             Row(
//               children: [
//                 Expanded(
//                   child: InkWell(
//                     onTap: () {
//                       // Navigate to AddTutorPage
//                       Navigator.push(
//                         context,
//                         MaterialPageRoute(builder: (context) => AddTutorPage()),
//                       ).then((_) => _fetchDashboardData()); // Refresh data after returning
//                     },
//                     child: _buildActionCard(
//                       title: 'Add Tutor',
//                       icon: Icons.add,
//                       color: Colors.purple,
//                     ),
//                   ),
//                 ),
//                 SizedBox(width: 16.0),
//                 Expanded(
//                   child: InkWell(
//                     onTap: () {
//                       // Navigate to AddCoursePage
//                       Navigator.push(
//                         context,
//                         MaterialPageRoute(builder: (context) => AddCoursePage()),
//                       ).then((_) => _fetchDashboardData()); // Refresh data after returning
//                     },
//                     child: _buildActionCard(
//                       title: 'Add Course',
//                       icon: Icons.book,
//                       color: Colors.teal,
//                     ),
//                   ),
//                 ),
//               ],
//             ),
//             SizedBox(height: 16.0),
//
//             // Fourth Row: Tutor Requests
//             Row(
//               children: [
//                 Expanded(
//                   child: InkWell(
//                     onTap: () {
//                       // Navigate to TutorRequestsPage
//                       Navigator.push(
//                         context,
//                         MaterialPageRoute(builder: (context) => TutorRequestsPage()),
//                       ).then((_) => _fetchDashboardData()); // Refresh data after returning
//                     },
//                     child: _buildActionCard(
//                       title: 'Tutor Requests',
//                       icon: Icons.request_page, // Use a relevant icon
//                       color: Colors.deepOrange,
//                       // Optionally, you can show a badge with the number of requests
//                       badgeCount: totalTutorRequests,
//                     ),
//                   ),
//                 ),
//                 SizedBox(width: 16.0),
//                 // Optional: Add another action card here if needed
//               ],
//             ),
//             SizedBox(height: 16.0),
//
//             // Add more rows or widgets as needed
//           ],
//         ),
//       ),
//     );
//   }
//
//   // Helper method to build statistic cards
//   Widget _buildStatisticCard({
//     required String title,
//     required String count,
//     Widget? icon, // Changed from IconData to Widget
//     required Color color,
//     bool isFullWidth = false,
//   }) {
//     return Card(
//       color: Colors.white,
//       elevation: 4.0,
//       shape: RoundedRectangleBorder(
//         borderRadius: BorderRadius.circular(12.0),
//       ),
//       child: Container(
//         padding: EdgeInsets.all(16.0),
//         width: isFullWidth ? double.infinity : null,
//         child: Column(
//           children: [
//             if (icon != null) icon,
//             SizedBox(height: 10.0),
//             Text(
//               count,
//               style: TextStyle(
//                 fontSize: 22.0,
//                 fontWeight: FontWeight.bold,
//                 color: color,
//               ),
//             ),
//             SizedBox(height: 5.0),
//             Text(
//               title,
//               style: TextStyle(
//                 fontSize: 16.0,
//                 color: Colors.grey[700],
//               ),
//               textAlign: TextAlign.center,
//             ),
//           ],
//         ),
//       ),
//     );
//   }
//
//   // Helper method to build action cards
//   Widget _buildActionCard({
//     required String title,
//     required IconData icon,
//     required Color color,
//     VoidCallback? onTap,
//     int? badgeCount, // Optional badge count
//   }) {
//     return Stack(
//       children: [
//         Card(
//           color: Colors.white,
//           elevation: 4.0,
//           shape: RoundedRectangleBorder(
//             borderRadius: BorderRadius.circular(12.0),
//           ),
//           child: Container(
//             height: 100.0,
//             padding: EdgeInsets.all(16.0),
//             child: Column(
//               mainAxisAlignment: MainAxisAlignment.center,
//               children: [
//                 Icon(icon, size: 30.0, color: color),
//                 SizedBox(height: 10.0),
//                 Text(
//                   title,
//                   style: TextStyle(
//                     fontSize: 16.0,
//                     color: color,
//                     fontWeight: FontWeight.bold,
//                   ),
//                 ),
//               ],
//             ),
//           ),
//         ),
//         // If there's a badge count, display it
//         if (badgeCount != null && badgeCount > 0)
//           Positioned(
//             right: 8,
//             top: 8,
//             child: Container(
//               padding: EdgeInsets.all(4.0),
//               decoration: BoxDecoration(
//                 color: Colors.redAccent,
//                 shape: BoxShape.circle,
//               ),
//               child: Text(
//                 badgeCount.toString(),
//                 style: TextStyle(
//                   color: Colors.white,
//                   fontSize: 12.0,
//                 ),
//               ),
//             ),
//           ),
//       ],
//     );
//   }
// }

// import 'package:flutter/material.dart';
// // import 'package:cloud_firestore/cloud_firestore.dart'; // Firebase is commented out
// import 'add_tutor_page.dart';    // Import AddTutorPage
// import 'add_course_page.dart';  // Import AddCoursePage
// import 'tutor_requests_page.dart'; // Import TutorRequestsPage
//
// class AdminDashboardPage extends StatefulWidget {
//   @override
//   _AdminDashboardPageState createState() => _AdminDashboardPageState();
// }
//
// class _AdminDashboardPageState extends State<AdminDashboardPage> {
//   // State variables with dummy data
//   int totalStudents = 1200;
//   int totalTutors = 150;
//   double totalRevenue = 35000.75;
//   int totalTutorRequests = 25; // Example dummy count
//
//   // final FirebaseFirestore _firestore = FirebaseFirestore.instance; // Firebase is commented out
//
//   @override
//   void initState() {
//     super.initState();
//     // Schedule _fetchDashboardData to run after the first frame
//     WidgetsBinding.instance.addPostFrameCallback((_) {
//       _fetchDashboardData();
//     });
//   }
//
//   // Fetch data from Firestore using typed snapshots
//   Future<void> _fetchDashboardData() async {
//     try {
//       // Firebase code is commented out and replaced with dummy data
//       /*
//       // Fetch total students
//       QuerySnapshot<Map<String, dynamic>> studentsSnapshot =
//           await _firestore.collection('students').get();
//       int fetchedTotalStudents = studentsSnapshot.size;
//
//       // Fetch total tutors
//       QuerySnapshot<Map<String, dynamic>> tutorsSnapshot =
//           await _firestore.collection('tutors').get();
//       int fetchedTotalTutors = tutorsSnapshot.size;
//
//       // Fetch total revenue
//       DocumentSnapshot<Map<String, dynamic>> revenueSnapshot =
//           await _firestore.collection('revenue').doc('current').get();
//       double fetchedTotalRevenue =
//           revenueSnapshot.data()?['amount']?.toDouble() ?? 0.0;
//
//       // Fetch total tutor requests
//       QuerySnapshot<Map<String, dynamic>> requestsSnapshot =
//           await _firestore.collection('tutor_requests').get();
//       int fetchedTotalTutorRequests = requestsSnapshot.size;
//       */
//
//       // Using dummy data instead
//       int fetchedTotalStudents = 1200;
//       int fetchedTotalTutors = 150;
//       double fetchedTotalRevenue = 35000.75;
//       int fetchedTotalTutorRequests = 25;
//
//       setState(() {
//         totalStudents = fetchedTotalStudents;
//         totalTutors = fetchedTotalTutors;
//         totalRevenue = fetchedTotalRevenue;
//         totalTutorRequests = fetchedTotalTutorRequests;
//       });
//     } catch (e) {
//       // Handle errors by showing a SnackBar
//       ScaffoldMessenger.of(context).showSnackBar(
//         SnackBar(content: Text('Error fetching data: $e')),
//       );
//     }
//   }
//
//   // Refresh function to re-fetch data
//   Future<void> _refreshDashboardData() async {
//     await _fetchDashboardData();
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return RefreshIndicator(
//       onRefresh: _refreshDashboardData,
//       child: SingleChildScrollView(
//         physics: AlwaysScrollableScrollPhysics(),
//         padding: EdgeInsets.all(16.0),
//         child: Column(
//           children: [
//             // First Row: Total Students and Total Tutors
//             Row(
//               children: [
//                 Expanded(
//                   child: _buildStatisticCard(
//                     title: 'Total Students',
//                     count: totalStudents.toString(),
//                     icon: Icon(
//                       Icons.person,
//                       size: 40.0,
//                       color: Colors.blue,
//                     ),
//                     color: Colors.blue,
//                   ),
//                 ),
//                 SizedBox(width: 16.0),
//                 Expanded(
//                   child: _buildStatisticCard(
//                     title: 'Total Tutors',
//                     count: totalTutors.toString(),
//                     icon: Icon(
//                       Icons.school,
//                       size: 40.0,
//                       color: Colors.green,
//                     ),
//                     color: Colors.green,
//                   ),
//                 ),
//               ],
//             ),
//             SizedBox(height: 16.0),
//
//             // Second Row: Total Revenue (Full Width)
//             _buildStatisticCard(
//               title: 'Total Revenue',
//               count: 'रू ${totalRevenue.toStringAsFixed(2)}', // Nepali Rupee symbol
//               icon: Text(
//                 'रू',
//                 style: TextStyle(
//                   fontSize: 40.0, // Adjust size as needed
//                   color: Colors.orange,
//                   fontWeight: FontWeight.bold,
//                 ),
//               ),
//               color: Colors.orange,
//               isFullWidth: true, // No Expanded needed here
//             ),
//             SizedBox(height: 16.0),
//
//             // Third Row: Add Tutor and Add Course
//             Row(
//               children: [
//                 Expanded(
//                   child: InkWell(
//                     onTap: () {
//                       // Navigate to AddTutorPage
//                       Navigator.push(
//                         context,
//                         MaterialPageRoute(builder: (context) => AddTutorPage()),
//                       ).then((_) => _fetchDashboardData()); // Refresh data after returning
//                     },
//                     child: _buildActionCard(
//                       title: 'Add Tutor',
//                       icon: Icons.add,
//                       color: Colors.purple,
//                     ),
//                   ),
//                 ),
//                 SizedBox(width: 16.0),
//                 Expanded(
//                   child: InkWell(
//                     onTap: () {
//                       // Navigate to AddCoursePage
//                       Navigator.push(
//                         context,
//                         MaterialPageRoute(builder: (context) => AddCoursePage()),
//                       ).then((_) => _fetchDashboardData()); // Refresh data after returning
//                     },
//                     child: _buildActionCard(
//                       title: 'Add Course',
//                       icon: Icons.book,
//                       color: Colors.teal,
//                     ),
//                   ),
//                 ),
//               ],
//             ),
//             SizedBox(height: 16.0),
//
//             // Fourth Row: Tutor Requests
//             Row(
//               children: [
//                 Expanded(
//                   child: InkWell(
//                     onTap: () {
//                       // Navigate to TutorRequestsPage
//                       Navigator.push(
//                         context,
//                         MaterialPageRoute(builder: (context) => TutorRequestsPage()),
//                       ).then((_) => _fetchDashboardData()); // Refresh data after returning
//                     },
//                     child: _buildActionCard(
//                       title: 'Tutor Requests',
//                       icon: Icons.request_page, // Use a relevant icon
//                       color: Colors.deepOrange,
//                       // Optionally, you can show a badge with the number of requests
//                       badgeCount: totalTutorRequests,
//                     ),
//                   ),
//                 ),
//                 SizedBox(width: 16.0),
//                 // Optional: Add another action card here if needed
//               ],
//             ),
//             SizedBox(height: 16.0),
//
//             // Add more rows or widgets as needed
//           ],
//         ),
//       ),
//     );
//   }
//
//   // Helper method to build statistic cards
//   Widget _buildStatisticCard({
//     required String title,
//     required String count,
//     Widget? icon, // Changed from IconData to Widget
//     required Color color,
//     bool isFullWidth = false,
//   }) {
//     return Card(
//       color: Colors.white,
//       elevation: 4.0,
//       shape: RoundedRectangleBorder(
//         borderRadius: BorderRadius.circular(12.0),
//       ),
//       child: Container(
//         padding: EdgeInsets.all(16.0),
//         width: isFullWidth ? double.infinity : null,
//         child: Column(
//           children: [
//             if (icon != null) icon,
//             SizedBox(height: 10.0),
//             Text(
//               count,
//               style: TextStyle(
//                 fontSize: 22.0,
//                 fontWeight: FontWeight.bold,
//                 color: color,
//               ),
//             ),
//             SizedBox(height: 5.0),
//             Text(
//               title,
//               style: TextStyle(
//                 fontSize: 16.0,
//                 color: Colors.grey[700],
//               ),
//               textAlign: TextAlign.center,
//             ),
//           ],
//         ),
//       ),
//     );
//   }
//
//   // Helper method to build action cards
//   Widget _buildActionCard({
//     required String title,
//     required IconData icon,
//     required Color color,
//     VoidCallback? onTap,
//     int? badgeCount, // Optional badge count
//   }) {
//     return Stack(
//       children: [
//         Card(
//           color: Colors.white,
//           elevation: 4.0,
//           shape: RoundedRectangleBorder(
//             borderRadius: BorderRadius.circular(12.0),
//           ),
//           child: Container(
//             height: 100.0,
//             padding: EdgeInsets.all(16.0),
//             child: Column(
//               mainAxisAlignment: MainAxisAlignment.center,
//               children: [
//                 Icon(icon, size: 30.0, color: color),
//                 SizedBox(height: 10.0),
//                 Text(
//                   title,
//                   style: TextStyle(
//                     fontSize: 16.0,
//                     color: color,
//                     fontWeight: FontWeight.bold,
//                   ),
//                 ),
//               ],
//             ),
//           ),
//         ),
//         // If there's a badge count, display it
//         if (badgeCount != null && badgeCount > 0)
//           Positioned(
//             right: 8,
//             top: 8,
//             child: Container(
//               padding: EdgeInsets.all(4.0),
//               decoration: BoxDecoration(
//                 color: Colors.redAccent,
//                 shape: BoxShape.circle,
//               ),
//               child: Text(
//                 badgeCount.toString(),
//                 style: TextStyle(
//                   color: Colors.white,
//                   fontSize: 12.0,
//                 ),
//               ),
//             ),
//           ),
//       ],
//     );
//   }
// }
//
//
// import 'package:flutter/material.dart';
// // import 'package:cloud_firestore/cloud_firestore.dart'; // Firebase is commented out
// import 'add_tutor_page.dart';    // Import AddTutorPage
// import 'add_course_page.dart';  // Import AddCoursePage
// import 'tutor_requests_page.dart'; // Import TutorRequestsPage
//
// class AdminDashboardPage extends StatefulWidget {
//   @override
//   _AdminDashboardPageState createState() => _AdminDashboardPageState();
// }
//
// class _AdminDashboardPageState extends State<AdminDashboardPage> {
//   // State variables with dummy data
//   int totalStudents = 1200;
//   int totalTutors = 150;
//   double totalRevenue = 35000.75;
//   int totalTutorRequests = 25; // Example dummy count
//
//   // final FirebaseFirestore _firestore = FirebaseFirestore.instance; // Firebase is commented out
//
//   @override
//   void initState() {
//     super.initState();
//     // Schedule _fetchDashboardData to run after the first frame
//     WidgetsBinding.instance.addPostFrameCallback((_) {
//       _fetchDashboardData();
//     });
//   }
//
//   // Fetch data from Firestore using typed snapshots
//   Future<void> _fetchDashboardData() async {
//     try {
//       // Firebase code is commented out and replaced with dummy data
//       /*
//       // Fetch total students
//       QuerySnapshot<Map<String, dynamic>> studentsSnapshot =
//           await _firestore.collection('students').get();
//       int fetchedTotalStudents = studentsSnapshot.size;
//
//       // Fetch total tutors
//       QuerySnapshot<Map<String, dynamic>> tutorsSnapshot =
//           await _firestore.collection('tutors').get();
//       int fetchedTotalTutors = tutorsSnapshot.size;
//
//       // Fetch total revenue
//       DocumentSnapshot<Map<String, dynamic>> revenueSnapshot =
//           await _firestore.collection('revenue').doc('current').get();
//       double fetchedTotalRevenue =
//           revenueSnapshot.data()?['amount']?.toDouble() ?? 0.0;
//
//       // Fetch total tutor requests
//       QuerySnapshot<Map<String, dynamic>> requestsSnapshot =
//           await _firestore.collection('tutor_requests').get();
//       int fetchedTotalTutorRequests = requestsSnapshot.size;
//       */
//
//       // Using dummy data instead
//       int fetchedTotalStudents = 1200;
//       int fetchedTotalTutors = 150;
//       double fetchedTotalRevenue = 35000.75;
//       int fetchedTotalTutorRequests = 25;
//
//       setState(() {
//         totalStudents = fetchedTotalStudents;
//         totalTutors = fetchedTotalTutors;
//         totalRevenue = fetchedTotalRevenue;
//         totalTutorRequests = fetchedTotalTutorRequests;
//       });
//     } catch (e) {
//       // Handle errors by showing a SnackBar
//       ScaffoldMessenger.of(context).showSnackBar(
//         SnackBar(content: Text('Error fetching data: $e')),
//       );
//     }
//   }
//
//   // Refresh function to re-fetch data
//   Future<void> _refreshDashboardData() async {
//     await _fetchDashboardData();
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return RefreshIndicator(
//       onRefresh: _refreshDashboardData,
//       child: SingleChildScrollView(
//         physics: AlwaysScrollableScrollPhysics(),
//         padding: EdgeInsets.all(16.0),
//         child: Column(
//           children: [
//             // First Row: Total Students and Total Tutors
//             Row(
//               children: [
//                 Expanded(
//                   child: _buildStatisticCard(
//                     title: 'Total Students',
//                     count: totalStudents.toString(),
//                     icon: Icon(
//                       Icons.person,
//                       size: 40.0,
//                       color: Colors.blue,
//                     ),
//                     color: Colors.blue,
//                   ),
//                 ),
//                 SizedBox(width: 16.0),
//                 Expanded(
//                   child: _buildStatisticCard(
//                     title: 'Total Tutors',
//                     count: totalTutors.toString(),
//                     icon: Icon(
//                       Icons.school,
//                       size: 40.0,
//                       color: Colors.green,
//                     ),
//                     color: Colors.green,
//                   ),
//                 ),
//               ],
//             ),
//             SizedBox(height: 16.0),
//
//             // Second Row: Total Revenue (Full Width)
//             _buildStatisticCard(
//               title: 'Total Revenue',
//               count: 'रू ${totalRevenue.toStringAsFixed(2)}', // Nepali Rupee symbol
//               icon: Text(
//                 'रू',
//                 style: TextStyle(
//                   fontSize: 40.0, // Adjust size as needed
//                   color: Colors.orange,
//                   fontWeight: FontWeight.bold,
//                 ),
//               ),
//               color: Colors.orange,
//               isFullWidth: true, // No Expanded needed here
//             ),
//             SizedBox(height: 16.0),
//
//             // Third Row: Add Tutor and Add Course
//             Row(
//               children: [
//                 Expanded(
//                   child: InkWell(
//                     onTap: () {
//                       // Navigate to AddTutorPage
//                       Navigator.push(
//                         context,
//                         MaterialPageRoute(builder: (context) => AddTutorPage()),
//                       ).then((_) => _fetchDashboardData()); // Refresh data after returning
//                     },
//                     child: _buildActionCard(
//                       title: 'Add Tutor',
//                       icon: Icons.add,
//                       color: Colors.purple,
//                     ),
//                   ),
//                 ),
//                 SizedBox(width: 16.0), // Gap between the two action cards
//                 Expanded(
//                   child: InkWell(
//                     onTap: () {
//                       // Navigate to AddCoursePage
//                       Navigator.push(
//                         context,
//                         MaterialPageRoute(builder: (context) => AddCoursePage()),
//                       ).then((_) => _fetchDashboardData()); // Refresh data after returning
//                     },
//                     child: _buildActionCard(
//                       title: 'Add Course',
//                       icon: Icons.book,
//                       color: Colors.teal,
//                     ),
//                   ),
//                 ),
//               ],
//             ),
//             SizedBox(height: 16.0),
//
//             // Fourth Row: Tutor Requests (Full Width)
//             _buildActionCard(
//               title: 'Tutor Requests',
//               icon: Icons.request_page, // Use a relevant icon
//               color: Colors.deepOrange,
//               // Show a badge with the number of requests
//               badgeCount: totalTutorRequests,
//               isFullWidth: true, // Ensure it spans the full width
//             ),
//             SizedBox(height: 16.0),
//
//             // Add more rows or widgets as needed
//           ],
//         ),
//       ),
//     );
//   }
//
//   // Helper method to build statistic cards
//   Widget _buildStatisticCard({
//     required String title,
//     required String count,
//     Widget? icon, // Changed from IconData to Widget
//     required Color color,
//     bool isFullWidth = false,
//   }) {
//     return Card(
//       color: Colors.white,
//       elevation: 4.0,
//       shape: RoundedRectangleBorder(
//         borderRadius: BorderRadius.circular(12.0),
//       ),
//       child: Container(
//         padding: EdgeInsets.all(16.0),
//         width: isFullWidth ? double.infinity : null,
//         child: Column(
//           children: [
//             if (icon != null) icon,
//             SizedBox(height: 10.0),
//             Text(
//               count,
//               style: TextStyle(
//                 fontSize: 22.0,
//                 fontWeight: FontWeight.bold,
//                 color: color,
//               ),
//             ),
//             SizedBox(height: 5.0),
//             Text(
//               title,
//               style: TextStyle(
//                 fontSize: 16.0,
//                 color: Colors.grey[700],
//               ),
//               textAlign: TextAlign.center,
//             ),
//           ],
//         ),
//       ),
//     );
//   }
//
//   // Helper method to build action cards
//   Widget _buildActionCard({
//     required String title,
//     required IconData icon,
//     required Color color,
//     VoidCallback? onTap,
//     int? badgeCount, // Optional badge count
//     bool isFullWidth = false, // Determines if the card spans full width
//   }) {
//     // Adjust height based on whether it's full width or not
//     double cardHeight = isFullWidth ? 120.0 : 100.0;
//
//     return InkWell(
//       onTap: onTap,
//       child: Stack(
//         children: [
//           Card(
//             color: Colors.white,
//             elevation: 4.0,
//             shape: RoundedRectangleBorder(
//               borderRadius: BorderRadius.circular(12.0),
//             ),
//             child: Container(
//               height: cardHeight,
//               padding: EdgeInsets.all(16.0),
//               child: Row(
//                 children: [
//                   Icon(icon, size: 30.0, color: color),
//                   SizedBox(width: 16.0),
//                   Expanded(
//                     child: Text(
//                       title,
//                       style: TextStyle(
//                         fontSize: 18.0, // Increased font size for better readability
//                         color: color,
//                         fontWeight: FontWeight.bold,
//                       ),
//                     ),
//                   ),
//                 ],
//               ),
//             ),
//           ),
//           // If there's a badge count and the card is not full width, display it
//           if (badgeCount != null && badgeCount > 0 && !isFullWidth)
//             Positioned(
//               right: 12,
//               top: 12,
//               child: Container(
//                 padding: EdgeInsets.all(6.0),
//                 decoration: BoxDecoration(
//                   color: Colors.redAccent,
//                   shape: BoxShape.circle,
//                 ),
//                 child: Text(
//                   badgeCount.toString(),
//                   style: TextStyle(
//                     color: Colors.white,
//                     fontSize: 12.0,
//                   ),
//                 ),
//               ),
//             ),
//           // If the card is full width and has a badge count, position it differently
//           if (badgeCount != null && badgeCount > 0 && isFullWidth)
//             Positioned(
//               right: 16,
//               top: 16,
//               child: Container(
//                 padding: EdgeInsets.all(6.0),
//                 decoration: BoxDecoration(
//                   color: Colors.redAccent,
//                   shape: BoxShape.circle,
//                 ),
//                 child: Text(
//                   badgeCount.toString(),
//                   style: TextStyle(
//                     color: Colors.white,
//                     fontSize: 12.0,
//                   ),
//                 ),
//               ),
//             ),
//         ],
//       ),
//     );
//   }
// }

import 'package:flutter/material.dart';
import 'package:tutor_nest/pages/Admin/tutor_request_detail_page.dart';
// import 'package:cloud_firestore/cloud_firestore.dart'; // Firebase is commented out
import 'add_tutor_page.dart';    // Import AddTutorPage
import 'add_course_page.dart';  // Import AddCoursePage
import 'tutor_requests_page.dart'; // Import TutorRequestsPage

class AdminDashboardPage extends StatefulWidget {
  @override
  _AdminDashboardPageState createState() => _AdminDashboardPageState();
}

class _AdminDashboardPageState extends State<AdminDashboardPage> {
  // State variables with dummy data
  int totalStudents = 1200;
  int totalTutors = 150;
  double totalRevenue = 35000.75;
  int totalTutorRequests = 25; // Example dummy count

  // final FirebaseFirestore _firestore = FirebaseFirestore.instance; // Firebase is commented out

  @override
  void initState() {
    super.initState();
    // Schedule _fetchDashboardData to run after the first frame
    WidgetsBinding.instance.addPostFrameCallback((_) {
      _fetchDashboardData();
    });
  }

  // Fetch data from Firestore using typed snapshots
  Future<void> _fetchDashboardData() async {
    try {
      // Firebase code is commented out and replaced with dummy data
      /*
      // Fetch total students
      QuerySnapshot<Map<String, dynamic>> studentsSnapshot =
          await _firestore.collection('students').get();
      int fetchedTotalStudents = studentsSnapshot.size;

      // Fetch total tutors
      QuerySnapshot<Map<String, dynamic>> tutorsSnapshot =
          await _firestore.collection('tutors').get();
      int fetchedTotalTutors = tutorsSnapshot.size;

      // Fetch total revenue
      DocumentSnapshot<Map<String, dynamic>> revenueSnapshot =
          await _firestore.collection('revenue').doc('current').get();
      double fetchedTotalRevenue =
          revenueSnapshot.data()?['amount']?.toDouble() ?? 0.0;

      // Fetch total tutor requests
      QuerySnapshot<Map<String, dynamic>> requestsSnapshot =
          await _firestore.collection('tutor_requests').get();
      int fetchedTotalTutorRequests = requestsSnapshot.size;
      */

      // Using dummy data instead
      int fetchedTotalStudents = 1200;
      int fetchedTotalTutors = 150;
      double fetchedTotalRevenue = 35000.75;
      int fetchedTotalTutorRequests = 25;

      setState(() {
        totalStudents = fetchedTotalStudents;
        totalTutors = fetchedTotalTutors;
        totalRevenue = fetchedTotalRevenue;
        totalTutorRequests = fetchedTotalTutorRequests;
      });
    } catch (e) {
      // Handle errors by showing a SnackBar
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Error fetching data: $e')),
      );
    }
  }

  // Refresh function to re-fetch data
  Future<void> _refreshDashboardData() async {
    await _fetchDashboardData();
  }

  @override
  Widget build(BuildContext context) {
    return RefreshIndicator(
      onRefresh: _refreshDashboardData,
      child: SingleChildScrollView(
        physics: AlwaysScrollableScrollPhysics(),
        padding: EdgeInsets.all(16.0),
        child: Column(
          children: [
            // First Row: Total Students and Total Tutors
            Row(
              children: [
                Expanded(
                  child: _buildStatisticCard(
                    title: 'Total Students',
                    count: totalStudents.toString(),
                    icon: Icon(
                      Icons.person,
                      size: 40.0,
                      color: Colors.blue,
                    ),
                    color: Colors.blue,
                  ),
                ),
                SizedBox(width: 16.0),
                Expanded(
                  child: _buildStatisticCard(
                    title: 'Total Tutors',
                    count: totalTutors.toString(),
                    icon: Icon(
                      Icons.school,
                      size: 40.0,
                      color: Colors.green,
                    ),
                    color: Colors.green,
                  ),
                ),
              ],
            ),
            SizedBox(height: 16.0),

            // Second Row: Total Revenue (Full Width)
            _buildStatisticCard(
              title: 'Total Revenue',
              count: 'रू ${totalRevenue.toStringAsFixed(2)}', // Nepali Rupee symbol
              icon: Text(
                'रू',
                style: TextStyle(
                  fontSize: 40.0, // Adjust size as needed
                  color: Colors.orange,
                  fontWeight: FontWeight.bold,
                ),
              ),
              color: Colors.orange,
              isFullWidth: true, // No Expanded needed here
            ),
            SizedBox(height: 16.0),

            // Third Row: Add Tutor and Add Course
            Row(
              children: [
                Expanded(
                  child: InkWell(
                    onTap: () {
                      // Navigate to AddTutorPage
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => AddTutorPage()),
                      ).then((_) => _fetchDashboardData()); // Refresh data after returning
                    },
                    child: _buildActionCard(
                      title: 'Add Tutor',
                      icon: Icons.add,
                      color: Colors.purple,
                    ),
                  ),
                ),
                SizedBox(width: 16.0), // Gap between the two action cards
                Expanded(
                  child: InkWell(
                    onTap: () {
                      // Navigate to AddCoursePage
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => AddCoursePage()),
                      ).then((_) => _fetchDashboardData()); // Refresh data after returning
                    },
                    child: _buildActionCard(
                      title: 'Add Course',
                      icon: Icons.book,
                      color: Colors.teal,
                    ),
                  ),
                ),
              ],
            ),
            SizedBox(height: 16.0),

            // Fourth Row: Tutor Requests (Full Width and Clickable)
            _buildActionCard(
              title: 'Tutor Requests',
              icon: Icons.request_page, // Use a relevant icon
              color: Colors.deepOrange,
              // Show a badge with the number of requests
              badgeCount: totalTutorRequests,
              isFullWidth: true, // Ensure it spans the full width
              onTap: () {
                // Navigate to TutorRequestsPage
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => VerifyTutorPage()),
                ).then((_) => _fetchDashboardData()); // Refresh data after returning
              },
            ),
            SizedBox(height: 16.0),

            // Add more rows or widgets as needed
          ],
        ),
      ),
    );
  }

  // Helper method to build statistic cards
  Widget _buildStatisticCard({
    required String title,
    required String count,
    Widget? icon, // Changed from IconData to Widget
    required Color color,
    bool isFullWidth = false,
  }) {
    return Card(
      color: Colors.white,
      elevation: 4.0,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(12.0),
      ),
      child: Container(
        padding: EdgeInsets.all(16.0),
        width: isFullWidth ? double.infinity : null,
        child: Column(
          children: [
            if (icon != null) icon,
            SizedBox(height: 10.0),
            Text(
              count,
              style: TextStyle(
                fontSize: 22.0,
                fontWeight: FontWeight.bold,
                color: color,
              ),
            ),
            SizedBox(height: 5.0),
            Text(
              title,
              style: TextStyle(
                fontSize: 16.0,
                color: Colors.grey[700],
              ),
              textAlign: TextAlign.center,
            ),
          ],
        ),
      ),
    );
  }

  // Helper method to build action cards
  Widget _buildActionCard({
    required String title,
    required IconData icon,
    required Color color,
    VoidCallback? onTap,
    int? badgeCount, // Optional badge count
    bool isFullWidth = false, // Determines if the card spans full width
  }) {
    // Adjust height based on whether it's full width or not
    double cardHeight = isFullWidth ? 120.0 : 100.0;

    return InkWell(
      onTap: onTap,
      child: Stack(
        children: [
          Card(
            color: Colors.white,
            elevation: 4.0,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(12.0),
            ),
            child: Container(
              height: cardHeight,
              padding: EdgeInsets.all(16.0),
              child: Row(
                children: [
                  Icon(icon, size: 30.0, color: color),
                  SizedBox(width: 16.0),
                  Expanded(
                    child: Text(
                      title,
                      style: TextStyle(
                        fontSize: 18.0, // Increased font size for better readability
                        color: color,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
          // If there's a badge count and the card is not full width, display it
          if (badgeCount != null && badgeCount > 0 && !isFullWidth)
            Positioned(
              right: 12,
              top: 12,
              child: Container(
                padding: EdgeInsets.all(6.0),
                decoration: BoxDecoration(
                  color: Colors.redAccent,
                  shape: BoxShape.circle,
                ),
                child: Text(
                  badgeCount.toString(),
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 12.0,
                  ),
                ),
              ),
            ),
          // If the card is full width and has a badge count, position it differently
          if (badgeCount != null && badgeCount > 0 && isFullWidth)
            Positioned(
              right: 16,
              top: 16,
              child: Container(
                padding: EdgeInsets.all(6.0),
                decoration: BoxDecoration(
                  color: Colors.redAccent,
                  shape: BoxShape.circle,
                ),
                child: Text(
                  badgeCount.toString(),
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 12.0,
                  ),
                ),
              ),
            ),
        ],
      ),
    );
  }
}

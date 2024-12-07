// import 'package:flutter/material.dart';
// import 'package:tutor_nest/pages/history_page_content.dart';
// import 'package:tutor_nest/pages/home_page_content.dart';
// import 'package:tutor_nest/pages/schedule_page_content.dart'; // Import SchedulePage if needed
// import 'package:tutor_nest/pages/history_page_content.dart'; // Import HistoryPage if needed
//
// class CoursesPageContent extends StatefulWidget {
//   @override
//   _CoursesPageContentState createState() => _CoursesPageContentState();
// }
//
// class _CoursesPageContentState extends State<CoursesPageContent> {
//   final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();
//
//   Map<String, String> selectedLanguage = {
//     "name": "English",
//     "image": "assets/us_flag.png"
//   };
//
//   int _currentIndex = 3; // Default to "Courses" tab
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
//                 Navigator.push(
//                     context, MaterialPageRoute(builder: (context) => HistoryPageContent()));
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
//                 // Already on CoursesPage, do nothing
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
//           "Courses Page Content Goes Here",
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
//                 MaterialPageRoute(builder: (context) => HomePageContent()),
//               );
//             } else if (index == 1) {
//               Navigator.push(
//                 context,
//                 MaterialPageRoute(builder: (context) => SchedulePageContent()),
//               );
//             } else if (index == 2) {
//               Navigator.push(
//                 context,
//                 MaterialPageRoute(builder: (context) => HistoryPageContent()),
//               );
//             } else if (index == 3) {
//               // Already on CoursesPage, do nothing
//             } else if (index == 4) {
//               // Navigate to SettingsPage when available
//             }
//           }
//         },
//       ),
//     );
//   }
// }

// import 'package:flutter/material.dart';
//
// class CoursesPageContent extends StatefulWidget {
//   @override
//   _CoursesPageContentState createState() => _CoursesPageContentState();
// }
//
// class _CoursesPageContentState extends State<CoursesPageContent> {
//   final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();
//
//   // Dummy data for testing (Replace this with Firebase integration)
//   Future<List<Map<String, String>>> fetchCourses() async {
//     await Future.delayed(Duration(seconds: 1)); // Simulate network delay
//     return [
//       {
//         "name": "Artificial Intelligence",
//         "description":
//         "Hello I am an AI course that dives into neural networks and machine learning techniques.",
//         "image":
//         "https://via.placeholder.com/300x150.png?text=Artificial+Intelligence" // Replace with actual image URL
//       },
//       {
//         "name": "C++ Programming",
//         "description":
//         "Learn the fundamentals of C++ programming with hands-on examples and projects.",
//         "image":
//         "https://via.placeholder.com/300x150.png?text=C%2B%2B+Programming" // Replace with actual image URL
//       },
//     ];
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       key: _scaffoldKey,
//       appBar: AppBar(
//         backgroundColor: Colors.white,
//         elevation: 0,
//         title: Row(
//           children: [
//             Image.asset(
//               'assets/education_logo.png', // Replace with your logo path
//               height: 50,
//             ),
//           ],
//         ),
//         actions: [
//           IconButton(
//             icon: Icon(Icons.menu, color: Colors.black),
//             onPressed: () {
//               _scaffoldKey.currentState?.openEndDrawer();
//             },
//           ),
//         ],
//       ),
//       endDrawer: Drawer(
//         child: ListView(
//           children: [
//             DrawerHeader(
//               decoration: BoxDecoration(color: Colors.blue),
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
//               onTap: () => Navigator.pop(context),
//             ),
//             ListTile(
//               leading: Icon(Icons.schedule),
//               title: Text("Schedule"),
//               onTap: () => Navigator.pop(context),
//             ),
//             ListTile(
//               leading: Icon(Icons.history),
//               title: Text("History"),
//               onTap: () => Navigator.pop(context),
//             ),
//           ],
//         ),
//       ),
//       body: Padding(
//         padding: const EdgeInsets.all(16.0),
//         child: Column(
//           crossAxisAlignment: CrossAxisAlignment.start,
//           children: [
//             // Title with icon
//             Row(
//               children: [
//                 Icon(Icons.school, size: 50, color: Colors.purple),
//                 const SizedBox(width: 16),
//                 const Text(
//                   "Discover Courses",
//                   style: TextStyle(
//                     fontSize: 24,
//                     fontWeight: FontWeight.bold,
//                   ),
//                 ),
//               ],
//             ),
//             const SizedBox(height: 16),
//             // Search bar
//             Row(
//               children: [
//                 Expanded(
//                   child: TextField(
//                     decoration: InputDecoration(
//                       hintText: "Search...",
//                       prefixIcon: Icon(Icons.search),
//                       border: OutlineInputBorder(
//                         borderRadius: BorderRadius.circular(8),
//                       ),
//                     ),
//                   ),
//                 ),
//               ],
//             ),
//             const SizedBox(height: 16),
//             // Description
//             const Text(
//               "Discover courses in various fields. Choose from a variety of topics and start learning today.",
//               style: TextStyle(fontSize: 16),
//             ),
//             const SizedBox(height: 16),
//             const Text(
//               "Courses",
//               style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
//             ),
//             const SizedBox(height: 16),
//             // Courses list
//             Expanded(
//               child: FutureBuilder<List<Map<String, String>>>(
//                 future: fetchCourses(),
//                 builder: (context, snapshot) {
//                   if (snapshot.connectionState == ConnectionState.waiting) {
//                     return Center(child: CircularProgressIndicator());
//                   } else if (snapshot.hasError) {
//                     return Center(child: Text("Failed to load courses."));
//                   } else if (snapshot.hasData && snapshot.data!.isNotEmpty) {
//                     return ListView.builder(
//                       itemCount: snapshot.data!.length,
//                       itemBuilder: (context, index) {
//                         final course = snapshot.data![index];
//                         return CourseCard(data: course);
//                       },
//                     );
//                   } else {
//                     return Center(child: Text("No courses available."));
//                   }
//                 },
//               ),
//             ),
//           ],
//         ),
//       ),
//       bottomNavigationBar: BottomNavigationBar(
//         items: const [
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
//         currentIndex: 3, // Active index for "Courses"
//         selectedItemColor: Colors.blue,
//         unselectedItemColor: Colors.grey,
//         onTap: (index) {
//           // Handle navigation
//           if (index != 3) Navigator.pop(context);
//         },
//       ),
//     );
//   }
// }
//
// class CourseCard extends StatelessWidget {
//   final Map<String, String> data;
//
//   const CourseCard({Key? key, required this.data}) : super(key: key);
//
//   @override
//   Widget build(BuildContext context) {
//     return Card(
//       margin: const EdgeInsets.symmetric(vertical: 8),
//       shape: RoundedRectangleBorder(
//         borderRadius: BorderRadius.circular(8),
//       ),
//       elevation: 2,
//       child: Column(
//         crossAxisAlignment: CrossAxisAlignment.start,
//         children: [
//           // Course image
//           ClipRRect(
//             borderRadius: BorderRadius.vertical(top: Radius.circular(8)),
//             child: Image.network(
//               data['image']!,
//               width: double.infinity,
//               height: 150,
//               fit: BoxFit.cover,
//             ),
//           ),
//           Padding(
//             padding: const EdgeInsets.all(16.0),
//             child: Column(
//               crossAxisAlignment: CrossAxisAlignment.start,
//               children: [
//                 // Course name
//                 Text(
//                   data['name']!,
//                   style: TextStyle(
//                     fontSize: 18,
//                     fontWeight: FontWeight.bold,
//                   ),
//                 ),
//                 const SizedBox(height: 8),
//                 // Course description
//                 Text(
//                   data['description']!,
//                   maxLines: 3,
//                   overflow: TextOverflow.ellipsis,
//                   style: TextStyle(fontSize: 14),
//                 ),
//               ],
//             ),
//           ),
//         ],
//       ),
//     );
//   }
// }

// lib/pages/courses_page_content.dart
// import 'package:flutter/material.dart';
// import '../services/courses_service.dart'; // Import the service
// import '../widgets/course_card.dart';
// import 'course_detail_page_content.dart';// Import the CourseCard widget
//
// class CoursesPageContent extends StatefulWidget {
//   @override
//   _CoursesPageContentState createState() => _CoursesPageContentState();
// }
//
// class _CoursesPageContentState extends State<CoursesPageContent> {
//   final CoursesService _coursesService = CoursesService(); // Instantiate the service
//
//   @override
//   Widget build(BuildContext context) {
//     // Note: Removed the Scaffold, AppBar, Drawer, and BottomNavigationBar
//     return Padding(
//       padding: const EdgeInsets.all(16.0),
//       child: Column(
//         crossAxisAlignment: CrossAxisAlignment.start,
//         children: [
//           // Title with icon
//           Row(
//             children: [
//               Icon(Icons.school, size: 50, color: Colors.purple),
//               const SizedBox(width: 16),
//               const Text(
//                 "Discover Courses",
//                 style: TextStyle(
//                   fontSize: 24,
//                   fontWeight: FontWeight.bold,
//                 ),
//               ),
//             ],
//           ),
//           const SizedBox(height: 16),
//           // Search bar
//           Row(
//             children: [
//               Expanded(
//                 child: TextField(
//                   decoration: InputDecoration(
//                     hintText: "Search...",
//                     prefixIcon: Icon(Icons.search),
//                     border: OutlineInputBorder(
//                       borderRadius: BorderRadius.circular(8),
//                     ),
//                   ),
//                 ),
//               ),
//             ],
//           ),
//           const SizedBox(height: 16),
//           // Description
//           const Text(
//             "Discover courses in various fields. Choose from a variety of topics and start learning today.",
//             style: TextStyle(fontSize: 16),
//           ),
//           const SizedBox(height: 16),
//           const Text(
//             "Courses",
//             style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
//           ),
//           const SizedBox(height: 16),
//           // Courses list
//           Expanded(
//             child: FutureBuilder<List<Map<String, String>>>(
//               future: _coursesService.fetchCourses(),
//               builder: (context, snapshot) {
//                 if (snapshot.connectionState == ConnectionState.waiting) {
//                   return Center(child: CircularProgressIndicator());
//                 } else if (snapshot.hasError) {
//                   return Center(child: Text("Failed to load courses."));
//                 } else if (snapshot.hasData && snapshot.data!.isNotEmpty) {
//                   return ListView.builder(
//                     itemCount: snapshot.data!.length,
//                     itemBuilder: (context, index) {
//                       final course = snapshot.data![index];
//                       return CourseCard(data: course, onTap: () {
//                         // Navigate to CourseDetailsPage
//                         Navigator.push(
//                           context,
//                           MaterialPageRoute(
//                             builder: (context) => CourseDetailsPageContent(courseId: course.id),
//                           ),
//                         );
//                       },);
//                     },
//                   );
//                 } else {
//                   return Center(child: Text("No courses available."));
//                 }
//               },
//             ),
//           ),
//         ],
//       ),
//     );
//   }
// }

// import 'package:flutter/material.dart';
// import '../models/course.dart';
// import '../services/courses_service.dart'; // Import the service
// import '../widgets/course_card.dart';      // Import the CourseCard widget
// import 'course_details_page.dart';        // Import the CourseDetailsPage
//
// class CoursesPageContent extends StatefulWidget {
//   @override
//   _CoursesPageContentState createState() => _CoursesPageContentState();
// }
//
// class _CoursesPageContentState extends State<CoursesPageContent> {
//   final CoursesService _coursesService = CoursesService(); // Instantiate the service
//
//   @override
//   Widget build(BuildContext context) {
//     // Note: Removed the Scaffold, AppBar, Drawer, and BottomNavigationBar
//     return Padding(
//       padding: const EdgeInsets.all(16.0),
//       child: Column(
//         crossAxisAlignment: CrossAxisAlignment.start,
//         children: [
//           // Title with icon
//           Row(
//             children: [
//               Icon(Icons.school, size: 50, color: Colors.purple),
//               const SizedBox(width: 16),
//               const Text(
//                 "Discover Courses",
//                 style: TextStyle(
//                   fontSize: 24,
//                   fontWeight: FontWeight.bold,
//                 ),
//               ),
//             ],
//           ),
//           const SizedBox(height: 16),
//           // Search bar
//           Row(
//             children: [
//               Expanded(
//                 child: TextField(
//                   decoration: InputDecoration(
//                     hintText: "Search...",
//                     prefixIcon: Icon(Icons.search),
//                     border: OutlineInputBorder(
//                       borderRadius: BorderRadius.circular(8),
//                     ),
//                   ),
//                 ),
//               ),
//             ],
//           ),
//           const SizedBox(height: 16),
//           // Description
//           const Text(
//             "Discover courses in various fields. Choose from a variety of topics and start learning today.",
//             style: TextStyle(fontSize: 16),
//           ),
//           const SizedBox(height: 16),
//           const Text(
//             "Courses",
//             style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
//           ),
//           const SizedBox(height: 16),
//           // Courses list
//           Expanded(
//             child: FutureBuilder<List<Course>>(
//               future: _coursesService.fetchCourses(),
//               builder: (context, snapshot) {
//                 if (snapshot.connectionState == ConnectionState.waiting) {
//                   return Center(child: CircularProgressIndicator());
//                 } else if (snapshot.hasError) {
//                   return Center(child: Text("Failed to load courses."));
//                 } else if (snapshot.hasData && snapshot.data!.isNotEmpty) {
//                   return ListView.builder(
//                     itemCount: snapshot.data!.length,
//                     itemBuilder: (context, index) {
//                       final course = snapshot.data![index];
//                       return CourseCard(
//                         course: course,
//                         onTap: () {
//                           // Navigate to CourseDetailsPage
//                           Navigator.push(
//                             context,
//                             MaterialPageRoute(
//                               builder: (context) => CourseDetailsPage(courseId: course.id),
//                             ),
//                           );
//                         },
//                       );
//                     },
//                   );
//                 } else {
//                   return Center(child: Text("No courses available."));
//                 }
//               },
//             ),
//           ),
//         ],
//       ),
//     );
//   }
// }

// lib/pages/courses_page_content.dart
import 'package:flutter/material.dart';
import '../../models/course.dart';
import '../../services/courses_service.dart'; // Import the service
import '../../widgets/course_card.dart';      // Import the CourseCard widget
import 'course_details_page.dart';        // Import the CourseDetailsPage

class CoursesPageContent extends StatefulWidget {
  @override
  _CoursesPageContentState createState() => _CoursesPageContentState();
}

class _CoursesPageContentState extends State<CoursesPageContent> {
  final CoursesService _coursesService = CoursesService(); // Instantiate the service

  @override
  Widget build(BuildContext context) {
    // Removed the Scaffold, AppBar, Drawer, and BottomNavigationBar as they are handled in MainPage
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Title with Icon
          Row(
            children: [
              Icon(Icons.school, size: 50, color: Colors.purple),
              const SizedBox(width: 16),
              const Text(
                "Discover Courses",
                style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ],
          ),
          const SizedBox(height: 16),
          // Search Bar
          Row(
            children: [
              Expanded(
                child: TextField(
                  decoration: InputDecoration(
                    hintText: "Search...",
                    prefixIcon: Icon(Icons.search),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(8),
                    ),
                  ),
                ),
              ),
            ],
          ),
          const SizedBox(height: 16),
          // Description
          const Text(
            "Discover courses in various fields. Choose from a variety of topics and start learning today.",
            style: TextStyle(fontSize: 16),
          ),
          const SizedBox(height: 16),
          const Text(
            "Courses",
            style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 16),
          // Courses List
          Expanded(
            child: FutureBuilder<List<Course>>(
              future: _coursesService.fetchCourses(),
              builder: (context, snapshot) {
                if (snapshot.connectionState == ConnectionState.waiting) {
                  return Center(child: CircularProgressIndicator());
                } else if (snapshot.hasError) {
                  return Center(child: Text("Failed to load courses."));
                } else if (snapshot.hasData && snapshot.data!.isNotEmpty) {
                  return ListView.builder(
                    itemCount: snapshot.data!.length,
                    itemBuilder: (context, index) {
                      final course = snapshot.data![index];
                      return CourseCard(
                        course: course,
                        onTap: () {
                          // Navigate to CourseDetailsPage
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => CourseDetailsPage(courseId: course.id),
                            ),
                          );
                        },
                      );
                    },
                  );
                } else {
                  return Center(child: Text("No courses available."));
                }
              },
            ),
          ),
        ],
      ),
    );
  }
}

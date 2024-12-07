// // lib/widgets/schedule_cards.dart
//
// import 'package:flutter/material.dart';
// import '../models/lesson.dart';
//
// /// Widget for displaying scheduled lessons
// class ScheduleCards extends StatelessWidget {
//   final List<Lesson> scheduledLessons;
//
//   ScheduleCards({required this.scheduledLessons});
//
//   // Helper function to format DateTime
//   String _formatDateTime(BuildContext context, DateTime dateTime) {
//     return "${_formatTimeOfDay(context, TimeOfDay.fromDateTime(dateTime))}";
//   }
//
//   // Helper function to format TimeOfDay
//   String _formatTimeOfDay(BuildContext context, TimeOfDay time) {
//     return MaterialLocalizations.of(context).formatTimeOfDay(time,
//         alwaysUse24HourFormat: false);
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return Column(
//       crossAxisAlignment: CrossAxisAlignment.start,
//       children: [
//         Text(
//           "Today's Schedule",
//           style: TextStyle(fontSize: 18, fontWeight: FontWeight.w600),
//         ),
//         SizedBox(height: 10),
//         Container(
//           height: 180, // Adjust height as needed
//           child: scheduledLessons.isEmpty
//               ? Center(
//             child: Text(
//               "No scheduled lessons for today.",
//               style: TextStyle(color: Colors.grey),
//             ),
//           )
//               : ListView.builder(
//             scrollDirection: Axis.horizontal,
//             itemCount: scheduledLessons.length,
//             itemBuilder: (context, index) {
//               var lesson = scheduledLessons[index];
//               return Padding(
//                 padding: EdgeInsets.only(right: 16.0),
//                 child: Card(
//                   elevation: 4,
//                   child: Container(
//                     width: 220, // Adjust width as needed
//                     padding: EdgeInsets.all(16.0),
//                     child: Column(
//                       crossAxisAlignment: CrossAxisAlignment.start,
//                       children: [
//                         Text(
//                           lesson.subject,
//                           style: TextStyle(
//                               fontSize: 18, fontWeight: FontWeight.bold),
//                         ),
//                         SizedBox(height: 10),
//                         Text("Student: ${lesson.student}",
//                             style: TextStyle(fontSize: 16)),
//                         SizedBox(height: 5),
//                         Text("Student ID: ${lesson.studentId}",
//                             style: TextStyle(fontSize: 16)),
//                         SizedBox(height: 10),
//                         Text("Time: ${_formatDateTime(context, lesson.dateTime)}",
//                             style: TextStyle(fontSize: 16)),
//                       ],
//                     ),
//                   ),
//                 ),
//               );
//             },
//           ),
//         ),
//       ],
//     );
//   }
// }

// lib/widgets/schedule_cards.dart

// import 'package:flutter/material.dart';
// import '../models/lesson.dart';
//
// /// Widget for displaying scheduled lessons
// class ScheduleCards extends StatelessWidget {
//   final List<Lesson> scheduledLessons;
//
//   ScheduleCards({required this.scheduledLessons});
//
//   // Helper function to format DateTime
//   String _formatDateTime(BuildContext context, DateTime dateTime) {
//     return "${_formatTimeOfDay(context, TimeOfDay.fromDateTime(dateTime))}";
//   }
//
//   // Helper function to format TimeOfDay
//   String _formatTimeOfDay(BuildContext context, TimeOfDay time) {
//     return MaterialLocalizations.of(context).formatTimeOfDay(time,
//         alwaysUse24HourFormat: false);
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return Column(
//       crossAxisAlignment: CrossAxisAlignment.start,
//       children: [
//         Text(
//           "Today's Schedule",
//           style: TextStyle(fontSize: 18, fontWeight: FontWeight.w600),
//         ),
//         SizedBox(height: 10),
//         Container(
//           height: 180, // Adjust height as needed
//           child: scheduledLessons.isEmpty
//               ? Center(
//             child: Text(
//               "No scheduled lessons for today.",
//               style: TextStyle(color: Colors.grey),
//             ),
//           )
//               : ListView.builder(
//             scrollDirection: Axis.horizontal,
//             itemCount: scheduledLessons.length,
//             itemBuilder: (context, index) {
//               var lesson = scheduledLessons[index];
//               return Padding(
//                 padding: EdgeInsets.only(right: 16.0),
//                 child: Card(
//                   elevation: 4,
//                   child: Container(
//                     width: 220, // Adjust width as needed
//                     padding: EdgeInsets.all(16.0),
//                     child: Column(
//                       crossAxisAlignment: CrossAxisAlignment.start,
//                       children: [
//                         Text(
//                           lesson.subject,
//                           style: TextStyle(
//                               fontSize: 18, fontWeight: FontWeight.bold),
//                         ),
//                         SizedBox(height: 10),
//                         Text("Student: ${lesson.student}",
//                             style: TextStyle(fontSize: 16)),
//                         SizedBox(height: 5),
//                         Text("Student ID: ${lesson.studentId}",
//                             style: TextStyle(fontSize: 16)),
//                         SizedBox(height: 10),
//                         Text("Time: ${_formatDateTime(context, lesson.dateTime)}",
//                             style: TextStyle(fontSize: 16)),
//                       ],
//                     ),
//                   ),
//                 ),
//               );
//             },
//           ),
//         ),
//       ],
//     );
//   }
// }

// widgets/schedule_cards.dart
//
// import 'package:flutter/material.dart';
// import '../models/lesson.dart';
// import '../pages/tutor/lesson_details_page.dart'; // Import the new page
//
// /// Widget for displaying scheduled lessons
// class ScheduleCards extends StatelessWidget {
//   final List<Lesson> scheduledLessons;
//
//   ScheduleCards({required this.scheduledLessons});
//
//   // Helper function to format DateTime
//   String _formatDateTime(BuildContext context, DateTime dateTime) {
//     return "${_formatTimeOfDay(context, TimeOfDay.fromDateTime(dateTime))}";
//   }
//
//   // Helper function to format TimeOfDay
//   String _formatTimeOfDay(BuildContext context, TimeOfDay time) {
//     return MaterialLocalizations.of(context).formatTimeOfDay(time,
//         alwaysUse24HourFormat: false);
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     // Determine screen width to adjust layout
//     double screenWidth = MediaQuery.of(context).size.width;
//
//     // Determine number of columns based on screen width
//     int crossAxisCount = screenWidth < 600 ? 1 : 2;
//
//     return Column(
//       crossAxisAlignment: CrossAxisAlignment.start,
//       children: [
//         Text(
//           "Today's Schedule",
//           style: TextStyle(fontSize: 18, fontWeight: FontWeight.w600),
//         ),
//         SizedBox(height: 10),
//         scheduledLessons.isEmpty
//             ? Center(
//           child: Text(
//             "No scheduled lessons for today.",
//             style: TextStyle(color: Colors.grey),
//           ),
//         )
//             : LayoutBuilder(
//           builder: (context, constraints) {
//             return GridView.builder(
//               shrinkWrap: true,
//               physics: NeverScrollableScrollPhysics(),
//               gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
//                 crossAxisCount: crossAxisCount,
//                 crossAxisSpacing: 10,
//                 mainAxisSpacing: 10,
//                 childAspectRatio: 3 / 2,
//               ),
//               itemCount: scheduledLessons.length,
//               itemBuilder: (context, index) {
//                 var lesson = scheduledLessons[index];
//                 return GestureDetector(
//                   onTap: () {
//                     Navigator.push(
//                       context,
//                       MaterialPageRoute(
//                         builder: (context) =>
//                             LessonDetailsPage(lesson: lesson),
//                       ),
//                     );
//                   },
//                   child: Card(
//                     elevation: 4,
//                     child: Padding(
//                       padding: EdgeInsets.all(16.0),
//                       child: Column(
//                         crossAxisAlignment: CrossAxisAlignment.start,
//                         children: [
//                           Text(
//                             lesson.subject,
//                             style: TextStyle(
//                                 fontSize: 18,
//                                 fontWeight: FontWeight.bold),
//                           ),
//                           SizedBox(height: 10),
//                           Text("Student: ${lesson.student}",
//                               style: TextStyle(fontSize: 16)),
//                           SizedBox(height: 5),
//                           Text("Student ID: ${lesson.studentId}",
//                               style: TextStyle(fontSize: 16)),
//                           SizedBox(height: 10),
//                           Text(
//                               "Time: ${_formatDateTime(context, lesson.dateTime)}",
//                               style: TextStyle(fontSize: 16)),
//                         ],
//                       ),
//                     ),
//                   ),
//                 );
//               },
//             );
//           },
//         ),
//       ],
//     );
//   }
// }

// lib/widgets/schedule_cards.dart

import 'package:flutter/material.dart';
import 'package:tutor_nest/models/lesson.dart';
import 'package:tutor_nest/pages/tutor/lesson_details_page.dart'; // Import the new page

/// Widget for displaying scheduled lessons
class ScheduleCards extends StatelessWidget {
  final List<Lesson> scheduledLessons;

  ScheduleCards({required this.scheduledLessons});

  // Helper function to format DateTime
  String _formatDateTime(BuildContext context, DateTime dateTime) {
    return "${_formatTimeOfDay(context, TimeOfDay.fromDateTime(dateTime))}";
  }

  // Helper function to format TimeOfDay
  String _formatTimeOfDay(BuildContext context, TimeOfDay time) {
    return MaterialLocalizations.of(context).formatTimeOfDay(time,
        alwaysUse24HourFormat: false);
  }

  @override
  Widget build(BuildContext context) {
    // Determine screen width to adjust layout
    double screenWidth = MediaQuery.of(context).size.width;

    // Determine number of columns based on screen width
    int crossAxisCount = screenWidth < 600 ? 1 : 2;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          "Today's Schedule",
          style: TextStyle(fontSize: 18, fontWeight: FontWeight.w600),
        ),
        SizedBox(height: 10),
        scheduledLessons.isEmpty
            ? Center(
          child: Text(
            "No scheduled lessons for today.",
            style: TextStyle(color: Colors.grey),
          ),
        )
            : LayoutBuilder(
          builder: (context, constraints) {
            return GridView.builder(
              shrinkWrap: true,
              physics: NeverScrollableScrollPhysics(),
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: crossAxisCount,
                crossAxisSpacing: 10,
                mainAxisSpacing: 10,
                childAspectRatio: 3 / 2,
              ),
              itemCount: scheduledLessons.length,
              itemBuilder: (context, index) {
                var lesson = scheduledLessons[index];
                return GestureDetector(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) =>
                            LessonDetailsPage(lesson: lesson),
                      ),
                    );
                  },
                  child: Card(
                    elevation: 4,
                    child: Padding(
                      padding: EdgeInsets.all(16.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            lesson.subject,
                            style: TextStyle(
                                fontSize: 18,
                                fontWeight: FontWeight.bold),
                          ),
                          SizedBox(height: 10),
                          Text("Student: ${lesson.student}",
                              style: TextStyle(fontSize: 16)),
                          SizedBox(height: 5),
                          Text("Student ID: ${lesson.studentId}",
                              style: TextStyle(fontSize: 16)),
                          SizedBox(height: 10),
                          Text(
                              "Time: ${_formatDateTime(context, lesson.dateTime)}",
                              style: TextStyle(fontSize: 16)),
                        ],
                      ),
                    ),
                  ),
                );
              },
            );
          },
        ),
      ],
    );
  }
}


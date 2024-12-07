// lib/pages/lesson_details_page.dart
//
// import 'package:flutter/material.dart';
// import 'package:intl/intl.dart';
// import 'package:tutor_nest/models/lesson.dart';
// // import 'tutor_live_stream_page.dart'; // Optional: Create this page if implementing live streaming
//
// /// A page that displays detailed information about a lesson.
// class LessonDetailsPage extends StatelessWidget {
//   final Lesson lesson;
//
//   LessonDetailsPage({required this.lesson});
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text("Lesson Details"),
//       ),
//       body: Padding(
//         padding: EdgeInsets.all(16.0),
//         child: Column(
//           crossAxisAlignment: CrossAxisAlignment.start,
//           children: [
//             Text(lesson.subject,
//                 style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold)),
//             SizedBox(height: 20),
//             Text(
//               "Student: ${lesson.student}",
//               style: TextStyle(fontSize: 18),
//             ),
//             SizedBox(height: 10),
//             Text(
//               "Student ID: ${lesson.studentId}",
//               style: TextStyle(fontSize: 18),
//             ),
//             SizedBox(height: 10),
//             Text(
//               "Time: ${DateFormat.yMMMd().format(lesson.dateTime)} at ${DateFormat.jm().format(lesson.dateTime)}",
//               style: TextStyle(fontSize: 18),
//             ),
//             SizedBox(height: 20),
//             ElevatedButton(
//               onPressed: () {
//                 // Navigate to Live Stream Page
//                 // Navigator.push(
//                 //   context,
//                 //   MaterialPageRoute(
//                 //     builder: (context) => LiveStreamPage(lesson: lesson),
//                 //   ),
//                 // );
//               },
//               child: Text("Start Live Stream"),
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }

// lib/pages/lesson_details_page.dart

// import 'package:flutter/material.dart';
// import 'package:intl/intl.dart';
// import 'package:tutor_nest/models/lesson.dart';
// import 'tutor_live_stream_page.dart'; // Import if implementing live streaming
//
// /// A page that displays detailed information about a lesson.
// class LessonDetailsPage extends StatelessWidget {
//   final Lesson lesson;
//
//   LessonDetailsPage({required this.lesson});
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text("Lesson Details"),
//       ),
//       body: Padding(
//         padding: EdgeInsets.all(16.0),
//         child: Column(
//           crossAxisAlignment: CrossAxisAlignment.start,
//           children: [
//             Text(lesson.subject,
//                 style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold)),
//             SizedBox(height: 20),
//             Text(
//               "Student: ${lesson.student}",
//               style: TextStyle(fontSize: 18),
//             ),
//             SizedBox(height: 10),
//             Text(
//               "Student ID: ${lesson.studentId}",
//               style: TextStyle(fontSize: 18),
//             ),
//             SizedBox(height: 10),
//             Text(
//               "Time: ${DateFormat.yMMMd().format(lesson.dateTime)} at ${DateFormat.jm().format(lesson.dateTime)}",
//               style: TextStyle(fontSize: 18),
//             ),
//             SizedBox(height: 20),
//             ElevatedButton(
//               onPressed: () {
//                 // Navigate to Live Stream Page
//                 Navigator.push(
//                   context,
//                   MaterialPageRoute(
//                     builder: (context) => TutorLiveStreamPage(channelName: channelName, appId: appId, token: token),
//                   ),
//                 );
//               },
//               child: Text("Start Live Stream"),
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }

import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:tutor_nest/models/lesson.dart';
import 'package:tutor_nest/pages/tutor/tutor_live_stream_page.dart';
import 'tutor_live_stream_page.dart'; // Import the live stream page

/// A page that displays detailed information about a lesson.
class LessonDetailsPage extends StatelessWidget {
  final Lesson lesson;

  LessonDetailsPage({required this.lesson});

  // Example configuration for Agora
  final String agoraAppId = 'e852fa884df2463f83c3684bba401896';
  final String agoraToken = '007eJxTYGi2qTvwpIL31PJ3n29mpYs5bxQJ9nsiXSfkLXRcyHp7U6ECQ6qFqVFaooWFSUqakYmZcZqFcbKxmYVJUlKiiYGhhaXZzhf+6Q2BjAx/Pu5nZWSAQBCfh6EktbgkPjkjMS8vNYeBAQBSXCMy'; // Ideally, fetch this dynamically

  @override
  Widget build(BuildContext context) {
    // Define the unique channel name based on lesson details
    // final String channelName = 'lesson_${lesson.id}_${lesson.tutorId}';
    final String channelName = 'test_channel';
    return Scaffold(
      appBar: AppBar(
        title: const Text("Lesson Details"),
        backgroundColor: Colors.white,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              lesson.subject,
              style: const TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 20),
            Text(
              "Student: ${lesson.student}",
              style: const TextStyle(fontSize: 18),
            ),
            const SizedBox(height: 10),
            Text(
              "Student ID: ${lesson.studentId}",
              style: const TextStyle(fontSize: 18),
            ),
            const SizedBox(height: 10),
            Text(
              "Time: ${DateFormat.yMMMd().format(lesson.dateTime)} at ${DateFormat.jm().format(lesson.dateTime)}",
              style: const TextStyle(fontSize: 18),
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                // Navigate to Live Stream Page with necessary parameters
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => TutorLiveStreamPage(channelName: channelName, appId: agoraAppId, token: agoraToken)
                    ),
                  );

              },
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.blue,
                padding: const EdgeInsets.symmetric(vertical: 15, horizontal: 20),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(8),
                ),
              ),
              child: const Text(
                "Start Live Stream",
                style: TextStyle(fontSize: 16, color: Colors.white),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

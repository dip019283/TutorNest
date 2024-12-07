// lib/screens/history_details_page.dart

// import 'package:flutter/material.dart';
// import 'package:tutor_nest/models/lesson_history.dart';
//
// /// A new screen that displays detailed history information.
// class HistoryDetailsPage extends StatelessWidget {
//   final List<LessonHistory> history;
//
//   HistoryDetailsPage({required this.history});
//
//   // Helper function to format TimeOfDay
//   String _formatTimeOfDay(BuildContext context, TimeOfDay time) {
//     return MaterialLocalizations.of(context).formatTimeOfDay(time,
//         alwaysUse24HourFormat: false);
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text("Lesson History"),
//       ),
//       body: history.isEmpty
//           ? Center(
//         child: Text(
//           "No history available.",
//           style: TextStyle(color: Colors.grey, fontSize: 16),
//         ),
//       )
//           : ListView.builder(
//         padding: EdgeInsets.all(16.0),
//         itemCount: history.length,
//         itemBuilder: (context, index) {
//           var historyItem = history[index];
//           return Card(
//             elevation: 4,
//             margin: EdgeInsets.symmetric(vertical: 8.0),
//             child: ListTile(
//               leading: Icon(Icons.history, color: Colors.blue),
//               title: Text(historyItem.subject,
//                   style: TextStyle(
//                       fontSize: 18, fontWeight: FontWeight.bold)),
//               subtitle: Padding(
//                 padding: const EdgeInsets.only(top: 8.0),
//                 child: Column(
//                   crossAxisAlignment: CrossAxisAlignment.start,
//                   children: [
//                     Text("Student: ${historyItem.student}",
//                         style: TextStyle(fontSize: 16)),
//                     Text("Student ID: ${historyItem.studentId}",
//                         style: TextStyle(fontSize: 16)),
//                     Text(
//                         "Date: ${historyItem.dateTime.toLocal()}".split(' ')[0],
//                         style: TextStyle(fontSize: 16)),
//                     Text(
//                         "Time: ${_formatTimeOfDay(context, TimeOfDay.fromDateTime(historyItem.dateTime))}",
//                         style: TextStyle(fontSize: 16)),
//                     SizedBox(height: 5),
//                     Text("Feedback: ${historyItem.feedback}",
//                         style: TextStyle(fontSize: 16)),
//                   ],
//                 ),
//               ),
//             ),
//           );
//         },
//       ),
//     );
//   }
// }

// lib/screens/history_details_page.dart

import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:tutor_nest/models/lesson_history.dart';

/// A new screen that displays detailed history information.
class HistoryDetailsPage extends StatelessWidget {
  final List<LessonHistory> history;

  HistoryDetailsPage({required this.history});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Lesson History"),
      ),
      body: history.isEmpty
          ? Center(
        child: Text(
          "No history available.",
          style: TextStyle(color: Colors.grey, fontSize: 16),
        ),
      )
          : ListView.builder(
        padding: EdgeInsets.all(16.0),
        itemCount: history.length,
        itemBuilder: (context, index) {
          var historyItem = history[index];
          return Card(
            elevation: 4,
            margin: EdgeInsets.symmetric(vertical: 8.0),
            child: Padding(
              padding: EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(historyItem.subject,
                      style: TextStyle(
                          fontSize: 18, fontWeight: FontWeight.bold)),
                  SizedBox(height: 10),
                  Text("Student: ${historyItem.student}",
                      style: TextStyle(fontSize: 16)),
                  SizedBox(height: 5),
                  Text("Student ID: ${historyItem.studentId}",
                      style: TextStyle(fontSize: 16)),
                  SizedBox(height: 5),
                  Text(
                      "Date: ${DateFormat.yMMMd().format(historyItem.dateTime.toLocal())}",
                      style: TextStyle(fontSize: 16)),
                  SizedBox(height: 5),
                  Text(
                      "Time: ${DateFormat.jm().format(historyItem.dateTime.toLocal())}",
                      style: TextStyle(fontSize: 16)),
                  SizedBox(height: 5),
                  Text("Feedback: ${historyItem.feedback}",
                      style: TextStyle(fontSize: 16)),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}

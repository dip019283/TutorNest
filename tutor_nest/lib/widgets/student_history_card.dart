// // lib/widgets/student_history_card.dart
// import 'package:flutter/material.dart';
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
//           ],
//         ),
//       ),
//     );
//   }
// }

// lib/widgets/student_history_card.dart
import 'package:flutter/material.dart';
import '../models/history_item.dart'; // Import the HistoryItem model

class HistoryCard extends StatelessWidget {
  final HistoryItem data;

  const HistoryCard({Key? key, required this.data}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.symmetric(vertical: 8),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
      elevation: 4, // Added elevation for better UI
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // User Info Row
            Row(
              children: [
                CircleAvatar(
                  radius: 20,
                  backgroundImage: NetworkImage(data.image),
                  backgroundColor: Colors.grey.shade300,
                  child: data.image.isEmpty
                      ? Icon(
                    Icons.person,
                    color: Colors.white,
                  )
                      : null,
                ),
                const SizedBox(width: 8),
                Text(
                  data.name,
                  style: const TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 16,
                  ),
                ),
                const Spacer(),
                Text(
                  "⭐ ${data.rating}",
                  style: const TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 16,
                  ),
                ),
              ],
            ),
            const SizedBox(height: 8),
            // Date and Time
            Text(
              data.date,
              style: const TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 14,
              ),
            ),
            Text(
              data.time,
              style: const TextStyle(
                fontSize: 14,
                color: Colors.grey,
              ),
            ),
            const SizedBox(height: 8),
            // Feedback
            const Text(
              "Feedback:",
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 14,
              ),
            ),
            Text(
              data.feedback,
              style: const TextStyle(fontSize: 14),
            ),
            // Hidden ID (Not displayed)
            // You can access data.id internally if needed
          ],
        ),
      ),
    );
  }
}

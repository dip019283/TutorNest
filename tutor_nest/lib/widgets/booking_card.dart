// import 'package:flutter/material.dart';
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

// lib/widgets/booking_card.dart

import 'package:flutter/material.dart';
import '../models/booking_item.dart';

class BookingCard extends StatelessWidget {
  final BookingItem data;

  const BookingCard({Key? key, required this.data}) : super(key: key);

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
            // Request
            const Text(
              "Request:",
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 14,
              ),
            ),
            Text(
              data.request,
              style: const TextStyle(fontSize: 14),
            ),
            const SizedBox(height: 8),
            // Action Buttons
            Row(
              children: [
                ElevatedButton(
                  onPressed: () {
                    // Handle Cancel action
                  },
                  style: ElevatedButton.styleFrom(backgroundColor: Colors.red),
                  child: const Text("Cancel"),
                ),
                const Spacer(),
                ElevatedButton.icon(
                  onPressed: () {
                    // Handle Go to Class action
                  },
                  icon: const Icon(Icons.video_call),
                  label: const Text("Go to class"),
                ),
              ],
            ),
            // Hidden ID (Not displayed)
            // You can access data.id internally if needed
          ],
        ),
      ),
    );
  }
}

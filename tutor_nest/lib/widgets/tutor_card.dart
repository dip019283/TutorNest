// import 'package:flutter/material.dart';
//
// class TutorCard extends StatelessWidget {
//   final Map<String, dynamic> tutor;
//   final VoidCallback? onTap;
//
//   const TutorCard({Key? key, required this.tutor, this.onTap}) : super(key: key);
//
//   @override
//   Widget build(BuildContext context) {
//     return Card(
//       margin: EdgeInsets.only(bottom: 16),
//       shape: RoundedRectangleBorder(
//         borderRadius: BorderRadius.circular(8),
//       ),
//       child: InkWell(
//         onTap: onTap, // Handle tap if needed
//         child: Padding(
//           padding: const EdgeInsets.all(16.0),
//           child: Column(
//             crossAxisAlignment: CrossAxisAlignment.start,
//             children: [
//               Row(
//                 children: [
//                   CircleAvatar(
//                     radius: 20,
//                     backgroundImage: NetworkImage(tutor['profilePicture']),
//                     backgroundColor: Colors.grey,
//                     child: tutor['profilePicture'] == ""
//                         ? Icon(
//                       Icons.person,
//                       color: Colors.white,
//                     )
//                         : null,
//                   ),
//                   SizedBox(width: 16),
//                   Text(
//                     tutor['name'] ?? "Unknown Tutor",
//                     style: TextStyle(fontSize: 16),
//                   ),
//                 ],
//               ),
//               SizedBox(height: 8),
//               Text(
//                 tutor['subject'] ?? "Subject not provided",
//                 style: TextStyle(fontSize: 14),
//               ),
//               // You can add more details or actions if needed
//             ],
//           ),
//         ),
//       ),
//     );
//   }
// }

// lib/widgets/tutor_card.dart

import 'package:flutter/material.dart';
import '../models/tutor_item.dart';

class TutorCard extends StatelessWidget {
  final TutorItem tutor;
  final VoidCallback? onTap;

  const TutorCard({Key? key, required this.tutor, this.onTap}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: EdgeInsets.only(bottom: 16),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(8),
      ),
      child: InkWell(
        onTap: onTap, // Handle tap if needed
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  CircleAvatar(
                    radius: 20,
                    backgroundImage: NetworkImage(tutor.profilePicture),
                    backgroundColor: Colors.grey.shade300,
                    child: tutor.profilePicture.isEmpty
                        ? Icon(
                      Icons.person,
                      color: Colors.white,
                    )
                        : null,
                  ),
                  SizedBox(width: 16),
                  Text(
                    tutor.name,
                    style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                  ),
                  Spacer(),
                  Text(
                    "⭐ ${tutor.rating}",
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                ],
              ),
              SizedBox(height: 8),
              Text(
                tutor.subject,
                style: TextStyle(fontSize: 14),
              ),
              // You can add more details or actions if needed
            ],
          ),
        ),
      ),
    );
  }
}

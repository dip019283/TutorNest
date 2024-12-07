// // lib/widgets/profile_card.dart
// import 'package:flutter/material.dart';
//
// class ProfileCard extends StatelessWidget {
//   final Map<String, String> userData;
//   final VoidCallback onEditProfile;
//
//   const ProfileCard({
//     Key? key,
//     required this.userData,
//     required this.onEditProfile,
//   }) : super(key: key);
//
//   @override
//   Widget build(BuildContext context) {
//     return Card(
//       shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
//       elevation: 4,
//       child: Padding(
//         padding: const EdgeInsets.all(16.0),
//         child: Row(
//           children: [
//             // Profile Picture
//             CircleAvatar(
//               radius: 40,
//               backgroundColor: Colors.grey.shade300,
//               backgroundImage: NetworkImage(userData['profilePicture']!),
//               child: userData['profilePicture'] == null || userData['profilePicture']!.isEmpty
//                   ? const Icon(Icons.person, size: 50, color: Colors.white)
//                   : null,
//             ),
//             const SizedBox(width: 16),
//             // User Details
//             Column(
//               crossAxisAlignment: CrossAxisAlignment.start,
//               children: [
//                 Text(
//                   userData['name']!,
//                   style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
//                 ),
//                 const SizedBox(height: 4),
//                 Text(
//                   userData['email']!,
//                   style: const TextStyle(fontSize: 16, color: Colors.grey),
//                 ),
//                 const SizedBox(height: 8),
//                 ElevatedButton.icon(
//                   onPressed: onEditProfile,
//                   icon: const Icon(Icons.edit),
//                   label: const Text("Edit Profile"),
//                 ),
//               ],
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }

// lib/widgets/profile_card.dart

// import 'package:flutter/material.dart';
// import '../models/user_profile.dart';
//
// class ProfileCard extends StatelessWidget {
//   final UserProfile userProfile;
//   final VoidCallback onEditProfile;
//
//   const ProfileCard({
//     Key? key,
//     required this.userProfile,
//     required this.onEditProfile,
//   }) : super(key: key);
//
//   @override
//   Widget build(BuildContext context) {
//     return Card(
//       shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
//       elevation: 4, // Added elevation for better UI
//       child: Padding(
//         padding: const EdgeInsets.all(16.0),
//         child: Row(
//           children: [
//             // Profile Picture
//             CircleAvatar(
//               radius: 40,
//               backgroundColor: Colors.grey.shade300,
//               backgroundImage: NetworkImage(userProfile.profilePicture),
//               child: userProfile.profilePicture.isEmpty
//                   ? const Icon(Icons.person, size: 50, color: Colors.white)
//                   : null,
//             ),
//             const SizedBox(width: 16),
//             // User Details
//             Column(
//               crossAxisAlignment: CrossAxisAlignment.start,
//               children: [
//                 Text(
//                   userProfile.name,
//                   style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
//                 ),
//                 const SizedBox(height: 4),
//                 Text(
//                   userProfile.email,
//                   style: const TextStyle(fontSize: 16, color: Colors.grey),
//                 ),
//                 const SizedBox(height: 8),
//                 ElevatedButton.icon(
//                   onPressed: onEditProfile,
//                   icon: const Icon(Icons.edit),
//                   label: const Text("Edit Profile"),
//
//                 ),
//               ],
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }

// widgets/profile_card.dart

import 'package:flutter/material.dart';
import '../models/user_profile.dart';

class ProfileCard extends StatelessWidget {
  final UserProfile userProfile;
  final VoidCallback onEditProfile;

  const ProfileCard({
    Key? key,
    required this.userProfile,
    required this.onEditProfile,
  }) : super(key: key);

  // Function to extract initials from the name
  String getInitials(String name) {
    List<String> nameParts = name.trim().split(' ');
    String initials = '';
    if (nameParts.isNotEmpty) {
      initials += nameParts[0][0].toUpperCase(); // First letter of first name
      if (nameParts.length > 1) {
        initials += nameParts[nameParts.length - 1][0].toUpperCase(); // First letter of last name
      }
    }
    return initials;
  }

  @override
  Widget build(BuildContext context) {
    String initials = getInitials(userProfile.name);

    return Card(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
      elevation: 4, // Added elevation for better UI
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Row(
          children: [
            // Profile Picture or Initials
            CircleAvatar(
              radius: 40,
              backgroundColor: Colors.blue, // Background color for initials
              backgroundImage: userProfile.profilePicture.isNotEmpty
                  ? NetworkImage(userProfile.profilePicture)
                  : null,
              child: userProfile.profilePicture.isEmpty
                  ? Text(
                initials,
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                ),
              )
                  : null,
            ),
            const SizedBox(width: 16),
            // User Details
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  userProfile.name,
                  style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                ),
                const SizedBox(height: 4),
                Text(
                  userProfile.email,
                  style: const TextStyle(fontSize: 16, color: Colors.grey),
                ),
                const SizedBox(height: 8),
                ElevatedButton.icon(
                  onPressed: onEditProfile,
                  icon: const Icon(Icons.edit),
                  label: const Text("Edit Profile"),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

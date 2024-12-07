// import 'package:flutter/material.dart';
//
// /// Model class representing a Certificate.
// class Certificate {
//   final String type;
//   final String fileName;
//   final String url;
//
//   Certificate({
//     required this.type,
//     required this.fileName,
//     required this.url,
//   });
// }
//
// /// Model class representing a Tutor.
// class Tutor {
//   final String id;
//   final String name;
//   final String email;
//   final String address;
//   final String dateOfBirth;
//   final String interests;
//   final String education;
//   final String experience;
//   final String profession;
//   final String instruction;
//   final String language;
//   final String about;
//   String status; // 'Verified' or 'Unverified'
//   final String imageUrl;
//   final String videoUrl;
//   final List<Certificate> certificates;
//
//   Tutor({
//     required this.id,
//     required this.name,
//     required this.email,
//     required this.address,
//     required this.dateOfBirth,
//     required this.interests,
//     required this.education,
//     required this.experience,
//     required this.profession,
//     required this.instruction,
//     required this.language,
//     required this.about,
//     this.status = 'Unverified',
//     required this.imageUrl,
//     required this.videoUrl,
//     required this.certificates,
//   });
// }
//
// /// Stateful widget for verifying tutors.
// class VerifyTutorPage extends StatefulWidget {
//   @override
//   _VerifyTutorPageState createState() => _VerifyTutorPageState();
// }
//
// class _VerifyTutorPageState extends State<VerifyTutorPage> {
//   // List of tutors (dummy data)
//   List<Tutor> _tutors = [
//     Tutor(
//       id: '1',
//       name: 'John Doe',
//       email: 'john.doe@example.com',
//       address: '123 Main St, Springfield',
//       dateOfBirth: '1990-01-01',
//       interests: 'Mathematics, Physics',
//       education: 'MSc in Mathematics',
//       experience: '5 years teaching',
//       profession: 'Mathematician',
//       instruction: 'Online and in-person',
//       language: 'English',
//       about: 'Passionate about teaching mathematics and physics.',
//       status: 'Unverified',
//       imageUrl:
//       'https://via.placeholder.com/150', // Placeholder image URL
//       videoUrl:
//       'https://www.example.com/video1.mp4', // Placeholder video URL
//       certificates: [
//         Certificate(
//           type: 'Bachelor Degree',
//           fileName: 'BSc_Math.pdf',
//           url: 'https://www.example.com/certificates/BSc_Math.pdf',
//         ),
//         Certificate(
//           type: 'Master Degree',
//           fileName: 'MSc_Math.pdf',
//           url: 'https://www.example.com/certificates/MSc_Math.pdf',
//         ),
//       ],
//     ),
//     Tutor(
//       id: '2',
//       name: 'Jane Smith',
//       email: 'jane.smith@example.com',
//       address: '456 Elm St, Metropolis',
//       dateOfBirth: '1985-05-15',
//       interests: 'Chemistry, Biology',
//       education: 'PhD in Chemistry',
//       experience: '8 years teaching',
//       profession: 'Chemist',
//       instruction: 'Online',
//       language: 'English, Spanish',
//       about:
//       'Experienced chemistry tutor with a focus on practical applications.',
//       status: 'Verified',
//       imageUrl:
//       'https://via.placeholder.com/150', // Placeholder image URL
//       videoUrl:
//       'https://www.example.com/video2.mp4', // Placeholder video URL
//       certificates: [
//         Certificate(
//           type: 'Bachelor Degree',
//           fileName: 'BSc_Chemistry.pdf',
//           url: 'https://www.example.com/certificates/BSc_Chemistry.pdf',
//         ),
//         Certificate(
//           type: 'PhD Degree',
//           fileName: 'PhD_Chemistry.pdf',
//           url: 'https://www.example.com/certificates/PhD_Chemistry.pdf',
//         ),
//       ],
//     ),
//     // Add more dummy tutors as needed
//   ];
//
//   /// Method to update the verification status of a tutor.
//   void _updateStatus(int index, String newStatus) {
//     setState(() {
//       _tutors[index].status = newStatus;
//       // TODO: Update the status in Firestore
//       // Example:
//       // FirebaseFirestore.instance
//       //     .collection('tutors')
//       //     .doc(_tutors[index].id)
//       //     .update({'status': newStatus});
//     });
//
//     ScaffoldMessenger.of(context).showSnackBar(
//       SnackBar(
//         content:
//         Text('${_tutors[index].name} has been marked as $newStatus.'),
//         duration: Duration(seconds: 2),
//       ),
//     );
//   }
//
//   /// Builds the UI for each tutor card.
//   Widget _buildTutorCard(int index) {
//     final tutor = _tutors[index];
//     return Card(
//       margin: EdgeInsets.symmetric(horizontal: 12.0, vertical: 6.0),
//       elevation: 3.0,
//       child: ExpansionTile(
//         leading: CircleAvatar(
//           backgroundImage: NetworkImage(tutor.imageUrl),
//           backgroundColor: Colors.grey[200],
//         ),
//         title: Text(tutor.name),
//         subtitle: Text(tutor.email),
//         children: [
//           Padding(
//             padding: EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
//             child: Column(
//               crossAxisAlignment: CrossAxisAlignment.start,
//               children: [
//                 // Display additional tutor details
//                 Text('Address: ${tutor.address}'),
//                 Text('Date of Birth: ${tutor.dateOfBirth}'),
//                 Text('Interests: ${tutor.interests}'),
//                 Text('Education: ${tutor.education}'),
//                 Text('Experience: ${tutor.experience}'),
//                 Text('Profession: ${tutor.profession}'),
//                 Text('Instruction: ${tutor.instruction}'),
//                 Text('Language: ${tutor.language}'),
//                 SizedBox(height: 10),
//                 Text('About: ${tutor.about}'),
//                 SizedBox(height: 10),
//
//                 // Display Video
//                 tutor.videoUrl.isNotEmpty
//                     ? Column(
//                   crossAxisAlignment: CrossAxisAlignment.start,
//                   children: [
//                     Text(
//                       'Introduction Video:',
//                       style: TextStyle(fontWeight: FontWeight.bold),
//                     ),
//                     SizedBox(height: 5),
//                     GestureDetector(
//                       onTap: () {
//                         // TODO: Implement video playback
//                         // For now, we'll just show a dialog with the video URL
//                         showDialog(
//                           context: context,
//                           builder: (context) {
//                             return AlertDialog(
//                               title: Text('Video Link'),
//                               content: Text(tutor.videoUrl),
//                               actions: [
//                                 TextButton(
//                                   onPressed: () =>
//                                       Navigator.of(context).pop(),
//                                   child: Text('Close'),
//                                 ),
//                               ],
//                             );
//                           },
//                         );
//                       },
//                       child: Row(
//                         children: [
//                           Icon(Icons.play_circle_fill,
//                               color: Colors.purple),
//                           SizedBox(width: 5),
//                           Text(
//                             'Play Video',
//                             style: TextStyle(
//                                 color: Colors.purple,
//                                 decoration: TextDecoration.underline),
//                           ),
//                         ],
//                       ),
//                     ),
//                     SizedBox(height: 10),
//                   ],
//                 )
//                     : Container(),
//
//                 // Display Certificates
//                 tutor.certificates.isNotEmpty
//                     ? Column(
//                   crossAxisAlignment: CrossAxisAlignment.start,
//                   children: [
//                     Text(
//                       'Certificates:',
//                       style: TextStyle(fontWeight: FontWeight.bold),
//                     ),
//                     SizedBox(height: 5),
//                     ListView.builder(
//                       shrinkWrap: true,
//                       physics: NeverScrollableScrollPhysics(),
//                       itemCount: tutor.certificates.length,
//                       itemBuilder: (context, certIndex) {
//                         final cert = tutor.certificates[certIndex];
//                         return ListTile(
//                           contentPadding: EdgeInsets.zero,
//                           leading:
//                           Icon(Icons.description, color: Colors.purple),
//                           title: Text(cert.type),
//                           subtitle: Text(cert.fileName),
//                           trailing: IconButton(
//                             icon: Icon(Icons.link, color: Colors.purple),
//                             onPressed: () {
//                               // TODO: Implement file download or viewing
//                               // For now, show a dialog with the file URL
//                               showDialog(
//                                 context: context,
//                                 builder: (context) {
//                                   return AlertDialog(
//                                     title: Text('Certificate Link'),
//                                     content: Text(cert.url),
//                                     actions: [
//                                       TextButton(
//                                         onPressed: () =>
//                                             Navigator.of(context).pop(),
//                                         child: Text('Close'),
//                                       ),
//                                     ],
//                                   );
//                                 },
//                               );
//                             },
//                           ),
//                         );
//                       },
//                     ),
//                     SizedBox(height: 10),
//                   ],
//                 )
//                     : Container(),
//
//                 Divider(),
//                 Text(
//                   'Verification Status:',
//                   style: TextStyle(fontWeight: FontWeight.bold),
//                 ),
//                 SizedBox(height: 5),
//                 // Status Dropdown
//                 DropdownButtonFormField<String>(
//                   value: tutor.status,
//                   decoration: InputDecoration(
//                     border: OutlineInputBorder(),
//                     contentPadding:
//                     EdgeInsets.symmetric(horizontal: 10, vertical: 5),
//                   ),
//                   items: <String>['Verified', 'Unverified']
//                       .map<DropdownMenuItem<String>>((String value) {
//                     return DropdownMenuItem<String>(
//                       value: value,
//                       child: Text(value),
//                     );
//                   }).toList(),
//                   onChanged: (String? newValue) {
//                     if (newValue != null) {
//                       _updateStatus(index, newValue);
//                     }
//                   },
//                 ),
//                 SizedBox(height: 10),
//               ],
//             ),
//           ),
//         ],
//       ),
//     );
//   }
//
//   /// Builds the main UI of the page.
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text('Verify Tutors'),
//         backgroundColor: Colors.purple,
//       ),
//       body: _tutors.isEmpty
//           ? Center(
//         child: Text(
//           'No tutors available.',
//           style: TextStyle(fontSize: 18.0),
//         ),
//       )
//           : ListView.builder(
//         itemCount: _tutors.length,
//         itemBuilder: (context, index) {
//           return _buildTutorCard(index);
//         },
//       ),
//     );
//   }
// }

//
// import 'package:flutter/material.dart';
// import 'package:video_player/video_player.dart';
// import 'package:chewie/chewie.dart';
// import 'package:url_launcher/url_launcher.dart';
//
// /// Model class representing a Certificate.
// class Certificate {
//   final String type;
//   final String fileName;
//   final String url;
//
//   Certificate({
//     required this.type,
//     required this.fileName,
//     required this.url,
//   });
// }
//
// /// Model class representing a Tutor.
// class Tutor {
//   final String id;
//   final String name;
//   final String email;
//   final String address;
//   final String dateOfBirth;
//   final String interests;
//   final String education;
//   final String experience;
//   final String profession;
//   final String instruction;
//   final String language;
//   final String about;
//   String status; // 'Verified' or 'Unverified'
//   final String imageUrl;
//   final String videoUrl;
//   final List<Certificate> certificates;
//
//   Tutor({
//     required this.id,
//     required this.name,
//     required this.email,
//     required this.address,
//     required this.dateOfBirth,
//     required this.interests,
//     required this.education,
//     required this.experience,
//     required this.profession,
//     required this.instruction,
//     required this.language,
//     required this.about,
//     this.status = 'Unverified',
//     required this.imageUrl,
//     required this.videoUrl,
//     required this.certificates,
//   });
// }
//
// /// Stateful widget for verifying tutors.
// class VerifyTutorPage extends StatefulWidget {
//   @override
//   _VerifyTutorPageState createState() => _VerifyTutorPageState();
// }
//
// class _VerifyTutorPageState extends State<VerifyTutorPage> {
//   // List of tutors (dummy data)
//   List<Tutor> _tutors = [
//     Tutor(
//       id: '1',
//       name: 'John Doe',
//       email: 'john.doe@example.com',
//       address: '123 Main St, Springfield',
//       dateOfBirth: '1990-01-01',
//       interests: 'Mathematics, Physics',
//       education: 'MSc in Mathematics',
//       experience: '5 years teaching',
//       profession: 'Mathematician',
//       instruction: 'Online and in-person',
//       language: 'English',
//       about: 'Passionate about teaching mathematics and physics.',
//       status: 'Unverified',
//       imageUrl:
//       'https://via.placeholder.com/150', // Placeholder image URL
//       videoUrl:
//       'https://sample-videos.com/video123/mp4/720/big_buck_bunny_720p_1mb.mp4', // Sample video URL
//       certificates: [
//         Certificate(
//           type: 'Bachelor Degree',
//           fileName: 'BSc_Math.pdf',
//           url: 'https://www.example.com/certificates/BSc_Math.pdf',
//         ),
//         Certificate(
//           type: 'Master Degree',
//           fileName: 'MSc_Math.pdf',
//           url: 'https://www.example.com/certificates/MSc_Math.pdf',
//         ),
//       ],
//     ),
//     Tutor(
//       id: '2',
//       name: 'Jane Smith',
//       email: 'jane.smith@example.com',
//       address: '456 Elm St, Metropolis',
//       dateOfBirth: '1985-05-15',
//       interests: 'Chemistry, Biology',
//       education: 'PhD in Chemistry',
//       experience: '8 years teaching',
//       profession: 'Chemist',
//       instruction: 'Online',
//       language: 'English, Spanish',
//       about:
//       'Experienced chemistry tutor with a focus on practical applications.',
//       status: 'Unverified',
//       imageUrl:
//       'https://via.placeholder.com/150', // Placeholder image URL
//       videoUrl:
//       'https://sample-videos.com/video123/mp4/720/big_buck_bunny_720p_1mb.mp4', // Sample video URL
//       certificates: [
//         Certificate(
//           type: 'Bachelor Degree',
//           fileName: 'BSc_Chemistry.pdf',
//           url: 'https://www.example.com/certificates/BSc_Chemistry.pdf',
//         ),
//         Certificate(
//           type: 'PhD Degree',
//           fileName: 'PhD_Chemistry.pdf',
//           url: 'https://www.example.com/certificates/PhD_Chemistry.pdf',
//         ),
//       ],
//     ),
//     // Add more dummy tutors as needed
//   ];
//
//   // Map to hold video controllers for each tutor
//   Map<String, VideoPlayerController> _videoControllers = {};
//   Map<String, ChewieController> _chewieControllers = {};
//
//   @override
//   void initState() {
//     super.initState();
//     _initializeVideoPlayers();
//   }
//
//   /// Initialize video players for all tutors
//   void _initializeVideoPlayers() {
//     for (var tutor in _tutors) {
//       if (tutor.videoUrl.isNotEmpty) {
//         VideoPlayerController videoController =
//         VideoPlayerController.network(tutor.videoUrl);
//         ChewieController chewieController = ChewieController(
//           videoPlayerController: videoController,
//           aspectRatio: 16 / 9,
//           autoPlay: false,
//           looping: false,
//         );
//
//         _videoControllers[tutor.id] = videoController;
//         _chewieControllers[tutor.id] = chewieController;
//
//         videoController.initialize().then((_) {
//           setState(() {});
//         });
//       }
//     }
//   }
//
//   /// Dispose all video controllers to free resources
//   @override
//   void dispose() {
//     _chewieControllers.forEach((key, chewieController) {
//       chewieController.dispose();
//     });
//     _videoControllers.forEach((key, videoController) {
//       videoController.dispose();
//     });
//     super.dispose();
//   }
//
//   /// Method to update the verification status of a tutor.
//   void _updateStatus(int index, String newStatus) {
//     setState(() {
//       _tutors[index].status = newStatus;
//       // TODO: Update the status in Firestore
//       // Example:
//       // FirebaseFirestore.instance
//       //     .collection('tutors')
//       //     .doc(_tutors[index].id)
//       //     .update({'status': newStatus});
//       // Remove the tutor from the list after verification
//       _tutors.removeAt(index);
//     });
//
//     ScaffoldMessenger.of(context).showSnackBar(
//       SnackBar(
//         content:
//         Text('${_tutors[index].name} has been marked as $newStatus.'),
//         duration: Duration(seconds: 2),
//       ),
//     );
//   }
//
//   /// Builds the UI for each tutor card.
//   Widget _buildTutorCard(int index) {
//     final tutor = _tutors[index];
//     return Card(
//       margin: EdgeInsets.symmetric(horizontal: 12.0, vertical: 6.0),
//       elevation: 3.0,
//       child: ExpansionTile(
//         leading: CircleAvatar(
//           backgroundImage: NetworkImage(tutor.imageUrl),
//           backgroundColor: Colors.grey[200],
//         ),
//         title: Text(tutor.name),
//         subtitle: Text(tutor.email),
//         children: [
//           Padding(
//             padding: EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
//             child: Column(
//               crossAxisAlignment: CrossAxisAlignment.start,
//               children: [
//                 // Display additional tutor details
//                 Text('Address: ${tutor.address}'),
//                 Text('Date of Birth: ${tutor.dateOfBirth}'),
//                 Text('Interests: ${tutor.interests}'),
//                 Text('Education: ${tutor.education}'),
//                 Text('Experience: ${tutor.experience}'),
//                 Text('Profession: ${tutor.profession}'),
//                 Text('Instruction: ${tutor.instruction}'),
//                 Text('Language: ${tutor.language}'),
//                 SizedBox(height: 10),
//                 Text('About: ${tutor.about}'),
//                 SizedBox(height: 10),
//
//                 // Display Video
//                 tutor.videoUrl.isNotEmpty &&
//                     _chewieControllers.containsKey(tutor.id) &&
//                     _chewieControllers[tutor.id]!.videoPlayerController.value.isInitialized
//                     ? Column(
//                   crossAxisAlignment: CrossAxisAlignment.start,
//                   children: [
//                     Text(
//                       'Introduction Video:',
//                       style: TextStyle(fontWeight: FontWeight.bold),
//                     ),
//                     SizedBox(height: 5),
//                     Container(
//                       height: 200,
//                       child: Chewie(
//                         controller: _chewieControllers[tutor.id]!,
//                       ),
//                     ),
//                     SizedBox(height: 10),
//                   ],
//                 )
//                     : Container(),
//
//                 // Display Certificates
//                 tutor.certificates.isNotEmpty
//                     ? Column(
//                   crossAxisAlignment: CrossAxisAlignment.start,
//                   children: [
//                     Text(
//                       'Certificates:',
//                       style: TextStyle(fontWeight: FontWeight.bold),
//                     ),
//                     SizedBox(height: 5),
//                     ListView.builder(
//                       shrinkWrap: true,
//                       physics: NeverScrollableScrollPhysics(),
//                       itemCount: tutor.certificates.length,
//                       itemBuilder: (context, certIndex) {
//                         final cert = tutor.certificates[certIndex];
//                         bool isImage = cert.url.toLowerCase().endsWith('.jpg') ||
//                             cert.url.toLowerCase().endsWith('.png') ||
//                             cert.url.toLowerCase().endsWith('.jpeg');
//                         bool isPdf = cert.url.toLowerCase().endsWith('.pdf');
//                         return ListTile(
//                           contentPadding: EdgeInsets.zero,
//                           leading: isImage
//                               ? Image.network(
//                             cert.url,
//                             width: 50,
//                             height: 50,
//                             fit: BoxFit.cover,
//                           )
//                               : isPdf
//                               ? Icon(Icons.picture_as_pdf, color: Colors.red)
//                               : Icon(Icons.description, color: Colors.grey),
//                           title: Text(cert.type),
//                           subtitle: Text(cert.fileName),
//                           trailing: IconButton(
//                             icon: Icon(Icons.open_in_new, color: Colors.blue),
//                             onPressed: () async {
//                               // Open the certificate URL
//                               if (await canLaunch(cert.url)) {
//                                 await launch(cert.url);
//                               } else {
//                                 ScaffoldMessenger.of(context).showSnackBar(
//                                   SnackBar(
//                                     content: Text('Could not open the file.'),
//                                     duration: Duration(seconds: 2),
//                                   ),
//                                 );
//                               }
//                             },
//                           ),
//                         );
//                       },
//                     ),
//                     SizedBox(height: 10),
//                   ],
//                 )
//                     : Container(),
//
//                 Divider(),
//                 Text(
//                   'Verification Status:',
//                   style: TextStyle(fontWeight: FontWeight.bold),
//                 ),
//                 SizedBox(height: 5),
//
//                 // Accept and Reject Buttons
//                 Row(
//                   mainAxisAlignment: MainAxisAlignment.spaceEvenly,
//                   children: [
//                     ElevatedButton.icon(
//                       onPressed: () {
//                         _updateStatus(index, 'Verified');
//                       },
//                       icon: Icon(Icons.check, color: Colors.white),
//                       label: Text('Accept'),
//                       style: ElevatedButton.styleFrom(
//                         backgroundColor: Colors.green,
//                       ),
//                     ),
//                     ElevatedButton.icon(
//                       onPressed: () {
//                         _updateStatus(index, 'Rejected');
//                       },
//                       icon: Icon(Icons.close, color: Colors.white),
//                       label: Text('Reject'),
//                       style: ElevatedButton.styleFrom(
//                         backgroundColor: Colors.red,
//                       ),
//                     ),
//                   ],
//                 ),
//                 SizedBox(height: 10),
//               ],
//             ),
//           ),
//         ],
//       ),
//     );
//   }
//
//   /// Builds the main UI of the page.
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text('Verify Tutors'),
//         backgroundColor: Colors.purple,
//       ),
//       body: _tutors.isEmpty
//           ? Center(
//         child: Text(
//           'No tutors available.',
//           style: TextStyle(fontSize: 18.0),
//         ),
//       )
//           : ListView.builder(
//         itemCount: _tutors.length,
//         itemBuilder: (context, index) {
//           return _buildTutorCard(index);
//         },
//       ),
//     );
//   }
// }
//
// import 'package:flutter/material.dart';
// import 'package:video_player/video_player.dart';
// import 'package:chewie/chewie.dart';
// import 'package:url_launcher/url_launcher.dart';
//
// /// Model class representing a Certificate.
// class Certificate {
//   final String type;
//   final String fileName;
//   final String url;
//
//   Certificate({
//     required this.type,
//     required this.fileName,
//     required this.url,
//   });
// }
//
// /// Model class representing a Tutor.
// class Tutor {
//   final String id;
//   final String name;
//   final String email;
//   final String address;
//   final String dateOfBirth;
//   final String interests;
//   final String education;
//   final String experience;
//   final String profession;
//   final String instruction;
//   final String language;
//   final String about;
//   String status; // 'Verified' or 'Unverified'
//   final String imageUrl;
//   final String videoUrl;
//   final List<Certificate> certificates;
//
//   Tutor({
//     required this.id,
//     required this.name,
//     required this.email,
//     required this.address,
//     required this.dateOfBirth,
//     required this.interests,
//     required this.education,
//     required this.experience,
//     required this.profession,
//     required this.instruction,
//     required this.language,
//     required this.about,
//     this.status = 'Unverified',
//     required this.imageUrl,
//     required this.videoUrl,
//     required this.certificates,
//   });
// }
//
// /// Stateful widget for verifying tutors.
// class VerifyTutorPage extends StatefulWidget {
//   @override
//   _VerifyTutorPageState createState() => _VerifyTutorPageState();
// }
//
// class _VerifyTutorPageState extends State<VerifyTutorPage> {
//   // List of tutors (dummy data)
//   List<Tutor> _tutors = [
//     Tutor(
//       id: '1',
//       name: 'John Doe',
//       email: 'john.doe@example.com',
//       address: '123 Main St, Springfield',
//       dateOfBirth: '1990-01-01',
//       interests: 'Mathematics, Physics',
//       education: 'MSc in Mathematics',
//       experience: '5 years teaching',
//       profession: 'Mathematician',
//       instruction: 'Online and in-person',
//       language: 'English',
//       about: 'Passionate about teaching mathematics and physics.',
//       status: 'Unverified',
//       imageUrl:
//       'https://via.placeholder.com/150', // Placeholder image URL
//       videoUrl:
//       'https://sample-videos.com/video123/mp4/720/big_buck_bunny_720p_1mb.mp4', // Sample video URL
//       certificates: [
//         Certificate(
//           type: 'Bachelor Degree',
//           fileName: 'BSc_Math.pdf',
//           url: 'https://www.example.com/certificates/BSc_Math.pdf',
//         ),
//         Certificate(
//           type: 'Master Degree',
//           fileName: 'MSc_Math.pdf',
//           url: 'https://www.example.com/certificates/MSc_Math.pdf',
//         ),
//       ],
//     ),
//     Tutor(
//       id: '2',
//       name: 'Jane Smith',
//       email: 'jane.smith@example.com',
//       address: '456 Elm St, Metropolis',
//       dateOfBirth: '1985-05-15',
//       interests: 'Chemistry, Biology',
//       education: 'PhD in Chemistry',
//       experience: '8 years teaching',
//       profession: 'Chemist',
//       instruction: 'Online',
//       language: 'English, Spanish',
//       about:
//       'Experienced chemistry tutor with a focus on practical applications.',
//       status: 'Unverified',
//       imageUrl:
//       'https://via.placeholder.com/150', // Placeholder image URL
//       videoUrl:
//       'https://sample-videos.com/video123/mp4/720/big_buck_bunny_720p_1mb.mp4', // Sample video URL
//       certificates: [
//         Certificate(
//           type: 'Bachelor Degree',
//           fileName: 'BSc_Chemistry.pdf',
//           url: 'https://www.example.com/certificates/BSc_Chemistry.pdf',
//         ),
//         Certificate(
//           type: 'PhD Degree',
//           fileName: 'PhD_Chemistry.pdf',
//           url: 'https://www.example.com/certificates/PhD_Chemistry.pdf',
//         ),
//       ],
//     ),
//     // Add more dummy tutors as needed
//   ];
//
//   // Map to hold video controllers for each tutor
//   Map<String, VideoPlayerController> _videoControllers = {};
//   Map<String, ChewieController> _chewieControllers = {};
//
//   @override
//   void initState() {
//     super.initState();
//     _initializeVideoPlayers();
//   }
//
//   /// Initialize video players for all tutors
//   void _initializeVideoPlayers() {
//     for (var tutor in _tutors) {
//       if (tutor.videoUrl.isNotEmpty) {
//         VideoPlayerController videoController =
//         VideoPlayerController.network(tutor.videoUrl);
//         ChewieController chewieController = ChewieController(
//           videoPlayerController: videoController,
//           aspectRatio: 16 / 9,
//           autoPlay: false,
//           looping: false,
//           // Additional options can be set here
//         );
//
//         _videoControllers[tutor.id] = videoController;
//         _chewieControllers[tutor.id] = chewieController;
//
//         videoController.initialize().then((_) {
//           setState(() {});
//         });
//       }
//     }
//   }
//
//   /// Dispose all video controllers to free resources
//   @override
//   void dispose() {
//     _chewieControllers.forEach((key, chewieController) {
//       chewieController.dispose();
//     });
//     _videoControllers.forEach((key, videoController) {
//       videoController.dispose();
//     });
//     super.dispose();
//   }
//
//   /// Method to update the verification status of a tutor.
//   void _updateStatus(int index, String newStatus) {
//     String tutorName = _tutors[index].name;
//
//     setState(() {
//       _tutors.removeAt(index);
//       // TODO: Update the status in Firestore
//       // Example:
//       // FirebaseFirestore.instance
//       //     .collection('tutors')
//       //     .doc(_tutors[index].id)
//       //     .update({'status': newStatus});
//     });
//
//     ScaffoldMessenger.of(context).showSnackBar(
//       SnackBar(
//         content: Text('$tutorName has been marked as $newStatus.'),
//         duration: Duration(seconds: 2),
//       ),
//     );
//   }
//
//   /// Method to launch URLs (for PDF viewing)
//   Future<void> _launchURL(String url) async {
//     Uri uri = Uri.parse(url);
//     if (await canLaunchUrl(uri)) {
//       await launchUrl(uri, mode: LaunchMode.externalApplication);
//     } else {
//       ScaffoldMessenger.of(context).showSnackBar(
//         SnackBar(
//           content: Text('Could not open the file.'),
//           duration: Duration(seconds: 2),
//         ),
//       );
//     }
//   }
//
//   /// Builds the UI for each tutor card.
//   Widget _buildTutorCard(int index) {
//     final tutor = _tutors[index];
//     return Card(
//       margin: EdgeInsets.symmetric(horizontal: 12.0, vertical: 6.0),
//       elevation: 3.0,
//       child: ExpansionTile(
//         leading: CircleAvatar(
//           backgroundImage: NetworkImage(tutor.imageUrl),
//           backgroundColor: Colors.grey[200],
//         ),
//         title: Text(tutor.name),
//         subtitle: Text(tutor.email),
//         children: [
//           Padding(
//             padding: EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
//             child: Column(
//               crossAxisAlignment: CrossAxisAlignment.start,
//               children: [
//                 // Display additional tutor details
//                 Text('Address: ${tutor.address}'),
//                 Text('Date of Birth: ${tutor.dateOfBirth}'),
//                 Text('Interests: ${tutor.interests}'),
//                 Text('Education: ${tutor.education}'),
//                 Text('Experience: ${tutor.experience}'),
//                 Text('Profession: ${tutor.profession}'),
//                 Text('Instruction: ${tutor.instruction}'),
//                 Text('Language: ${tutor.language}'),
//                 SizedBox(height: 10),
//                 Text('About: ${tutor.about}'),
//                 SizedBox(height: 10),
//
//                 // Display Video
//                 tutor.videoUrl.isNotEmpty &&
//                     _chewieControllers.containsKey(tutor.id) &&
//                     _chewieControllers[tutor.id]!.videoPlayerController.value.isInitialized
//                     ? Column(
//                   crossAxisAlignment: CrossAxisAlignment.start,
//                   children: [
//                     Text(
//                       'Introduction Video:',
//                       style: TextStyle(fontWeight: FontWeight.bold),
//                     ),
//                     SizedBox(height: 5),
//                     Container(
//                       height: 200,
//                       child: Chewie(
//                         controller: _chewieControllers[tutor.id]!,
//                       ),
//                     ),
//                     SizedBox(height: 10),
//                   ],
//                 )
//                     : Container(),
//
//                 // Display Certificates
//                 tutor.certificates.isNotEmpty
//                     ? Column(
//                   crossAxisAlignment: CrossAxisAlignment.start,
//                   children: [
//                     Text(
//                       'Certificates:',
//                       style: TextStyle(fontWeight: FontWeight.bold),
//                     ),
//                     SizedBox(height: 5),
//                     ListView.builder(
//                       shrinkWrap: true,
//                       physics: NeverScrollableScrollPhysics(),
//                       itemCount: tutor.certificates.length,
//                       itemBuilder: (context, certIndex) {
//                         final cert = tutor.certificates[certIndex];
//                         bool isImage = cert.url.toLowerCase().endsWith('.jpg') ||
//                             cert.url.toLowerCase().endsWith('.png') ||
//                             cert.url.toLowerCase().endsWith('.jpeg');
//                         bool isPdf = cert.url.toLowerCase().endsWith('.pdf');
//                         return ListTile(
//                           contentPadding: EdgeInsets.zero,
//                           leading: isImage
//                               ? Image.network(
//                             cert.url,
//                             width: 50,
//                             height: 50,
//                             fit: BoxFit.cover,
//                           )
//                               : isPdf
//                               ? Icon(Icons.picture_as_pdf, color: Colors.red, size: 40)
//                               : Icon(Icons.description, color: Colors.grey, size: 40),
//                           title: Text(cert.type),
//                           subtitle: Text(cert.fileName),
//                           trailing: IconButton(
//                             icon: Icon(Icons.open_in_new, color: Colors.blue),
//                             onPressed: () {
//                               // Open the certificate URL
//                               _launchURL(cert.url);
//                             },
//                           ),
//                         );
//                       },
//                     ),
//                     SizedBox(height: 10),
//                   ],
//                 )
//                     : Container(),
//
//                 Divider(),
//                 Text(
//                   'Verification Actions:',
//                   style: TextStyle(fontWeight: FontWeight.bold),
//                 ),
//                 SizedBox(height: 5),
//
//                 // Accept and Reject Buttons
//                 Row(
//                   mainAxisAlignment: MainAxisAlignment.spaceEvenly,
//                   children: [
//                     ElevatedButton.icon(
//                       onPressed: () {
//                         _showConfirmationDialog(index, 'Verified');
//                       },
//                       icon: Icon(Icons.check, color: Colors.white),
//                       label: Text('Accept'),
//                       style: ElevatedButton.styleFrom(
//                         primary: Colors.green,
//                       ),
//                     ),
//                     ElevatedButton.icon(
//                       onPressed: () {
//                         _showConfirmationDialog(index, 'Rejected');
//                       },
//                       icon: Icon(Icons.close, color: Colors.white),
//                       label: Text('Reject'),
//                       style: ElevatedButton.styleFrom(
//                         primary: Colors.red,
//                       ),
//                     ),
//                   ],
//                 ),
//                 SizedBox(height: 10),
//               ],
//             ),
//           ),
//         ],
//       ),
//     );
//   }
//
//   /// Method to show a confirmation dialog before accepting or rejecting a tutor.
//   void _showConfirmationDialog(int index, String action) {
//     String tutorName = _tutors[index].name;
//     showDialog(
//       context: context,
//       builder: (context) {
//         return AlertDialog(
//           title: Text('$action Tutor'),
//           content: Text('Are you sure you want to $action $tutorName?'),
//           actions: [
//             TextButton(
//               onPressed: () => Navigator.of(context).pop(), // Cancel action
//               child: Text('Cancel'),
//             ),
//             ElevatedButton(
//               onPressed: () {
//                 Navigator.of(context).pop(); // Close the dialog
//                 _updateStatus(index, action); // Update status
//               },
//               style: ElevatedButton.styleFrom(
//                 backgroundColor: action == 'Verified' ? Colors.green : Colors.red,
//               ),
//               child: Text(action),
//             ),
//           ],
//         );
//       },
//     );
//   }
//
//   /// Builds the main UI of the page.
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text('Verify Tutors'),
//         backgroundColor: Colors.purple,
//       ),
//       body: _tutors.isEmpty
//           ? Center(
//         child: Text(
//           'No tutors available.',
//           style: TextStyle(fontSize: 18.0),
//         ),
//       )
//           : ListView.builder(
//         itemCount: _tutors.length,
//         itemBuilder: (context, index) {
//           return _buildTutorCard(index);
//         },
//       ),
//     );
//   }
// }

// import 'package:flutter/material.dart';
// import 'package:flutter_pdfview/flutter_pdfview.dart';
// import '../../widgets/video_popup.dart';
//  // Ensure this path is correct based on your project structure.
//
// /// Model class representing a Certificate.
// class Certificate {
//   final String type;
//   final String fileName;
//   final String url;
//
//   Certificate({
//     required this.type,
//     required this.fileName,
//     required this.url,
//   });
// }
//
// /// Model class representing a Tutor.
// class Tutor {
//   final String id;
//   final String name;
//   final String email;
//   final String address;
//   final String dateOfBirth;
//   final String interests;
//   final String education;
//   final String experience;
//   final String profession;
//   final String instruction;
//   final String language;
//   final String about;
//   String status; // 'Verified' or 'Unverified'
//   final String imageUrl;
//   final String videoUrl;
//   final List<Certificate> certificates;
//
//   Tutor({
//     required this.id,
//     required this.name,
//     required this.email,
//     required this.address,
//     required this.dateOfBirth,
//     required this.interests,
//     required this.education,
//     required this.experience,
//     required this.profession,
//     required this.instruction,
//     required this.language,
//     required this.about,
//     this.status = 'Unverified',
//     required this.imageUrl,
//     required this.videoUrl,
//     required this.certificates,
//   });
// }
//
// /// Stateful widget for verifying tutors.
// class VerifyTutorPage extends StatefulWidget {
//   @override
//   _VerifyTutorPageState createState() => _VerifyTutorPageState();
// }
//
// class _VerifyTutorPageState extends State<VerifyTutorPage> {
//   // List of tutors (dummy data)
//   List<Tutor> _tutors = [
//     Tutor(
//       id: '1',
//       name: 'John Doe',
//       email: 'john.doe@example.com',
//       address: '123 Main St, Springfield',
//       dateOfBirth: '1990-01-01',
//       interests: 'Mathematics, Physics',
//       education: 'MSc in Mathematics',
//       experience: '5 years teaching',
//       profession: 'Mathematician',
//       instruction: 'Online and in-person',
//       language: 'English',
//       about: 'Passionate about teaching mathematics and physics.',
//       status: 'Unverified',
//       imageUrl:
//       'https://via.placeholder.com/150', // Placeholder image URL
//       videoUrl:
//       'https://sample-videos.com/video123/mp4/720/big_buck_bunny_720p_1mb.mp4', // Sample video URL
//       certificates: [
//         Certificate(
//           type: 'Bachelor Degree',
//           fileName: 'BSc_Math.pdf',
//           url: 'assets/certificates/BSc_Math.pdf',
//         ),
//         Certificate(
//           type: 'Master Degree',
//           fileName: 'MSc_Math.pdf',
//           url: 'assets/certificates/MSc_Math.pdf',
//         ),
//       ],
//     ),
//     Tutor(
//       id: '2',
//       name: 'Jane Smith',
//       email: 'jane.smith@example.com',
//       address: '456 Elm St, Metropolis',
//       dateOfBirth: '1985-05-15',
//       interests: 'Chemistry, Biology',
//       education: 'PhD in Chemistry',
//       experience: '8 years teaching',
//       profession: 'Chemist',
//       instruction: 'Online',
//       language: 'English, Spanish',
//       about:
//       'Experienced chemistry tutor with a focus on practical applications.',
//       status: 'Unverified',
//       imageUrl:
//       'https://via.placeholder.com/150', // Placeholder image URL
//       videoUrl:
//       'https://sample-videos.com/video123/mp4/720/big_buck_bunny_720p_1mb.mp4', // Sample video URL
//       certificates: [
//         Certificate(
//           type: 'Bachelor Degree',
//           fileName: 'BSc_Chemistry.pdf',
//           url: 'assets/certificates/BSc_Chemistry.pdf',
//         ),
//         Certificate(
//           type: 'PhD Degree',
//           fileName: 'PhD_Chemistry.pdf',
//           url: 'assets/certificates/PhD_Chemistry.pdf',
//         ),
//       ],
//     ),
//     // Add more dummy tutors as needed
//   ];
//
//   /// Method to update the verification status of a tutor.
//   void _updateStatus(int index, String newStatus) {
//     String tutorName = _tutors[index].name;
//
//     setState(() {
//       _tutors.removeAt(index);
//       // TODO: Update the status in Firestore
//       // Example:
//       // FirebaseFirestore.instance
//       //     .collection('tutors')
//       //     .doc(_tutors[index].id)
//       //     .update({'status': newStatus});
//     });
//
//     ScaffoldMessenger.of(context).showSnackBar(
//       SnackBar(
//         content: Text('$tutorName has been marked as $newStatus.'),
//         duration: Duration(seconds: 2),
//       ),
//     );
//   }
//
//   /// Method to open PDF certificates within the app.
//   void _openPDF(String assetPath, String fileName) {
//     showDialog(
//       context: context,
//       builder: (context) {
//         return Dialog(
//           child: Container(
//             width: double.infinity,
//             height: 600, // Adjust as needed
//             child: Column(
//               children: [
//                 // Header with file name and close button
//                 Container(
//                   color: Colors.grey[200],
//                   padding: EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
//                   child: Row(
//                     children: [
//                       Expanded(
//                         child: Text(
//                           fileName,
//                           style: TextStyle(
//                             fontSize: 16.0,
//                             fontWeight: FontWeight.bold,
//                           ),
//                         ),
//                       ),
//                       IconButton(
//                         icon: Icon(Icons.close),
//                         onPressed: () => Navigator.of(context).pop(),
//                       ),
//                     ],
//                   ),
//                 ),
//                 // PDF Viewer
//                 Expanded(
//                   child: PDFView(
//                     filePath: assetPath,
//                     enableSwipe: true,
//                     swipeHorizontal: true,
//                     autoSpacing: false,
//                     pageFling: false,
//                   ),
//                 ),
//               ],
//             ),
//           ),
//         );
//       },
//     );
//   }
//
//   /// Method to show a confirmation dialog before accepting or rejecting a tutor.
//   void _showConfirmationDialog(int index, String action) {
//     String tutorName = _tutors[index].name;
//     showDialog(
//       context: context,
//       builder: (context) {
//         return AlertDialog(
//           title: Text('$action Tutor'),
//           content: Text('Are you sure you want to $action $tutorName?'),
//           actions: [
//             TextButton(
//               onPressed: () => Navigator.of(context).pop(), // Cancel action
//               child: Text('Cancel'),
//             ),
//             ElevatedButton(
//               onPressed: () {
//                 Navigator.of(context).pop(); // Close the dialog
//                 _updateStatus(index, action == 'Accept' ? 'Verified' : 'Rejected');
//               },
//               style: ElevatedButton.styleFrom(
//                 backgroundColor: action == 'Accept' ? Colors.green : Colors.red,
//               ),
//               child: Text(action),
//             ),
//           ],
//         );
//       },
//     );
//   }
//
//   /// Builds the UI for each tutor card.
//   Widget _buildTutorCard(int index) {
//     final tutor = _tutors[index];
//     return Card(
//       margin: EdgeInsets.symmetric(horizontal: 12.0, vertical: 6.0),
//       elevation: 3.0,
//       child: ExpansionTile(
//         leading: CircleAvatar(
//           backgroundImage: NetworkImage(tutor.imageUrl),
//           backgroundColor: Colors.grey[200],
//         ),
//         title: Text(tutor.name),
//         subtitle: Text(tutor.email),
//         children: [
//           Padding(
//             padding: EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
//             child: Column(
//               crossAxisAlignment: CrossAxisAlignment.start,
//               children: [
//                 // Display additional tutor details
//                 Text('Address: ${tutor.address}'),
//                 Text('Date of Birth: ${tutor.dateOfBirth}'),
//                 Text('Interests: ${tutor.interests}'),
//                 Text('Education: ${tutor.education}'),
//                 Text('Experience: ${tutor.experience}'),
//                 Text('Profession: ${tutor.profession}'),
//                 Text('Instruction: ${tutor.instruction}'),
//                 Text('Language: ${tutor.language}'),
//                 SizedBox(height: 10),
//                 Text('About: ${tutor.about}'),
//                 SizedBox(height: 10),
//
//                 // Display Photo
//                 Center(
//                   child: Image.network(
//                     tutor.imageUrl,
//                     height: 150,
//                     width: 150,
//                     fit: BoxFit.cover,
//                   ),
//                 ),
//                 SizedBox(height: 10),
//
//                 // Display Video
//                 tutor.videoUrl.isNotEmpty
//                     ? Column(
//                   crossAxisAlignment: CrossAxisAlignment.start,
//                   children: [
//                     Text(
//                       'Introduction Video:',
//                       style: TextStyle(fontWeight: FontWeight.bold),
//                     ),
//                     SizedBox(height: 5),
//                     Center(
//                       child: ElevatedButton.icon(
//                         onPressed: () {
//                           showDialog(
//                             context: context,
//                             builder: (context) {
//                               return VideoPopup(videoUrl: tutor.videoUrl);
//                             },
//                           );
//                         },
//                         icon: Icon(Icons.play_circle_fill, color: Colors.white),
//                         label: Text('Play Video'),
//                         style: ElevatedButton.styleFrom(
//                           backgroundColor: Colors.purple,
//                           padding: EdgeInsets.symmetric(horizontal: 20, vertical: 12),
//                           textStyle: TextStyle(fontSize: 16),
//                         ),
//                       ),
//                     ),
//                     SizedBox(height: 10),
//                   ],
//                 )
//                     : Container(),
//
//                 // Display Certificates
//                 tutor.certificates.isNotEmpty
//                     ? Column(
//                   crossAxisAlignment: CrossAxisAlignment.start,
//                   children: [
//                     Text(
//                       'Certificates:',
//                       style: TextStyle(fontWeight: FontWeight.bold),
//                     ),
//                     SizedBox(height: 5),
//                     Wrap(
//                       spacing: 10,
//                       runSpacing: 10,
//                       children: tutor.certificates.map((cert) {
//                         bool isImage = cert.url.toLowerCase().endsWith('.jpg') ||
//                             cert.url.toLowerCase().endsWith('.png') ||
//                             cert.url.toLowerCase().endsWith('.jpeg');
//                         bool isPdf = cert.url.toLowerCase().endsWith('.pdf');
//                         return Column(
//                           crossAxisAlignment: CrossAxisAlignment.start,
//                           children: [
//                             isImage
//                                 ? Image.network(
//                               cert.url,
//                               height: 100,
//                               width: 100,
//                               fit: BoxFit.cover,
//                             )
//                                 : isPdf
//                                 ? GestureDetector(
//                               onTap: () {
//                                 _openPDF(cert.url, cert.fileName);
//                               },
//                               child: Column(
//                                 children: [
//                                   Icon(Icons.picture_as_pdf,
//                                       color: Colors.red, size: 50),
//                                   SizedBox(height: 5),
//                                   Text(
//                                     cert.fileName,
//                                     style: TextStyle(
//                                       color: Colors.blue,
//                                       decoration: TextDecoration.underline,
//                                     ),
//                                   ),
//                                 ],
//                               ),
//                             )
//                                 : GestureDetector(
//                               onTap: () {
//                                 _openPDF(cert.url, cert.fileName);
//                               },
//                               child: Column(
//                                 children: [
//                                   Icon(Icons.description,
//                                       color: Colors.grey, size: 50),
//                                   SizedBox(height: 5),
//                                   Text(
//                                     cert.fileName,
//                                     style: TextStyle(
//                                       color: Colors.blue,
//                                       decoration: TextDecoration.underline,
//                                     ),
//                                   ),
//                                 ],
//                               ),
//                             ),
//                           ],
//                         );
//                       }).toList(),
//                     ),
//                     SizedBox(height: 10),
//                   ],
//                 )
//                     : Container(),
//
//                 Divider(),
//                 Text(
//                   'Verification Actions:',
//                   style: TextStyle(fontWeight: FontWeight.bold),
//                 ),
//                 SizedBox(height: 5),
//
//                 // Accept and Reject Buttons
//                 Row(
//                   mainAxisAlignment: MainAxisAlignment.spaceEvenly,
//                   children: [
//                     ElevatedButton.icon(
//                       onPressed: () {
//                         _showConfirmationDialog(index, 'Accept');
//                       },
//                       icon: Icon(Icons.check, color: Colors.white),
//                       label: Text('Accept'),
//                       style: ElevatedButton.styleFrom(
//                         backgroundColor: Colors.green,
//                       ),
//                     ),
//                     ElevatedButton.icon(
//                       onPressed: () {
//                         _showConfirmationDialog(index, 'Reject');
//                       },
//                       icon: Icon(Icons.close, color: Colors.white),
//                       label: Text('Reject'),
//                       style: ElevatedButton.styleFrom(
//                         backgroundColor: Colors.red,
//                       ),
//                     ),
//                   ],
//                 ),
//                 SizedBox(height: 10),
//               ],
//             ),
//           ),
//         ],
//       ),
//     );
//   }
//
//   /// Builds the main UI of the page.
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text('Verify Tutors'),
//         backgroundColor: Colors.purple,
//       ),
//       body: _tutors.isEmpty
//           ? Center(
//         child: Text(
//           'No tutors available.',
//           style: TextStyle(fontSize: 18.0),
//         ),
//       )
//           : ListView.builder(
//         itemCount: _tutors.length,
//         itemBuilder: (context, index) {
//           return _buildTutorCard(index);
//         },
//       ),
//     );
//   }
// }

// import 'package:flutter/material.dart';
// import 'package:flutter_pdfview/flutter_pdfview.dart';
// import '../../widgets/video_popup.dart';
// // Ensure this path is correct based on your project structure.
//
// /// Model class representing a Certificate.
// class Certificate {
//   final String type;
//   final String fileName;
//   final String url;
//
//   Certificate({
//     required this.type,
//     required this.fileName,
//     required this.url,
//   });
// }
//
// /// Model class representing a Tutor.
// class Tutor {
//   final String id;
//   final String name;
//   final String email;
//   final String address;
//   final String dateOfBirth;
//   final String interests;
//   final String education;
//   final String experience;
//   final String profession;
//   final String instruction;
//   final String language;
//   final String about;
//   String status; // 'Verified' or 'Unverified'
//   final String imageUrl;
//   final String videoUrl;
//   final List<Certificate> certificates;
//
//   Tutor({
//     required this.id,
//     required this.name,
//     required this.email,
//     required this.address,
//     required this.dateOfBirth,
//     required this.interests,
//     required this.education,
//     required this.experience,
//     required this.profession,
//     required this.instruction,
//     required this.language,
//     required this.about,
//     this.status = 'Unverified',
//     required this.imageUrl,
//     required this.videoUrl,
//     required this.certificates,
//   });
// }
//
// /// Stateful widget for verifying tutors.
// class VerifyTutorPage extends StatefulWidget {
//   @override
//   _VerifyTutorPageState createState() => _VerifyTutorPageState();
// }
//
// class _VerifyTutorPageState extends State<VerifyTutorPage> {
//   // List of tutors (dummy data)
//   List<Tutor> _tutors = [
//     Tutor(
//       id: '1',
//       name: 'John Doe',
//       email: 'john.doe@example.com',
//       address: '123 Main St, Springfield',
//       dateOfBirth: '1990-01-01',
//       interests: 'Mathematics, Physics',
//       education: 'MSc in Mathematics',
//       experience: '5 years teaching',
//       profession: 'Mathematician',
//       instruction: 'Online and in-person',
//       language: 'English',
//       about: 'Passionate about teaching mathematics and physics.',
//       status: 'Unverified',
//       imageUrl:
//       'https://via.placeholder.com/150', // Placeholder image URL
//       videoUrl:
//       'https://sample-videos.com/video123/mp4/720/big_buck_bunny_720p_1mb.mp4', // Sample video URL
//       certificates: [
//         Certificate(
//           type: 'Bachelor Degree',
//           fileName: 'BSc_Math.pdf',
//           url: 'assets/certificates/BSc_Math.pdf',
//         ),
//         Certificate(
//           type: 'Master Degree',
//           fileName: 'MSc_Math.pdf',
//           url: 'assets/certificates/MSc_Math.pdf',
//         ),
//       ],
//     ),
//     Tutor(
//       id: '2',
//       name: 'Jane Smith',
//       email: 'jane.smith@example.com',
//       address: '456 Elm St, Metropolis',
//       dateOfBirth: '1985-05-15',
//       interests: 'Chemistry, Biology',
//       education: 'PhD in Chemistry',
//       experience: '8 years teaching',
//       profession: 'Chemist',
//       instruction: 'Online',
//       language: 'English, Spanish',
//       about:
//       'Experienced chemistry tutor with a focus on practical applications.',
//       status: 'Unverified',
//       imageUrl:
//       'https://via.placeholder.com/150', // Placeholder image URL
//       videoUrl:
//       'https://sample-videos.com/video123/mp4/720/big_buck_bunny_720p_1mb.mp4', // Sample video URL
//       certificates: [
//         Certificate(
//           type: 'Bachelor Degree',
//           fileName: 'BSc_Chemistry.pdf',
//           url: 'assets/certificates/BSc_Chemistry.pdf',
//         ),
//         Certificate(
//           type: 'PhD Degree',
//           fileName: 'PhD_Chemistry.pdf',
//           url: 'assets/certificates/PhD_Chemistry.pdf',
//         ),
//       ],
//     ),
//     // Add more dummy tutors as needed
//   ];
//
//   /// Method to update the verification status of a tutor.
//   void _updateStatus(int index, String newStatus) {
//     String tutorName = _tutors[index].name;
//
//     setState(() {
//       _tutors[index].status = newStatus;
//       // TODO: Update the status in Firestore
//       // Example:
//       // FirebaseFirestore.instance
//       //     .collection('tutors')
//       //     .doc(_tutors[index].id)
//       //     .update({'status': newStatus});
//     });
//
//     ScaffoldMessenger.of(context).showSnackBar(
//       SnackBar(
//         content: Text('$tutorName has been marked as $newStatus.'),
//         duration: Duration(seconds: 2),
//       ),
//     );
//   }
//
//   /// Method to open PDF certificates within the app.
//   void _openPDF(String assetPath, String fileName) {
//     showDialog(
//       context: context,
//       builder: (context) {
//         return Dialog(
//           child: Container(
//             width: double.infinity,
//             height: 600, // Adjust as needed
//             child: Column(
//               children: [
//                 // Header with file name and close button
//                 Container(
//                   color: Colors.grey[200],
//                   padding: EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
//                   child: Row(
//                     children: [
//                       Expanded(
//                         child: Text(
//                           fileName,
//                           style: TextStyle(
//                             fontSize: 16.0,
//                             fontWeight: FontWeight.bold,
//                           ),
//                         ),
//                       ),
//                       IconButton(
//                         icon: Icon(Icons.close),
//                         onPressed: () => Navigator.of(context).pop(),
//                       ),
//                     ],
//                   ),
//                 ),
//                 // PDF Viewer
//                 Expanded(
//                   child: PDFView(
//                     filePath: assetPath,
//                     enableSwipe: true,
//                     swipeHorizontal: true,
//                     autoSpacing: false,
//                     pageFling: false,
//                   ),
//                 ),
//               ],
//             ),
//           ),
//         );
//       },
//     );
//   }
//
//   /// Method to show a confirmation dialog before updating the status.
//   void _showConfirmationDialog(int index, String newStatus) {
//     String tutorName = _tutors[index].name;
//     String action = newStatus == 'Verified' ? 'verify' : 'unverify';
//
//     showDialog(
//       context: context,
//       builder: (context) {
//         return AlertDialog(
//           title: Text('${action.capitalize()} Tutor'),
//           content: Text('Are you sure you want to $action $tutorName?'),
//           actions: [
//             TextButton(
//               onPressed: () => Navigator.of(context).pop(), // Cancel action
//               child: Text('Cancel'),
//             ),
//             ElevatedButton(
//               onPressed: () {
//                 Navigator.of(context).pop(); // Close the dialog
//                 _updateStatus(index, newStatus);
//               },
//               style: ElevatedButton.styleFrom(
//                 backgroundColor: newStatus == 'Verified' ? Colors.green : Colors.red,
//               ),
//               child: Text(newStatus == 'Verified' ? 'Verify' : 'Unverify'),
//             ),
//           ],
//         );
//       },
//     );
//   }
//
//   /// Extension method to capitalize the first letter of a string.
//   String capitalize(String s) => s[0].toUpperCase() + s.substring(1);
//
//   /// Builds the UI for each tutor card.
//   Widget _buildTutorCard(int index) {
//     final tutor = _tutors[index];
//     return Card(
//       margin: EdgeInsets.symmetric(horizontal: 12.0, vertical: 6.0),
//       elevation: 3.0,
//       child: ExpansionTile(
//         leading: CircleAvatar(
//           backgroundImage: NetworkImage(tutor.imageUrl),
//           backgroundColor: Colors.grey[200],
//         ),
//         title: Text(tutor.name),
//         subtitle: Text(tutor.email),
//         children: [
//           Padding(
//             padding: EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
//             child: Column(
//               crossAxisAlignment: CrossAxisAlignment.start,
//               children: [
//                 // Display additional tutor details
//                 Text('Address: ${tutor.address}'),
//                 Text('Date of Birth: ${tutor.dateOfBirth}'),
//                 Text('Interests: ${tutor.interests}'),
//                 Text('Education: ${tutor.education}'),
//                 Text('Experience: ${tutor.experience}'),
//                 Text('Profession: ${tutor.profession}'),
//                 Text('Instruction: ${tutor.instruction}'),
//                 Text('Language: ${tutor.language}'),
//                 SizedBox(height: 10),
//                 Text('About: ${tutor.about}'),
//                 SizedBox(height: 10),
//
//                 // Display Photo
//                 Center(
//                   child: Image.network(
//                     tutor.imageUrl,
//                     height: 150,
//                     width: 150,
//                     fit: BoxFit.cover,
//                   ),
//                 ),
//                 SizedBox(height: 10),
//
//                 // Display Video
//                 tutor.videoUrl.isNotEmpty
//                     ? Column(
//                   crossAxisAlignment: CrossAxisAlignment.start,
//                   children: [
//                     Text(
//                       'Introduction Video:',
//                       style: TextStyle(fontWeight: FontWeight.bold),
//                     ),
//                     SizedBox(height: 5),
//                     Center(
//                       child: ElevatedButton.icon(
//                         onPressed: () {
//                           showDialog(
//                             context: context,
//                             builder: (context) {
//                               return VideoPopup(videoUrl: tutor.videoUrl);
//                             },
//                           );
//                         },
//                         icon: Icon(Icons.play_circle_fill, color: Colors.white),
//                         label: Text('Play Video'),
//                         style: ElevatedButton.styleFrom(
//                           backgroundColor: Colors.purple,
//                           padding: EdgeInsets.symmetric(horizontal: 20, vertical: 12),
//                           textStyle: TextStyle(fontSize: 16),
//                         ),
//                       ),
//                     ),
//                     SizedBox(height: 10),
//                   ],
//                 )
//                     : Container(),
//
//                 // Display Certificates
//                 tutor.certificates.isNotEmpty
//                     ? Column(
//                   crossAxisAlignment: CrossAxisAlignment.start,
//                   children: [
//                     Text(
//                       'Certificates:',
//                       style: TextStyle(fontWeight: FontWeight.bold),
//                     ),
//                     SizedBox(height: 5),
//                     Wrap(
//                       spacing: 10,
//                       runSpacing: 10,
//                       children: tutor.certificates.map((cert) {
//                         bool isImage = cert.url.toLowerCase().endsWith('.jpg') ||
//                             cert.url.toLowerCase().endsWith('.png') ||
//                             cert.url.toLowerCase().endsWith('.jpeg');
//                         bool isPdf = cert.url.toLowerCase().endsWith('.pdf');
//                         return Column(
//                           crossAxisAlignment: CrossAxisAlignment.start,
//                           children: [
//                             isImage
//                                 ? Image.network(
//                               cert.url,
//                               height: 100,
//                               width: 100,
//                               fit: BoxFit.cover,
//                             )
//                                 : isPdf
//                                 ? GestureDetector(
//                               onTap: () {
//                                 _openPDF(cert.url, cert.fileName);
//                               },
//                               child: Column(
//                                 children: [
//                                   Icon(Icons.picture_as_pdf,
//                                       color: Colors.red, size: 50),
//                                   SizedBox(height: 5),
//                                   Text(
//                                     cert.fileName,
//                                     style: TextStyle(
//                                       color: Colors.blue,
//                                       decoration: TextDecoration.underline,
//                                     ),
//                                   ),
//                                 ],
//                               ),
//                             )
//                                 : GestureDetector(
//                               onTap: () {
//                                 _openPDF(cert.url, cert.fileName);
//                               },
//                               child: Column(
//                                 children: [
//                                   Icon(Icons.description,
//                                       color: Colors.grey, size: 50),
//                                   SizedBox(height: 5),
//                                   Text(
//                                     cert.fileName,
//                                     style: TextStyle(
//                                       color: Colors.blue,
//                                       decoration: TextDecoration.underline,
//                                     ),
//                                   ),
//                                 ],
//                               ),
//                             ),
//                           ],
//                         );
//                       }).toList(),
//                     ),
//                     SizedBox(height: 10),
//                   ],
//                 )
//                     : Container(),
//
//                 Divider(),
//                 Text(
//                   'Verification Status:',
//                   style: TextStyle(fontWeight: FontWeight.bold),
//                 ),
//                 SizedBox(height: 5),
//
//                 // Status Dropdown
//                 Row(
//                   children: [
//                     Text(
//                       'Status:',
//                       style: TextStyle(fontSize: 16.0),
//                     ),
//                     SizedBox(width: 20),
//                     DropdownButton<String>(
//                       value: tutor.status,
//                       items: <String>['Unverified', 'Verified']
//                           .map((String value) {
//                         return DropdownMenuItem<String>(
//                           value: value,
//                           child: Text(value),
//                         );
//                       }).toList(),
//                       onChanged: (String? newValue) {
//                         if (newValue != null && newValue != tutor.status) {
//                           _showConfirmationDialog(index, newValue);
//                         }
//                       },
//                     ),
//                   ],
//                 ),
//                 SizedBox(height: 10),
//               ],
//             ),
//           ),
//         ],
//       ),
//     );
//   }
//
//   /// Builds the main UI of the page.
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text('Verify Tutors'),
//         backgroundColor: Colors.purple,
//       ),
//       body: _tutors.isEmpty
//           ? Center(
//         child: Text(
//           'No tutors available.',
//           style: TextStyle(fontSize: 18.0),
//         ),
//       )
//           : ListView.builder(
//         itemCount: _tutors.length,
//         itemBuilder: (context, index) {
//           return _buildTutorCard(index);
//         },
//       ),
//     );
//   }
// }
//
// /// Widget to display video in a popup.
// /// Ensure you have this widget implemented correctly.
// /// Below is a simple implementation for reference.
// class VideoPopup extends StatelessWidget {
//   final String videoUrl;
//
//   VideoPopup({required this.videoUrl});
//
//   @override
//   Widget build(BuildContext context) {
//     // Implement your video player here.
//     // This is a placeholder implementation.
//     return Dialog(
//       child: Container(
//         width: double.infinity,
//         height: 300,
//         child: Center(
//           child: Text('Video Player for URL: $videoUrl'),
//         ),
//       ),
//     );
//   }
// }
//
// /// Extension method to capitalize the first letter of a string.
// extension StringExtension on String {
//   String capitalize() => this.length > 0 ? '${this[0].toUpperCase()}${this.substring(1)}' : '';
// }

import 'package:flutter/material.dart';
import 'package:flutter_pdfview/flutter_pdfview.dart';
import '../../widgets/video_popup.dart';
// Ensure this path is correct based on your project structure.

/// Model class representing a Certificate.
class Certificate {
  final String type;
  final String fileName;
  final String url;

  Certificate({
    required this.type,
    required this.fileName,
    required this.url,
  });
}

/// Model class representing a Tutor.
class Tutor {
  final String id;
  final String name;
  final String email;
  final String address;
  final String dateOfBirth;
  final String interests;
  final String education;
  final String experience;
  final String profession;
  final String instruction;
  final String language;
  final String about;
  String status; // 'Verified' or 'Unverified'
  final String imageUrl;
  final String videoUrl;
  final List<Certificate> certificates;

  Tutor({
    required this.id,
    required this.name,
    required this.email,
    required this.address,
    required this.dateOfBirth,
    required this.interests,
    required this.education,
    required this.experience,
    required this.profession,
    required this.instruction,
    required this.language,
    required this.about,
    this.status = 'Unverified',
    required this.imageUrl,
    required this.videoUrl,
    required this.certificates,
  });
}

/// Stateful widget for verifying tutors.
class VerifyTutorPage extends StatefulWidget {
  @override
  _VerifyTutorPageState createState() => _VerifyTutorPageState();
}

class _VerifyTutorPageState extends State<VerifyTutorPage> {
  // List of tutors (dummy data)
  List<Tutor> _tutors = [
    Tutor(
      id: '1',
      name: 'John Doe',
      email: 'john.doe@example.com',
      address: '123 Main St, Springfield',
      dateOfBirth: '1990-01-01',
      interests: 'Mathematics, Physics',
      education: 'MSc in Mathematics',
      experience: '5 years teaching',
      profession: 'Mathematician',
      instruction: 'Online and in-person',
      language: 'English',
      about: 'Passionate about teaching mathematics and physics.',
      status: 'Unverified',
      imageUrl:
      'https://via.placeholder.com/150', // Placeholder image URL
      videoUrl:
      'https://sample-videos.com/video123/mp4/720/big_buck_bunny_720p_1mb.mp4', // Sample video URL
      certificates: [
        Certificate(
          type: 'Bachelor Degree',
          fileName: 'BSc_Math.pdf',
          url: 'assets/certificates/BSc_Math.pdf',
        ),
        Certificate(
          type: 'Master Degree',
          fileName: 'MSc_Math.pdf',
          url: 'assets/certificates/MSc_Math.pdf',
        ),
      ],
    ),
    Tutor(
      id: '2',
      name: 'Jane Smith',
      email: 'jane.smith@example.com',
      address: '456 Elm St, Metropolis',
      dateOfBirth: '1985-05-15',
      interests: 'Chemistry, Biology',
      education: 'PhD in Chemistry',
      experience: '8 years teaching',
      profession: 'Chemist',
      instruction: 'Online',
      language: 'English, Spanish',
      about:
      'Experienced chemistry tutor with a focus on practical applications.',
      status: 'Unverified',
      imageUrl:
      'https://via.placeholder.com/150', // Placeholder image URL
      videoUrl:
      'https://sample-videos.com/video123/mp4/720/big_buck_bunny_720p_1mb.mp4', // Sample video URL
      certificates: [
        Certificate(
          type: 'Bachelor Degree',
          fileName: 'BSc_Chemistry.pdf',
          url: 'assets/certificates/BSc_Chemistry.pdf',
        ),
        Certificate(
          type: 'PhD Degree',
          fileName: 'PhD_Chemistry.pdf',
          url: 'assets/certificates/PhD_Chemistry.pdf',
        ),
      ],
    ),
    // Add more dummy tutors as needed
  ];

  /// Method to update the verification status of a tutor.
  void _updateStatus(int index, String newStatus) {
    String tutorName = _tutors[index].name;
    String tutorId = _tutors[index].id;

    setState(() {
      _tutors[index].status = newStatus;
      // TODO: Update the status in Firestore
      // Example:
      // FirebaseFirestore.instance
      //     .collection('tutors')
      //     .doc(tutorId)
      //     .update({'status': newStatus});
    });

    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text('$tutorName has been marked as $newStatus.'),
        duration: Duration(seconds: 2),
      ),
    );
  }

  /// Method to remove a tutor from the list after accepting or rejecting.
  void _processTutor(int index, String newStatus) {
    String tutorName = _tutors[index].name;
    String tutorId = _tutors[index].id;

    setState(() {
      _tutors.removeAt(index);
      // TODO: Update the status in Firestore
      // Example:
      // FirebaseFirestore.instance
      //     .collection('tutors')
      //     .doc(tutorId)
      //     .update({'status': newStatus});
    });

    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text('$tutorName has been $newStatus.'),
        duration: Duration(seconds: 2),
      ),
    );
  }

  /// Method to open PDF certificates within the app.
  void _openPDF(String assetPath, String fileName) {
    showDialog(
      context: context,
      builder: (context) {
        return Dialog(
          child: Container(
            width: double.infinity,
            height: 600, // Adjust as needed
            child: Column(
              children: [
                // Header with file name and close button
                Container(
                  color: Colors.grey[200],
                  padding: EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
                  child: Row(
                    children: [
                      Expanded(
                        child: Text(
                          fileName,
                          style: TextStyle(
                            fontSize: 16.0,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                      IconButton(
                        icon: Icon(Icons.close),
                        onPressed: () => Navigator.of(context).pop(),
                      ),
                    ],
                  ),
                ),
                // PDF Viewer
                Expanded(
                  child: PDFView(
                    filePath: assetPath,
                    enableSwipe: true,
                    swipeHorizontal: true,
                    autoSpacing: false,
                    pageFling: false,
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }

  /// Method to show a confirmation dialog before accepting or rejecting a tutor.
  void _showConfirmationDialog(int index, String action) {
    String tutorName = _tutors[index].name;
    String newStatus = action == 'Accept' ? 'Verified' : 'Rejected';

    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: Text('$action Tutor'),
          content: Text('Are you sure you want to $action $tutorName?'),
          actions: [
            TextButton(
              onPressed: () => Navigator.of(context).pop(), // Cancel action
              child: Text('Cancel'),
            ),
            ElevatedButton(
              onPressed: () {
                Navigator.of(context).pop(); // Close the dialog
                _processTutor(index, newStatus);
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: action == 'Accept' ? Colors.green : Colors.red,
              ),
              child: Text(action),
            ),
          ],
        );
      },
    );
  }

  /// Method to show a confirmation dialog before changing the status via dropdown.
  void _showStatusChangeDialog(int index, String newStatus) {
    String tutorName = _tutors[index].name;

    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: Text('Change Status'),
          content: Text('Are you sure you want to mark $tutorName as $newStatus?'),
          actions: [
            TextButton(
              onPressed: () => Navigator.of(context).pop(), // Cancel action
              child: Text('Cancel'),
            ),
            ElevatedButton(
              onPressed: () {
                Navigator.of(context).pop(); // Close the dialog
                _updateStatus(index, newStatus);
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: newStatus == 'Verified' ? Colors.green : Colors.orange,
              ),
              child: Text('Confirm'),
            ),
          ],
        );
      },
    );
  }

  /// Extension method to capitalize the first letter of a string.
  String capitalize(String s) => s.isNotEmpty ? '${s[0].toUpperCase()}${s.substring(1)}' : s;

  /// Builds the UI for each tutor card.
  Widget _buildTutorCard(int index) {
    final tutor = _tutors[index];
    return Card(
      margin: EdgeInsets.symmetric(horizontal: 12.0, vertical: 6.0),
      elevation: 3.0,
      child: ExpansionTile(
        leading: CircleAvatar(
          backgroundImage: NetworkImage(tutor.imageUrl),
          backgroundColor: Colors.grey[200],
        ),
        title: Text(tutor.name),
        subtitle: Text(tutor.email),
        children: [
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // Display additional tutor details
                Text('Address: ${tutor.address}'),
                Text('Date of Birth: ${tutor.dateOfBirth}'),
                Text('Interests: ${tutor.interests}'),
                Text('Education: ${tutor.education}'),
                Text('Experience: ${tutor.experience}'),
                Text('Profession: ${tutor.profession}'),
                Text('Instruction: ${tutor.instruction}'),
                Text('Language: ${tutor.language}'),
                SizedBox(height: 10),
                Text('About: ${tutor.about}'),
                SizedBox(height: 10),

                // Display Photo
                Center(
                  child: Image.network(
                    tutor.imageUrl,
                    height: 150,
                    width: 150,
                    fit: BoxFit.cover,
                  ),
                ),
                SizedBox(height: 10),

                // Display Video
                tutor.videoUrl.isNotEmpty
                    ? Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Introduction Video:',
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                    SizedBox(height: 5),
                    Center(
                      child: ElevatedButton.icon(
                        onPressed: () {
                          showDialog(
                            context: context,
                            builder: (context) {
                              return VideoPopup(videoUrl: tutor.videoUrl);
                            },
                          );
                        },
                        icon: Icon(Icons.play_circle_fill, color: Colors.white),
                        label: Text('Play Video'),
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.purple,
                          padding: EdgeInsets.symmetric(horizontal: 20, vertical: 12),
                          textStyle: TextStyle(fontSize: 16),
                        ),
                      ),
                    ),
                    SizedBox(height: 10),
                  ],
                )
                    : Container(),

                // Display Certificates
                tutor.certificates.isNotEmpty
                    ? Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Certificates:',
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                    SizedBox(height: 5),
                    Wrap(
                      spacing: 10,
                      runSpacing: 10,
                      children: tutor.certificates.map((cert) {
                        bool isImage = cert.url.toLowerCase().endsWith('.jpg') ||
                            cert.url.toLowerCase().endsWith('.png') ||
                            cert.url.toLowerCase().endsWith('.jpeg');
                        bool isPdf = cert.url.toLowerCase().endsWith('.pdf');
                        return Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            isImage
                                ? Image.network(
                              cert.url,
                              height: 100,
                              width: 100,
                              fit: BoxFit.cover,
                            )
                                : isPdf
                                ? GestureDetector(
                              onTap: () {
                                _openPDF(cert.url, cert.fileName);
                              },
                              child: Column(
                                children: [
                                  Icon(Icons.picture_as_pdf,
                                      color: Colors.red, size: 50),
                                  SizedBox(height: 5),
                                  Text(
                                    cert.fileName,
                                    style: TextStyle(
                                      color: Colors.blue,
                                      decoration: TextDecoration.underline,
                                    ),
                                  ),
                                ],
                              ),
                            )
                                : GestureDetector(
                              onTap: () {
                                _openPDF(cert.url, cert.fileName);
                              },
                              child: Column(
                                children: [
                                  Icon(Icons.description,
                                      color: Colors.grey, size: 50),
                                  SizedBox(height: 5),
                                  Text(
                                    cert.fileName,
                                    style: TextStyle(
                                      color: Colors.blue,
                                      decoration: TextDecoration.underline,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        );
                      }).toList(),
                    ),
                    SizedBox(height: 10),
                  ],
                )
                    : Container(),

                Divider(),
                Text(
                  'Verification Status:',
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
                SizedBox(height: 5),

                // Status Dropdown
                Row(
                  children: [
                    Text(
                      'Status:',
                      style: TextStyle(fontSize: 16.0),
                    ),
                    SizedBox(width: 20),
                    DropdownButton<String>(
                      value: tutor.status,
                      items: <String>['Unverified', 'Verified']
                          .map((String value) {
                        return DropdownMenuItem<String>(
                          value: value,
                          child: Text(value),
                        );
                      }).toList(),
                      onChanged: (String? newValue) {
                        if (newValue != null && newValue != tutor.status) {
                          _showStatusChangeDialog(index, newValue);
                        }
                      },
                    ),
                  ],
                ),
                SizedBox(height: 10),

                // Accept and Reject Buttons
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    ElevatedButton.icon(
                      onPressed: () {
                        _showConfirmationDialog(index, 'Accept');
                      },
                      icon: Icon(Icons.check, color: Colors.white),
                      label: Text('Accept'),
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.green,
                      ),
                    ),
                    ElevatedButton.icon(
                      onPressed: () {
                        _showConfirmationDialog(index, 'Reject');
                      },
                      icon: Icon(Icons.close, color: Colors.white),
                      label: Text('Reject'),
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.red,
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 10),
              ],
            ),
          ),
        ],
      ),
    );
  }

  /// Builds the main UI of the page.
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Verify Tutors'),
        backgroundColor: Colors.purple,
      ),
      body: _tutors.isEmpty
          ? Center(
        child: Text(
          'No tutors available.',
          style: TextStyle(fontSize: 18.0),
        ),
      )
          : ListView.builder(
        itemCount: _tutors.length,
        itemBuilder: (context, index) {
          return _buildTutorCard(index);
        },
      ),
    );
  }
}

/// Widget to display video in a popup.
/// Ensure you have this widget implemented correctly.
/// Below is a simple implementation for reference.
class VideoPopup extends StatelessWidget {
  final String videoUrl;

  VideoPopup({required this.videoUrl});

  @override
  Widget build(BuildContext context) {
    // Implement your video player here.
    // This is a placeholder implementation.
    return Dialog(
      child: Container(
        width: double.infinity,
        height: 300,
        child: Center(
          child: Text('Video Player for URL: $videoUrl'),
        ),
      ),
    );
  }
}

// import 'package:flutter/material.dart';
// import 'package:video_player/video_player.dart';
//
// void main() {
//   runApp(TutorDetailsContent());
// }
//
// class TutorDetailsContent extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       debugShowCheckedModeBanner: false,
//       home: TutorDetailsPage(),
//     );
//   }
// }
//
// class TutorDetailsPage extends StatefulWidget {
//   @override
//   _TutorDetailsPageState createState() => _TutorDetailsPageState();
// }
//
// class _TutorDetailsPageState extends State<TutorDetailsPage> {
//   // Dummy Data
//   final String tutorName = "Dinesh Adhikari";
//   final String address = "Kathmandu";
//   final String description = "Highly experienced tutor in Business English, IELTS, and SAT prep.";
//   final String educationDetails = "Master's in Computer Science from XYZ University.";
//   final List<String> languages = ["English", "Nepali"];
//   final List<String> specialties = ["Business English", "IELTS", "SAT", "Programming in Java"];
//   final String interests = "Passionate about teaching and making learning fun.";
//   final String teachingExperience = "5 years of experience.";
//
//   bool showRateButton = false;
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text('Tutor Details'),
//         leading: IconButton(
//           icon: Icon(Icons.arrow_back),
//           onPressed: () {
//             Navigator.pop(context);
//           },
//         ),
//       ),
//       body: SingleChildScrollView(
//         child: Padding(
//           padding: const EdgeInsets.all(16.0),
//           child: Column(
//             crossAxisAlignment: CrossAxisAlignment.center,
//             children: [
//               // Profile Photo
//               CircleAvatar(
//                 radius: 50,
//                 backgroundColor: Colors.grey[300],
//                 child: Icon(Icons.person, size: 50),
//               ),
//               SizedBox(height: 8),
//               // Name and Rating
//               Row(
//                 mainAxisAlignment: MainAxisAlignment.center,
//                 children: [
//                   Text(tutorName, style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
//                   SizedBox(width: 5),
//                   Icon(Icons.star, color: Colors.amber),
//                   Text('5'),
//                 ],
//               ),
//               SizedBox(height: 5),
//               // Address
//               Text(address, style: TextStyle(color: Colors.grey[600])),
//               SizedBox(height: 10),
//               // Buttons
//               ElevatedButton(
//                 onPressed: () {
//                   _showBookingDialog(context);
//                 },
//                 child: Text('Book Now'),
//               ),
//               Row(
//                 mainAxisAlignment: MainAxisAlignment.center,
//                 children: [
//                   IconButton(
//                     icon: Icon(Icons.report, color: Colors.blue),
//                     onPressed: () {
//                       _showReportDialog(context);
//                     },
//                   ),
//                   Text('Report'),
//                   SizedBox(width: 10),
//                   if (showRateButton)
//                     ElevatedButton(
//                       onPressed: () {
//                         _showRateDialog(context);
//                       },
//                       child: Text('Rate'),
//                     ),
//                   SizedBox(width: 10),
//                   IconButton(
//                     icon: Icon(Icons.comment, color: Colors.blue),
//                     onPressed: () {
//                       Navigator.push(context, MaterialPageRoute(builder: (context) => CommentPage()));
//                     },
//                   ),
//                   Text('Comments'),
//                 ],
//               ),
//               SizedBox(height: 15),
//               // Description
//               Text(description, style: TextStyle(fontSize: 16)),
//               SizedBox(height: 20),
//               // Video Section
//               Text('Video', style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
//               SizedBox(height: 10),
//               AspectRatio(
//                 aspectRatio: 16 / 9,
//                 child: VideoCard(),
//               ),
//               SizedBox(height: 20),
//               // Education Section
//               Text('Education', style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
//               SizedBox(height: 5),
//               Text(educationDetails),
//               SizedBox(height: 20),
//               // Languages Section
//               Text('Languages', style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
//               SizedBox(height: 5),
//               Wrap(
//                 spacing: 10,
//                 children: languages.map((language) => Chip(label: Text(language))).toList(),
//               ),
//               SizedBox(height: 20),
//               // Specialties Section
//               Text('Specialties', style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
//               SizedBox(height: 5),
//               Wrap(
//                 spacing: 10,
//                 children: specialties.map((specialty) => Chip(label: Text(specialty))).toList(),
//               ),
//               SizedBox(height: 20),
//               // Interests Section
//               Text('Interests', style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
//               SizedBox(height: 5),
//               Text(interests),
//               SizedBox(height: 20),
//               // Teaching Experience Section
//               Text('Teaching Experience', style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
//               SizedBox(height: 5),
//               Text(teachingExperience),
//             ],
//           ),
//         ),
//       ),
//     );
//   }
//
//   void _showBookingDialog(BuildContext context) {
//     showDialog(
//       context: context,
//       builder: (context) {
//         return AlertDialog(
//           title: Text('Are you sure you want to book?'),
//           actions: [
//             TextButton(
//               onPressed: () {
//                 Navigator.pop(context);
//               },
//               child: Text('Cancel'),
//             ),
//             ElevatedButton(
//               onPressed: () {
//                 setState(() {
//                   showRateButton = true;
//                 });
//                 Navigator.pop(context);
//               },
//               child: Text('Yes'),
//             ),
//           ],
//         );
//       },
//     );
//   }
//
//   void _showReportDialog(BuildContext context) {
//     showDialog(
//       context: context,
//       builder: (context) {
//         return AlertDialog(
//           title: Text('Report'),
//           content: TextField(
//             decoration: InputDecoration(
//               hintText: 'Enter your report here...',
//               border: OutlineInputBorder(),
//             ),
//             maxLines: 5,
//           ),
//           actions: [
//             TextButton(
//               onPressed: () {
//                 Navigator.pop(context);
//               },
//               child: Text('Cancel'),
//             ),
//             ElevatedButton(
//               onPressed: () {
//                 Navigator.pop(context);
//                 // Add report logic here
//               },
//               child: Text('Submit'),
//             ),
//           ],
//         );
//       },
//     );
//   }
//
//   void _showRateDialog(BuildContext context) {
//     showDialog(
//       context: context,
//       builder: (context) {
//         return AlertDialog(
//           title: Text('Rate this Tutor'),
//           content: Text('Rating functionality will be implemented here.'),
//           actions: [
//             TextButton(
//               onPressed: () {
//                 Navigator.pop(context);
//               },
//               child: Text('Cancel'),
//             ),
//           ],
//         );
//       },
//     );
//   }
// }
//
// class CommentPage extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text('Comments'),
//       ),
//       body: Center(
//         child: Text('Comments Page - Add Comment Functionality Here'),
//       ),
//     );
//   }
// }
//
// class VideoCard extends StatefulWidget {
//   @override
//   _VideoCardState createState() => _VideoCardState();
// }
//
// class _VideoCardState extends State<VideoCard> {
//   late VideoPlayerController _controller;
//
//   @override
//   void initState() {
//     super.initState();
//     _controller = VideoPlayerController.network(
//       'https://www.example.com/sample-video.mp4', // Replace with actual video URL
//     )..initialize().then((_) {
//       setState(() {});
//     });
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return Stack(
//       children: [
//         VideoPlayer(_controller),
//         Positioned(
//           bottom: 10,
//           left: 10,
//           child: Row(
//             children: [
//               IconButton(
//                 icon: Icon(Icons.replay_10),
//                 onPressed: () {
//                   _controller.seekTo(
//                     _controller.value.position - Duration(seconds: 10),
//                   );
//                 },
//               ),
//               IconButton(
//                 icon: Icon(
//                   _controller.value.isPlaying ? Icons.pause : Icons.play_arrow,
//                 ),
//                 onPressed: () {
//                   setState(() {
//                     _controller.value.isPlaying ? _controller.pause() : _controller.play();
//                   });
//                 },
//               ),
//               IconButton(
//                 icon: Icon(Icons.forward_10),
//                 onPressed: () {
//                   _controller.seekTo(
//                     _controller.value.position + Duration(seconds: 10),
//                   );
//                 },
//               ),
//             ],
//           ),
//         ),
//       ],
//     );
//   }
//
//   @override
//   void dispose() {
//     _controller.dispose();
//     super.dispose();
//   }
// }

// import 'package:flutter/material.dart';
// import 'package:video_player/video_player.dart';
//
// void main() {
//   runApp(TutorDetailsContent());
// }
//
// class TutorDetailsContent extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       title: 'Tutor Details',
//       debugShowCheckedModeBanner: false,
//       theme: ThemeData(
//         primarySwatch: Colors.indigo,
//         hintColor: Colors.deepOrange,
//         scaffoldBackgroundColor: Colors.grey[50],
//         textTheme: TextTheme(
//           titleLarge: TextStyle(fontSize: 20.0, fontWeight: FontWeight.bold, color: Colors.indigo[900]),
//           bodyMedium: TextStyle(fontSize: 16.0, color: Colors.grey[800]),
//           titleMedium: TextStyle(fontSize: 18.0, fontWeight: FontWeight.w600, color: Colors.indigo[800]),
//         ),
//         buttonTheme: ButtonThemeData(
//           buttonColor: Colors.indigo, // Background color
//           textTheme: ButtonTextTheme.primary, // Text color
//         ),
//       ),
//       home: TutorDetailsPage(),
//     );
//   }
// }
//
// class TutorDetailsPage extends StatefulWidget {
//   @override
//   _TutorDetailsPageState createState() => _TutorDetailsPageState();
// }
//
// class _TutorDetailsPageState extends State<TutorDetailsPage> {
//   // Dummy Data
//   final String tutorName = "Dinesh Adhikari";
//   final String address = "Kathmandu";
//   final String description =
//       "Highly experienced tutor in Business English, IELTS, and SAT prep. Passionate about helping students achieve their academic and professional goals.";
//   final String educationDetails = "Master's in Computer Science from XYZ University.";
//   final List<String> languages = ["English", "Nepali"];
//   final List<String> specialties = ["Business English", "IELTS", "SAT", "Programming in Java"];
//   final String interests = "Passionate about teaching and making learning fun.";
//   final String teachingExperience = "5 years of experience.";
//
//   bool showRateButton = false;
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text('Tutor Details'),
//         flexibleSpace: Container(
//           decoration: BoxDecoration(
//             gradient: LinearGradient(
//               colors: [Colors.indigo, Colors.deepPurple],
//               begin: Alignment.topLeft,
//               end: Alignment.bottomRight,
//             ),
//           ),
//         ),
//         leading: IconButton(
//           icon: Icon(Icons.arrow_back, color: Colors.white),
//           onPressed: () {
//             Navigator.pop(context);
//           },
//         ),
//       ),
//       body: SingleChildScrollView(
//         child: Padding(
//           padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 16.0),
//           child: Column(
//             crossAxisAlignment: CrossAxisAlignment.center,
//             children: [
//               // Profile Photo
//               CircleAvatar(
//                 radius: 60,
//                 backgroundImage: AssetImage('assets/profile_placeholder.png'), // Replace with actual image asset
//                 backgroundColor: Colors.transparent,
//               ),
//               SizedBox(height: 10),
//               // Name and Rating
//               Row(
//                 mainAxisAlignment: MainAxisAlignment.center,
//                 children: [
//                   Text(
//                     tutorName,
//                     style: Theme.of(context).textTheme.titleLarge,
//                   ),
//                   SizedBox(width: 8),
//                   Row(
//                     children: [
//                       Icon(Icons.star, color: Colors.amber, size: 20),
//                       SizedBox(width: 4),
//                       Text(
//                         '5.0',
//                         style: TextStyle(fontSize: 16, color: Colors.grey[800]),
//                       ),
//                     ],
//                   ),
//                 ],
//               ),
//               SizedBox(height: 4),
//               // Address
//               Text(
//                 address,
//                 style: TextStyle(color: Colors.grey[600], fontSize: 14),
//               ),
//               SizedBox(height: 20),
//               // Action Buttons
//               Row(
//                 mainAxisAlignment: MainAxisAlignment.spaceEvenly,
//                 children: [
//                   // Book Now Button with Gradient
//                   ElevatedButton(
//                     onPressed: () {
//                       _showBookingDialog(context);
//                     },
//                     style: ElevatedButton.styleFrom(
//                       foregroundColor: Colors.white, backgroundColor: Colors.indigo, padding: EdgeInsets.symmetric(horizontal: 20, vertical: 12),
//                       shape: RoundedRectangleBorder(
//                         borderRadius: BorderRadius.circular(30.0),
//                       ), // Button text color
//                       elevation: 5,
//                     ),
//                     child: Text('Book Now', style: TextStyle(fontSize: 16)),
//                   ),
//                   // Report Button
//                   IconButton(
//                     icon: Icon(Icons.report, color: Colors.deepOrange),
//                     onPressed: () {
//                       _showReportDialog(context);
//                     },
//                     tooltip: 'Report',
//                   ),
//                   // Rate Button (conditionally shown)
//                   if (showRateButton)
//                     ElevatedButton(
//                       onPressed: () {
//                         _showRateDialog(context);
//                       },
//                       style: ElevatedButton.styleFrom(
//                         backgroundColor: Colors.deepOrange,
//                         shape: RoundedRectangleBorder(
//                           borderRadius: BorderRadius.circular(20.0),
//                         ),
//                       ),
//                       child: Text('Rate', style: TextStyle(fontSize: 16)),
//                     ),
//                   // Comments Button
//                   IconButton(
//                     icon: Icon(Icons.comment, color: Colors.indigo),
//                     onPressed: () {
//                       Navigator.push(
//                         context,
//                         MaterialPageRoute(builder: (context) => CommentPage()),
//                       );
//                     },
//                     tooltip: 'Comments',
//                   ),
//                 ],
//               ),
//               SizedBox(height: 20),
//               // Description
//               Align(
//                 alignment: Alignment.centerLeft,
//                 child: Text(
//                   'About',
//                   style: Theme.of(context).textTheme.titleMedium,
//                 ),
//               ),
//               SizedBox(height: 5),
//               Text(
//                 description,
//                 style: Theme.of(context).textTheme.bodyMedium,
//                 textAlign: TextAlign.justify,
//               ),
//               SizedBox(height: 25),
//               // Video Section
//               Align(
//                 alignment: Alignment.centerLeft,
//                 child: Text(
//                   'Introduction Video',
//                   style: Theme.of(context).textTheme.titleMedium,
//                 ),
//               ),
//               SizedBox(height: 10),
//               AspectRatio(
//                 aspectRatio: 16 / 9,
//                 child: VideoCard(),
//               ),
//               SizedBox(height: 25),
//               // Education Section
//               Align(
//                 alignment: Alignment.centerLeft,
//                 child: Text(
//                   'Education',
//                   style: Theme.of(context).textTheme.titleMedium,
//                 ),
//               ),
//               SizedBox(height: 5),
//               Text(
//                 educationDetails,
//                 style: Theme.of(context).textTheme.bodyMedium,
//               ),
//               SizedBox(height: 25),
//               // Languages Section
//               Align(
//                 alignment: Alignment.centerLeft,
//                 child: Text(
//                   'Languages',
//                   style: Theme.of(context).textTheme.titleMedium,
//                 ),
//               ),
//               SizedBox(height: 5),
//               Wrap(
//                 spacing: 10,
//                 children: languages
//                     .map(
//                       (language) => Chip(
//                     label: Text(language),
//                     backgroundColor: Colors.indigo[50],
//                     avatar: Icon(Icons.language, size: 20, color: Colors.indigo),
//                   ),
//                 )
//                     .toList(),
//               ),
//               SizedBox(height: 25),
//               // Specialties Section
//               Align(
//                 alignment: Alignment.centerLeft,
//                 child: Text(
//                   'Specialties',
//                   style: Theme.of(context).textTheme.titleMedium,
//                 ),
//               ),
//               SizedBox(height: 5),
//               Wrap(
//                 spacing: 10,
//                 children: specialties
//                     .map(
//                       (specialty) => Chip(
//                     label: Text(specialty),
//                     backgroundColor: Colors.deepOrange[50],
//                     avatar: Icon(Icons.star, size: 20, color: Colors.deepOrange),
//                   ),
//                 )
//                     .toList(),
//               ),
//               SizedBox(height: 25),
//               // Interests Section
//               Align(
//                 alignment: Alignment.centerLeft,
//                 child: Text(
//                   'Interests',
//                   style: Theme.of(context).textTheme.titleMedium,
//                 ),
//               ),
//               SizedBox(height: 5),
//               Text(
//                 interests,
//                 style: Theme.of(context).textTheme.bodyMedium,
//               ),
//               SizedBox(height: 25),
//               // Teaching Experience Section
//               Align(
//                 alignment: Alignment.centerLeft,
//                 child: Text(
//                   'Teaching Experience',
//                   style: Theme.of(context).textTheme.titleMedium,
//                 ),
//               ),
//               SizedBox(height: 5),
//               Text(
//                 teachingExperience,
//                 style: Theme.of(context).textTheme.bodyMedium,
//               ),
//               SizedBox(height: 30),
//             ],
//           ),
//         ),
//       ),
//     );
//   }
//
//   void _showBookingDialog(BuildContext context) {
//     showDialog(
//       context: context,
//       builder: (context) {
//         return AlertDialog(
//           title: Text('Confirm Booking'),
//           content: Text('Are you sure you want to book this tutor?'),
//           actions: [
//             TextButton(
//               onPressed: () {
//                 Navigator.pop(context);
//               },
//               child: Text('Cancel', style: TextStyle(color: Colors.grey[700])),
//             ),
//             ElevatedButton(
//               onPressed: () {
//                 setState(() {
//                   showRateButton = true;
//                 });
//                 Navigator.pop(context);
//                 ScaffoldMessenger.of(context).showSnackBar(
//                   SnackBar(content: Text('Booking Confirmed!')),
//                 );
//               },
//               style: ElevatedButton.styleFrom(backgroundColor: Colors.indigo),
//               child: Text('Yes'),
//             ),
//           ],
//         );
//       },
//     );
//   }
//
//   void _showReportDialog(BuildContext context) {
//     TextEditingController reportController = TextEditingController();
//
//     showDialog(
//       context: context,
//       builder: (context) {
//         return AlertDialog(
//           title: Text('Report Tutor'),
//           content: TextField(
//             controller: reportController,
//             decoration: InputDecoration(
//               hintText: 'Enter your report here...',
//               border: OutlineInputBorder(),
//             ),
//             maxLines: 5,
//           ),
//           actions: [
//             TextButton(
//               onPressed: () {
//                 Navigator.pop(context);
//               },
//               child: Text('Cancel', style: TextStyle(color: Colors.grey[700])),
//             ),
//             ElevatedButton(
//               onPressed: () {
//                 // Implement report submission logic here
//                 Navigator.pop(context);
//                 ScaffoldMessenger.of(context).showSnackBar(
//                   SnackBar(content: Text('Report Submitted')),
//                 );
//               },
//               style: ElevatedButton.styleFrom(backgroundColor: Colors.deepOrange),
//               child: Text('Submit'),
//             ),
//           ],
//         );
//       },
//     );
//   }
//
//   void _showRateDialog(BuildContext context) {
//     double _currentRating = 5.0;
//
//     showDialog(
//       context: context,
//       builder: (context) {
//         return AlertDialog(
//           title: Text('Rate this Tutor'),
//           content: Column(
//             mainAxisSize: MainAxisSize.min,
//             children: [
//               Text('Please provide your rating below:'),
//               SizedBox(height: 20),
//               StatefulBuilder(
//                 builder: (context, setState) {
//                   return Slider(
//                     value: _currentRating,
//                     min: 1,
//                     max: 5,
//                     divisions: 4,
//                     label: _currentRating.round().toString(),
//                     onChanged: (double value) {
//                       setState(() {
//                         _currentRating = value;
//                       });
//                     },
//                     activeColor: Colors.indigo,
//                     inactiveColor: Colors.indigo[100],
//                   );
//                 },
//               ),
//             ],
//           ),
//           actions: [
//             TextButton(
//               onPressed: () {
//                 Navigator.pop(context);
//               },
//               child: Text('Cancel', style: TextStyle(color: Colors.grey[700])),
//             ),
//             ElevatedButton(
//               onPressed: () {
//                 // Implement rating submission logic here
//                 Navigator.pop(context);
//                 ScaffoldMessenger.of(context).showSnackBar(
//                   SnackBar(content: Text('Thank you for your rating!')),
//                 );
//               },
//               style: ElevatedButton.styleFrom(backgroundColor: Colors.indigo),
//               child: Text('Submit'),
//             ),
//           ],
//         );
//       },
//     );
//   }
// }
//
// class CommentPage extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     // Dummy comments data
//     final List<String> comments = [
//       "Great tutor! Helped me improve my English significantly.",
//       "Very patient and knowledgeable.",
//       "Highly recommended for IELTS preparation.",
//     ];
//
//     return Scaffold(
//       appBar: AppBar(
//         title: Text('Comments'),
//         flexibleSpace: Container(
//           decoration: BoxDecoration(
//             gradient: LinearGradient(
//               colors: [Colors.indigo, Colors.deepPurple],
//               begin: Alignment.topLeft,
//               end: Alignment.bottomRight,
//             ),
//           ),
//         ),
//       ),
//       body: Padding(
//         padding: const EdgeInsets.all(16.0),
//         child: Column(
//           children: [
//             // Existing Comments
//             Expanded(
//               child: ListView.builder(
//                 itemCount: comments.length,
//                 itemBuilder: (context, index) {
//                   return Card(
//                     elevation: 2,
//                     margin: EdgeInsets.symmetric(vertical: 8),
//                     child: ListTile(
//                       leading: CircleAvatar(
//                         backgroundColor: Colors.indigo,
//                         child: Icon(Icons.person, color: Colors.white),
//                       ),
//                       title: Text('User ${index + 1}'),
//                       subtitle: Text(comments[index]),
//                     ),
//                   );
//                 },
//               ),
//             ),
//             // Add Comment Field
//             TextField(
//               decoration: InputDecoration(
//                 hintText: 'Add a comment...',
//                 prefixIcon: Icon(Icons.comment),
//                 border: OutlineInputBorder(
//                   borderRadius: BorderRadius.circular(30.0),
//                 ),
//               ),
//               maxLines: 2,
//             ),
//             SizedBox(height: 10),
//             ElevatedButton.icon(
//               onPressed: () {
//                 // Implement add comment functionality
//                 ScaffoldMessenger.of(context).showSnackBar(
//                   SnackBar(content: Text('Comment Added')),
//                 );
//               },
//               icon: Icon(Icons.send),
//               label: Text('Submit'),
//               style: ElevatedButton.styleFrom(
//                 backgroundColor: Colors.indigo,
//                 shape: RoundedRectangleBorder(
//                   borderRadius: BorderRadius.circular(30.0),
//                 ),
//                 padding: EdgeInsets.symmetric(horizontal: 20, vertical: 12),
//               ),
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }
//
// class VideoCard extends StatefulWidget {
//   @override
//   _VideoCardState createState() => _VideoCardState();
// }
//
// class _VideoCardState extends State<VideoCard> {
//   late VideoPlayerController _controller;
//   bool _isControlsVisible = true;
//
//   @override
//   void initState() {
//     super.initState();
//     _controller = VideoPlayerController.network(
//       'https://www.example.com/sample-video.mp4', // Replace with actual video URL
//     )
//       ..initialize().then((_) {
//         setState(() {});
//       })
//       ..setLooping(false);
//   }
//
//   void _toggleControls() {
//     setState(() {
//       _isControlsVisible = !_isControlsVisible;
//     });
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return GestureDetector(
//       onTap: _toggleControls,
//       child: Stack(
//         children: [
//           // Video Player
//           _controller.value.isInitialized
//               ? AspectRatio(
//             aspectRatio: _controller.value.aspectRatio,
//             child: VideoPlayer(_controller),
//           )
//               : Center(child: CircularProgressIndicator()),
//           // Play/Pause Overlay
//           if (_isControlsVisible)
//             Positioned.fill(
//               child: Container(
//                 color: Colors.black45,
//                 child: Center(
//                   child: IconButton(
//                     icon: Icon(
//                       _controller.value.isPlaying ? Icons.pause_circle_filled : Icons.play_circle_filled,
//                       color: Colors.white,
//                       size: 60,
//                     ),
//                     onPressed: () {
//                       setState(() {
//                         _controller.value.isPlaying ? _controller.pause() : _controller.play();
//                       });
//                     },
//                   ),
//                 ),
//               ),
//             ),
//           // Video Controls
//           if (_isControlsVisible)
//             Positioned(
//               bottom: 10,
//               left: 10,
//               right: 10,
//               child: Row(
//                 mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                 children: [
//                   // Rewind 10 Seconds
//                   IconButton(
//                     icon: Icon(Icons.replay_10, color: Colors.white),
//                     onPressed: () {
//                       final newPosition = _controller.value.position - Duration(seconds: 10);
//                       _controller.seekTo(newPosition >= Duration.zero ? newPosition : Duration.zero);
//                     },
//                   ),
//                   // Play/Pause Button
//                   IconButton(
//                     icon: Icon(
//                       _controller.value.isPlaying ? Icons.pause : Icons.play_arrow,
//                       color: Colors.white,
//                       size: 30,
//                     ),
//                     onPressed: () {
//                       setState(() {
//                         _controller.value.isPlaying ? _controller.pause() : _controller.play();
//                       });
//                     },
//                   ),
//                   // Forward 10 Seconds
//                   IconButton(
//                     icon: Icon(Icons.forward_10, color: Colors.white),
//                     onPressed: () {
//                       final newPosition = _controller.value.position + Duration(seconds: 10);
//                       _controller.seekTo(newPosition <= _controller.value.duration ? newPosition : _controller.value.duration);
//                     },
//                   ),
//                 ],
//               ),
//             ),
//         ],
//       ),
//     );
//   }
//
//   @override
//   void dispose() {
//     _controller.dispose();
//     super.dispose();
//   }
// }


// import 'package:flutter/material.dart';
// import 'package:video_player/video_player.dart';
//
// void main() {
//   runApp(TutorDetailsContent());
// }
//
// class TutorDetailsContent extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       title: 'Tutor Details',
//       debugShowCheckedModeBanner: false,
//       theme: ThemeData(
//         primarySwatch: Colors.blue, // Changed primary color to blue
//         hintColor: Colors.deepOrange,
//         scaffoldBackgroundColor: Colors.grey[50],
//         textTheme: TextTheme(
//           titleLarge: TextStyle(fontSize: 20.0, fontWeight: FontWeight.bold, color: Colors.blue[800]), // Changed to blue
//           bodyMedium: TextStyle(fontSize: 16.0, color: Colors.grey[800]),
//           titleMedium: TextStyle(fontSize: 18.0, fontWeight: FontWeight.w600, color: Colors.blue[700]), // Changed to blue
//         ),
//         buttonTheme: ButtonThemeData(
//           buttonColor: Colors.blue, // Changed button color to blue
//           textTheme: ButtonTextTheme.primary,
//         ),
//       ),
//       home: TutorDetailsPage(),
//     );
//   }
// }
//
// class TutorDetailsPage extends StatefulWidget {
//   @override
//   _TutorDetailsPageState createState() => _TutorDetailsPageState();
// }
//
// class _TutorDetailsPageState extends State<TutorDetailsPage> {
//   // Dummy Data
//   final String tutorName = "Dinesh Adhikari";
//   final String address = "Kathmandu";
//   final String description =
//       "Highly experienced tutor in Business English, IELTS, and SAT prep. Passionate about helping students achieve their academic and professional goals.";
//   final String educationDetails = "Master's in Computer Science from XYZ University.";
//   final List<String> languages = ["English", "Nepali"];
//   final List<String> specialties = ["Business English", "IELTS", "SAT", "Programming in Java"];
//   final String interests = "Passionate about teaching and making learning fun.";
//   final String teachingExperience = "5 years of experience.";
//
//   bool showRateButton = false;
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         backgroundColor: Colors.white, // Set AppBar background to white
//         title: Text(
//           'Tutor Details',
//           style: TextStyle(color: Colors.blue), // Set title color to blue
//         ),
//         centerTitle: true,
//         leading: IconButton(
//           icon: Icon(Icons.arrow_back, color: Colors.blue), // Set back button color to blue
//           onPressed: () {
//             Navigator.pop(context);
//           },
//         ),
//         elevation: 1, // Optional: Add slight shadow for better visibility
//       ),
//       body: SingleChildScrollView(
//         child: Padding(
//           padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 16.0),
//           child: Column(
//             crossAxisAlignment: CrossAxisAlignment.center,
//             children: [
//               // Profile Photo
//               CircleAvatar(
//                 radius: 60,
//                 backgroundImage: AssetImage('assets/profile_placeholder.png'), // Replace with actual image asset
//                 backgroundColor: Colors.transparent,
//               ),
//               SizedBox(height: 10),
//               // Name and Rating
//               Row(
//                 mainAxisAlignment: MainAxisAlignment.center,
//                 children: [
//                   Text(
//                     tutorName,
//                     style: Theme.of(context).textTheme.titleLarge,
//                   ),
//                   SizedBox(width: 8),
//                   Row(
//                     children: [
//                       Icon(Icons.star, color: Colors.amber, size: 20),
//                       SizedBox(width: 4),
//                       Text(
//                         '5.0',
//                         style: TextStyle(fontSize: 16, color: Colors.grey[800]),
//                       ),
//                     ],
//                   ),
//                 ],
//               ),
//               SizedBox(height: 4),
//               // Address
//               Text(
//                 address,
//                 style: TextStyle(color: Colors.grey[600], fontSize: 14),
//               ),
//               SizedBox(height: 20),
//               // "Book Now" Button Positioned Above Other Buttons
//               SizedBox(
//                 width: double.infinity,
//                 child: ElevatedButton(
//                   onPressed: () {
//                     _showBookingDialog(context);
//                   },
//                   style: ElevatedButton.styleFrom(
//                     foregroundColor: Colors.white,
//                     backgroundColor: Colors.blue, // Blue button
//                     padding: EdgeInsets.symmetric(horizontal: 20, vertical: 12),
//                     shape: RoundedRectangleBorder(
//                       borderRadius: BorderRadius.circular(30.0),
//                     ),
//                     elevation: 5,
//                   ),
//                   child: Text('Book Now', style: TextStyle(fontSize: 16)),
//                 ),
//               ),
//               SizedBox(height: 20),
//               // Action Buttons: Report, Rate, Comment with Consistent Spacing
//               Row(
//                 mainAxisAlignment: MainAxisAlignment.spaceEvenly,
//                 children: [
//                   // Report Button
//                   IconButton(
//                     icon: Icon(Icons.report, color: Colors.deepOrange),
//                     onPressed: () {
//                       _showReportDialog(context);
//                     },
//                     tooltip: 'Report',
//                   ),
//                   // Rate Button (conditionally shown)
//                   if (showRateButton)
//                     IconButton(
//                       icon: Icon(Icons.rate_review, color: Colors.blue),
//                       onPressed: () {
//                         _showRateDialog(context);
//                       },
//                       tooltip: 'Rate',
//                     ),
//                   // Comments Button
//                   IconButton(
//                     icon: Icon(Icons.comment, color: Colors.blue),
//                     onPressed: () {
//                       Navigator.push(
//                         context,
//                         MaterialPageRoute(builder: (context) => CommentPage()),
//                       );
//                     },
//                     tooltip: 'Comments',
//                   ),
//                 ],
//               ),
//               SizedBox(height: 20),
//               // Description
//               Align(
//                 alignment: Alignment.centerLeft,
//                 child: Text(
//                   'About',
//                   style: Theme.of(context).textTheme.titleMedium,
//                 ),
//               ),
//               SizedBox(height: 5),
//               Text(
//                 description,
//                 style: Theme.of(context).textTheme.bodyMedium,
//                 textAlign: TextAlign.justify,
//               ),
//               SizedBox(height: 25),
//               // Video Section
//               Align(
//                 alignment: Alignment.centerLeft,
//                 child: Text(
//                   'Introduction Video',
//                   style: Theme.of(context).textTheme.titleMedium,
//                 ),
//               ),
//               SizedBox(height: 10),
//               AspectRatio(
//                 aspectRatio: 16 / 9,
//                 child: VideoCard(),
//               ),
//               SizedBox(height: 25),
//               // Education Section
//               Align(
//                 alignment: Alignment.centerLeft,
//                 child: Text(
//                   'Education',
//                   style: Theme.of(context).textTheme.titleMedium,
//                 ),
//               ),
//               SizedBox(height: 5),
//               Text(
//                 educationDetails,
//                 style: Theme.of(context).textTheme.bodyMedium,
//               ),
//               SizedBox(height: 25),
//               // Languages Section
//               Align(
//                 alignment: Alignment.centerLeft,
//                 child: Text(
//                   'Languages',
//                   style: Theme.of(context).textTheme.titleMedium,
//                 ),
//               ),
//               SizedBox(height: 5),
//               Wrap(
//                 spacing: 10,
//                 children: languages
//                     .map(
//                       (language) => Chip(
//                     label: Text(language),
//                     backgroundColor: Colors.blue[50],
//                     avatar: Icon(Icons.language, size: 20, color: Colors.blue),
//                   ),
//                 )
//                     .toList(),
//               ),
//               SizedBox(height: 25),
//               // Specialties Section
//               Align(
//                 alignment: Alignment.centerLeft,
//                 child: Text(
//                   'Specialties',
//                   style: Theme.of(context).textTheme.titleMedium,
//                 ),
//               ),
//               SizedBox(height: 5),
//               Wrap(
//                 spacing: 10,
//                 children: specialties
//                     .map(
//                       (specialty) => Chip(
//                     label: Text(specialty),
//                     backgroundColor: Colors.blue[50],
//                     avatar: Icon(Icons.star, size: 20, color: Colors.blue),
//                   ),
//                 )
//                     .toList(),
//               ),
//               SizedBox(height: 25),
//               // Interests Section
//               Align(
//                 alignment: Alignment.centerLeft,
//                 child: Text(
//                   'Interests',
//                   style: Theme.of(context).textTheme.titleMedium,
//                 ),
//               ),
//               SizedBox(height: 5),
//               Text(
//                 interests,
//                 style: Theme.of(context).textTheme.bodyMedium,
//               ),
//               SizedBox(height: 25),
//               // Teaching Experience Section
//               Align(
//                 alignment: Alignment.centerLeft,
//                 child: Text(
//                   'Teaching Experience',
//                   style: Theme.of(context).textTheme.titleMedium,
//                 ),
//               ),
//               SizedBox(height: 5),
//               Text(
//                 teachingExperience,
//                 style: Theme.of(context).textTheme.bodyMedium,
//               ),
//               SizedBox(height: 30),
//             ],
//           ),
//         ),
//       ),
//     );
//   }
//
//   void _showBookingDialog(BuildContext context) {
//     showDialog(
//       context: context,
//       builder: (context) {
//         return AlertDialog(
//           title: Text('Confirm Booking'),
//           content: Text('Are you sure you want to book this tutor?'),
//           actions: [
//             TextButton(
//               onPressed: () {
//                 Navigator.pop(context);
//               },
//               child: Text('Cancel', style: TextStyle(color: Colors.grey[700])),
//             ),
//             ElevatedButton(
//               onPressed: () {
//                 setState(() {
//                   showRateButton = true; // Show Rate button after booking
//                 });
//                 Navigator.pop(context);
//                 ScaffoldMessenger.of(context).showSnackBar(
//                   SnackBar(content: Text('Booking Confirmed!')),
//                 );
//               },
//               style: ElevatedButton.styleFrom(backgroundColor: Colors.blue), // Blue confirmation button
//               child: Text('Yes'),
//             ),
//           ],
//         );
//       },
//     );
//   }
//
//   void _showReportDialog(BuildContext context) {
//     TextEditingController reportController = TextEditingController();
//
//     showDialog(
//       context: context,
//       builder: (context) {
//         return AlertDialog(
//           title: Text('Report Tutor'),
//           content: TextField(
//             controller: reportController,
//             decoration: InputDecoration(
//               hintText: 'Enter your report here...',
//               border: OutlineInputBorder(),
//             ),
//             maxLines: 5,
//           ),
//           actions: [
//             TextButton(
//               onPressed: () {
//                 Navigator.pop(context);
//               },
//               child: Text('Cancel', style: TextStyle(color: Colors.grey[700])),
//             ),
//             ElevatedButton(
//               onPressed: () {
//                 // Implement report submission logic here
//                 Navigator.pop(context);
//                 ScaffoldMessenger.of(context).showSnackBar(
//                   SnackBar(content: Text('Report Submitted')),
//                 );
//               },
//               style: ElevatedButton.styleFrom(backgroundColor: Colors.deepOrange),
//               child: Text('Submit'),
//             ),
//           ],
//         );
//       },
//     );
//   }
//
//   void _showRateDialog(BuildContext context) {
//     double _currentRating = 5.0;
//
//     showDialog(
//       context: context,
//       builder: (context) {
//         return AlertDialog(
//           title: Text('Rate this Tutor'),
//           content: Column(
//             mainAxisSize: MainAxisSize.min,
//             children: [
//               Text('Please provide your rating below:'),
//               SizedBox(height: 20),
//               StatefulBuilder(
//                 builder: (context, setState) {
//                   return Slider(
//                     value: _currentRating,
//                     min: 1,
//                     max: 5,
//                     divisions: 4,
//                     label: _currentRating.round().toString(),
//                     onChanged: (double value) {
//                       setState(() {
//                         _currentRating = value;
//                       });
//                     },
//                     activeColor: Colors.blue, // Changed slider active color to blue
//                     inactiveColor: Colors.blue[100],
//                   );
//                 },
//               ),
//             ],
//           ),
//           actions: [
//             TextButton(
//               onPressed: () {
//                 Navigator.pop(context);
//               },
//               child: Text('Cancel', style: TextStyle(color: Colors.grey[700])),
//             ),
//             ElevatedButton(
//               onPressed: () {
//                 // Implement rating submission logic here
//                 Navigator.pop(context);
//                 ScaffoldMessenger.of(context).showSnackBar(
//                   SnackBar(content: Text('Thank you for your rating!')),
//                 );
//               },
//               style: ElevatedButton.styleFrom(backgroundColor: Colors.blue),
//               child: Text('Submit'),
//             ),
//           ],
//         );
//       },
//     );
//   }
// }
//
// class CommentPage extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     // Dummy comments data
//     final List<String> comments = [
//       "Great tutor! Helped me improve my English significantly.",
//       "Very patient and knowledgeable.",
//       "Highly recommended for IELTS preparation.",
//     ];
//
//     return Scaffold(
//       appBar: AppBar(
//         backgroundColor: Colors.white, // Set AppBar background to white
//         title: Text(
//           'Comments',
//           style: TextStyle(color: Colors.blue), // Set title color to blue
//         ),
//         centerTitle: true,
//         leading: IconButton(
//           icon: Icon(Icons.arrow_back, color: Colors.blue), // Set back button color to blue
//           onPressed: () {
//             Navigator.pop(context);
//           },
//         ),
//         elevation: 1, // Optional: Add slight shadow for better visibility
//       ),
//       body: Padding(
//         padding: const EdgeInsets.all(16.0),
//         child: Column(
//           children: [
//             // Existing Comments
//             Expanded(
//               child: ListView.builder(
//                 itemCount: comments.length,
//                 itemBuilder: (context, index) {
//                   return Card(
//                     elevation: 2,
//                     margin: EdgeInsets.symmetric(vertical: 8),
//                     child: ListTile(
//                       leading: CircleAvatar(
//                         backgroundColor: Colors.blue, // Changed avatar color to blue
//                         child: Icon(Icons.person, color: Colors.white),
//                       ),
//                       title: Text('User ${index + 1}'),
//                       subtitle: Text(comments[index]),
//                     ),
//                   );
//                 },
//               ),
//             ),
//             // Add Comment Field
//             TextField(
//               decoration: InputDecoration(
//                 hintText: 'Add a comment...',
//                 prefixIcon: Icon(Icons.comment, color: Colors.blue), // Blue icon
//                 border: OutlineInputBorder(
//                   borderRadius: BorderRadius.circular(30.0),
//                 ),
//               ),
//               maxLines: 2,
//             ),
//             SizedBox(height: 10),
//             ElevatedButton.icon(
//               onPressed: () {
//                 // Implement add comment functionality
//                 ScaffoldMessenger.of(context).showSnackBar(
//                   SnackBar(content: Text('Comment Added')),
//                 );
//               },
//               icon: Icon(Icons.send),
//               label: Text('Submit'),
//               style: ElevatedButton.styleFrom(
//                 backgroundColor: Colors.blue, // Blue button
//                 shape: RoundedRectangleBorder(
//                   borderRadius: BorderRadius.circular(30.0),
//                 ),
//                 padding: EdgeInsets.symmetric(horizontal: 20, vertical: 12),
//               ),
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }
//
// class VideoCard extends StatefulWidget {
//   @override
//   _VideoCardState createState() => _VideoCardState();
// }
//
// class _VideoCardState extends State<VideoCard> {
//   late VideoPlayerController _controller;
//   bool _isControlsVisible = true;
//
//   @override
//   void initState() {
//     super.initState();
//     _controller = VideoPlayerController.network(
//       'https://www.example.com/sample-video.mp4', // Replace with actual video URL
//     )
//       ..initialize().then((_) {
//         setState(() {});
//       })
//       ..setLooping(false);
//   }
//
//   void _toggleControls() {
//     setState(() {
//       _isControlsVisible = !_isControlsVisible;
//     });
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return GestureDetector(
//       onTap: _toggleControls,
//       child: Stack(
//         children: [
//           // Video Player
//           _controller.value.isInitialized
//               ? AspectRatio(
//             aspectRatio: _controller.value.aspectRatio,
//             child: VideoPlayer(_controller),
//           )
//               : Center(child: CircularProgressIndicator()),
//           // Play/Pause Overlay
//           if (_isControlsVisible)
//             Positioned.fill(
//               child: Container(
//                 color: Colors.black45,
//                 child: Center(
//                   child: IconButton(
//                     icon: Icon(
//                       _controller.value.isPlaying ? Icons.pause_circle_filled : Icons.play_circle_filled,
//                       color: Colors.white,
//                       size: 60,
//                     ),
//                     onPressed: () {
//                       setState(() {
//                         _controller.value.isPlaying ? _controller.pause() : _controller.play();
//                       });
//                     },
//                   ),
//                 ),
//               ),
//             ),
//           // Video Controls
//           if (_isControlsVisible)
//             Positioned(
//               bottom: 10,
//               left: 10,
//               right: 10,
//               child: Row(
//                 mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                 children: [
//                   // Rewind 10 Seconds
//                   IconButton(
//                     icon: Icon(Icons.replay_10, color: Colors.white),
//                     onPressed: () {
//                       final newPosition = _controller.value.position - Duration(seconds: 10);
//                       _controller.seekTo(newPosition >= Duration.zero ? newPosition : Duration.zero);
//                     },
//                   ),
//                   // Play/Pause Button
//                   IconButton(
//                     icon: Icon(
//                       _controller.value.isPlaying ? Icons.pause : Icons.play_arrow,
//                       color: Colors.white,
//                       size: 30,
//                     ),
//                     onPressed: () {
//                       setState(() {
//                         _controller.value.isPlaying ? _controller.pause() : _controller.play();
//                       });
//                     },
//                   ),
//                   // Forward 10 Seconds
//                   IconButton(
//                     icon: Icon(Icons.forward_10, color: Colors.white),
//                     onPressed: () {
//                       final newPosition = _controller.value.position + Duration(seconds: 10);
//                       _controller.seekTo(newPosition <= _controller.value.duration ? newPosition : _controller.value.duration);
//                     },
//                   ),
//                 ],
//               ),
//             ),
//         ],
//       ),
//     );
//   }
//
//   @override
//   void dispose() {
//     _controller.dispose();
//     super.dispose();
//   }
// }

// import 'package:flutter/material.dart';
// import 'package:video_player/video_player.dart';
//
// void main() {
//   runApp(TutorDetailsContent());
// }
//
// class TutorDetailsContent extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       title: 'Tutor Details',
//       debugShowCheckedModeBanner: false,
//       theme: ThemeData(
//         primarySwatch: Colors.blue, // Changed primary color to blue
//         hintColor: Colors.deepOrange,
//         scaffoldBackgroundColor: Colors.grey[50],
//         textTheme: TextTheme(
//           titleLarge: TextStyle(
//               fontSize: 20.0,
//               fontWeight: FontWeight.bold,
//               color: Colors.blue[800]), // Changed to blue
//           bodyMedium: TextStyle(fontSize: 16.0, color: Colors.grey[800]),
//           titleMedium: TextStyle(
//               fontSize: 18.0,
//               fontWeight: FontWeight.w600,
//               color: Colors.blue[700]), // Changed to blue
//         ),
//         buttonTheme: ButtonThemeData(
//           buttonColor: Colors.blue, // Changed button color to blue
//           textTheme: ButtonTextTheme.primary,
//         ),
//       ),
//       home: TutorDetailsPage(),
//     );
//   }
// }
//
// class TutorDetailsPage extends StatefulWidget {
//   @override
//   _TutorDetailsPageState createState() => _TutorDetailsPageState();
// }
//
// class _TutorDetailsPageState extends State<TutorDetailsPage> {
//   // Dummy Data
//   final String tutorName = "Dinesh Adhikari";
//   final String address = "Kathmandu";
//   final String description =
//       "Highly experienced tutor in Business English, IELTS, and SAT prep. Passionate about helping students achieve their academic and professional goals.";
//   final String educationDetails =
//       "Master's in Computer Science from XYZ University.";
//   final List<String> languages = ["English", "Nepali"];
//   final List<String> specialties = [
//     "Business English",
//     "IELTS",
//     "SAT",
//     "Programming in Java"
//   ];
//   final String interests = "Passionate about teaching and making learning fun.";
//   final String teachingExperience = "5 years of experience.";
//
//   bool showRateButton = false;
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         backgroundColor: Colors.white, // Set AppBar background to white
//         title: Text(
//           'Tutor Details',
//           style: TextStyle(color: Colors.blue), // Set title color to blue
//         ),
//         centerTitle: true,
//         leading: IconButton(
//           icon: Icon(Icons.arrow_back, color: Colors.blue), // Set back button color to blue
//           onPressed: () {
//             Navigator.pop(context);
//           },
//         ),
//         elevation: 1, // Optional: Add slight shadow for better visibility
//       ),
//       body: SingleChildScrollView(
//         child: Padding(
//           padding:
//           const EdgeInsets.symmetric(horizontal: 20.0, vertical: 16.0),
//           child: Column(
//             crossAxisAlignment: CrossAxisAlignment.center,
//             children: [
//               // Profile Photo
//               CircleAvatar(
//                 radius: 60,
//                 backgroundImage:
//                 AssetImage('assets/profile_placeholder.png'), // Replace with actual image asset
//                 backgroundColor: Colors.transparent,
//               ),
//               SizedBox(height: 10),
//               // Name and Rating
//               Row(
//                 mainAxisAlignment: MainAxisAlignment.center,
//                 children: [
//                   Text(
//                     tutorName,
//                     style: Theme.of(context).textTheme.titleLarge,
//                   ),
//                   SizedBox(width: 8),
//                   Row(
//                     children: [
//                       Icon(Icons.star, color: Colors.amber, size: 20),
//                       SizedBox(width: 4),
//                       Text(
//                         '5.0',
//                         style:
//                         TextStyle(fontSize: 16, color: Colors.grey[800]),
//                       ),
//                     ],
//                   ),
//                 ],
//               ),
//               SizedBox(height: 4),
//               // Address
//               Text(
//                 address,
//                 style: TextStyle(color: Colors.grey[600], fontSize: 14),
//               ),
//               SizedBox(height: 20),
//               // "Book Now" Button Positioned Above Other Buttons
//               SizedBox(
//                 width: double.infinity,
//                 child: ElevatedButton(
//                   onPressed: () {
//                     _showBookingDialog(context);
//                   },
//                   style: ElevatedButton.styleFrom(
//                     foregroundColor: Colors.white,
//                     backgroundColor: Colors.blue, // Blue button
//                     padding:
//                     EdgeInsets.symmetric(horizontal: 20, vertical: 12),
//                     shape: RoundedRectangleBorder(
//                       borderRadius: BorderRadius.circular(30.0),
//                     ),
//                     elevation: 5,
//                   ),
//                   child: Text('Book Now', style: TextStyle(fontSize: 16)),
//                 ),
//               ),
//               SizedBox(height: 20),
//               // Action Buttons: Report, Rate, Comment with Labels and Consistent Spacing
//               Row(
//                 mainAxisAlignment: MainAxisAlignment.spaceEvenly,
//                 children: [
//                   // Report Button with Label
//                   Column(
//                     children: [
//                       IconButton(
//                         icon: Icon(Icons.report, color: Colors.deepOrange),
//                         onPressed: () {
//                           _showReportDialog(context);
//                         },
//                       ),
//                       Text(
//                         'Report',
//                         style: TextStyle(
//                           color: Colors.deepOrange,
//                           fontSize: 12,
//                         ),
//                       ),
//                     ],
//                   ),
//                   // Rate Button with Label (conditionally shown)
//                   if (showRateButton)
//                     Column(
//                       children: [
//                         IconButton(
//                           icon: Icon(Icons.rate_review, color: Colors.blue),
//                           onPressed: () {
//                             _showRateDialog(context);
//                           },
//                         ),
//                         Text(
//                           'Rate',
//                           style: TextStyle(
//                             color: Colors.blue,
//                             fontSize: 12,
//                           ),
//                         ),
//                       ],
//                     ),
//                   // Comment Button with Label
//                   Column(
//                     children: [
//                       IconButton(
//                         icon: Icon(Icons.comment, color: Colors.blue),
//                         onPressed: () {
//                           Navigator.push(
//                             context,
//                             MaterialPageRoute(
//                                 builder: (context) => CommentPage()),
//                           );
//                         },
//                       ),
//                       Text(
//                         'Comment',
//                         style: TextStyle(
//                           color: Colors.blue,
//                           fontSize: 12,
//                         ),
//                       ),
//                     ],
//                   ),
//                 ],
//               ),
//               SizedBox(height: 20),
//               // Description
//               Align(
//                 alignment: Alignment.centerLeft,
//                 child: Text(
//                   'About',
//                   style: Theme.of(context).textTheme.titleMedium,
//                 ),
//               ),
//               SizedBox(height: 5),
//               Text(
//                 description,
//                 style: Theme.of(context).textTheme.bodyMedium,
//                 textAlign: TextAlign.justify,
//               ),
//               SizedBox(height: 25),
//               // Video Section
//               Align(
//                 alignment: Alignment.centerLeft,
//                 child: Text(
//                   'Introduction Video',
//                   style: Theme.of(context).textTheme.titleMedium,
//                 ),
//               ),
//               SizedBox(height: 10),
//               AspectRatio(
//                 aspectRatio: 16 / 9,
//                 child: VideoCard(),
//               ),
//               SizedBox(height: 25),
//               // Education Section
//               Align(
//                 alignment: Alignment.centerLeft,
//                 child: Text(
//                   'Education',
//                   style: Theme.of(context).textTheme.titleMedium,
//                 ),
//               ),
//               SizedBox(height: 5),
//               Text(
//                 educationDetails,
//                 style: Theme.of(context).textTheme.bodyMedium,
//               ),
//               SizedBox(height: 25),
//               // Languages Section
//               Align(
//                 alignment: Alignment.centerLeft,
//                 child: Text(
//                   'Languages',
//                   style: Theme.of(context).textTheme.titleMedium,
//                 ),
//               ),
//               SizedBox(height: 5),
//               Wrap(
//                 spacing: 10,
//                 children: languages
//                     .map(
//                       (language) => Chip(
//                     label: Text(language),
//                     backgroundColor: Colors.blue[50],
//                     avatar: Icon(
//                       Icons.language,
//                       size: 20,
//                       color: Colors.blue,
//                     ),
//                   ),
//                 )
//                     .toList(),
//               ),
//               SizedBox(height: 25),
//               // Specialties Section
//               Align(
//                 alignment: Alignment.centerLeft,
//                 child: Text(
//                   'Specialties',
//                   style: Theme.of(context).textTheme.titleMedium,
//                 ),
//               ),
//               SizedBox(height: 5),
//               Wrap(
//                 spacing: 10,
//                 children: specialties
//                     .map(
//                       (specialty) => Chip(
//                     label: Text(specialty),
//                     backgroundColor: Colors.blue[50],
//                     avatar: Icon(
//                       Icons.star,
//                       size: 20,
//                       color: Colors.blue,
//                     ),
//                   ),
//                 )
//                     .toList(),
//               ),
//               SizedBox(height: 25),
//               // Interests Section
//               Align(
//                 alignment: Alignment.centerLeft,
//                 child: Text(
//                   'Interests',
//                   style: Theme.of(context).textTheme.titleMedium,
//                 ),
//               ),
//               SizedBox(height: 5),
//               Text(
//                 interests,
//                 style: Theme.of(context).textTheme.bodyMedium,
//               ),
//               SizedBox(height: 25),
//               // Teaching Experience Section
//               Align(
//                 alignment: Alignment.centerLeft,
//                 child: Text(
//                   'Teaching Experience',
//                   style: Theme.of(context).textTheme.titleMedium,
//                 ),
//               ),
//               SizedBox(height: 5),
//               Text(
//                 teachingExperience,
//                 style: Theme.of(context).textTheme.bodyMedium,
//               ),
//               SizedBox(height: 30),
//             ],
//           ),
//         ),
//       ),
//     );
//   }
//
//   void _showBookingDialog(BuildContext context) {
//     showDialog(
//       context: context,
//       builder: (context) {
//         return AlertDialog(
//           title: Text('Confirm Booking'),
//           content: Text('Are you sure you want to book this tutor?'),
//           actions: [
//             TextButton(
//               onPressed: () {
//                 Navigator.pop(context);
//               },
//               child: Text('Cancel',
//                   style: TextStyle(color: Colors.grey[700])),
//             ),
//             ElevatedButton(
//               onPressed: () {
//                 setState(() {
//                   showRateButton =
//                   true; // Show Rate button after booking
//                 });
//                 Navigator.pop(context);
//                 ScaffoldMessenger.of(context).showSnackBar(
//                   SnackBar(content: Text('Booking Confirmed!')),
//                 );
//               },
//               style: ElevatedButton.styleFrom(backgroundColor: Colors.blue),
//               child: Text('Yes'),
//             ),
//           ],
//         );
//       },
//     );
//   }
//
//   void _showReportDialog(BuildContext context) {
//     TextEditingController reportController = TextEditingController();
//
//     showDialog(
//       context: context,
//       builder: (context) {
//         return AlertDialog(
//           title: Text('Report Tutor'),
//           content: TextField(
//             controller: reportController,
//             decoration: InputDecoration(
//               hintText: 'Enter your report here...',
//               border: OutlineInputBorder(),
//             ),
//             maxLines: 5,
//           ),
//           actions: [
//             TextButton(
//               onPressed: () {
//                 Navigator.pop(context);
//               },
//               child: Text('Cancel',
//                   style: TextStyle(color: Colors.grey[700])),
//             ),
//             ElevatedButton(
//               onPressed: () {
//                 // Implement report submission logic here
//                 Navigator.pop(context);
//                 ScaffoldMessenger.of(context).showSnackBar(
//                   SnackBar(content: Text('Report Submitted')),
//                 );
//               },
//               style: ElevatedButton.styleFrom(
//                   backgroundColor: Colors.deepOrange),
//               child: Text('Submit'),
//             ),
//           ],
//         );
//       },
//     );
//   }
//
//   void _showRateDialog(BuildContext context) {
//     double _currentRating = 5.0;
//
//     showDialog(
//       context: context,
//       builder: (context) {
//         return AlertDialog(
//           title: Text('Rate this Tutor'),
//           content: Column(
//             mainAxisSize: MainAxisSize.min,
//             children: [
//               Text('Please provide your rating below:'),
//               SizedBox(height: 20),
//               StatefulBuilder(
//                 builder: (context, setState) {
//                   return Slider(
//                     value: _currentRating,
//                     min: 1,
//                     max: 5,
//                     divisions: 4,
//                     label: _currentRating.round().toString(),
//                     onChanged: (double value) {
//                       setState(() {
//                         _currentRating = value;
//                       });
//                     },
//                     activeColor:
//                     Colors.blue, // Changed slider active color to blue
//                     inactiveColor: Colors.blue[100],
//                   );
//                 },
//               ),
//             ],
//           ),
//           actions: [
//             TextButton(
//               onPressed: () {
//                 Navigator.pop(context);
//               },
//               child: Text('Cancel',
//                   style: TextStyle(color: Colors.grey[700])),
//             ),
//             ElevatedButton(
//               onPressed: () {
//                 // Implement rating submission logic here
//                 Navigator.pop(context);
//                 ScaffoldMessenger.of(context).showSnackBar(
//                   SnackBar(content: Text('Thank you for your rating!')),
//                 );
//               },
//               style: ElevatedButton.styleFrom(backgroundColor: Colors.blue),
//               child: Text('Submit'),
//             ),
//           ],
//         );
//       },
//     );
//   }
// }
//
// class CommentPage extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     // Dummy comments data
//     final List<String> comments = [
//       "Great tutor! Helped me improve my English significantly.",
//       "Very patient and knowledgeable.",
//       "Highly recommended for IELTS preparation.",
//     ];
//
//     return Scaffold(
//       appBar: AppBar(
//         backgroundColor: Colors.white, // Set AppBar background to white
//         title: Text(
//           'Comments',
//           style: TextStyle(color: Colors.blue), // Set title color to blue
//         ),
//         centerTitle: true,
//         leading: IconButton(
//           icon: Icon(Icons.arrow_back, color: Colors.blue), // Set back button color to blue
//           onPressed: () {
//             Navigator.pop(context);
//           },
//         ),
//         elevation: 1, // Optional: Add slight shadow for better visibility
//       ),
//       body: Padding(
//         padding: const EdgeInsets.all(16.0),
//         child: Column(
//           children: [
//             // Existing Comments
//             Expanded(
//               child: ListView.builder(
//                 itemCount: comments.length,
//                 itemBuilder: (context, index) {
//                   return Card(
//                     elevation: 2,
//                     margin: EdgeInsets.symmetric(vertical: 8),
//                     child: ListTile(
//                       leading: CircleAvatar(
//                         backgroundColor:
//                         Colors.blue, // Changed avatar color to blue
//                         child: Icon(Icons.person, color: Colors.white),
//                       ),
//                       title: Text('User ${index + 1}'),
//                       subtitle: Text(comments[index]),
//                     ),
//                   );
//                 },
//               ),
//             ),
//             // Add Comment Field
//             TextField(
//               decoration: InputDecoration(
//                 hintText: 'Add a comment...',
//                 prefixIcon:
//                 Icon(Icons.comment, color: Colors.blue), // Blue icon
//                 border: OutlineInputBorder(
//                   borderRadius: BorderRadius.circular(30.0),
//                 ),
//               ),
//               maxLines: 2,
//             ),
//             SizedBox(height: 10),
//             ElevatedButton.icon(
//               onPressed: () {
//                 // Implement add comment functionality
//                 ScaffoldMessenger.of(context).showSnackBar(
//                   SnackBar(content: Text('Comment Added')),
//                 );
//               },
//               icon: Icon(Icons.send),
//               label: Text('Submit'),
//               style: ElevatedButton.styleFrom(
//                 backgroundColor: Colors.blue, // Blue button
//                 shape: RoundedRectangleBorder(
//                   borderRadius: BorderRadius.circular(30.0),
//                 ),
//                 padding:
//                 EdgeInsets.symmetric(horizontal: 20, vertical: 12),
//               ),
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }
//
// class VideoCard extends StatefulWidget {
//   @override
//   _VideoCardState createState() => _VideoCardState();
// }
//
// class _VideoCardState extends State<VideoCard> {
//   late VideoPlayerController _controller;
//   bool _isControlsVisible = true;
//
//   @override
//   void initState() {
//     super.initState();
//     _controller = VideoPlayerController.network(
//       'https://www.example.com/sample-video.mp4', // Replace with actual video URL
//     )
//       ..initialize().then((_) {
//         setState(() {});
//       })
//       ..setLooping(false);
//   }
//
//   void _toggleControls() {
//     setState(() {
//       _isControlsVisible = !_isControlsVisible;
//     });
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return GestureDetector(
//       onTap: _toggleControls,
//       child: Stack(
//         children: [
//           // Video Player
//           _controller.value.isInitialized
//               ? AspectRatio(
//             aspectRatio: _controller.value.aspectRatio,
//             child: VideoPlayer(_controller),
//           )
//               : Center(child: CircularProgressIndicator()),
//           // Play/Pause Overlay
//           if (_isControlsVisible)
//             Positioned.fill(
//               child: Container(
//                 color: Colors.black45,
//                 child: Center(
//                   child: IconButton(
//                     icon: Icon(
//                       _controller.value.isPlaying
//                           ? Icons.pause_circle_filled
//                           : Icons.play_circle_filled,
//                       color: Colors.white,
//                       size: 60,
//                     ),
//                     onPressed: () {
//                       setState(() {
//                         _controller.value.isPlaying
//                             ? _controller.pause()
//                             : _controller.play();
//                       });
//                     },
//                   ),
//                 ),
//               ),
//             ),
//           // Video Controls
//           if (_isControlsVisible)
//             Positioned(
//               bottom: 10,
//               left: 10,
//               right: 10,
//               child: Row(
//                 mainAxisAlignment:
//                 MainAxisAlignment.spaceBetween,
//                 children: [
//                   // Rewind 10 Seconds
//                   IconButton(
//                     icon: Icon(Icons.replay_10, color: Colors.white),
//                     onPressed: () {
//                       final newPosition =
//                           _controller.value.position -
//                               Duration(seconds: 10);
//                       _controller.seekTo(newPosition >= Duration.zero
//                           ? newPosition
//                           : Duration.zero);
//                     },
//                   ),
//                   // Play/Pause Button
//                   IconButton(
//                     icon: Icon(
//                       _controller.value.isPlaying
//                           ? Icons.pause
//                           : Icons.play_arrow,
//                       color: Colors.white,
//                       size: 30,
//                     ),
//                     onPressed: () {
//                       setState(() {
//                         _controller.value.isPlaying
//                             ? _controller.pause()
//                             : _controller.play();
//                       });
//                     },
//                   ),
//                   // Forward 10 Seconds
//                   IconButton(
//                     icon: Icon(Icons.forward_10, color: Colors.white),
//                     onPressed: () {
//                       final newPosition =
//                           _controller.value.position +
//                               Duration(seconds: 10);
//                       _controller.seekTo(newPosition <=
//                           _controller.value.duration
//                           ? newPosition
//                           : _controller.value.duration);
//                     },
//                   ),
//                 ],
//               ),
//             ),
//         ],
//       ),
//     );
//   }
//
//   @override
//   void dispose() {
//     _controller.dispose();
//     super.dispose();
//   }
// }

// import 'package:flutter/material.dart';
// import 'package:video_player/video_player.dart';
//
// void main() {
//   runApp(TutorDetailsContent());
// }
//
// class TutorDetailsContent extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       title: 'Tutor Details',
//       debugShowCheckedModeBanner: false,
//       theme: ThemeData(
//         primarySwatch: Colors.blue, // Changed primary color to blue
//         hintColor: Colors.deepOrange,
//         scaffoldBackgroundColor: Colors.grey[50],
//         textTheme: TextTheme(
//           titleLarge: TextStyle(
//               fontSize: 20.0,
//               fontWeight: FontWeight.bold,
//               color: Colors.blue[800]), // Changed to blue
//           bodyMedium: TextStyle(fontSize: 16.0, color: Colors.grey[800]),
//           titleMedium: TextStyle(
//               fontSize: 18.0,
//               fontWeight: FontWeight.w600,
//               color: Colors.blue[700]), // Changed to blue
//         ),
//         buttonTheme: ButtonThemeData(
//           buttonColor: Colors.blue, // Changed button color to blue
//           textTheme: ButtonTextTheme.primary,
//         ),
//       ),
//       home: TutorDetailsPage(),
//     );
//   }
// }
//
// class TutorDetailsPage extends StatefulWidget {
//   @override
//   _TutorDetailsPageState createState() => _TutorDetailsPageState();
// }
//
// class _TutorDetailsPageState extends State<TutorDetailsPage> {
//   // Dummy Data
//   final String tutorName = "Dinesh Adhikari";
//   final String address = "Kathmandu";
//   final String description =
//       "Highly experienced tutor in Business English, IELTS, and SAT prep. Passionate about helping students achieve their academic and professional goals.";
//   final String educationDetails =
//       "Master's in Computer Science from XYZ University.";
//   final List<String> languages = ["English", "Nepali"];
//   final List<String> specialties = [
//     "Business English",
//     "IELTS",
//     "SAT",
//     "Programming in Java"
//   ];
//   final String interests = "Passionate about teaching and making learning fun.";
//   final String teachingExperience = "5 years of experience.";
//
//   // New Dummy Image URL
//   final String tutorImage =
//       "https://images.unsplash.com/photo-1527980965255-d3b416303d12?ixlib=rb-4.0.3&auto=format&fit=crop&w=800&q=80";
//
//   bool showRateButton = false;
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         backgroundColor: Colors.white, // Set AppBar background to white
//         title: Text(
//           'Tutor Details',
//           style: TextStyle(color: Colors.blue), // Set title color to blue
//         ),
//         centerTitle: true,
//         leading: IconButton(
//           icon: Icon(Icons.arrow_back, color: Colors.blue), // Set back button color to blue
//           onPressed: () {
//             Navigator.pop(context);
//           },
//         ),
//         elevation: 1, // Optional: Add slight shadow for better visibility
//       ),
//       body: SingleChildScrollView(
//         child: Padding(
//           padding:
//           const EdgeInsets.symmetric(horizontal: 20.0, vertical: 16.0),
//           child: Column(
//             crossAxisAlignment: CrossAxisAlignment.center,
//             children: [
//               // Profile Photo with NetworkImage
//               CircleAvatar(
//                 radius: 60,
//                 backgroundImage: NetworkImage(tutorImage),
//                 backgroundColor: Colors.transparent,
//                 onBackgroundImageError: (exception, stackTrace) {
//                   // Handle image loading error
//                   // Optionally, set a default image or display an error message
//                 },
//               ),
//               SizedBox(height: 10),
//               // Name and Rating
//               Row(
//                 mainAxisAlignment: MainAxisAlignment.center,
//                 children: [
//                   Text(
//                     tutorName,
//                     style: Theme.of(context).textTheme.titleLarge,
//                   ),
//                   SizedBox(width: 8),
//                   Row(
//                     children: [
//                       Icon(Icons.star, color: Colors.amber, size: 20),
//                       SizedBox(width: 4),
//                       Text(
//                         '5.0',
//                         style:
//                         TextStyle(fontSize: 16, color: Colors.grey[800]),
//                       ),
//                     ],
//                   ),
//                 ],
//               ),
//               SizedBox(height: 4),
//               // Address
//               Text(
//                 address,
//                 style: TextStyle(color: Colors.grey[600], fontSize: 14),
//               ),
//               SizedBox(height: 20),
//               // "Book Now" Button Positioned Above Other Buttons
//               SizedBox(
//                 width: double.infinity,
//                 child: ElevatedButton(
//                   onPressed: () {
//                     _showBookingDialog(context);
//                   },
//                   style: ElevatedButton.styleFrom(
//                     foregroundColor: Colors.white,
//                     backgroundColor: Colors.blue, // Blue button
//                     padding:
//                     EdgeInsets.symmetric(horizontal: 20, vertical: 12),
//                     shape: RoundedRectangleBorder(
//                       borderRadius: BorderRadius.circular(30.0),
//                     ),
//                     elevation: 5,
//                   ),
//                   child: Text('Book Now', style: TextStyle(fontSize: 16)),
//                 ),
//               ),
//               SizedBox(height: 20),
//               // Action Buttons: Report, Rate, Comment with Labels and Consistent Spacing
//               Row(
//                 mainAxisAlignment: MainAxisAlignment.spaceEvenly,
//                 children: [
//                   // Report Button with Label
//                   Column(
//                     children: [
//                       IconButton(
//                         icon: Icon(Icons.report, color: Colors.deepOrange),
//                         onPressed: () {
//                           _showReportDialog(context);
//                         },
//                       ),
//                       Text(
//                         'Report',
//                         style: TextStyle(
//                           color: Colors.deepOrange,
//                           fontSize: 12,
//                         ),
//                       ),
//                     ],
//                   ),
//                   // Rate Button with Label (conditionally shown)
//                   if (showRateButton)
//                     Column(
//                       children: [
//                         IconButton(
//                           icon: Icon(Icons.rate_review, color: Colors.blue),
//                           onPressed: () {
//                             _showRateDialog(context);
//                           },
//                         ),
//                         Text(
//                           'Rate',
//                           style: TextStyle(
//                             color: Colors.blue,
//                             fontSize: 12,
//                           ),
//                         ),
//                       ],
//                     ),
//                   // Comment Button with Label
//                   Column(
//                     children: [
//                       IconButton(
//                         icon: Icon(Icons.comment, color: Colors.blue),
//                         onPressed: () {
//                           Navigator.push(
//                             context,
//                             MaterialPageRoute(
//                                 builder: (context) => CommentPage()),
//                           );
//                         },
//                       ),
//                       Text(
//                         'Comment',
//                         style: TextStyle(
//                           color: Colors.blue,
//                           fontSize: 12,
//                         ),
//                       ),
//                     ],
//                   ),
//                 ],
//               ),
//               SizedBox(height: 20),
//               // Description
//               Align(
//                 alignment: Alignment.centerLeft,
//                 child: Text(
//                   'About',
//                   style: Theme.of(context).textTheme.titleMedium,
//                 ),
//               ),
//               SizedBox(height: 5),
//               Text(
//                 description,
//                 style: Theme.of(context).textTheme.bodyMedium,
//                 textAlign: TextAlign.justify,
//               ),
//               SizedBox(height: 25),
//               // Video Section
//               Align(
//                 alignment: Alignment.centerLeft,
//                 child: Text(
//                   'Introduction Video',
//                   style: Theme.of(context).textTheme.titleMedium,
//                 ),
//               ),
//               SizedBox(height: 10),
//               AspectRatio(
//                 aspectRatio: 16 / 9,
//                 child: VideoCard(),
//               ),
//               SizedBox(height: 25),
//               // Education Section
//               Align(
//                 alignment: Alignment.centerLeft,
//                 child: Text(
//                   'Education',
//                   style: Theme.of(context).textTheme.titleMedium,
//                 ),
//               ),
//               SizedBox(height: 5),
//               Text(
//                 educationDetails,
//                 style: Theme.of(context).textTheme.bodyMedium,
//               ),
//               SizedBox(height: 25),
//               // Languages Section
//               Align(
//                 alignment: Alignment.centerLeft,
//                 child: Text(
//                   'Languages',
//                   style: Theme.of(context).textTheme.titleMedium,
//                 ),
//               ),
//               SizedBox(height: 5),
//               Wrap(
//                 spacing: 10,
//                 children: languages
//                     .map(
//                       (language) => Chip(
//                     label: Text(language),
//                     backgroundColor: Colors.blue[50],
//                     avatar: Icon(
//                       Icons.language,
//                       size: 20,
//                       color: Colors.blue,
//                     ),
//                   ),
//                 )
//                     .toList(),
//               ),
//               SizedBox(height: 25),
//               // Specialties Section
//               Align(
//                 alignment: Alignment.centerLeft,
//                 child: Text(
//                   'Specialties',
//                   style: Theme.of(context).textTheme.titleMedium,
//                 ),
//               ),
//               SizedBox(height: 5),
//               Wrap(
//                 spacing: 10,
//                 children: specialties
//                     .map(
//                       (specialty) => Chip(
//                     label: Text(specialty),
//                     backgroundColor: Colors.blue[50],
//                     avatar: Icon(
//                       Icons.star,
//                       size: 20,
//                       color: Colors.blue,
//                     ),
//                   ),
//                 )
//                     .toList(),
//               ),
//               SizedBox(height: 25),
//               // Interests Section
//               Align(
//                 alignment: Alignment.centerLeft,
//                 child: Text(
//                   'Interests',
//                   style: Theme.of(context).textTheme.titleMedium,
//                 ),
//               ),
//               SizedBox(height: 5),
//               Text(
//                 interests,
//                 style: Theme.of(context).textTheme.bodyMedium,
//               ),
//               SizedBox(height: 25),
//               // Teaching Experience Section
//               Align(
//                 alignment: Alignment.centerLeft,
//                 child: Text(
//                   'Teaching Experience',
//                   style: Theme.of(context).textTheme.titleMedium,
//                 ),
//               ),
//               SizedBox(height: 5),
//               Text(
//                 teachingExperience,
//                 style: Theme.of(context).textTheme.bodyMedium,
//               ),
//               SizedBox(height: 30),
//             ],
//           ),
//         ),
//       ),
//     );
//   }
//
//   void _showBookingDialog(BuildContext context) {
//     showDialog(
//       context: context,
//       builder: (context) {
//         return AlertDialog(
//           title: Text('Confirm Booking'),
//           content: Text('Are you sure you want to book this tutor?'),
//           actions: [
//             TextButton(
//               onPressed: () {
//                 Navigator.pop(context);
//               },
//               child:
//               Text('Cancel', style: TextStyle(color: Colors.grey[700])),
//             ),
//             ElevatedButton(
//               onPressed: () {
//                 setState(() {
//                   showRateButton = true; // Show Rate button after booking
//                 });
//                 Navigator.pop(context);
//                 ScaffoldMessenger.of(context).showSnackBar(
//                   SnackBar(content: Text('Booking Confirmed!')),
//                 );
//               },
//               style: ElevatedButton.styleFrom(backgroundColor: Colors.blue),
//               child: Text('Yes'),
//             ),
//           ],
//         );
//       },
//     );
//   }
//
//   void _showReportDialog(BuildContext context) {
//     TextEditingController reportController = TextEditingController();
//
//     showDialog(
//       context: context,
//       builder: (context) {
//         return AlertDialog(
//           title: Text('Report Tutor'),
//           content: TextField(
//             controller: reportController,
//             decoration: InputDecoration(
//               hintText: 'Enter your report here...',
//               border: OutlineInputBorder(),
//             ),
//             maxLines: 5,
//           ),
//           actions: [
//             TextButton(
//               onPressed: () {
//                 Navigator.pop(context);
//               },
//               child:
//               Text('Cancel', style: TextStyle(color: Colors.grey[700])),
//             ),
//             ElevatedButton(
//               onPressed: () {
//                 // Implement report submission logic here
//                 Navigator.pop(context);
//                 ScaffoldMessenger.of(context).showSnackBar(
//                   SnackBar(content: Text('Report Submitted')),
//                 );
//               },
//               style: ElevatedButton.styleFrom(
//                   backgroundColor: Colors.deepOrange),
//               child: Text('Submit'),
//             ),
//           ],
//         );
//       },
//     );
//   }
//
//   void _showRateDialog(BuildContext context) {
//     double _currentRating = 5.0;
//
//     showDialog(
//       context: context,
//       builder: (context) {
//         return AlertDialog(
//           title: Text('Rate this Tutor'),
//           content: Column(
//             mainAxisSize: MainAxisSize.min,
//             children: [
//               Text('Please provide your rating below:'),
//               SizedBox(height: 20),
//               StatefulBuilder(
//                 builder: (context, setState) {
//                   return Slider(
//                     value: _currentRating,
//                     min: 1,
//                     max: 5,
//                     divisions: 4,
//                     label: _currentRating.round().toString(),
//                     onChanged: (double value) {
//                       setState(() {
//                         _currentRating = value;
//                       });
//                     },
//                     activeColor:
//                     Colors.blue, // Changed slider active color to blue
//                     inactiveColor: Colors.blue[100],
//                   );
//                 },
//               ),
//             ],
//           ),
//           actions: [
//             TextButton(
//               onPressed: () {
//                 Navigator.pop(context);
//               },
//               child:
//               Text('Cancel', style: TextStyle(color: Colors.grey[700])),
//             ),
//             ElevatedButton(
//               onPressed: () {
//                 // Implement rating submission logic here
//                 Navigator.pop(context);
//                 ScaffoldMessenger.of(context).showSnackBar(
//                   SnackBar(content: Text('Thank you for your rating!')),
//                 );
//               },
//               style: ElevatedButton.styleFrom(backgroundColor: Colors.blue),
//               child: Text('Submit'),
//             ),
//           ],
//         );
//       },
//     );
//   }
// }
//
// class CommentPage extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     // Dummy comments data
//     final List<String> comments = [
//       "Great tutor! Helped me improve my English significantly.",
//       "Very patient and knowledgeable.",
//       "Highly recommended for IELTS preparation.",
//     ];
//
//     return Scaffold(
//       appBar: AppBar(
//         backgroundColor: Colors.white, // Set AppBar background to white
//         title: Text(
//           'Comments',
//           style: TextStyle(color: Colors.blue), // Set title color to blue
//         ),
//         centerTitle: true,
//         leading: IconButton(
//           icon: Icon(Icons.arrow_back, color: Colors.blue), // Set back button color to blue
//           onPressed: () {
//             Navigator.pop(context);
//           },
//         ),
//         elevation: 1, // Optional: Add slight shadow for better visibility
//       ),
//       body: Padding(
//         padding: const EdgeInsets.all(16.0),
//         child: Column(
//           children: [
//             // Existing Comments
//             Expanded(
//               child: ListView.builder(
//                 itemCount: comments.length,
//                 itemBuilder: (context, index) {
//                   return Card(
//                     elevation: 2,
//                     margin: EdgeInsets.symmetric(vertical: 8),
//                     child: ListTile(
//                       leading: CircleAvatar(
//                         backgroundColor:
//                         Colors.blue, // Changed avatar color to blue
//                         child: Icon(Icons.person, color: Colors.white),
//                       ),
//                       title: Text('User ${index + 1}'),
//                       subtitle: Text(comments[index]),
//                     ),
//                   );
//                 },
//               ),
//             ),
//             // Add Comment Field
//             TextField(
//               decoration: InputDecoration(
//                 hintText: 'Add a comment...',
//                 prefixIcon:
//                 Icon(Icons.comment, color: Colors.blue), // Blue icon
//                 border: OutlineInputBorder(
//                   borderRadius: BorderRadius.circular(30.0),
//                 ),
//               ),
//               maxLines: 2,
//             ),
//             SizedBox(height: 10),
//             ElevatedButton.icon(
//               onPressed: () {
//                 // Implement add comment functionality
//                 ScaffoldMessenger.of(context).showSnackBar(
//                   SnackBar(content: Text('Comment Added')),
//                 );
//               },
//               icon: Icon(Icons.send),
//               label: Text('Submit'),
//               style: ElevatedButton.styleFrom(
//                 backgroundColor: Colors.blue, // Blue button
//                 shape: RoundedRectangleBorder(
//                   borderRadius: BorderRadius.circular(30.0),
//                 ),
//                 padding:
//                 EdgeInsets.symmetric(horizontal: 20, vertical: 12),
//               ),
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }
//
// class VideoCard extends StatefulWidget {
//   @override
//   _VideoCardState createState() => _VideoCardState();
// }
//
// class _VideoCardState extends State<VideoCard> {
//   late VideoPlayerController _controller;
//   bool _isControlsVisible = true;
//
//   @override
//   void initState() {
//     super.initState();
//     _controller = VideoPlayerController.network(
//       'https://www.example.com/sample-video.mp4', // Replace with actual video URL
//     )
//       ..initialize().then((_) {
//         setState(() {});
//       })
//       ..setLooping(false);
//   }
//
//   void _toggleControls() {
//     setState(() {
//       _isControlsVisible = !_isControlsVisible;
//     });
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return GestureDetector(
//       onTap: _toggleControls,
//       child: Stack(
//         children: [
//           // Video Player
//           _controller.value.isInitialized
//               ? AspectRatio(
//             aspectRatio: _controller.value.aspectRatio,
//             child: VideoPlayer(_controller),
//           )
//               : Center(child: CircularProgressIndicator()),
//           // Play/Pause Overlay
//           if (_isControlsVisible)
//             Positioned.fill(
//               child: Container(
//                 color: Colors.black45,
//                 child: Center(
//                   child: IconButton(
//                     icon: Icon(
//                       _controller.value.isPlaying
//                           ? Icons.pause_circle_filled
//                           : Icons.play_circle_filled,
//                       color: Colors.white,
//                       size: 60,
//                     ),
//                     onPressed: () {
//                       setState(() {
//                         _controller.value.isPlaying
//                             ? _controller.pause()
//                             : _controller.play();
//                       });
//                     },
//                   ),
//                 ),
//               ),
//             ),
//           // Video Controls
//           if (_isControlsVisible)
//             Positioned(
//               bottom: 10,
//               left: 10,
//               right: 10,
//               child: Row(
//                 mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                 children: [
//                   // Rewind 10 Seconds
//                   IconButton(
//                     icon: Icon(Icons.replay_10, color: Colors.white),
//                     onPressed: () {
//                       final newPosition =
//                           _controller.value.position - Duration(seconds: 10);
//                       _controller.seekTo(newPosition >= Duration.zero
//                           ? newPosition
//                           : Duration.zero);
//                     },
//                   ),
//                   // Play/Pause Button
//                   IconButton(
//                     icon: Icon(
//                       _controller.value.isPlaying
//                           ? Icons.pause
//                           : Icons.play_arrow,
//                       color: Colors.white,
//                       size: 30,
//                     ),
//                     onPressed: () {
//                       setState(() {
//                         _controller.value.isPlaying
//                             ? _controller.pause()
//                             : _controller.play();
//                       });
//                     },
//                   ),
//                   // Forward 10 Seconds
//                   IconButton(
//                     icon: Icon(Icons.forward_10, color: Colors.white),
//                     onPressed: () {
//                       final newPosition =
//                           _controller.value.position + Duration(seconds: 10);
//                       _controller.seekTo(newPosition <=
//                           _controller.value.duration
//                           ? newPosition
//                           : _controller.value.duration);
//                     },
//                   ),
//                 ],
//               ),
//             ),
//         ],
//       ),
//     );
//   }
//
//   @override
//   void dispose() {
//     _controller.dispose();
//     super.dispose();
//   }
// }

// import 'package:flutter/material.dart';
// import 'package:video_player/video_player.dart';
// import 'package:intl/intl.dart'; // For formatting duration
//
// void main() {
//   runApp(TutorDetailsContent());
// }
//
// class TutorDetailsContent extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       title: 'Tutor Details',
//       debugShowCheckedModeBanner: false,
//       theme: ThemeData(
//         primarySwatch: Colors.blue, // Changed primary color to blue
//         hintColor: Colors.deepOrange,
//         scaffoldBackgroundColor: Colors.grey[50],
//         textTheme: TextTheme(
//           titleLarge: TextStyle(
//               fontSize: 20.0,
//               fontWeight: FontWeight.bold,
//               color: Colors.blue[800]), // Changed to blue
//           bodyMedium: TextStyle(fontSize: 16.0, color: Colors.grey[800]),
//           titleMedium: TextStyle(
//               fontSize: 18.0,
//               fontWeight: FontWeight.w600,
//               color: Colors.blue[700]), // Changed to blue
//         ),
//         buttonTheme: ButtonThemeData(
//           buttonColor: Colors.blue, // Changed button color to blue
//           textTheme: ButtonTextTheme.primary,
//         ),
//       ),
//       home: TutorDetailsPage(),
//     );
//   }
// }
//
// class TutorDetailsPage extends StatefulWidget {
//   @override
//   _TutorDetailsPageState createState() => _TutorDetailsPageState();
// }
//
// class _TutorDetailsPageState extends State<TutorDetailsPage> {
//   // Dummy Data
//   final String tutorName = "Dinesh Adhikari";
//   final String address = "Kathmandu";
//   final String description =
//       "Highly experienced tutor in Business English, IELTS, and SAT prep. Passionate about helping students achieve their academic and professional goals.";
//   final String educationDetails =
//       "Master's in Computer Science from XYZ University.";
//   final List<String> languages = ["English", "Nepali"];
//   final List<String> specialties = [
//     "Business English",
//     "IELTS",
//     "SAT",
//     "Programming in Java"
//   ];
//   final String interests = "Passionate about teaching and making learning fun.";
//   final String teachingExperience = "5 years of experience.";
//
//   // New Dummy Image URL
//   final String tutorImage =
//       "https://images.unsplash.com/photo-1527980965255-d3b416303d12?ixlib=rb-4.0.3&auto=format&fit=crop&w=800&q=80";
//
//   bool showRateButton = false;
//
//   // Dummy Video URLs (Simulating database fetched data)
//   final List<String> videoUrls = [
//     // Replace with actual video URLs or keep dummy for now
//     'https://www.learningcontainer.com/wp-content/uploads/2020/05/sample-mp4-file.mp4',
//     // Add more URLs if needed
//   ];
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         backgroundColor: Colors.white, // Set AppBar background to white
//         title: Text(
//           'Tutor Details',
//           style: TextStyle(color: Colors.blue), // Set title color to blue
//         ),
//         centerTitle: true,
//         leading: IconButton(
//           icon: Icon(Icons.arrow_back, color: Colors.blue), // Set back button color to blue
//           onPressed: () {
//             Navigator.pop(context);
//           },
//         ),
//         elevation: 1, // Optional: Add slight shadow for better visibility
//       ),
//       body: SingleChildScrollView(
//         child: Padding(
//           padding:
//           const EdgeInsets.symmetric(horizontal: 20.0, vertical: 16.0),
//           child: Column(
//             crossAxisAlignment: CrossAxisAlignment.center,
//             children: [
//               // Profile Photo with NetworkImage
//               CircleAvatar(
//                 radius: 60,
//                 backgroundImage: NetworkImage(tutorImage),
//                 backgroundColor: Colors.transparent,
//                 onBackgroundImageError: (exception, stackTrace) {
//                   // Handle image loading error
//                   // Optionally, set a default image or display an error message
//                 },
//               ),
//               SizedBox(height: 10),
//               // Name and Rating
//               Row(
//                 mainAxisAlignment: MainAxisAlignment.center,
//                 children: [
//                   Text(
//                     tutorName,
//                     style: Theme.of(context).textTheme.titleLarge,
//                   ),
//                   SizedBox(width: 8),
//                   Row(
//                     children: [
//                       Icon(Icons.star, color: Colors.amber, size: 20),
//                       SizedBox(width: 4),
//                       Text(
//                         '5.0',
//                         style:
//                         TextStyle(fontSize: 16, color: Colors.grey[800]),
//                       ),
//                     ],
//                   ),
//                 ],
//               ),
//               SizedBox(height: 4),
//               // Address
//               Text(
//                 address,
//                 style: TextStyle(color: Colors.grey[600], fontSize: 14),
//               ),
//               SizedBox(height: 20),
//               // "Book Now" Button Positioned Above Other Buttons
//               SizedBox(
//                 width: double.infinity,
//                 child: ElevatedButton(
//                   onPressed: () {
//                     _showBookingDialog(context);
//                   },
//                   style: ElevatedButton.styleFrom(
//                     foregroundColor: Colors.white,
//                     backgroundColor: Colors.blue, // Blue button
//                     padding:
//                     EdgeInsets.symmetric(horizontal: 20, vertical: 12),
//                     shape: RoundedRectangleBorder(
//                       borderRadius: BorderRadius.circular(30.0),
//                     ),
//                     elevation: 5,
//                   ),
//                   child: Text('Book Now', style: TextStyle(fontSize: 16)),
//                 ),
//               ),
//               SizedBox(height: 20),
//               // Action Buttons: Report, Rate, Comment with Labels and Consistent Spacing
//               Row(
//                 mainAxisAlignment: MainAxisAlignment.spaceEvenly,
//                 children: [
//                   // Report Button with Label
//                   Column(
//                     children: [
//                       IconButton(
//                         icon: Icon(Icons.report, color: Colors.deepOrange),
//                         onPressed: () {
//                           _showReportDialog(context);
//                         },
//                       ),
//                       Text(
//                         'Report',
//                         style: TextStyle(
//                           color: Colors.deepOrange,
//                           fontSize: 12,
//                         ),
//                       ),
//                     ],
//                   ),
//                   // Rate Button with Label (conditionally shown)
//                   if (showRateButton)
//                     Column(
//                       children: [
//                         IconButton(
//                           icon: Icon(Icons.rate_review, color: Colors.blue),
//                           onPressed: () {
//                             _showRateDialog(context);
//                           },
//                         ),
//                         Text(
//                           'Rate',
//                           style: TextStyle(
//                             color: Colors.blue,
//                             fontSize: 12,
//                           ),
//                         ),
//                       ],
//                     ),
//                   // Comment Button with Label
//                   Column(
//                     children: [
//                       IconButton(
//                         icon: Icon(Icons.comment, color: Colors.blue),
//                         onPressed: () {
//                           Navigator.push(
//                             context,
//                             MaterialPageRoute(
//                                 builder: (context) => CommentPage()),
//                           );
//                         },
//                       ),
//                       Text(
//                         'Comment',
//                         style: TextStyle(
//                           color: Colors.blue,
//                           fontSize: 12,
//                         ),
//                       ),
//                     ],
//                   ),
//                 ],
//               ),
//               SizedBox(height: 20),
//               // Description
//               Align(
//                 alignment: Alignment.centerLeft,
//                 child: Text(
//                   'About',
//                   style: Theme.of(context).textTheme.titleMedium,
//                 ),
//               ),
//               SizedBox(height: 5),
//               Text(
//                 description,
//                 style: Theme.of(context).textTheme.bodyMedium,
//                 textAlign: TextAlign.justify,
//               ),
//               SizedBox(height: 25),
//               // Video Section
//               Align(
//                 alignment: Alignment.centerLeft,
//                 child: Text(
//                   'Introduction Video',
//                   style: Theme.of(context).textTheme.titleMedium,
//                 ),
//               ),
//               SizedBox(height: 10),
//               // Pass the first video URL from the list to VideoCard
//               AspectRatio(
//                 aspectRatio: 16 / 9,
//                 child: VideoCard(videoUrl: videoUrls[0]),
//               ),
//               SizedBox(height: 25),
//               // Education Section
//               Align(
//                 alignment: Alignment.centerLeft,
//                 child: Text(
//                   'Education',
//                   style: Theme.of(context).textTheme.titleMedium,
//                 ),
//               ),
//               SizedBox(height: 5),
//               Text(
//                 educationDetails,
//                 style: Theme.of(context).textTheme.bodyMedium,
//               ),
//               SizedBox(height: 25),
//               // Languages Section
//               Align(
//                 alignment: Alignment.centerLeft,
//                 child: Text(
//                   'Languages',
//                   style: Theme.of(context).textTheme.titleMedium,
//                 ),
//               ),
//               SizedBox(height: 5),
//               Wrap(
//                 spacing: 10,
//                 children: languages
//                     .map(
//                       (language) => Chip(
//                     label: Text(language),
//                     backgroundColor: Colors.blue[50],
//                     avatar: Icon(
//                       Icons.language,
//                       size: 20,
//                       color: Colors.blue,
//                     ),
//                   ),
//                 )
//                     .toList(),
//               ),
//               SizedBox(height: 25),
//               // Specialties Section
//               Align(
//                 alignment: Alignment.centerLeft,
//                 child: Text(
//                   'Specialties',
//                   style: Theme.of(context).textTheme.titleMedium,
//                 ),
//               ),
//               SizedBox(height: 5),
//               Wrap(
//                 spacing: 10,
//                 children: specialties
//                     .map(
//                       (specialty) => Chip(
//                     label: Text(specialty),
//                     backgroundColor: Colors.blue[50],
//                     avatar: Icon(
//                       Icons.star,
//                       size: 20,
//                       color: Colors.blue,
//                     ),
//                   ),
//                 )
//                     .toList(),
//               ),
//               SizedBox(height: 25),
//               // Interests Section
//               Align(
//                 alignment: Alignment.centerLeft,
//                 child: Text(
//                   'Interests',
//                   style: Theme.of(context).textTheme.titleMedium,
//                 ),
//               ),
//               SizedBox(height: 5),
//               Text(
//                 interests,
//                 style: Theme.of(context).textTheme.bodyMedium,
//               ),
//               SizedBox(height: 25),
//               // Teaching Experience Section
//               Align(
//                 alignment: Alignment.centerLeft,
//                 child: Text(
//                   'Teaching Experience',
//                   style: Theme.of(context).textTheme.titleMedium,
//                 ),
//               ),
//               SizedBox(height: 5),
//               Text(
//                 teachingExperience,
//                 style: Theme.of(context).textTheme.bodyMedium,
//               ),
//               SizedBox(height: 30),
//             ],
//           ),
//         ),
//       ),
//     );
//   }
//
//   void _showBookingDialog(BuildContext context) {
//     showDialog(
//       context: context,
//       builder: (context) {
//         return AlertDialog(
//           title: Text('Confirm Booking'),
//           content: Text('Are you sure you want to book this tutor?'),
//           actions: [
//             TextButton(
//               onPressed: () {
//                 Navigator.pop(context);
//               },
//               child:
//               Text('Cancel', style: TextStyle(color: Colors.grey[700])),
//             ),
//             ElevatedButton(
//               onPressed: () {
//                 setState(() {
//                   showRateButton = true; // Show Rate button after booking
//                 });
//                 Navigator.pop(context);
//                 ScaffoldMessenger.of(context).showSnackBar(
//                   SnackBar(content: Text('Booking Confirmed!')),
//                 );
//               },
//               style: ElevatedButton.styleFrom(backgroundColor: Colors.blue),
//               child: Text('Yes'),
//             ),
//           ],
//         );
//       },
//     );
//   }
//
//   void _showReportDialog(BuildContext context) {
//     TextEditingController reportController = TextEditingController();
//
//     showDialog(
//       context: context,
//       builder: (context) {
//         return AlertDialog(
//           title: Text('Report Tutor'),
//           content: TextField(
//             controller: reportController,
//             decoration: InputDecoration(
//               hintText: 'Enter your report here...',
//               border: OutlineInputBorder(),
//             ),
//             maxLines: 5,
//           ),
//           actions: [
//             TextButton(
//               onPressed: () {
//                 Navigator.pop(context);
//               },
//               child:
//               Text('Cancel', style: TextStyle(color: Colors.grey[700])),
//             ),
//             ElevatedButton(
//               onPressed: () {
//                 // Implement report submission logic here
//                 Navigator.pop(context);
//                 ScaffoldMessenger.of(context).showSnackBar(
//                   SnackBar(content: Text('Report Submitted')),
//                 );
//               },
//               style: ElevatedButton.styleFrom(
//                   backgroundColor: Colors.deepOrange),
//               child: Text('Submit'),
//             ),
//           ],
//         );
//       },
//     );
//   }
//
//   void _showRateDialog(BuildContext context) {
//     double _currentRating = 5.0;
//
//     showDialog(
//       context: context,
//       builder: (context) {
//         return AlertDialog(
//           title: Text('Rate this Tutor'),
//           content: Column(
//             mainAxisSize: MainAxisSize.min,
//             children: [
//               Text('Please provide your rating below:'),
//               SizedBox(height: 20),
//               StatefulBuilder(
//                 builder: (context, setState) {
//                   return Slider(
//                     value: _currentRating,
//                     min: 1,
//                     max: 5,
//                     divisions: 4,
//                     label: _currentRating.round().toString(),
//                     onChanged: (double value) {
//                       setState(() {
//                         _currentRating = value;
//                       });
//                     },
//                     activeColor:
//                     Colors.blue, // Changed slider active color to blue
//                     inactiveColor: Colors.blue[100],
//                   );
//                 },
//               ),
//             ],
//           ),
//           actions: [
//             TextButton(
//               onPressed: () {
//                 Navigator.pop(context);
//               },
//               child:
//               Text('Cancel', style: TextStyle(color: Colors.grey[700])),
//             ),
//             ElevatedButton(
//               onPressed: () {
//                 // Implement rating submission logic here
//                 Navigator.pop(context);
//                 ScaffoldMessenger.of(context).showSnackBar(
//                   SnackBar(content: Text('Thank you for your rating!')),
//                 );
//               },
//               style: ElevatedButton.styleFrom(backgroundColor: Colors.blue),
//               child: Text('Submit'),
//             ),
//           ],
//         );
//       },
//     );
//   }
// }
//
// class CommentPage extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     // Dummy comments data
//     final List<String> comments = [
//       "Great tutor! Helped me improve my English significantly.",
//       "Very patient and knowledgeable.",
//       "Highly recommended for IELTS preparation.",
//     ];
//
//     return Scaffold(
//       appBar: AppBar(
//         backgroundColor: Colors.white, // Set AppBar background to white
//         title: Text(
//           'Comments',
//           style: TextStyle(color: Colors.blue), // Set title color to blue
//         ),
//         centerTitle: true,
//         leading: IconButton(
//           icon: Icon(Icons.arrow_back, color: Colors.blue), // Set back button color to blue
//           onPressed: () {
//             Navigator.pop(context);
//           },
//         ),
//         elevation: 1, // Optional: Add slight shadow for better visibility
//       ),
//       body: Padding(
//         padding: const EdgeInsets.all(16.0),
//         child: Column(
//           children: [
//             // Existing Comments
//             Expanded(
//               child: ListView.builder(
//                 itemCount: comments.length,
//                 itemBuilder: (context, index) {
//                   return Card(
//                     elevation: 2,
//                     margin: EdgeInsets.symmetric(vertical: 8),
//                     child: ListTile(
//                       leading: CircleAvatar(
//                         backgroundColor:
//                         Colors.blue, // Changed avatar color to blue
//                         child: Icon(Icons.person, color: Colors.white),
//                       ),
//                       title: Text('User ${index + 1}'),
//                       subtitle: Text(comments[index]),
//                     ),
//                   );
//                 },
//               ),
//             ),
//             // Add Comment Field
//             TextField(
//               decoration: InputDecoration(
//                 hintText: 'Add a comment...',
//                 prefixIcon:
//                 Icon(Icons.comment, color: Colors.blue), // Blue icon
//                 border: OutlineInputBorder(
//                   borderRadius: BorderRadius.circular(30.0),
//                 ),
//               ),
//               maxLines: 2,
//             ),
//             SizedBox(height: 10),
//             ElevatedButton.icon(
//               onPressed: () {
//                 // Implement add comment functionality
//                 ScaffoldMessenger.of(context).showSnackBar(
//                   SnackBar(content: Text('Comment Added')),
//                 );
//               },
//               icon: Icon(Icons.send),
//               label: Text('Submit'),
//               style: ElevatedButton.styleFrom(
//                 backgroundColor: Colors.blue, // Blue button
//                 shape: RoundedRectangleBorder(
//                   borderRadius: BorderRadius.circular(30.0),
//                 ),
//                 padding:
//                 EdgeInsets.symmetric(horizontal: 20, vertical: 12),
//               ),
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }
//
// // class VideoCard extends StatefulWidget {
// //   final String videoUrl;
// //
// //   VideoCard({required this.videoUrl});
// //
// //   @override
// //   _VideoCardState createState() => _VideoCardState();
// // }
// //
// // class _VideoCardState extends State<VideoCard> {
// //   late VideoPlayerController _controller;
// //   bool _isControlsVisible = true;
// //   bool _isDragging = false;
// //   double _sliderValue = 0.0;
// //
// //   @override
// //   void initState() {
// //     super.initState();
// //     _controller = VideoPlayerController.network(
// //       widget.videoUrl, // Use the dynamic video URL
// //     )
// //       ..initialize().then((_) {
// //         setState(() {});
// //       })
// //       ..setLooping(false);
// //
// //     // Listen to video position updates
// //     _controller.addListener(() {
// //       if (!_isDragging) {
// //         setState(() {
// //           _sliderValue = _controller.value.position.inSeconds.toDouble();
// //         });
// //       }
// //     });
// //   }
// //
// //   void _toggleControls() {
// //     setState(() {
// //       _isControlsVisible = !_isControlsVisible;
// //     });
// //   }
// //
// //   String _formatDuration(Duration duration) {
// //     // Formats duration to mm:ss
// //     String twoDigits(int n) => n.toString().padLeft(2, '0');
// //     String twoDigitMinutes =
// //     twoDigits(duration.inMinutes.remainder(60));
// //     String twoDigitSeconds =
// //     twoDigits(duration.inSeconds.remainder(60));
// //     return "$twoDigitMinutes:$twoDigitSeconds";
// //   }
// //
// //   @override
// //   Widget build(BuildContext context) {
// //     final totalDuration =
// //     _controller.value.isInitialized ? _controller.value.duration : Duration.zero;
// //     final currentPosition =
// //     _controller.value.isInitialized ? _controller.value.position : Duration.zero;
// //     final remainingDuration = totalDuration - currentPosition;
// //
// //     return GestureDetector(
// //       onTap: _toggleControls,
// //       child: Stack(
// //         children: [
// //           // Video Player
// //           _controller.value.isInitialized
// //               ? AspectRatio(
// //             aspectRatio: _controller.value.aspectRatio,
// //             child: VideoPlayer(_controller),
// //           )
// //               : Center(child: CircularProgressIndicator()),
// //           // Overlay Controls
// //           if (_isControlsVisible)
// //             Positioned.fill(
// //               child: Container(
// //                 color: Colors.black45,
// //                 child: Column(
// //                   mainAxisAlignment: MainAxisAlignment.spaceBetween,
// //                   children: [
// //                     // Top Controls (optional, can be used for title or other controls)
// //                     SizedBox(height: 10),
// //                     // Middle Controls (Play/Pause)
// //                     Expanded(
// //                       child: Center(
// //                         child: IconButton(
// //                           icon: Icon(
// //                             _controller.value.isPlaying
// //                                 ? Icons.pause_circle_filled
// //                                 : Icons.play_circle_filled,
// //                             color: Colors.white,
// //                             size: 60,
// //                           ),
// //                           onPressed: () {
// //                             setState(() {
// //                               _controller.value.isPlaying
// //                                   ? _controller.pause()
// //                                   : _controller.play();
// //                             });
// //                           },
// //                         ),
// //                       ),
// //                     ),
// //                     // Bottom Controls (Rewind, Progress Bar, Forward)
// //                     Container(
// //                       color: Colors.black54,
// //                       padding:
// //                       EdgeInsets.symmetric(horizontal: 10.0, vertical: 5.0),
// //                       child: Column(
// //                         children: [
// //                           // Progress Bar
// //                           _controller.value.isInitialized
// //                               ? Column(
// //                             children: [
// //                               Slider(
// //                                 value: _sliderValue,
// //                                 min: 0.0,
// //                                 max: totalDuration.inSeconds.toDouble(),
// //                                 activeColor: Colors.blue,
// //                                 inactiveColor: Colors.white54,
// //                                 onChanged: (value) {
// //                                   setState(() {
// //                                     _isDragging = true;
// //                                     _sliderValue = value;
// //                                   });
// //                                 },
// //                                 onChangeEnd: (value) {
// //                                   setState(() {
// //                                     _controller.seekTo(
// //                                         Duration(seconds: value.toInt()));
// //                                     _isDragging = false;
// //                                   });
// //                                 },
// //                               ),
// //                               // Time Display
// //                               Row(
// //                                 mainAxisAlignment:
// //                                 MainAxisAlignment.spaceBetween,
// //                                 children: [
// //                                   // Current Time
// //                                   Text(
// //                                     _formatDuration(currentPosition),
// //                                     style: TextStyle(
// //                                         color: Colors.white, fontSize: 12),
// //                                   ),
// //                                   // Remaining Time
// //                                   Text(
// //                                     '-${_formatDuration(remainingDuration)}',
// //                                     style: TextStyle(
// //                                         color: Colors.white, fontSize: 12),
// //                                   ),
// //                                 ],
// //                               ),
// //                             ],
// //                           )
// //                               : Container(),
// //                           // Rewind, Play/Pause, Forward Buttons
// //                           Row(
// //                             mainAxisAlignment: MainAxisAlignment.spaceEvenly,
// //                             children: [
// //                               // Rewind 10 Seconds
// //                               IconButton(
// //                                 icon: Icon(Icons.replay_10,
// //                                     color: Colors.white, size: 30),
// //                                 onPressed: () {
// //                                   final newPosition = _controller
// //                                       .value.position -
// //                                       Duration(seconds: 10);
// //                                   _controller.seekTo(newPosition >= Duration.zero
// //                                       ? newPosition
// //                                       : Duration.zero);
// //                                 },
// //                               ),
// //                               // Play/Pause Button
// //                               IconButton(
// //                                 icon: Icon(
// //                                   _controller.value.isPlaying
// //                                       ? Icons.pause
// //                                       : Icons.play_arrow,
// //                                   color: Colors.white,
// //                                   size: 30,
// //                                 ),
// //                                 onPressed: () {
// //                                   setState(() {
// //                                     _controller.value.isPlaying
// //                                         ? _controller.pause()
// //                                         : _controller.play();
// //                                   });
// //                                 },
// //                               ),
// //                               // Forward 10 Seconds
// //                               IconButton(
// //                                 icon: Icon(Icons.forward_10,
// //                                     color: Colors.white, size: 30),
// //                                 onPressed: () {
// //                                   final newPosition = _controller
// //                                       .value.position +
// //                                       Duration(seconds: 10);
// //                                   _controller.seekTo(newPosition <=
// //                                       _controller.value.duration
// //                                       ? newPosition
// //                                       : _controller.value.duration);
// //                                 },
// //                               ),
// //                             ],
// //                           ),
// //                         ],
// //                       ),
// //                     ),
// //                   ],
// //                 ),
// //               ),
// //             ),
// //         ],
// //       ),
// //     );
// //   }
// //
// //   @override
// //   void dispose() {
// //     _controller.dispose();
// //     super.dispose();
// //   }
// // }
//
//
// class VideoCard extends StatefulWidget {
//   final String videoUrl;
//
//   VideoCard({required this.videoUrl});
//
//   @override
//   _VideoCardState createState() => _VideoCardState();
// }
//
// class _VideoCardState extends State<VideoCard> {
//   late VideoPlayerController _controller;
//   bool _isControlsVisible = true;
//   bool _isDragging = false;
//   double _sliderValue = 0.0;
//
//   @override
//   void initState() {
//     super.initState();
//     _controller = VideoPlayerController.network(
//       widget.videoUrl, // Use the dynamic video URL
//     )
//       ..initialize().then((_) {
//         setState(() {});
//       })
//       ..setLooping(false);
//
//     // Listen to video position updates
//     _controller.addListener(() {
//       if (!_isDragging && _controller.value.isInitialized) {
//         setState(() {
//           _sliderValue =
//               _controller.value.position.inSeconds.toDouble();
//         });
//       }
//     });
//   }
//
//   void _toggleControls() {
//     setState(() {
//       _isControlsVisible = !_isControlsVisible;
//     });
//   }
//
//   String _formatDuration(Duration duration) {
//     // Formats duration to mm:ss
//     String twoDigits(int n) => n.toString().padLeft(2, '0');
//     String twoDigitMinutes =
//     twoDigits(duration.inMinutes.remainder(60));
//     String twoDigitSeconds =
//     twoDigits(duration.inSeconds.remainder(60));
//     return "$twoDigitMinutes:$twoDigitSeconds";
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     final totalDuration =
//     _controller.value.isInitialized ? _controller.value.duration : Duration.zero;
//     final currentPosition =
//     _controller.value.isInitialized ? _controller.value.position : Duration.zero;
//     final remainingDuration = totalDuration - currentPosition;
//
//     return GestureDetector(
//       onTap: _toggleControls,
//       child: Stack(
//         children: [
//           // Video Player
//           _controller.value.isInitialized
//               ? SizedBox.expand(
//             child: FittedBox(
//               fit: BoxFit.cover, // Adjust this to BoxFit.fitWidth or BoxFit.fitHeight if needed
//               child: SizedBox(
//                 width: _controller.value.size?.width ?? 0,
//                 height: _controller.value.size?.height ?? 0,
//                 child: VideoPlayer(_controller),
//               ),
//             ),
//           )
//               : Center(child: CircularProgressIndicator()),
//           // Overlay Controls
//           if (_isControlsVisible)
//             Positioned.fill(
//               child: Container(
//                 color: Colors.black45,
//                 child: Column(
//                   mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                   children: [
//                     // Top Controls (optional, can be used for title or other controls)
//                     SizedBox(height: 10),
//                     // Middle Controls (Play/Pause)
//                     Expanded(
//                       child: Center(
//                         child: IconButton(
//                           icon: Icon(
//                             _controller.value.isPlaying
//                                 ? Icons.pause_circle_filled
//                                 : Icons.play_circle_filled,
//                             color: Colors.white,
//                             size: 60,
//                           ),
//                           onPressed: () {
//                             setState(() {
//                               _controller.value.isPlaying
//                                   ? _controller.pause()
//                                   : _controller.play();
//                             });
//                           },
//                         ),
//                       ),
//                     ),
//                     // Bottom Controls (Rewind, Progress Bar, Forward)
//                     Container(
//                       color: Colors.black54,
//                       padding:
//                       EdgeInsets.symmetric(horizontal: 10.0, vertical: 5.0),
//                       child: Column(
//                         children: [
//                           // Progress Bar
//                           _controller.value.isInitialized
//                               ? Column(
//                             children: [
//                               Slider(
//                                 value: _sliderValue,
//                                 min: 0.0,
//                                 max: totalDuration.inSeconds.toDouble(),
//                                 activeColor: Colors.blue,
//                                 inactiveColor: Colors.white54,
//                                 onChanged: (value) {
//                                   setState(() {
//                                     _isDragging = true;
//                                     _sliderValue = value;
//                                   });
//                                 },
//                                 onChangeEnd: (value) {
//                                   setState(() {
//                                     _controller.seekTo(
//                                         Duration(seconds: value.toInt()));
//                                     _isDragging = false;
//                                   });
//                                 },
//                               ),
//                               // Time Display
//                               Row(
//                                 mainAxisAlignment:
//                                 MainAxisAlignment.spaceBetween,
//                                 children: [
//                                   // Current Time
//                                   Text(
//                                     _formatDuration(currentPosition),
//                                     style: TextStyle(
//                                         color: Colors.white, fontSize: 12),
//                                   ),
//                                   // Remaining Time
//                                   Text(
//                                     '-${_formatDuration(remainingDuration)}',
//                                     style: TextStyle(
//                                         color: Colors.white, fontSize: 12),
//                                   ),
//                                 ],
//                               ),
//                             ],
//                           )
//                               : Container(),
//                           // Rewind, Play/Pause, Forward Buttons
//                           Row(
//                             mainAxisAlignment: MainAxisAlignment.spaceEvenly,
//                             children: [
//                               // Rewind 10 Seconds
//                               IconButton(
//                                 icon: Icon(Icons.replay_10,
//                                     color: Colors.white, size: 30),
//                                 onPressed: () {
//                                   final newPosition = _controller
//                                       .value.position -
//                                       Duration(seconds: 10);
//                                   _controller.seekTo(newPosition >= Duration.zero
//                                       ? newPosition
//                                       : Duration.zero);
//                                 },
//                               ),
//                               // Play/Pause Button
//                               IconButton(
//                                 icon: Icon(
//                                   _controller.value.isPlaying
//                                       ? Icons.pause
//                                       : Icons.play_arrow,
//                                   color: Colors.white,
//                                   size: 30,
//                                 ),
//                                 onPressed: () {
//                                   setState(() {
//                                     _controller.value.isPlaying
//                                         ? _controller.pause()
//                                         : _controller.play();
//                                   });
//                                 },
//                               ),
//                               // Forward 10 Seconds
//                               IconButton(
//                                 icon: Icon(Icons.forward_10,
//                                     color: Colors.white, size: 30),
//                                 onPressed: () {
//                                   final newPosition = _controller
//                                       .value.position +
//                                       Duration(seconds: 10);
//                                   _controller.seekTo(newPosition <=
//                                       _controller.value.duration
//                                       ? newPosition
//                                       : _controller.value.duration);
//                                 },
//                               ),
//                             ],
//                           ),
//                         ],
//                       ),
//                     ),
//                   ],
//                 ),
//               ),
//             ),
//         ],
//       ),
//     );
//   }
//
//   @override
//   void dispose() {
//     _controller.dispose();
//     super.dispose();
//   }
// }
//
// import 'package:flutter/material.dart';
// import 'package:video_player/video_player.dart';
// import 'package:intl/intl.dart'; // For formatting duration
//
// void main() {
//   runApp(TutorDetailsContent());
// }
//
// class TutorDetailsContent extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       title: 'Tutor Details',
//       debugShowCheckedModeBanner: false,
//       theme: ThemeData(
//         primarySwatch: Colors.blue, // Changed primary color to blue
//         hintColor: Colors.deepOrange,
//         scaffoldBackgroundColor: Colors.grey[50],
//         textTheme: TextTheme(
//           titleLarge: TextStyle(
//               fontSize: 20.0,
//               fontWeight: FontWeight.bold,
//               color: Colors.blue[800]), // Changed to blue
//           bodyMedium: TextStyle(fontSize: 16.0, color: Colors.grey[800]),
//           titleMedium: TextStyle(
//               fontSize: 18.0,
//               fontWeight: FontWeight.w600,
//               color: Colors.blue[700]), // Changed to blue
//         ),
//         buttonTheme: ButtonThemeData(
//           buttonColor: Colors.blue, // Changed button color to blue
//           textTheme: ButtonTextTheme.primary,
//         ),
//       ),
//       home: TutorDetailsPage(),
//     );
//   }
// }
//
// class TutorDetailsPage extends StatefulWidget {
//   @override
//   _TutorDetailsPageState createState() => _TutorDetailsPageState();
// }
//
// class _TutorDetailsPageState extends State<TutorDetailsPage> {
//   // Dummy Data
//   final String tutorName = "Dinesh Adhikari";
//   final String address = "Kathmandu";
//   final String description =
//       "Highly experienced tutor in Business English, IELTS, and SAT prep. Passionate about helping students achieve their academic and professional goals.";
//   final String educationDetails =
//       "Master's in Computer Science from XYZ University.";
//   final List<String> languages = ["English", "Nepali"];
//   final List<String> specialties = [
//     "Business English",
//     "IELTS",
//     "SAT",
//     "Programming in Java"
//   ];
//   final String interests = "Passionate about teaching and making learning fun.";
//   final String teachingExperience = "5 years of experience.";
//
//   // New Dummy Image URL
//   final String tutorImage =
//       "https://images.unsplash.com/photo-1527980965255-d3b416303d12?ixlib=rb-4.0.3&auto=format&fit=crop&w=800&q=80";
//
//   bool showRateButton = false;
//
//   // Dummy Video URLs (Simulating database fetched data)
//   final List<String> videoUrls = [
//     // Replace with actual video URLs or keep dummy for now
//     'https://www.learningcontainer.com/wp-content/uploads/2020/05/sample-mp4-file.mp4',
//     // Add more URLs if needed
//   ];
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         backgroundColor: Colors.white, // Set AppBar background to white
//         title: Text(
//           'Tutor Details',
//           style: TextStyle(color: Colors.blue), // Set title color to blue
//         ),
//         centerTitle: true,
//         leading: IconButton(
//           icon: Icon(Icons.arrow_back, color: Colors.blue), // Set back button color to blue
//           onPressed: () {
//             Navigator.pop(context);
//           },
//         ),
//         elevation: 1, // Optional: Add slight shadow for better visibility
//       ),
//       body: SingleChildScrollView(
//         child: Padding(
//           padding:
//           const EdgeInsets.symmetric(horizontal: 20.0, vertical: 16.0),
//           child: Column(
//             crossAxisAlignment: CrossAxisAlignment.center,
//             children: [
//               // Profile Photo with NetworkImage
//               CircleAvatar(
//                 radius: 60,
//                 backgroundImage: NetworkImage(tutorImage),
//                 backgroundColor: Colors.transparent,
//                 onBackgroundImageError: (exception, stackTrace) {
//                   // Handle image loading error
//                   // Optionally, set a default image or display an error message
//                 },
//               ),
//               SizedBox(height: 10),
//               // Name and Rating
//               Row(
//                 mainAxisAlignment: MainAxisAlignment.center,
//                 children: [
//                   Text(
//                     tutorName,
//                     style: Theme.of(context).textTheme.titleLarge,
//                   ),
//                   SizedBox(width: 8),
//                   Row(
//                     children: [
//                       Icon(Icons.star, color: Colors.amber, size: 20),
//                       SizedBox(width: 4),
//                       Text(
//                         '5.0',
//                         style:
//                         TextStyle(fontSize: 16, color: Colors.grey[800]),
//                       ),
//                     ],
//                   ),
//                 ],
//               ),
//               SizedBox(height: 4),
//               // Address
//               Text(
//                 address,
//                 style: TextStyle(color: Colors.grey[600], fontSize: 14),
//               ),
//               SizedBox(height: 20),
//               // "Book Now" Button Positioned Above Other Buttons
//               SizedBox(
//                 width: double.infinity,
//                 child: ElevatedButton(
//                   onPressed: () {
//                     _showBookingDialog(context);
//                   },
//                   style: ElevatedButton.styleFrom(
//                     foregroundColor: Colors.white,
//                     backgroundColor: Colors.blue, // Blue button
//                     padding:
//                     EdgeInsets.symmetric(horizontal: 20, vertical: 12),
//                     shape: RoundedRectangleBorder(
//                       borderRadius: BorderRadius.circular(30.0),
//                     ),
//                     elevation: 5,
//                   ),
//                   child: Text('Book Now', style: TextStyle(fontSize: 16)),
//                 ),
//               ),
//               SizedBox(height: 20),
//               // Action Buttons: Report, Rate, Comment with Labels and Consistent Spacing
//               Row(
//                 mainAxisAlignment: MainAxisAlignment.spaceEvenly,
//                 children: [
//                   // Report Button with Label
//                   Column(
//                     children: [
//                       IconButton(
//                         icon: Icon(Icons.report, color: Colors.deepOrange),
//                         onPressed: () {
//                           _showReportDialog(context);
//                         },
//                       ),
//                       Text(
//                         'Report',
//                         style: TextStyle(
//                           color: Colors.deepOrange,
//                           fontSize: 12,
//                         ),
//                       ),
//                     ],
//                   ),
//                   // Rate Button with Label (conditionally shown)
//                   if (showRateButton)
//                     Column(
//                       children: [
//                         IconButton(
//                           icon: Icon(Icons.rate_review, color: Colors.blue),
//                           onPressed: () {
//                             _showRateDialog(context);
//                           },
//                         ),
//                         Text(
//                           'Rate',
//                           style: TextStyle(
//                             color: Colors.blue,
//                             fontSize: 12,
//                           ),
//                         ),
//                       ],
//                     ),
//                   // Comment Button with Label
//                   Column(
//                     children: [
//                       IconButton(
//                         icon: Icon(Icons.comment, color: Colors.blue),
//                         onPressed: () {
//                           Navigator.push(
//                             context,
//                             MaterialPageRoute(
//                                 builder: (context) => CommentPage()),
//                           );
//                         },
//                       ),
//                       Text(
//                         'Comment',
//                         style: TextStyle(
//                           color: Colors.blue,
//                           fontSize: 12,
//                         ),
//                       ),
//                     ],
//                   ),
//                 ],
//               ),
//               SizedBox(height: 20),
//               // Description
//               Align(
//                 alignment: Alignment.centerLeft,
//                 child: Text(
//                   'About',
//                   style: Theme.of(context).textTheme.titleMedium,
//                 ),
//               ),
//               SizedBox(height: 5),
//               Text(
//                 description,
//                 style: Theme.of(context).textTheme.bodyMedium,
//                 textAlign: TextAlign.justify,
//               ),
//               SizedBox(height: 25),
//               // Video Section
//               Align(
//                 alignment: Alignment.centerLeft,
//                 child: Text(
//                   'Introduction Video',
//                   style: Theme.of(context).textTheme.titleMedium,
//                 ),
//               ),
//               SizedBox(height: 10),
//               // Constrain video width to screen width and allow dynamic height
//               Container(
//                 width: double.infinity,
//                 child: VideoCard(videoUrl: videoUrls[0]),
//               ),
//               SizedBox(height: 25),
//               // Education Section
//               Align(
//                 alignment: Alignment.centerLeft,
//                 child: Text(
//                   'Education',
//                   style: Theme.of(context).textTheme.titleMedium,
//                 ),
//               ),
//               SizedBox(height: 5),
//               Text(
//                 educationDetails,
//                 style: Theme.of(context).textTheme.bodyMedium,
//               ),
//               SizedBox(height: 25),
//               // Languages Section
//               Align(
//                 alignment: Alignment.centerLeft,
//                 child: Text(
//                   'Languages',
//                   style: Theme.of(context).textTheme.titleMedium,
//                 ),
//               ),
//               SizedBox(height: 5),
//               Wrap(
//                 spacing: 10,
//                 children: languages
//                     .map(
//                       (language) => Chip(
//                     label: Text(language),
//                     backgroundColor: Colors.blue[50],
//                     avatar: Icon(
//                       Icons.language,
//                       size: 20,
//                       color: Colors.blue,
//                     ),
//                   ),
//                 )
//                     .toList(),
//               ),
//               SizedBox(height: 25),
//               // Specialties Section
//               Align(
//                 alignment: Alignment.centerLeft,
//                 child: Text(
//                   'Specialties',
//                   style: Theme.of(context).textTheme.titleMedium,
//                 ),
//               ),
//               SizedBox(height: 5),
//               Wrap(
//                 spacing: 10,
//                 children: specialties
//                     .map(
//                       (specialty) => Chip(
//                     label: Text(specialty),
//                     backgroundColor: Colors.blue[50],
//                     avatar: Icon(
//                       Icons.star,
//                       size: 20,
//                       color: Colors.blue,
//                     ),
//                   ),
//                 )
//                     .toList(),
//               ),
//               SizedBox(height: 25),
//               // Interests Section
//               Align(
//                 alignment: Alignment.centerLeft,
//                 child: Text(
//                   'Interests',
//                   style: Theme.of(context).textTheme.titleMedium,
//                 ),
//               ),
//               SizedBox(height: 5),
//               Text(
//                 interests,
//                 style: Theme.of(context).textTheme.bodyMedium,
//               ),
//               SizedBox(height: 25),
//               // Teaching Experience Section
//               Align(
//                 alignment: Alignment.centerLeft,
//                 child: Text(
//                   'Teaching Experience',
//                   style: Theme.of(context).textTheme.titleMedium,
//                 ),
//               ),
//               SizedBox(height: 5),
//               Text(
//                 teachingExperience,
//                 style: Theme.of(context).textTheme.bodyMedium,
//               ),
//               SizedBox(height: 30),
//             ],
//           ),
//         ),
//       ),
//     );
//   }
//
//   void _showBookingDialog(BuildContext context) {
//     showDialog(
//       context: context,
//       builder: (context) {
//         return AlertDialog(
//           title: Text('Confirm Booking'),
//           content: Text('Are you sure you want to book this tutor?'),
//           actions: [
//             TextButton(
//               onPressed: () {
//                 Navigator.pop(context);
//               },
//               child:
//               Text('Cancel', style: TextStyle(color: Colors.grey[700])),
//             ),
//             ElevatedButton(
//               onPressed: () {
//                 setState(() {
//                   showRateButton = true; // Show Rate button after booking
//                 });
//                 Navigator.pop(context);
//                 ScaffoldMessenger.of(context).showSnackBar(
//                   SnackBar(content: Text('Booking Confirmed!')),
//                 );
//               },
//               style: ElevatedButton.styleFrom(backgroundColor: Colors.blue),
//               child: Text('Yes'),
//             ),
//           ],
//         );
//       },
//     );
//   }
//
//   void _showReportDialog(BuildContext context) {
//     TextEditingController reportController = TextEditingController();
//
//     showDialog(
//       context: context,
//       builder: (context) {
//         return AlertDialog(
//           title: Text('Report Tutor'),
//           content: TextField(
//             controller: reportController,
//             decoration: InputDecoration(
//               hintText: 'Enter your report here...',
//               border: OutlineInputBorder(),
//             ),
//             maxLines: 5,
//           ),
//           actions: [
//             TextButton(
//               onPressed: () {
//                 Navigator.pop(context);
//               },
//               child:
//               Text('Cancel', style: TextStyle(color: Colors.grey[700])),
//             ),
//             ElevatedButton(
//               onPressed: () {
//                 // Implement report submission logic here
//                 Navigator.pop(context);
//                 ScaffoldMessenger.of(context).showSnackBar(
//                   SnackBar(content: Text('Report Submitted')),
//                 );
//               },
//               style: ElevatedButton.styleFrom(
//                   backgroundColor: Colors.deepOrange),
//               child: Text('Submit'),
//             ),
//           ],
//         );
//       },
//     );
//   }
//
//   void _showRateDialog(BuildContext context) {
//     double _currentRating = 5.0;
//
//     showDialog(
//       context: context,
//       builder: (context) {
//         return AlertDialog(
//           title: Text('Rate this Tutor'),
//           content: Column(
//             mainAxisSize: MainAxisSize.min,
//             children: [
//               Text('Please provide your rating below:'),
//               SizedBox(height: 20),
//               StatefulBuilder(
//                 builder: (context, setState) {
//                   return Slider(
//                     value: _currentRating,
//                     min: 1,
//                     max: 5,
//                     divisions: 4,
//                     label: _currentRating.round().toString(),
//                     onChanged: (double value) {
//                       setState(() {
//                         _currentRating = value;
//                       });
//                     },
//                     activeColor:
//                     Colors.blue, // Changed slider active color to blue
//                     inactiveColor: Colors.blue[100],
//                   );
//                 },
//               ),
//             ],
//           ),
//           actions: [
//             TextButton(
//               onPressed: () {
//                 Navigator.pop(context);
//               },
//               child:
//               Text('Cancel', style: TextStyle(color: Colors.grey[700])),
//             ),
//             ElevatedButton(
//               onPressed: () {
//                 // Implement rating submission logic here
//                 Navigator.pop(context);
//                 ScaffoldMessenger.of(context).showSnackBar(
//                   SnackBar(content: Text('Thank you for your rating!')),
//                 );
//               },
//               style: ElevatedButton.styleFrom(backgroundColor: Colors.blue),
//               child: Text('Submit'),
//             ),
//           ],
//         );
//       },
//     );
//   }
// }
//
// class CommentPage extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     // Dummy comments data
//     final List<String> comments = [
//       "Great tutor! Helped me improve my English significantly.",
//       "Very patient and knowledgeable.",
//       "Highly recommended for IELTS preparation.",
//     ];
//
//     return Scaffold(
//       appBar: AppBar(
//         backgroundColor: Colors.white, // Set AppBar background to white
//         title: Text(
//           'Comments',
//           style: TextStyle(color: Colors.blue), // Set title color to blue
//         ),
//         centerTitle: true,
//         leading: IconButton(
//           icon: Icon(Icons.arrow_back, color: Colors.blue), // Set back button color to blue
//           onPressed: () {
//             Navigator.pop(context);
//           },
//         ),
//         elevation: 1, // Optional: Add slight shadow for better visibility
//       ),
//       body: Padding(
//         padding: const EdgeInsets.all(16.0),
//         child: Column(
//           children: [
//             // Existing Comments
//             Expanded(
//               child: ListView.builder(
//                 itemCount: comments.length,
//                 itemBuilder: (context, index) {
//                   return Card(
//                     elevation: 2,
//                     margin: EdgeInsets.symmetric(vertical: 8),
//                     child: ListTile(
//                       leading: CircleAvatar(
//                         backgroundColor:
//                         Colors.blue, // Changed avatar color to blue
//                         child: Icon(Icons.person, color: Colors.white),
//                       ),
//                       title: Text('User ${index + 1}'),
//                       subtitle: Text(comments[index]),
//                     ),
//                   );
//                 },
//               ),
//             ),
//             // Add Comment Field
//             TextField(
//               decoration: InputDecoration(
//                 hintText: 'Add a comment...',
//                 prefixIcon:
//                 Icon(Icons.comment, color: Colors.blue), // Blue icon
//                 border: OutlineInputBorder(
//                   borderRadius: BorderRadius.circular(30.0),
//                 ),
//               ),
//               maxLines: 2,
//             ),
//             SizedBox(height: 10),
//             ElevatedButton.icon(
//               onPressed: () {
//                 // Implement add comment functionality
//                 ScaffoldMessenger.of(context).showSnackBar(
//                   SnackBar(content: Text('Comment Added')),
//                 );
//               },
//               icon: Icon(Icons.send),
//               label: Text('Submit'),
//               style: ElevatedButton.styleFrom(
//                 backgroundColor: Colors.blue, // Blue button
//                 shape: RoundedRectangleBorder(
//                   borderRadius: BorderRadius.circular(30.0),
//                 ),
//                 padding:
//                 EdgeInsets.symmetric(horizontal: 20, vertical: 12),
//               ),
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }
//
// class VideoCard extends StatefulWidget {
//   final String videoUrl;
//
//   VideoCard({required this.videoUrl});
//
//   @override
//   _VideoCardState createState() => _VideoCardState();
// }
//
// class _VideoCardState extends State<VideoCard> {
//   late VideoPlayerController _controller;
//   bool _isControlsVisible = true;
//   bool _isDragging = false;
//   double _sliderValue = 0.0;
//
//   @override
//   void initState() {
//     super.initState();
//     _controller = VideoPlayerController.network(
//       widget.videoUrl, // Use the dynamic video URL
//     )
//       ..initialize().then((_) {
//         setState(() {});
//       })
//       ..setLooping(false);
//
//     // Listen to video position updates
//     _controller.addListener(() {
//       if (!_isDragging && _controller.value.isInitialized) {
//         setState(() {
//           _sliderValue = _controller.value.position.inSeconds.toDouble();
//         });
//       }
//     });
//   }
//
//   void _toggleControls() {
//     setState(() {
//       _isControlsVisible = !_isControlsVisible;
//     });
//   }
//
//   String _formatDuration(Duration duration) {
//     // Formats duration to mm:ss
//     String twoDigits(int n) => n.toString().padLeft(2, '0');
//     String twoDigitMinutes =
//     twoDigits(duration.inMinutes.remainder(60));
//     String twoDigitSeconds =
//     twoDigits(duration.inSeconds.remainder(60));
//     return "$twoDigitMinutes:$twoDigitSeconds";
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     final totalDuration =
//     _controller.value.isInitialized ? _controller.value.duration : Duration.zero;
//     final currentPosition =
//     _controller.value.isInitialized ? _controller.value.position : Duration.zero;
//     final remainingDuration = totalDuration - currentPosition;
//
//     return GestureDetector(
//       onTap: _toggleControls,
//       child: Stack(
//         children: [
//           // Video Player with Dynamic Aspect Ratio
//           _controller.value.isInitialized
//               ? AspectRatio(
//             aspectRatio: _controller.value.aspectRatio,
//             child: VideoPlayer(_controller),
//           )
//               : Container(
//             height: 200, // Placeholder height while loading
//             child: Center(child: CircularProgressIndicator()),
//           ),
//           // Overlay Controls
//           if (_isControlsVisible)
//             Positioned.fill(
//               child: Container(
//                 color: Colors.black45,
//                 child: Column(
//                   mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                   children: [
//                     // Top Controls (optional, can be used for title or other controls)
//                     SizedBox(height: 10),
//                     // Middle Controls (Play/Pause)
//                     Expanded(
//                       child: Center(
//                         child: IconButton(
//                           icon: Icon(
//                             _controller.value.isPlaying
//                                 ? Icons.pause_circle_filled
//                                 : Icons.play_circle_filled,
//                             color: Colors.white,
//                             size: 60,
//                           ),
//                           onPressed: () {
//                             setState(() {
//                               _controller.value.isPlaying
//                                   ? _controller.pause()
//                                   : _controller.play();
//                             });
//                           },
//                         ),
//                       ),
//                     ),
//                     // Bottom Controls (Rewind, Progress Bar, Forward)
//                     Container(
//                       color: Colors.black54,
//                       padding:
//                       EdgeInsets.symmetric(horizontal: 10.0, vertical: 5.0),
//                       child: Column(
//                         children: [
//                           // Progress Bar
//                           _controller.value.isInitialized
//                               ? Column(
//                             children: [
//                               Slider(
//                                 value: _sliderValue,
//                                 min: 0.0,
//                                 max: totalDuration.inSeconds.toDouble(),
//                                 activeColor: Colors.blue,
//                                 inactiveColor: Colors.white54,
//                                 onChanged: (value) {
//                                   setState(() {
//                                     _isDragging = true;
//                                     _sliderValue = value;
//                                   });
//                                 },
//                                 onChangeEnd: (value) {
//                                   setState(() {
//                                     _controller.seekTo(
//                                         Duration(seconds: value.toInt()));
//                                     _isDragging = false;
//                                   });
//                                 },
//                               ),
//                               // Time Display
//                               Row(
//                                 mainAxisAlignment:
//                                 MainAxisAlignment.spaceBetween,
//                                 children: [
//                                   // Current Time
//                                   Text(
//                                     _formatDuration(currentPosition),
//                                     style: TextStyle(
//                                         color: Colors.white, fontSize: 12),
//                                   ),
//                                   // Remaining Time
//                                   Text(
//                                     '-${_formatDuration(remainingDuration)}',
//                                     style: TextStyle(
//                                         color: Colors.white, fontSize: 12),
//                                   ),
//                                 ],
//                               ),
//                             ],
//                           )
//                               : Container(),
//                           // Rewind, Play/Pause, Forward Buttons
//                           Row(
//                             mainAxisAlignment: MainAxisAlignment.spaceEvenly,
//                             children: [
//                               // Rewind 10 Seconds
//                               IconButton(
//                                 icon: Icon(Icons.replay_10,
//                                     color: Colors.white, size: 30),
//                                 onPressed: () {
//                                   final newPosition = _controller
//                                       .value.position -
//                                       Duration(seconds: 10);
//                                   _controller.seekTo(newPosition >= Duration.zero
//                                       ? newPosition
//                                       : Duration.zero);
//                                 },
//                               ),
//                               // Play/Pause Button
//                               IconButton(
//                                 icon: Icon(
//                                   _controller.value.isPlaying
//                                       ? Icons.pause
//                                       : Icons.play_arrow,
//                                   color: Colors.white,
//                                   size: 30,
//                                 ),
//                                 onPressed: () {
//                                   setState(() {
//                                     _controller.value.isPlaying
//                                         ? _controller.pause()
//                                         : _controller.play();
//                                   });
//                                 },
//                               ),
//                               // Forward 10 Seconds
//                               IconButton(
//                                 icon: Icon(Icons.forward_10,
//                                     color: Colors.white, size: 30),
//                                 onPressed: () {
//                                   final newPosition = _controller
//                                       .value.position +
//                                       Duration(seconds: 10);
//                                   _controller.seekTo(newPosition <=
//                                       _controller.value.duration
//                                       ? newPosition
//                                       : _controller.value.duration);
//                                 },
//                               ),
//                             ],
//                           ),
//                         ],
//                       ),
//                     ),
//                   ],
//                 ),
//               ),
//             ),
//         ],
//       ),
//     );
//   }
//
//   @override
//   void dispose() {
//     _controller.dispose();
//     super.dispose();
//   }
// }


// import 'package:flutter/material.dart';
// import 'package:video_player/video_player.dart';
// import 'package:intl/intl.dart'; // For formatting duration
//
// void main() {
//   runApp(TutorDetailsContent());
// }
//
// class TutorDetailsContent extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       title: 'Tutor Details',
//       debugShowCheckedModeBanner: false,
//       theme: ThemeData(
//         primarySwatch: Colors.blue, // Changed primary color to blue
//         hintColor: Colors.deepOrange,
//         scaffoldBackgroundColor: Colors.grey[50],
//         textTheme: TextTheme(
//           titleLarge: TextStyle(
//               fontSize: 20.0,
//               fontWeight: FontWeight.bold,
//               color: Colors.blue[800]), // Changed to blue
//           bodyMedium: TextStyle(fontSize: 16.0, color: Colors.grey[800]),
//           titleMedium: TextStyle(
//               fontSize: 18.0,
//               fontWeight: FontWeight.w600,
//               color: Colors.blue[700]), // Changed to blue
//         ),
//         buttonTheme: ButtonThemeData(
//           buttonColor: Colors.blue, // Changed button color to blue
//           textTheme: ButtonTextTheme.primary,
//         ),
//       ),
//       home: TutorDetailsPage(),
//     );
//   }
// }
//
// class TutorDetailsPage extends StatefulWidget {
//   @override
//   _TutorDetailsPageState createState() => _TutorDetailsPageState();
// }
//
// class _TutorDetailsPageState extends State<TutorDetailsPage> {
//   // Dummy Data
//   final String tutorName = "Dinesh Adhikari";
//   final String address = "Kathmandu";
//   final String description =
//       "Highly experienced tutor in Business English, IELTS, and SAT prep. Passionate about helping students achieve their academic and professional goals.";
//   final String educationDetails =
//       "Master's in Computer Science from XYZ University.";
//   final List<String> languages = ["English", "Nepali"];
//   final List<String> specialties = [
//     "Business English",
//     "IELTS",
//     "SAT",
//     "Programming in Java"
//   ];
//   final String interests = "Passionate about teaching and making learning fun.";
//   final String teachingExperience = "5 years of experience.";
//
//   // New Dummy Image URL
//   final String tutorImage =
//       "https://images.unsplash.com/photo-1527980965255-d3b416303d12?ixlib=rb-4.0.3&auto=format&fit=crop&w=800&q=80";
//
//   bool hasBookedTutor = false; // New booking state variable
//
//   // Dummy Video URLs (Simulating database fetched data)
//   final List<String> videoUrls = [
//     // Replace with actual video URLs or keep dummy for now
//     'https://www.learningcontainer.com/wp-content/uploads/2020/05/sample-mp4-file.mp4',
//     // Add more URLs if needed
//   ];
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         backgroundColor: Colors.white, // Set AppBar background to white
//         title: Text(
//           'Tutor Details',
//           style: TextStyle(color: Colors.blue), // Set title color to blue
//         ),
//         centerTitle: true,
//         leading: IconButton(
//           icon: Icon(Icons.arrow_back, color: Colors.blue), // Set back button color to blue
//           onPressed: () {
//             Navigator.pop(context);
//           },
//         ),
//         elevation: 1, // Optional: Add slight shadow for better visibility
//       ),
//       body: SingleChildScrollView(
//         child: Padding(
//           padding:
//           const EdgeInsets.symmetric(horizontal: 20.0, vertical: 16.0),
//           child: Column(
//             crossAxisAlignment: CrossAxisAlignment.center,
//             children: [
//               // Profile Photo with NetworkImage
//               CircleAvatar(
//                 radius: 60,
//                 backgroundImage: NetworkImage(tutorImage),
//                 backgroundColor: Colors.transparent,
//                 onBackgroundImageError: (exception, stackTrace) {
//                   // Handle image loading error
//                   // Optionally, set a default image or display an error message
//                 },
//               ),
//               SizedBox(height: 10),
//               // Name and Rating
//               Row(
//                 mainAxisAlignment: MainAxisAlignment.center,
//                 children: [
//                   Text(
//                     tutorName,
//                     style: Theme.of(context).textTheme.titleLarge,
//                   ),
//                   SizedBox(width: 8),
//                   Row(
//                     children: [
//                       Icon(Icons.star, color: Colors.amber, size: 20),
//                       SizedBox(width: 4),
//                       Text(
//                         '5.0',
//                         style:
//                         TextStyle(fontSize: 16, color: Colors.grey[800]),
//                       ),
//                     ],
//                   ),
//                 ],
//               ),
//               SizedBox(height: 4),
//               // Address
//               Text(
//                 address,
//                 style: TextStyle(color: Colors.grey[600], fontSize: 14),
//               ),
//               SizedBox(height: 20),
//               // "Book Now" Button Positioned Above Other Buttons
//               SizedBox(
//                 width: double.infinity,
//                 child: ElevatedButton(
//                   onPressed: () {
//                     _showBookingDialog(context);
//                   },
//                   style: ElevatedButton.styleFrom(
//                     foregroundColor: Colors.white,
//                     backgroundColor: Colors.blue, // Blue button
//                     padding:
//                     EdgeInsets.symmetric(horizontal: 20, vertical: 12),
//                     shape: RoundedRectangleBorder(
//                       borderRadius: BorderRadius.circular(30.0),
//                     ),
//                     elevation: 5,
//                   ),
//                   child: Text('Book Now', style: TextStyle(fontSize: 16)),
//                 ),
//               ),
//               SizedBox(height: 20),
//               // Action Buttons: Report, Rate, Comment with Labels and Consistent Spacing
//               Row(
//                 mainAxisAlignment: MainAxisAlignment.spaceEvenly,
//                 children: [
//                   // Report Button with Label (conditionally shown)
//                   if (hasBookedTutor)
//                     Column(
//                       children: [
//                         IconButton(
//                           icon: Icon(Icons.report, color: Colors.deepOrange),
//                           onPressed: () {
//                             _showReportDialog(context);
//                           },
//                         ),
//                         Text(
//                           'Report',
//                           style: TextStyle(
//                             color: Colors.deepOrange,
//                             fontSize: 12,
//                           ),
//                         ),
//                       ],
//                     ),
//                   // Rate Button with Label (conditionally shown)
//                   if (hasBookedTutor)
//                     Column(
//                       children: [
//                         IconButton(
//                           icon: Icon(Icons.rate_review, color: Colors.blue),
//                           onPressed: () {
//                             _showRateDialog(context);
//                           },
//                         ),
//                         Text(
//                           'Rate',
//                           style: TextStyle(
//                             color: Colors.blue,
//                             fontSize: 12,
//                           ),
//                         ),
//                       ],
//                     ),
//                   // Comment Button with Label (always shown)
//                   Column(
//                     children: [
//                       IconButton(
//                         icon: Icon(Icons.comment, color: Colors.blue),
//                         onPressed: () {
//                           Navigator.push(
//                             context,
//                             MaterialPageRoute(
//                                 builder: (context) => CommentPage()),
//                           );
//                         },
//                       ),
//                       Text(
//                         'Comment',
//                         style: TextStyle(
//                           color: Colors.blue,
//                           fontSize: 12,
//                         ),
//                       ),
//                     ],
//                   ),
//                 ],
//               ),
//               SizedBox(height: 20),
//               // Description
//               Align(
//                 alignment: Alignment.centerLeft,
//                 child: Text(
//                   'About',
//                   style: Theme.of(context).textTheme.titleMedium,
//                 ),
//               ),
//               SizedBox(height: 5),
//               Text(
//                 description,
//                 style: Theme.of(context).textTheme.bodyMedium,
//                 textAlign: TextAlign.justify,
//               ),
//               SizedBox(height: 25),
//               // Video Section
//               Align(
//                 alignment: Alignment.centerLeft,
//                 child: Text(
//                   'Introduction Video',
//                   style: Theme.of(context).textTheme.titleMedium,
//                 ),
//               ),
//               SizedBox(height: 10),
//               // Constrain video width to screen width and allow dynamic height
//               Container(
//                 width: double.infinity,
//                 child: VideoCard(videoUrl: videoUrls[0]),
//               ),
//               SizedBox(height: 25),
//               // Education Section
//               Align(
//                 alignment: Alignment.centerLeft,
//                 child: Text(
//                   'Education',
//                   style: Theme.of(context).textTheme.titleMedium,
//                 ),
//               ),
//               SizedBox(height: 5),
//               Text(
//                 educationDetails,
//                 style: Theme.of(context).textTheme.bodyMedium,
//               ),
//               SizedBox(height: 25),
//               // Languages Section
//               Align(
//                 alignment: Alignment.centerLeft,
//                 child: Text(
//                   'Languages',
//                   style: Theme.of(context).textTheme.titleMedium,
//                 ),
//               ),
//               SizedBox(height: 5),
//               Wrap(
//                 spacing: 10,
//                 children: languages
//                     .map(
//                       (language) => Chip(
//                     label: Text(language),
//                     backgroundColor: Colors.blue[50],
//                     avatar: Icon(
//                       Icons.language,
//                       size: 20,
//                       color: Colors.blue,
//                     ),
//                   ),
//                 )
//                     .toList(),
//               ),
//               SizedBox(height: 25),
//               // Specialties Section
//               Align(
//                 alignment: Alignment.centerLeft,
//                 child: Text(
//                   'Specialties',
//                   style: Theme.of(context).textTheme.titleMedium,
//                 ),
//               ),
//               SizedBox(height: 5),
//               Wrap(
//                 spacing: 10,
//                 children: specialties
//                     .map(
//                       (specialty) => Chip(
//                     label: Text(specialty),
//                     backgroundColor: Colors.blue[50],
//                     avatar: Icon(
//                       Icons.star,
//                       size: 20,
//                       color: Colors.blue,
//                     ),
//                   ),
//                 )
//                     .toList(),
//               ),
//               SizedBox(height: 25),
//               // Interests Section
//               Align(
//                 alignment: Alignment.centerLeft,
//                 child: Text(
//                   'Interests',
//                   style: Theme.of(context).textTheme.titleMedium,
//                 ),
//               ),
//               SizedBox(height: 5),
//               Text(
//                 interests,
//                 style: Theme.of(context).textTheme.bodyMedium,
//               ),
//               SizedBox(height: 25),
//               // Teaching Experience Section
//               Align(
//                 alignment: Alignment.centerLeft,
//                 child: Text(
//                   'Teaching Experience',
//                   style: Theme.of(context).textTheme.titleMedium,
//                 ),
//               ),
//               SizedBox(height: 5),
//               Text(
//                 teachingExperience,
//                 style: Theme.of(context).textTheme.bodyMedium,
//               ),
//               SizedBox(height: 30),
//             ],
//           ),
//         ),
//       ),
//     );
//   }
//
//   // Function to show the booking confirmation dialog
//   void _showBookingDialog(BuildContext context) {
//     showDialog(
//       context: context,
//       builder: (context) {
//         return AlertDialog(
//           title: Text('Confirm Booking'),
//           content: Text('Are you sure you want to book this tutor?'),
//           actions: [
//             TextButton(
//               onPressed: () {
//                 Navigator.pop(context);
//               },
//               child:
//               Text('Cancel', style: TextStyle(color: Colors.grey[700])),
//             ),
//             ElevatedButton(
//               onPressed: () {
//                 setState(() {
//                   hasBookedTutor = true; // Update booking state
//                 });
//                 Navigator.pop(context);
//                 ScaffoldMessenger.of(context).showSnackBar(
//                   SnackBar(content: Text('Booking Confirmed!')),
//                 );
//               },
//               style: ElevatedButton.styleFrom(backgroundColor: Colors.blue),
//               child: Text('Yes'),
//             ),
//           ],
//         );
//       },
//     );
//   }
//
//   // Function to show the report dialog
//   void _showReportDialog(BuildContext context) {
//     TextEditingController reportController = TextEditingController();
//
//     showDialog(
//       context: context,
//       builder: (context) {
//         return AlertDialog(
//           title: Text('Report Tutor'),
//           content: TextField(
//             controller: reportController,
//             decoration: InputDecoration(
//               hintText: 'Enter your report here...',
//               border: OutlineInputBorder(),
//             ),
//             maxLines: 5,
//           ),
//           actions: [
//             TextButton(
//               onPressed: () {
//                 Navigator.pop(context);
//               },
//               child:
//               Text('Cancel', style: TextStyle(color: Colors.grey[700])),
//             ),
//             ElevatedButton(
//               onPressed: () {
//                 // TODO: Replace with actual report submission logic
//                 Navigator.pop(context);
//                 ScaffoldMessenger.of(context).showSnackBar(
//                   SnackBar(content: Text('Report Submitted')),
//                 );
//               },
//               style: ElevatedButton.styleFrom(backgroundColor: Colors.deepOrange),
//               child: Text('Submit'),
//             ),
//           ],
//         );
//       },
//     );
//   }
//
//   // Function to show the rate dialog
//   void _showRateDialog(BuildContext context) {
//     double _currentRating = 5.0;
//
//     showDialog(
//       context: context,
//       builder: (context) {
//         return AlertDialog(
//           title: Text('Rate this Tutor'),
//           content: Column(
//             mainAxisSize: MainAxisSize.min,
//             children: [
//               Text('Please provide your rating below:'),
//               SizedBox(height: 20),
//               StatefulBuilder(
//                 builder: (context, setState) {
//                   return Slider(
//                     value: _currentRating,
//                     min: 1,
//                     max: 5,
//                     divisions: 4,
//                     label: _currentRating.round().toString(),
//                     onChanged: (double value) {
//                       setState(() {
//                         _currentRating = value;
//                       });
//                     },
//                     activeColor: Colors.blue,
//                     inactiveColor: Colors.blue[100],
//                   );
//                 },
//               ),
//             ],
//           ),
//           actions: [
//             TextButton(
//               onPressed: () {
//                 Navigator.pop(context);
//               },
//               child:
//               Text('Cancel', style: TextStyle(color: Colors.grey[700])),
//             ),
//             ElevatedButton(
//               onPressed: () {
//                 // TODO: Replace with actual rating submission logic
//                 Navigator.pop(context);
//                 ScaffoldMessenger.of(context).showSnackBar(
//                   SnackBar(content: Text('Thank you for your rating!')),
//                 );
//               },
//               style: ElevatedButton.styleFrom(backgroundColor: Colors.blue),
//               child: Text('Submit'),
//             ),
//           ],
//         );
//       },
//     );
//   }
// }
//
// class CommentPage extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     // Dummy comments data
//     final List<String> comments = [
//       "Great tutor! Helped me improve my English significantly.",
//       "Very patient and knowledgeable.",
//       "Highly recommended for IELTS preparation.",
//     ];
//
//     return Scaffold(
//       appBar: AppBar(
//         backgroundColor: Colors.white, // Set AppBar background to white
//         title: Text(
//           'Comments',
//           style: TextStyle(color: Colors.blue), // Set title color to blue
//         ),
//         centerTitle: true,
//         leading: IconButton(
//           icon: Icon(Icons.arrow_back, color: Colors.blue), // Set back button color to blue
//           onPressed: () {
//             Navigator.pop(context);
//           },
//         ),
//         elevation: 1, // Optional: Add slight shadow for better visibility
//       ),
//       body: Padding(
//         padding: const EdgeInsets.all(16.0),
//         child: Column(
//           children: [
//             // Existing Comments
//             Expanded(
//               child: ListView.builder(
//                 itemCount: comments.length,
//                 itemBuilder: (context, index) {
//                   return Card(
//                     elevation: 2,
//                     margin: EdgeInsets.symmetric(vertical: 8),
//                     child: ListTile(
//                       leading: CircleAvatar(
//                         backgroundColor:
//                         Colors.blue, // Changed avatar color to blue
//                         child: Icon(Icons.person, color: Colors.white),
//                       ),
//                       title: Text('User ${index + 1}'),
//                       subtitle: Text(comments[index]),
//                     ),
//                   );
//                 },
//               ),
//             ),
//             // Add Comment Field
//             TextField(
//               decoration: InputDecoration(
//                 hintText: 'Add a comment...',
//                 prefixIcon:
//                 Icon(Icons.comment, color: Colors.blue), // Blue icon
//                 border: OutlineInputBorder(
//                   borderRadius: BorderRadius.circular(30.0),
//                 ),
//               ),
//               maxLines: 2,
//             ),
//             SizedBox(height: 10),
//             ElevatedButton.icon(
//               onPressed: () {
//                 // TODO: Implement add comment functionality
//                 ScaffoldMessenger.of(context).showSnackBar(
//                   SnackBar(content: Text('Comment Added')),
//                 );
//               },
//               icon: Icon(Icons.send),
//               label: Text('Submit'),
//               style: ElevatedButton.styleFrom(
//                 backgroundColor: Colors.blue, // Blue button
//                 shape: RoundedRectangleBorder(
//                   borderRadius: BorderRadius.circular(30.0),
//                 ),
//                 padding:
//                 EdgeInsets.symmetric(horizontal: 20, vertical: 12),
//               ),
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }
//
// class VideoCard extends StatefulWidget {
//   final String videoUrl;
//
//   VideoCard({required this.videoUrl});
//
//   @override
//   _VideoCardState createState() => _VideoCardState();
// }
//
// class _VideoCardState extends State<VideoCard> {
//   late VideoPlayerController _controller;
//   bool _isControlsVisible = true;
//   bool _isDragging = false;
//   double _sliderValue = 0.0;
//
//   @override
//   void initState() {
//     super.initState();
//     _controller = VideoPlayerController.network(
//       widget.videoUrl, // Use the dynamic video URL
//     )
//       ..initialize().then((_) {
//         setState(() {});
//       })
//       ..setLooping(false);
//
//     // Listen to video position updates
//     _controller.addListener(() {
//       if (!_isDragging && _controller.value.isInitialized) {
//         setState(() {
//           _sliderValue = _controller.value.position.inSeconds.toDouble();
//         });
//       }
//     });
//   }
//
//   void _toggleControls() {
//     setState(() {
//       _isControlsVisible = !_isControlsVisible;
//     });
//   }
//
//   String _formatDuration(Duration duration) {
//     // Formats duration to mm:ss
//     String twoDigits(int n) => n.toString().padLeft(2, '0');
//     String twoDigitMinutes =
//     twoDigits(duration.inMinutes.remainder(60));
//     String twoDigitSeconds =
//     twoDigits(duration.inSeconds.remainder(60));
//     return "$twoDigitMinutes:$twoDigitSeconds";
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     final totalDuration =
//     _controller.value.isInitialized ? _controller.value.duration : Duration.zero;
//     final currentPosition =
//     _controller.value.isInitialized ? _controller.value.position : Duration.zero;
//     final remainingDuration = totalDuration - currentPosition;
//
//     return GestureDetector(
//       onTap: _toggleControls,
//       child: Stack(
//         children: [
//           // Video Player with Dynamic Aspect Ratio
//           _controller.value.isInitialized
//               ? AspectRatio(
//             aspectRatio: _controller.value.aspectRatio,
//             child: VideoPlayer(_controller),
//           )
//               : Container(
//             height: 200, // Placeholder height while loading
//             child: Center(child: CircularProgressIndicator()),
//           ),
//           // Overlay Controls
//           if (_isControlsVisible)
//             Positioned.fill(
//               child: Container(
//                 color: Colors.black45,
//                 child: Column(
//                   mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                   children: [
//                     // Top Controls (optional, can be used for title or other controls)
//                     SizedBox(height: 10),
//                     // Middle Controls (Play/Pause)
//                     Expanded(
//                       child: Center(
//                         child: IconButton(
//                           icon: Icon(
//                             _controller.value.isPlaying
//                                 ? Icons.pause_circle_filled
//                                 : Icons.play_circle_filled,
//                             color: Colors.white,
//                             size: 60,
//                           ),
//                           onPressed: () {
//                             setState(() {
//                               _controller.value.isPlaying
//                                   ? _controller.pause()
//                                   : _controller.play();
//                             });
//                           },
//                         ),
//                       ),
//                     ),
//                     // Bottom Controls (Rewind, Progress Bar, Forward)
//                     Container(
//                       color: Colors.black54,
//                       padding: EdgeInsets.symmetric(horizontal: 10.0, vertical: 5.0),
//                       child: Column(
//                         children: [
//                           // Progress Bar
//                           _controller.value.isInitialized
//                               ? Column(
//                             children: [
//                               Slider(
//                                 value: _sliderValue,
//                                 min: 0.0,
//                                 max: totalDuration.inSeconds.toDouble(),
//                                 activeColor: Colors.blue,
//                                 inactiveColor: Colors.white54,
//                                 onChanged: (value) {
//                                   setState(() {
//                                     _isDragging = true;
//                                     _sliderValue = value;
//                                   });
//                                 },
//                                 onChangeEnd: (value) {
//                                   setState(() {
//                                     _controller.seekTo(
//                                         Duration(seconds: value.toInt()));
//                                     _isDragging = false;
//                                   });
//                                 },
//                               ),
//                               // Time Display
//                               Row(
//                                 mainAxisAlignment:
//                                 MainAxisAlignment.spaceBetween,
//                                 children: [
//                                   // Current Time
//                                   Text(
//                                     _formatDuration(currentPosition),
//                                     style: TextStyle(
//                                         color: Colors.white, fontSize: 12),
//                                   ),
//                                   // Remaining Time
//                                   Text(
//                                     '-${_formatDuration(remainingDuration)}',
//                                     style: TextStyle(
//                                         color: Colors.white, fontSize: 12),
//                                   ),
//                                 ],
//                               ),
//                             ],
//                           )
//                               : Container(),
//                           // Rewind, Play/Pause, Forward Buttons
//                           Row(
//                             mainAxisAlignment: MainAxisAlignment.spaceEvenly,
//                             children: [
//                               // Rewind 10 Seconds
//                               IconButton(
//                                 icon: Icon(Icons.replay_10,
//                                     color: Colors.white, size: 30),
//                                 onPressed: () {
//                                   final newPosition = _controller
//                                       .value.position -
//                                       Duration(seconds: 10);
//                                   _controller.seekTo(newPosition >= Duration.zero
//                                       ? newPosition
//                                       : Duration.zero);
//                                 },
//                               ),
//                               // Play/Pause Button
//                               IconButton(
//                                 icon: Icon(
//                                   _controller.value.isPlaying
//                                       ? Icons.pause
//                                       : Icons.play_arrow,
//                                   color: Colors.white,
//                                   size: 30,
//                                 ),
//                                 onPressed: () {
//                                   setState(() {
//                                     _controller.value.isPlaying
//                                         ? _controller.pause()
//                                         : _controller.play();
//                                   });
//                                 },
//                               ),
//                               // Forward 10 Seconds
//                               IconButton(
//                                 icon: Icon(Icons.forward_10,
//                                     color: Colors.white, size: 30),
//                                 onPressed: () {
//                                   final newPosition = _controller
//                                       .value.position +
//                                       Duration(seconds: 10);
//                                   _controller.seekTo(newPosition <=
//                                       _controller.value.duration
//                                       ? newPosition
//                                       : _controller.value.duration);
//                                 },
//                               ),
//                             ],
//                           ),
//                         ],
//                       ),
//                     ),
//                   ],
//                 ),
//               ),
//             ),
//         ],
//       ),
//     );
//   }
//
//   @override
//   void dispose() {
//     _controller.dispose();
//     super.dispose();
//   }
// }
//
// tutor_details_content.dart

// import 'package:flutter/material.dart';
// import 'package:video_player/video_player.dart';
// import 'package:intl/intl.dart'; // For formatting duration
//
// class TutorDetailsContent extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return TutorDetailsPage();
//   }
// }
//
// class TutorDetailsPage extends StatefulWidget {
//   @override
//   _TutorDetailsPageState createState() => _TutorDetailsPageState();
// }
//
// class _TutorDetailsPageState extends State<TutorDetailsPage> {
//   // Dummy Data
//   final String tutorName = "Dinesh Adhikari";
//   final String address = "Kathmandu";
//   final String description =
//       "Highly experienced tutor in Business English, IELTS, and SAT prep. Passionate about helping students achieve their academic and professional goals.";
//   final String educationDetails =
//       "Master's in Computer Science from XYZ University.";
//   final List<String> languages = ["English", "Nepali"];
//   final List<String> specialties = [
//     "Business English",
//     "IELTS",
//     "SAT",
//     "Programming in Java"
//   ];
//   final String interests = "Passionate about teaching and making learning fun.";
//   final String teachingExperience = "5 years of experience.";
//
//   // New Dummy Image URL
//   final String tutorImage =
//       "https://images.unsplash.com/photo-1527980965255-d3b416303d12?ixlib=rb-4.0.3&auto=format&fit=crop&w=800&q=80";
//
//   bool hasBookedTutor = false; // New booking state variable
//
//   // Dummy Video URLs (Simulating database fetched data)
//   final List<String> videoUrls = [
//     // Replace with actual video URLs or keep dummy for now
//     'https://www.learningcontainer.com/wp-content/uploads/2020/05/sample-mp4-file.mp4',
//     // Add more URLs if needed
//   ];
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         backgroundColor: Colors.white, // Set AppBar background to white
//         title: Text(
//           'Tutor Details',
//           style: TextStyle(color: Colors.blue), // Set title color to blue
//         ),
//         centerTitle: true,
//         leading: IconButton(
//           icon: Icon(Icons.arrow_back, color: Colors.blue), // Set back button color to blue
//           onPressed: () {
//             Navigator.pop(context);
//           },
//         ),
//         elevation: 1, // Optional: Add slight shadow for better visibility
//       ),
//       body: SingleChildScrollView(
//         child: Padding(
//           padding:
//           const EdgeInsets.symmetric(horizontal: 20.0, vertical: 16.0),
//           child: Column(
//             crossAxisAlignment: CrossAxisAlignment.center,
//             children: [
//               // Profile Photo with NetworkImage
//               CircleAvatar(
//                 radius: 60,
//                 backgroundImage: NetworkImage(tutorImage),
//                 backgroundColor: Colors.transparent,
//                 onBackgroundImageError: (exception, stackTrace) {
//                   // Handle image loading error
//                   // Optionally, set a default image or display an error message
//                 },
//               ),
//               SizedBox(height: 10),
//               // Name and Rating
//               Row(
//                 mainAxisAlignment: MainAxisAlignment.center,
//                 children: [
//                   Text(
//                     tutorName,
//                     style: Theme.of(context).textTheme.titleLarge,
//                   ),
//                   SizedBox(width: 8),
//                   Row(
//                     children: [
//                       Icon(Icons.star, color: Colors.amber, size: 20),
//                       SizedBox(width: 4),
//                       Text(
//                         '5.0',
//                         style:
//                         TextStyle(fontSize: 16, color: Colors.grey[800]),
//                       ),
//                     ],
//                   ),
//                 ],
//               ),
//               SizedBox(height: 4),
//               // Address
//               Text(
//                 address,
//                 style: TextStyle(color: Colors.grey[600], fontSize: 14),
//               ),
//               SizedBox(height: 20),
//               // "Book Now" Button Positioned Above Other Buttons
//               SizedBox(
//                 width: double.infinity,
//                 child: ElevatedButton(
//                   onPressed: () {
//                     _showBookingDialog(context);
//                   },
//                   style: ElevatedButton.styleFrom(
//                     foregroundColor: Colors.white,
//                     backgroundColor: Colors.blue, // Blue button
//                     padding:
//                     EdgeInsets.symmetric(horizontal: 20, vertical: 12),
//                     shape: RoundedRectangleBorder(
//                       borderRadius: BorderRadius.circular(30.0),
//                     ),
//                     elevation: 5,
//                   ),
//                   child: Text('Book Now', style: TextStyle(fontSize: 16)),
//                 ),
//               ),
//               SizedBox(height: 20),
//               // Action Buttons: Report, Rate, Comment with Labels and Consistent Spacing
//               Row(
//                 mainAxisAlignment: MainAxisAlignment.spaceEvenly,
//                 children: [
//                   // Report Button with Label (conditionally shown)
//                   if (hasBookedTutor)
//                     Column(
//                       children: [
//                         IconButton(
//                           icon: Icon(Icons.report, color: Colors.deepOrange),
//                           onPressed: () {
//                             _showReportDialog(context);
//                           },
//                         ),
//                         Text(
//                           'Report',
//                           style: TextStyle(
//                             color: Colors.deepOrange,
//                             fontSize: 12,
//                           ),
//                         ),
//                       ],
//                     ),
//                   // Rate Button with Label (conditionally shown)
//                   if (hasBookedTutor)
//                     Column(
//                       children: [
//                         IconButton(
//                           icon: Icon(Icons.rate_review, color: Colors.blue),
//                           onPressed: () {
//                             _showRateDialog(context);
//                           },
//                         ),
//                         Text(
//                           'Rate',
//                           style: TextStyle(
//                             color: Colors.blue,
//                             fontSize: 12,
//                           ),
//                         ),
//                       ],
//                     ),
//                   // Comment Button with Label (always shown)
//                   Column(
//                     children: [
//                       IconButton(
//                         icon: Icon(Icons.comment, color: Colors.blue),
//                         onPressed: () {
//                           Navigator.push(
//                             context,
//                             MaterialPageRoute(
//                                 builder: (context) => CommentPage()),
//                           );
//                         },
//                       ),
//                       Text(
//                         'Comment',
//                         style: TextStyle(
//                           color: Colors.blue,
//                           fontSize: 12,
//                         ),
//                       ),
//                     ],
//                   ),
//                 ],
//               ),
//               SizedBox(height: 20),
//               // Description
//               Align(
//                 alignment: Alignment.centerLeft,
//                 child: Text(
//                   'About',
//                   style: Theme.of(context).textTheme.titleMedium,
//                 ),
//               ),
//               SizedBox(height: 5),
//               Text(
//                 description,
//                 style: Theme.of(context).textTheme.bodyMedium,
//                 textAlign: TextAlign.justify,
//               ),
//               SizedBox(height: 25),
//               // Video Section
//               Align(
//                 alignment: Alignment.centerLeft,
//                 child: Text(
//                   'Introduction Video',
//                   style: Theme.of(context).textTheme.titleMedium,
//                 ),
//               ),
//               SizedBox(height: 10),
//               // Constrain video width to screen width and allow dynamic height
//               Container(
//                 width: double.infinity,
//                 child: VideoCard(videoUrl: videoUrls[0]),
//               ),
//               SizedBox(height: 25),
//               // Education Section
//               Align(
//                 alignment: Alignment.centerLeft,
//                 child: Text(
//                   'Education',
//                   style: Theme.of(context).textTheme.titleMedium,
//                 ),
//               ),
//               SizedBox(height: 5),
//               Text(
//                 educationDetails,
//                 style: Theme.of(context).textTheme.bodyMedium,
//               ),
//               SizedBox(height: 25),
//               // Languages Section
//               Align(
//                 alignment: Alignment.centerLeft,
//                 child: Text(
//                   'Languages',
//                   style: Theme.of(context).textTheme.titleMedium,
//                 ),
//               ),
//               SizedBox(height: 5),
//               Wrap(
//                 spacing: 10,
//                 children: languages
//                     .map(
//                       (language) => Chip(
//                     label: Text(language),
//                     backgroundColor: Colors.blue[50],
//                     avatar: Icon(
//                       Icons.language,
//                       size: 20,
//                       color: Colors.blue,
//                     ),
//                   ),
//                 )
//                     .toList(),
//               ),
//               SizedBox(height: 25),
//               // Specialties Section
//               Align(
//                 alignment: Alignment.centerLeft,
//                 child: Text(
//                   'Specialties',
//                   style: Theme.of(context).textTheme.titleMedium,
//                 ),
//               ),
//               SizedBox(height: 5),
//               Wrap(
//                 spacing: 10,
//                 children: specialties
//                     .map(
//                       (specialty) => Chip(
//                     label: Text(specialty),
//                     backgroundColor: Colors.blue[50],
//                     avatar: Icon(
//                       Icons.star,
//                       size: 20,
//                       color: Colors.blue,
//                     ),
//                   ),
//                 )
//                     .toList(),
//               ),
//               SizedBox(height: 25),
//               // Interests Section
//               Align(
//                 alignment: Alignment.centerLeft,
//                 child: Text(
//                   'Interests',
//                   style: Theme.of(context).textTheme.titleMedium,
//                 ),
//               ),
//               SizedBox(height: 5),
//               Text(
//                 interests,
//                 style: Theme.of(context).textTheme.bodyMedium,
//               ),
//               SizedBox(height: 25),
//               // Teaching Experience Section
//               Align(
//                 alignment: Alignment.centerLeft,
//                 child: Text(
//                   'Teaching Experience',
//                   style: Theme.of(context).textTheme.titleMedium,
//                 ),
//               ),
//               SizedBox(height: 5),
//               Text(
//                 teachingExperience,
//                 style: Theme.of(context).textTheme.bodyMedium,
//               ),
//               SizedBox(height: 30),
//             ],
//           ),
//         ),
//       ),
//     );
//   }
//
//   // Function to show the booking confirmation dialog
//   void _showBookingDialog(BuildContext context) {
//     showDialog(
//       context: context,
//       builder: (context) {
//         return AlertDialog(
//           title: Text('Confirm Booking'),
//           content: Text('Are you sure you want to book this tutor?'),
//           actions: [
//             TextButton(
//               onPressed: () {
//                 Navigator.pop(context);
//               },
//               child:
//               Text('Cancel', style: TextStyle(color: Colors.grey[700])),
//             ),
//             ElevatedButton(
//               onPressed: () {
//                 setState(() {
//                   hasBookedTutor = true; // Update booking state
//                 });
//                 Navigator.pop(context);
//                 ScaffoldMessenger.of(context).showSnackBar(
//                   SnackBar(content: Text('Booking Confirmed!')),
//                 );
//               },
//               style: ElevatedButton.styleFrom(backgroundColor: Colors.blue),
//               child: Text('Yes'),
//             ),
//           ],
//         );
//       },
//     );
//   }
//
//   // Function to show the report dialog
//   void _showReportDialog(BuildContext context) {
//     TextEditingController reportController = TextEditingController();
//
//     showDialog(
//       context: context,
//       builder: (context) {
//         return AlertDialog(
//           title: Text('Report Tutor'),
//           content: TextField(
//             controller: reportController,
//             decoration: InputDecoration(
//               hintText: 'Enter your report here...',
//               border: OutlineInputBorder(),
//             ),
//             maxLines: 5,
//           ),
//           actions: [
//             TextButton(
//               onPressed: () {
//                 Navigator.pop(context);
//               },
//               child:
//               Text('Cancel', style: TextStyle(color: Colors.grey[700])),
//             ),
//             ElevatedButton(
//               onPressed: () {
//                 // TODO: Replace with actual report submission logic
//                 Navigator.pop(context);
//                 ScaffoldMessenger.of(context).showSnackBar(
//                   SnackBar(content: Text('Report Submitted')),
//                 );
//               },
//               style: ElevatedButton.styleFrom(backgroundColor: Colors.deepOrange),
//               child: Text('Submit'),
//             ),
//           ],
//         );
//       },
//     );
//   }
//
//   // Function to show the rate dialog
//   void _showRateDialog(BuildContext context) {
//     double _currentRating = 5.0;
//
//     showDialog(
//       context: context,
//       builder: (context) {
//         return AlertDialog(
//           title: Text('Rate this Tutor'),
//           content: Column(
//             mainAxisSize: MainAxisSize.min,
//             children: [
//               Text('Please provide your rating below:'),
//               SizedBox(height: 20),
//               StatefulBuilder(
//                 builder: (context, setState) {
//                   return Slider(
//                     value: _currentRating,
//                     min: 1,
//                     max: 5,
//                     divisions: 4,
//                     label: _currentRating.round().toString(),
//                     onChanged: (double value) {
//                       setState(() {
//                         _currentRating = value;
//                       });
//                     },
//                     activeColor: Colors.blue,
//                     inactiveColor: Colors.blue[100],
//                   );
//                 },
//               ),
//             ],
//           ),
//           actions: [
//             TextButton(
//               onPressed: () {
//                 Navigator.pop(context);
//               },
//               child:
//               Text('Cancel', style: TextStyle(color: Colors.grey[700])),
//             ),
//             ElevatedButton(
//               onPressed: () {
//                 // TODO: Replace with actual rating submission logic
//                 Navigator.pop(context);
//                 ScaffoldMessenger.of(context).showSnackBar(
//                   SnackBar(content: Text('Thank you for your rating!')),
//                 );
//               },
//               style: ElevatedButton.styleFrom(backgroundColor: Colors.blue),
//               child: Text('Submit'),
//             ),
//           ],
//         );
//       },
//     );
//   }
// }
//
// class CommentPage extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     // Dummy comments data
//     final List<String> comments = [
//       "Great tutor! Helped me improve my English significantly.",
//       "Very patient and knowledgeable.",
//       "Highly recommended for IELTS preparation.",
//     ];
//
//     return Scaffold(
//       appBar: AppBar(
//         backgroundColor: Colors.white, // Set AppBar background to white
//         title: Text(
//           'Comments',
//           style: TextStyle(color: Colors.blue), // Set title color to blue
//         ),
//         centerTitle: true,
//         leading: IconButton(
//           icon: Icon(Icons.arrow_back, color: Colors.blue), // Set back button color to blue
//           onPressed: () {
//             Navigator.pop(context);
//           },
//         ),
//         elevation: 1, // Optional: Add slight shadow for better visibility
//       ),
//       body: Padding(
//         padding: const EdgeInsets.all(16.0),
//         child: Column(
//           children: [
//             // Existing Comments
//             Expanded(
//               child: ListView.builder(
//                 itemCount: comments.length,
//                 itemBuilder: (context, index) {
//                   return Card(
//                     elevation: 2,
//                     margin: EdgeInsets.symmetric(vertical: 8),
//                     child: ListTile(
//                       leading: CircleAvatar(
//                         backgroundColor:
//                         Colors.blue, // Changed avatar color to blue
//                         child: Icon(Icons.person, color: Colors.white),
//                       ),
//                       title: Text('User ${index + 1}'),
//                       subtitle: Text(comments[index]),
//                     ),
//                   );
//                 },
//               ),
//             ),
//             // Add Comment Field
//             TextField(
//               decoration: InputDecoration(
//                 hintText: 'Add a comment...',
//                 prefixIcon:
//                 Icon(Icons.comment, color: Colors.blue), // Blue icon
//                 border: OutlineInputBorder(
//                   borderRadius: BorderRadius.circular(30.0),
//                 ),
//               ),
//               maxLines: 2,
//             ),
//             SizedBox(height: 10),
//             ElevatedButton.icon(
//               onPressed: () {
//                 // TODO: Implement add comment functionality
//                 ScaffoldMessenger.of(context).showSnackBar(
//                   SnackBar(content: Text('Comment Added')),
//                 );
//               },
//               icon: Icon(Icons.send),
//               label: Text('Submit'),
//               style: ElevatedButton.styleFrom(
//                 backgroundColor: Colors.blue, // Blue button
//                 shape: RoundedRectangleBorder(
//                   borderRadius: BorderRadius.circular(30.0),
//                 ),
//                 padding:
//                 EdgeInsets.symmetric(horizontal: 20, vertical: 12),
//               ),
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }
//
// class VideoCard extends StatefulWidget {
//   final String videoUrl;
//
//   VideoCard({required this.videoUrl});
//
//   @override
//   _VideoCardState createState() => _VideoCardState();
// }
//
// class _VideoCardState extends State<VideoCard> {
//   late VideoPlayerController _controller;
//   bool _isControlsVisible = true;
//   bool _isDragging = false;
//   double _sliderValue = 0.0;
//
//   @override
//   void initState() {
//     super.initState();
//     _controller = VideoPlayerController.network(
//       widget.videoUrl, // Use the dynamic video URL
//     )
//       ..initialize().then((_) {
//         setState(() {});
//       })
//       ..setLooping(false);
//
//     // Listen to video position updates
//     _controller.addListener(() {
//       if (!_isDragging && _controller.value.isInitialized) {
//         setState(() {
//           _sliderValue = _controller.value.position.inSeconds.toDouble();
//         });
//       }
//     });
//   }
//
//   void _toggleControls() {
//     setState(() {
//       _isControlsVisible = !_isControlsVisible;
//     });
//   }
//
//   String _formatDuration(Duration duration) {
//     // Formats duration to mm:ss
//     String twoDigits(int n) => n.toString().padLeft(2, '0');
//     String twoDigitMinutes =
//     twoDigits(duration.inMinutes.remainder(60));
//     String twoDigitSeconds =
//     twoDigits(duration.inSeconds.remainder(60));
//     return "$twoDigitMinutes:$twoDigitSeconds";
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     final totalDuration =
//     _controller.value.isInitialized ? _controller.value.duration : Duration.zero;
//     final currentPosition =
//     _controller.value.isInitialized ? _controller.value.position : Duration.zero;
//     final remainingDuration = totalDuration - currentPosition;
//
//     return GestureDetector(
//       onTap: _toggleControls,
//       child: Stack(
//         children: [
//           // Video Player with Dynamic Aspect Ratio
//           _controller.value.isInitialized
//               ? AspectRatio(
//             aspectRatio: _controller.value.aspectRatio,
//             child: VideoPlayer(_controller),
//           )
//               : Container(
//             height: 200, // Placeholder height while loading
//             child: Center(child: CircularProgressIndicator()),
//           ),
//           // Overlay Controls
//           if (_isControlsVisible)
//             Positioned.fill(
//               child: Container(
//                 color: Colors.black45,
//                 child: Column(
//                   mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                   children: [
//                     // Top Controls (optional, can be used for title or other controls)
//                     SizedBox(height: 10),
//                     // Middle Controls (Play/Pause)
//                     Expanded(
//                       child: Center(
//                         child: IconButton(
//                           icon: Icon(
//                             _controller.value.isPlaying
//                                 ? Icons.pause_circle_filled
//                                 : Icons.play_circle_filled,
//                             color: Colors.white,
//                             size: 60,
//                           ),
//                           onPressed: () {
//                             setState(() {
//                               _controller.value.isPlaying
//                                   ? _controller.pause()
//                                   : _controller.play();
//                             });
//                           },
//                         ),
//                       ),
//                     ),
//                     // Bottom Controls (Rewind, Progress Bar, Forward)
//                     Container(
//                       color: Colors.black54,
//                       padding: EdgeInsets.symmetric(horizontal: 10.0, vertical: 5.0),
//                       child: Column(
//                         children: [
//                           // Progress Bar
//                           _controller.value.isInitialized
//                               ? Column(
//                             children: [
//                               Slider(
//                                 value: _sliderValue,
//                                 min: 0.0,
//                                 max: totalDuration.inSeconds.toDouble(),
//                                 activeColor: Colors.blue,
//                                 inactiveColor: Colors.white54,
//                                 onChanged: (value) {
//                                   setState(() {
//                                     _isDragging = true;
//                                     _sliderValue = value;
//                                   });
//                                 },
//                                 onChangeEnd: (value) {
//                                   setState(() {
//                                     _controller.seekTo(
//                                         Duration(seconds: value.toInt()));
//                                     _isDragging = false;
//                                   });
//                                 },
//                               ),
//                               // Time Display
//                               Row(
//                                 mainAxisAlignment:
//                                 MainAxisAlignment.spaceBetween,
//                                 children: [
//                                   // Current Time
//                                   Text(
//                                     _formatDuration(currentPosition),
//                                     style: TextStyle(
//                                         color: Colors.white, fontSize: 12),
//                                   ),
//                                   // Remaining Time
//                                   Text(
//                                     '-${_formatDuration(remainingDuration)}',
//                                     style: TextStyle(
//                                         color: Colors.white, fontSize: 12),
//                                   ),
//                                 ],
//                               ),
//                             ],
//                           )
//                               : Container(),
//                           // Rewind, Play/Pause, Forward Buttons
//                           Row(
//                             mainAxisAlignment: MainAxisAlignment.spaceEvenly,
//                             children: [
//                               // Rewind 10 Seconds
//                               IconButton(
//                                 icon: Icon(Icons.replay_10,
//                                     color: Colors.white, size: 30),
//                                 onPressed: () {
//                                   final newPosition = _controller
//                                       .value.position -
//                                       Duration(seconds: 10);
//                                   _controller.seekTo(newPosition >= Duration.zero
//                                       ? newPosition
//                                       : Duration.zero);
//                                 },
//                               ),
//                               // Play/Pause Button
//                               IconButton(
//                                 icon: Icon(
//                                   _controller.value.isPlaying
//                                       ? Icons.pause
//                                       : Icons.play_arrow,
//                                   color: Colors.white,
//                                   size: 30,
//                                 ),
//                                 onPressed: () {
//                                   setState(() {
//                                     _controller.value.isPlaying
//                                         ? _controller.pause()
//                                         : _controller.play();
//                                   });
//                                 },
//                               ),
//                               // Forward 10 Seconds
//                               IconButton(
//                                 icon: Icon(Icons.forward_10,
//                                     color: Colors.white, size: 30),
//                                 onPressed: () {
//                                   final newPosition = _controller
//                                       .value.position +
//                                       Duration(seconds: 10);
//                                   _controller.seekTo(newPosition <=
//                                       _controller.value.duration
//                                       ? newPosition
//                                       : _controller.value.duration);
//                                 },
//                               ),
//                             ],
//                           ),
//                         ],
//                       ),
//                     ),
//                   ],
//                 ),
//               ),
//             ),
//         ],
//       ),
//     );
//   }
//
//   @override
//   void dispose() {
//     _controller.dispose();
//     super.dispose();
//   }
// }

import 'package:flutter/material.dart';
import 'package:tutor_nest/pages/Student/payment_page_content.dart';
import 'package:video_player/video_player.dart';
import 'package:intl/intl.dart'; // For formatting dates and times

// void main() {
//   runApp(MaterialApp(
//     home: TutorDetailsContent(),
//     routes: {
//       '/subscription': (context) => SubscriptionPage(),
//     },
//   ));
// }

class TutorDetailsContent extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return TutorDetailsPage();
  }
}

class TutorDetailsPage extends StatefulWidget {
  @override
  _TutorDetailsPageState createState() => _TutorDetailsPageState();
}

class _TutorDetailsPageState extends State<TutorDetailsPage> {
  // Dummy Data
  final String tutorName = "Dinesh Adhikari";
  final String address = "Kathmandu";
  final String description =
      "Highly experienced tutor in Business English, IELTS, and SAT prep. Passionate about helping students achieve their academic and professional goals.";
  final String educationDetails =
      "Master's in Computer Science from XYZ University.";
  final List<String> languages = ["English", "Nepali"];
  final List<String> specialties = [
    "Business English",
    "IELTS",
    "SAT",
    "Programming in Java"
  ];
  final String interests = "Passionate about teaching and making learning fun.";
  final String teachingExperience = "5 years of experience.";

  // New Dummy Image URL
  final String tutorImage =
      "https://images.unsplash.com/photo-1527980965255-d3b416303d12?ixlib=rb-4.0.3&auto=format&fit=crop&w=800&q=80";

  bool hasBookedTutor = false; // New booking state variable

  // Dummy Video URLs (Simulating database fetched data)
  final List<String> videoUrls = [
    // Replace with actual video URLs or keep dummy for now
    'https://www.learningcontainer.com/wp-content/uploads/2020/05/sample-mp4-file.mp4',
    // Add more URLs if needed
  ];

  // New Variables for Availability and Subscription
  bool isTutorAvailable = true; // Set to true by default
  bool isUserSubscribed = false; // Set to true by default

  DateTime? selectedDate;
  TimeOfDay? selectedTime;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white, // Set AppBar background to white
        title: Text(
          'Tutor Details',
          style: TextStyle(color: Colors.blue), // Set title color to blue
        ),
        centerTitle: true,
        leading: IconButton(
          icon: Icon(Icons.arrow_back, color: Colors.blue), // Set back button color to blue
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        elevation: 1, // Optional: Add slight shadow for better visibility
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding:
          const EdgeInsets.symmetric(horizontal: 20.0, vertical: 16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              // Profile Photo with NetworkImage
              CircleAvatar(
                radius: 60,
                backgroundImage: NetworkImage(tutorImage),
                backgroundColor: Colors.transparent,
                onBackgroundImageError: (exception, stackTrace) {
                  // Handle image loading error
                  // Optionally, set a default image or display an error message
                },
              ),
              SizedBox(height: 10),
              // Name and Rating
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    tutorName,
                    style: Theme.of(context).textTheme.titleLarge,
                  ),
                  SizedBox(width: 8),
                  Row(
                    children: [
                      Icon(Icons.star, color: Colors.amber, size: 20),
                      SizedBox(width: 4),
                      Text(
                        '5.0',
                        style:
                        TextStyle(fontSize: 16, color: Colors.grey[800]),
                      ),
                    ],
                  ),
                ],
              ),
              SizedBox(height: 4),
              // Address
              Text(
                address,
                style: TextStyle(color: Colors.grey[600], fontSize: 14),
              ),
              SizedBox(height: 20),
              // "Book Now" Button Positioned Above Other Buttons
              SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                  onPressed: () {
                    _showBookingDialog(context);
                  },
                  style: ElevatedButton.styleFrom(
                    foregroundColor: Colors.white,
                    backgroundColor: Colors.blue, // Blue button
                    padding:
                    EdgeInsets.symmetric(horizontal: 20, vertical: 12),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(30.0),
                    ),
                    elevation: 5,
                  ),
                  child: Text('Book Now', style: TextStyle(fontSize: 16)),
                ),
              ),
              SizedBox(height: 20),
              // Action Buttons: Report, Rate, Comment with Labels and Consistent Spacing
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  // Report Button with Label (conditionally shown)
                  if (hasBookedTutor)
                    Column(
                      children: [
                        IconButton(
                          icon: Icon(Icons.report, color: Colors.deepOrange),
                          onPressed: () {
                            _showReportDialog(context);
                          },
                        ),
                        Text(
                          'Report',
                          style: TextStyle(
                            color: Colors.deepOrange,
                            fontSize: 12,
                          ),
                        ),
                      ],
                    ),
                  // Rate Button with Label (conditionally shown)
                  if (hasBookedTutor)
                    Column(
                      children: [
                        IconButton(
                          icon: Icon(Icons.rate_review, color: Colors.blue),
                          onPressed: () {
                            _showRateDialog(context);
                          },
                        ),
                        Text(
                          'Rate',
                          style: TextStyle(
                            color: Colors.blue,
                            fontSize: 12,
                          ),
                        ),
                      ],
                    ),
                  // Comment Button with Label (always shown)
                  Column(
                    children: [
                      IconButton(
                        icon: Icon(Icons.comment, color: Colors.blue),
                        onPressed: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => CommentPage()),
                          );
                        },
                      ),
                      Text(
                        'Comment',
                        style: TextStyle(
                          color: Colors.blue,
                          fontSize: 12,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
              SizedBox(height: 20),
              // Description
              Align(
                alignment: Alignment.centerLeft,
                child: Text(
                  'About',
                  style: Theme.of(context).textTheme.titleMedium,
                ),
              ),
              SizedBox(height: 5),
              Text(
                description,
                style: Theme.of(context).textTheme.bodyMedium,
                textAlign: TextAlign.justify,
              ),
              SizedBox(height: 25),
              // Video Section
              Align(
                alignment: Alignment.centerLeft,
                child: Text(
                  'Introduction Video',
                  style: Theme.of(context).textTheme.titleMedium,
                ),
              ),
              SizedBox(height: 10),
              // Constrain video width to screen width and allow dynamic height
              Container(
                width: double.infinity,
                child: VideoCard(videoUrl: videoUrls[0]),
              ),
              SizedBox(height: 25),
              // Education Section
              Align(
                alignment: Alignment.centerLeft,
                child: Text(
                  'Education',
                  style: Theme.of(context).textTheme.titleMedium,
                ),
              ),
              SizedBox(height: 5),
              Text(
                educationDetails,
                style: Theme.of(context).textTheme.bodyMedium,
              ),
              SizedBox(height: 25),
              // Languages Section
              Align(
                alignment: Alignment.centerLeft,
                child: Text(
                  'Languages',
                  style: Theme.of(context).textTheme.titleMedium,
                ),
              ),
              SizedBox(height: 5),
              Wrap(
                spacing: 10,
                children: languages
                    .map(
                      (language) => Chip(
                    label: Text(language),
                    backgroundColor: Colors.blue[50],
                    avatar: Icon(
                      Icons.language,
                      size: 20,
                      color: Colors.blue,
                    ),
                  ),
                )
                    .toList(),
              ),
              SizedBox(height: 25),
              // Specialties Section
              Align(
                alignment: Alignment.centerLeft,
                child: Text(
                  'Specialties',
                  style: Theme.of(context).textTheme.titleMedium,
                ),
              ),
              SizedBox(height: 5),
              Wrap(
                spacing: 10,
                children: specialties
                    .map(
                      (specialty) => Chip(
                    label: Text(specialty),
                    backgroundColor: Colors.blue[50],
                    avatar: Icon(
                      Icons.star,
                      size: 20,
                      color: Colors.blue,
                    ),
                  ),
                )
                    .toList(),
              ),
              SizedBox(height: 25),
              // Interests Section
              Align(
                alignment: Alignment.centerLeft,
                child: Text(
                  'Interests',
                  style: Theme.of(context).textTheme.titleMedium,
                ),
              ),
              SizedBox(height: 5),
              Text(
                interests,
                style: Theme.of(context).textTheme.bodyMedium,
              ),
              SizedBox(height: 25),
              // Teaching Experience Section
              Align(
                alignment: Alignment.centerLeft,
                child: Text(
                  'Teaching Experience',
                  style: Theme.of(context).textTheme.titleMedium,
                ),
              ),
              SizedBox(height: 5),
              Text(
                teachingExperience,
                style: Theme.of(context).textTheme.bodyMedium,
              ),
              SizedBox(height: 30),
            ],
          ),
        ),
      ),
    );
  }

  // Function to show the booking dialog with date and time selection
  void _showBookingDialog(BuildContext context) {
    // Temporary variables to hold selected date and time
    DateTime? tempSelectedDate = selectedDate;
    TimeOfDay? tempSelectedTime = selectedTime;
    bool tempIsTutorAvailable = isTutorAvailable;

    showDialog(
      context: context,
      builder: (context) {
        return StatefulBuilder(builder: (context, setState) {
          // Function to select date
          Future<void> _selectDate(BuildContext context) async {
            final DateTime? picked = await showDatePicker(
              context: context,
              initialDate: tempSelectedDate ?? DateTime.now(),
              firstDate: DateTime.now(),
              lastDate: DateTime.now().add(Duration(days: 365)),
            );
            if (picked != null) {
              setState(() {
                tempSelectedDate = picked;
              });
            }
          }

          // Function to select time
          Future<void> _selectTime(BuildContext context) async {
            final TimeOfDay? picked = await showTimePicker(
              context: context,
              initialTime: tempSelectedTime ?? TimeOfDay.now(),
            );
            if (picked != null) {
              setState(() {
                tempSelectedTime = picked;
              });
            }
          }

          // Function to check tutor availability based on selected date and time
          void _checkTutorAvailability() {
            // TODO: Implement actual availability check logic
            // For now, we assume the tutor is available
            tempIsTutorAvailable = true;
          }

          return AlertDialog(
            title: Text('Book Tutor'),
            content: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                // Date Picker
                Row(
                  children: [
                    Expanded(
                      child: Text(
                        tempSelectedDate == null
                            ? 'Select Date'
                            : DateFormat('yyyy-MM-dd')
                            .format(tempSelectedDate!),
                      ),
                    ),
                    IconButton(
                      icon: Icon(Icons.calendar_today),
                      onPressed: () {
                        _selectDate(context);
                      },
                    ),
                  ],
                ),
                SizedBox(height: 10),
                // Time Picker
                Row(
                  children: [
                    Expanded(
                      child: Text(
                        tempSelectedTime == null
                            ? 'Select Time'
                            : tempSelectedTime!.format(context),
                      ),
                    ),
                    IconButton(
                      icon: Icon(Icons.access_time),
                      onPressed: () {
                        _selectTime(context);
                      },
                    ),
                  ],
                ),
                SizedBox(height: 20),
                // Availability Status
                if (tempSelectedDate != null && tempSelectedTime != null)
                  FutureBuilder(
                    future: Future.delayed(Duration(milliseconds: 500), () {
                      _checkTutorAvailability();
                      return tempIsTutorAvailable;
                    }),
                    builder: (context, snapshot) {
                      if (snapshot.connectionState == ConnectionState.waiting) {
                        return CircularProgressIndicator();
                      } else {
                        if (snapshot.hasData && snapshot.data == true) {
                          return Text(
                            'Tutor is available',
                            style: TextStyle(color: Colors.green),
                          );
                        } else {
                          return Text(
                            'Tutor is not available',
                            style: TextStyle(color: Colors.red),
                          );
                        }
                      }
                    },
                  ),
              ],
            ),
            actions: [
              TextButton(
                onPressed: () {
                  Navigator.pop(context);
                },
                child:
                Text('Cancel', style: TextStyle(color: Colors.grey[700])),
              ),
              ElevatedButton(
                onPressed: (tempSelectedDate != null &&
                    tempSelectedTime != null &&
                    tempIsTutorAvailable)
                    ? () {
                  // Update the selected date and time in the state
                  setState(() {
                    selectedDate = tempSelectedDate;
                    selectedTime = tempSelectedTime;
                    isTutorAvailable = tempIsTutorAvailable;
                    hasBookedTutor = true; // Update booking state
                  });
                  Navigator.pop(context);
                  _showConfirmBookingDialog(context);
                }
                    : null, // Disable button if tutor is not available
                style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.blue,
                    // Change button color based on availability
                    foregroundColor: Colors.white),
                child: Text('Confirm'),
              ),
            ],
          );
        });
      },
    );
  }

  // Function to show the confirmation dialog after selecting date and time
  void _showConfirmBookingDialog(BuildContext context) {
    // Check if user is subscribed
    if (isUserSubscribed) {
      // If subscribed, show success message and enable rating/report
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Booking Confirmed!')),
      );
      setState(() {
        hasBookedTutor = true;
      });
    } else {
      // If not subscribed, navigate to subscription page
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => PaymentPage()),
      );
    }
  }

  // Function to show the report dialog
  void _showReportDialog(BuildContext context) {
    TextEditingController reportController = TextEditingController();

    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: Text('Report Tutor'),
          content: TextField(
            controller: reportController,
            decoration: InputDecoration(
              hintText: 'Enter your report here...',
              border: OutlineInputBorder(),
            ),
            maxLines: 5,
          ),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.pop(context);
              },
              child:
              Text('Cancel', style: TextStyle(color: Colors.grey[700])),
            ),
            ElevatedButton(
              onPressed: () {
                // TODO: Replace with actual report submission logic
                Navigator.pop(context);
                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(content: Text('Report Submitted')),
                );
              },
              style: ElevatedButton.styleFrom(backgroundColor: Colors.deepOrange),
              child: Text('Submit'),
            ),
          ],
        );
      },
    );
  }

  // Function to show the rate dialog
  void _showRateDialog(BuildContext context) {
    double _currentRating = 5.0;

    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: Text('Rate this Tutor'),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Text('Please provide your rating below:'),
              SizedBox(height: 20),
              StatefulBuilder(
                builder: (context, setState) {
                  return Slider(
                    value: _currentRating,
                    min: 1,
                    max: 5,
                    divisions: 4,
                    label: _currentRating.round().toString(),
                    onChanged: (double value) {
                      setState(() {
                        _currentRating = value;
                      });
                    },
                    activeColor: Colors.blue,
                    inactiveColor: Colors.blue[100],
                  );
                },
              ),
            ],
          ),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.pop(context);
              },
              child:
              Text('Cancel', style: TextStyle(color: Colors.grey[700])),
            ),
            ElevatedButton(
              onPressed: () {
                // TODO: Replace with actual rating submission logic
                Navigator.pop(context);
                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(content: Text('Thank you for your rating!')),
                );
              },
              style: ElevatedButton.styleFrom(backgroundColor: Colors.blue),
              child: Text('Submit'),
            ),
          ],
        );
      },
    );
  }
}

class CommentPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // Dummy comments data
    final List<String> comments = [
      "Great tutor! Helped me improve my English significantly.",
      "Very patient and knowledgeable.",
      "Highly recommended for IELTS preparation.",
    ];

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white, // Set AppBar background to white
        title: Text(
          'Comments',
          style: TextStyle(color: Colors.blue), // Set title color to blue
        ),
        centerTitle: true,
        leading: IconButton(
          icon: Icon(Icons.arrow_back, color: Colors.blue), // Set back button color to blue
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        elevation: 1, // Optional: Add slight shadow for better visibility
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            // Existing Comments
            Expanded(
              child: ListView.builder(
                itemCount: comments.length,
                itemBuilder: (context, index) {
                  return Card(
                    elevation: 2,
                    margin: EdgeInsets.symmetric(vertical: 8),
                    child: ListTile(
                      leading: CircleAvatar(
                        backgroundColor:
                        Colors.blue, // Changed avatar color to blue
                        child: Icon(Icons.person, color: Colors.white),
                      ),
                      title: Text('User ${index + 1}'),
                      subtitle: Text(comments[index]),
                    ),
                  );
                },
              ),
            ),
            // Add Comment Field
            TextField(
              decoration: InputDecoration(
                hintText: 'Add a comment...',
                prefixIcon:
                Icon(Icons.comment, color: Colors.blue), // Blue icon
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(30.0),
                ),
              ),
              maxLines: 2,
            ),
            SizedBox(height: 10),
            ElevatedButton.icon(
              onPressed: () {
                // TODO: Implement add comment functionality
                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(content: Text('Comment Added')),
                );
              },
              icon: Icon(Icons.send),
              label: Text('Submit'),
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.blue, // Blue button
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(30.0),
                ),
                padding:
                EdgeInsets.symmetric(horizontal: 20, vertical: 12),
              ),
            ),
          ],
        ),
      ),
    );
  }
}



class VideoCard extends StatefulWidget {
  final String videoUrl;

  VideoCard({required this.videoUrl});

  @override
  _VideoCardState createState() => _VideoCardState();
}

class _VideoCardState extends State<VideoCard> {
  late VideoPlayerController _controller;
  bool _isControlsVisible = true;
  bool _isDragging = false;
  double _sliderValue = 0.0;

  @override
  void initState() {
    super.initState();
    _controller = VideoPlayerController.network(
      widget.videoUrl, // Use the dynamic video URL
    )
      ..initialize().then((_) {
        setState(() {});
      })
      ..setLooping(false);

    // Listen to video position updates
    _controller.addListener(() {
      if (!_isDragging && _controller.value.isInitialized) {
        setState(() {
          _sliderValue = _controller.value.position.inSeconds.toDouble();
        });
      }
    });
  }

  void _toggleControls() {
    setState(() {
      _isControlsVisible = !_isControlsVisible;
    });
  }

  String _formatDuration(Duration duration) {
    // Formats duration to mm:ss
    String twoDigits(int n) => n.toString().padLeft(2, '0');
    String twoDigitMinutes =
    twoDigits(duration.inMinutes.remainder(60));
    String twoDigitSeconds =
    twoDigits(duration.inSeconds.remainder(60));
    return "$twoDigitMinutes:$twoDigitSeconds";
  }

  @override
  Widget build(BuildContext context) {
    final totalDuration =
    _controller.value.isInitialized ? _controller.value.duration : Duration.zero;
    final currentPosition =
    _controller.value.isInitialized ? _controller.value.position : Duration.zero;
    final remainingDuration = totalDuration - currentPosition;

    return GestureDetector(
      onTap: _toggleControls,
      child: Stack(
        children: [
          // Video Player with Dynamic Aspect Ratio
          _controller.value.isInitialized
              ? AspectRatio(
            aspectRatio: _controller.value.aspectRatio,
            child: VideoPlayer(_controller),
          )
              : Container(
            height: 200, // Placeholder height while loading
            child: Center(child: CircularProgressIndicator()),
          ),
          // Overlay Controls
          if (_isControlsVisible)
            Positioned.fill(
              child: Container(
                color: Colors.black45,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    // Top Controls (optional, can be used for title or other controls)
                    SizedBox(height: 10),
                    // Middle Controls (Play/Pause)
                    Expanded(
                      child: Center(
                        child: IconButton(
                          icon: Icon(
                            _controller.value.isPlaying
                                ? Icons.pause_circle_filled
                                : Icons.play_circle_filled,
                            color: Colors.white,
                            size: 60,
                          ),
                          onPressed: () {
                            setState(() {
                              _controller.value.isPlaying
                                  ? _controller.pause()
                                  : _controller.play();
                            });
                          },
                        ),
                      ),
                    ),
                    // Bottom Controls (Rewind, Progress Bar, Forward)
                    Container(
                      color: Colors.black54,
                      padding: EdgeInsets.symmetric(horizontal: 10.0, vertical: 5.0),
                      child: Column(
                        children: [
                          // Progress Bar
                          _controller.value.isInitialized
                              ? Column(
                            children: [
                              Slider(
                                value: _sliderValue,
                                min: 0.0,
                                max: totalDuration.inSeconds.toDouble(),
                                activeColor: Colors.blue,
                                inactiveColor: Colors.white54,
                                onChanged: (value) {
                                  setState(() {
                                    _isDragging = true;
                                    _sliderValue = value;
                                  });
                                },
                                onChangeEnd: (value) {
                                  setState(() {
                                    _controller.seekTo(
                                        Duration(seconds: value.toInt()));
                                    _isDragging = false;
                                  });
                                },
                              ),
                              // Time Display
                              Row(
                                mainAxisAlignment:
                                MainAxisAlignment.spaceBetween,
                                children: [
                                  // Current Time
                                  Text(
                                    _formatDuration(currentPosition),
                                    style: TextStyle(
                                        color: Colors.white, fontSize: 12),
                                  ),
                                  // Remaining Time
                                  Text(
                                    '-${_formatDuration(remainingDuration)}',
                                    style: TextStyle(
                                        color: Colors.white, fontSize: 12),
                                  ),
                                ],
                              ),
                            ],
                          )
                              : Container(),
                          // Rewind, Play/Pause, Forward Buttons
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              // Rewind 10 Seconds
                              IconButton(
                                icon: Icon(Icons.replay_10,
                                    color: Colors.white, size: 30),
                                onPressed: () {
                                  final newPosition = _controller
                                      .value.position -
                                      Duration(seconds: 10);
                                  _controller.seekTo(newPosition >= Duration.zero
                                      ? newPosition
                                      : Duration.zero);
                                },
                              ),
                              // Play/Pause Button
                              IconButton(
                                icon: Icon(
                                  _controller.value.isPlaying
                                      ? Icons.pause
                                      : Icons.play_arrow,
                                  color: Colors.white,
                                  size: 30,
                                ),
                                onPressed: () {
                                  setState(() {
                                    _controller.value.isPlaying
                                        ? _controller.pause()
                                        : _controller.play();
                                  });
                                },
                              ),
                              // Forward 10 Seconds
                              IconButton(
                                icon: Icon(Icons.forward_10,
                                    color: Colors.white, size: 30),
                                onPressed: () {
                                  final newPosition = _controller
                                      .value.position +
                                      Duration(seconds: 10);
                                  _controller.seekTo(newPosition <=
                                      _controller.value.duration
                                      ? newPosition
                                      : _controller.value.duration);
                                },
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
        ],
      ),
    );
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }
}

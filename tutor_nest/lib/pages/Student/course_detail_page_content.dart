// import 'package:flutter/material.dart';
// import 'package:video_player/video_player.dart';
//
// class CourseDetailsPage extends StatefulWidget {
//   @override
//   _CourseDetailsPageState createState() => _CourseDetailsPageState();
// }
//
// class _CourseDetailsPageState extends State<CourseDetailsPage> {
//   // Dummy course data
//   final Map<String, dynamic> courseData = {
//     "image":
//     "https://via.placeholder.com/300", // Replace with a Firebase course image
//     "courseName": "C# Programming",
//     "intro":
//     "This course equips you with the ability to code in OOP language and make you competent in programming Language in C#.",
//     "whyTakeThisCourse":
//     "This course is made by doing state-of-the-art analysis and research to make the student a qualified programmer and help the student in real-world programming.",
//     "whatYouWillLearn": [
//       "OOP Principles",
//       "Variables",
//       "Methods",
//       "Connections",
//     ],
//     "videoUrl":
//     "https://flutter.github.io/assets-for-api-docs/assets/videos/bee.mp4", // Replace with a Firebase video URL
//   };
//
//   // Function to show video pop-up
//   void showVideoPopup(BuildContext context, String videoUrl) {
//     showDialog(
//       context: context,
//       barrierDismissible: true,
//       builder: (context) {
//         return VideoPopup(videoUrl: videoUrl);
//       },
//     );
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         backgroundColor: Colors.white,
//         elevation: 0,
//         leading: IconButton(
//           icon: Icon(Icons.arrow_back, color: Colors.blue),
//           onPressed: () => Navigator.pop(context),
//         ),
//         title: Text(
//           "Course Details",
//           style: TextStyle(color: Colors.blue, fontWeight: FontWeight.bold),
//         ),
//       ),
//       body: SingleChildScrollView(
//         padding: EdgeInsets.all(16),
//         child: Column(
//           crossAxisAlignment: CrossAxisAlignment.start,
//           children: [
//             // Card with Course Details
//             Card(
//               shape: RoundedRectangleBorder(
//                 borderRadius: BorderRadius.circular(8),
//               ),
//               child: Column(
//                 children: [
//                   ClipRRect(
//                     borderRadius: BorderRadius.vertical(top: Radius.circular(8)),
//                     child: Image.network(
//                       courseData["image"],
//                       width: double.infinity,
//                       height: 200,
//                       fit: BoxFit.cover,
//                     ),
//                   ),
//                   Padding(
//                     padding: EdgeInsets.all(16),
//                     child: Row(
//                       mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                       children: [
//                         Text(
//                           courseData["courseName"],
//                           style: TextStyle(
//                               fontSize: 20, fontWeight: FontWeight.bold),
//                         ),
//                         ElevatedButton(
//                           onPressed: () {
//                             showVideoPopup(context, courseData["videoUrl"]);
//                           },
//                           child: Text("Discover"),
//                           style: ElevatedButton.styleFrom(
//                             backgroundColor: Colors.blue,
//                           ),
//                         ),
//                       ],
//                     ),
//                   ),
//                 ],
//               ),
//             ),
//             SizedBox(height: 16),
//             // Overview Section
//             Text(
//               "Overview:",
//               style: TextStyle(
//                 fontSize: 20,
//                 fontWeight: FontWeight.bold,
//                 color: Colors.blue,
//               ),
//             ),
//             Divider(thickness: 1),
//             SizedBox(height: 8),
//             // Intro Section
//             Text(
//               "Intro:",
//               style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
//             ),
//             SizedBox(height: 8),
//             Text(courseData["intro"]),
//             SizedBox(height: 16),
//             // Why Take This Course Section
//             Text(
//               "Why take this course:",
//               style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
//             ),
//             SizedBox(height: 8),
//             Text(courseData["whyTakeThisCourse"]),
//             SizedBox(height: 16),
//             // What You Will Learn Section
//             Text(
//               "What you will learn in this course:",
//               style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
//             ),
//             SizedBox(height: 8),
//             Text(courseData["whyTakeThisCourse"]),
//             SizedBox(height: 8),
//             // List of What You Will Learn
//             Column(
//               crossAxisAlignment: CrossAxisAlignment.start,
//               children: List.generate(
//                 courseData["whatYouWillLearn"].length,
//                     (index) => Row(
//                   children: [
//                     Icon(Icons.check_circle, color: Colors.blue),
//                     SizedBox(width: 8),
//                     Text(courseData["whatYouWillLearn"][index]),
//                   ],
//                 ),
//               ),
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }
//
// // Video Popup Implementation
// class VideoPopup extends StatefulWidget {
//   final String videoUrl;
//
//   const VideoPopup({Key? key, required this.videoUrl}) : super(key: key);
//
//   @override
//   _VideoPopupState createState() => _VideoPopupState();
// }
//
// class _VideoPopupState extends State<VideoPopup> {
//   late VideoPlayerController _controller;
//
//   @override
//   void initState() {
//     super.initState();
//     _controller = VideoPlayerController.network(widget.videoUrl)
//       ..initialize().then((_) {
//         setState(() {});
//         _controller.play();
//       });
//   }
//
//   @override
//   void dispose() {
//     _controller.dispose();
//     super.dispose();
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return AlertDialog(
//       contentPadding: EdgeInsets.zero,
//       content: AspectRatio(
//         aspectRatio: _controller.value.aspectRatio,
//         child: VideoPlayer(_controller),
//       ),
//       actions: [
//         TextButton(
//           onPressed: () {
//             _controller.pause();
//             Navigator.pop(context);
//           },
//           child: Text("Close"),
//         ),
//       ],
//     );
//   }
// }

// import 'package:flutter/material.dart';
// import '../models/course.dart';
// import '../services/course_details_service.dart';
// import '../widgets/video_popup.dart';
//
// class CourseDetailsPageContent extends StatefulWidget {
//   final String courseId;
//
//   const CourseDetailsPageContent({Key? key, required this.courseId}) : super(key: key);
//
//   @override
//   _CourseDetailsPageContentState createState() => _CourseDetailsPageContentState();
// }
//
// class _CourseDetailsPageContentState extends State<CourseDetailsPageContent> {
//   final CourseDetailsService _courseDetailsService = CourseDetailsService();
//   late Future<Course> _courseFuture;
//
//   @override
//   void initState() {
//     super.initState();
//     _courseFuture = _courseDetailsService.fetchCourseDetails(widget.courseId);
//   }
//
//   void _showVideoPopup(BuildContext context, String videoUrl) {
//     showDialog(
//       context: context,
//       barrierDismissible: true,
//       builder: (context) {
//         return VideoPopup(videoUrl: videoUrl);
//       },
//     );
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return FutureBuilder<Course>(
//       future: _courseFuture,
//       builder: (context, snapshot) {
//         if (snapshot.connectionState == ConnectionState.waiting) {
//           return Center(
//             child: CircularProgressIndicator(),
//           );
//         } else if (snapshot.hasError) {
//           return Center(
//             child: Text("Failed to load course details."),
//           );
//         } else if (snapshot.hasData) {
//           Course course = snapshot.data!;
//           return SingleChildScrollView(
//             padding: EdgeInsets.all(16),
//             child: Column(
//               crossAxisAlignment: CrossAxisAlignment.start,
//               children: [
//                 // Card with Course Details
//                 Card(
//                   shape: RoundedRectangleBorder(
//                     borderRadius: BorderRadius.circular(8),
//                   ),
//                   child: Column(
//                     children: [
//                       ClipRRect(
//                         borderRadius: BorderRadius.vertical(top: Radius.circular(8)),
//                         child: Image.network(
//                           course.image,
//                           width: double.infinity,
//                           height: 200,
//                           fit: BoxFit.cover,
//                         ),
//                       ),
//                       Padding(
//                         padding: EdgeInsets.all(16),
//                         child: Row(
//                           mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                           children: [
//                             Expanded(
//                               child: Text(
//                                 course.courseName,
//                                 style: TextStyle(
//                                   fontSize: 20,
//                                   fontWeight: FontWeight.bold,
//                                 ),
//                               ),
//                             ),
//                             ElevatedButton(
//                               onPressed: () {
//                                 _showVideoPopup(context, course.videoUrl);
//                               },
//                               child: Text("Discover"),
//                               style: ElevatedButton.styleFrom(
//                                 backgroundColor: Colors.blue,
//                               ),
//                             ),
//                           ],
//                         ),
//                       ),
//                     ],
//                   ),
//                 ),
//                 SizedBox(height: 16),
//                 // Overview Section
//                 Text(
//                   "Overview:",
//                   style: TextStyle(
//                     fontSize: 20,
//                     fontWeight: FontWeight.bold,
//                     color: Colors.blue,
//                   ),
//                 ),
//                 Divider(thickness: 1),
//                 SizedBox(height: 8),
//                 // Intro Section
//                 Text(
//                   "Intro:",
//                   style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
//                 ),
//                 SizedBox(height: 8),
//                 Text(course.intro),
//                 SizedBox(height: 16),
//                 // Why Take This Course Section
//                 Text(
//                   "Why take this course:",
//                   style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
//                 ),
//                 SizedBox(height: 8),
//                 Text(course.whyTakeThisCourse),
//                 SizedBox(height: 16),
//                 // What You Will Learn Section
//                 Text(
//                   "What you will learn in this course:",
//                   style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
//                 ),
//                 SizedBox(height: 8),
//                 // List of What You Will Learn
//                 Column(
//                   crossAxisAlignment: CrossAxisAlignment.start,
//                   children: course.whatYouWillLearn.map((item) {
//                     return Padding(
//                       padding: const EdgeInsets.symmetric(vertical: 4.0),
//                       child: Row(
//                         children: [
//                           Icon(Icons.check_circle, color: Colors.blue),
//                           SizedBox(width: 8),
//                           Expanded(child: Text(item)),
//                         ],
//                       ),
//                     );
//                   }).toList(),
//                 ),
//               ],
//             ),
//           );
//         } else {
//           return Center(
//             child: Text("Course not found."),
//           );
//         }
//       },
//     );
//   }
// }

// // lib/pages/course_details_page_content.dart
// import 'package:flutter/material.dart';
// import '../models/course.dart';
// import '../services/course_details_service.dart';
// import '../widgets/video_popup.dart';
//
// class CourseDetailsPageContent extends StatefulWidget {
//   final String courseId;
//
//   const CourseDetailsPageContent({Key? key, required this.courseId}) : super(key: key);
//
//   @override
//   _CourseDetailsPageContentState createState() => _CourseDetailsPageContentState();
// }
//
// class _CourseDetailsPageContentState extends State<CourseDetailsPageContent> {
//   final CourseDetailsService _courseDetailsService = CourseDetailsService();
//   late Future<Course> _courseFuture;
//
//   @override
//   void initState() {
//     super.initState();
//     _courseFuture = _courseDetailsService.fetchCourseDetails(widget.courseId);
//   }
//
//   void _showVideoPopup(BuildContext context, String videoUrl) {
//     showDialog(
//       context: context,
//       barrierDismissible: true,
//       builder: (context) {
//         return VideoPopup(videoUrl: videoUrl);
//       },
//     );
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return FutureBuilder<Course>(
//       future: _courseFuture,
//       builder: (context, snapshot) {
//         if (snapshot.connectionState == ConnectionState.waiting) {
//           return Center(
//             child: CircularProgressIndicator(),
//           );
//         } else if (snapshot.hasError) {
//           return Center(
//             child: Text("Failed to load course details."),
//           );
//         } else if (snapshot.hasData) {
//           Course course = snapshot.data!;
//           return SingleChildScrollView(
//             padding: EdgeInsets.all(16),
//             child: Column(
//               crossAxisAlignment: CrossAxisAlignment.start,
//               children: [
//                 // Card with Course Details
//                 Card(
//                   shape: RoundedRectangleBorder(
//                     borderRadius: BorderRadius.circular(8),
//                   ),
//                   child: Column(
//                     children: [
//                       // Course Image
//                       ClipRRect(
//                         borderRadius: BorderRadius.vertical(top: Radius.circular(8)),
//                         child: Image.network(
//                           course.image,
//                           width: double.infinity,
//                           height: 200,
//                           fit: BoxFit.cover,
//                         ),
//                       ),
//                       // Course Name and Discover Button
//                       Padding(
//                         padding: EdgeInsets.all(16),
//                         child: Row(
//                           mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                           children: [
//                             // Course Name
//                             Expanded(
//                               child: Text(
//                                 course.courseName,
//                                 style: TextStyle(
//                                   fontSize: 20,
//                                   fontWeight: FontWeight.bold,
//                                 ),
//                               ),
//                             ),
//                             // Discover Button
//                             ElevatedButton(
//                               onPressed: () {
//                                 _showVideoPopup(context, course.videoUrl);
//                               },
//                               child: Text("Discover"),
//                               style: ElevatedButton.styleFrom(
//                                 backgroundColor: Colors.blue,
//                               ),
//                             ),
//                           ],
//                         ),
//                       ),
//                     ],
//                   ),
//                 ),
//                 SizedBox(height: 16),
//                 // Overview Section
//                 Text(
//                   "Overview:",
//                   style: TextStyle(
//                     fontSize: 20,
//                     fontWeight: FontWeight.bold,
//                     color: Colors.blue,
//                   ),
//                 ),
//                 Divider(thickness: 1),
//                 SizedBox(height: 8),
//                 // Intro Section
//                 Text(
//                   "Intro:",
//                   style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
//                 ),
//                 SizedBox(height: 8),
//                 Text(course.intro),
//                 SizedBox(height: 16),
//                 // Why Take This Course Section
//                 Text(
//                   "Why take this course:",
//                   style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
//                 ),
//                 SizedBox(height: 8),
//                 Text(course.whyTakeThisCourse),
//                 SizedBox(height: 16),
//                 // What You Will Learn Section
//                 Text(
//                   "What you will learn in this course:",
//                   style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
//                 ),
//                 SizedBox(height: 8),
//                 // List of What You Will Learn
//                 Column(
//                   crossAxisAlignment: CrossAxisAlignment.start,
//                   children: course.whatYouWillLearn.map((item) {
//                     return Padding(
//                       padding: const EdgeInsets.symmetric(vertical: 4.0),
//                       child: Row(
//                         children: [
//                           Icon(Icons.check_circle, color: Colors.blue),
//                           SizedBox(width: 8),
//                           Expanded(child: Text(item)),
//                         ],
//                       ),
//                     );
//                   }).toList(),
//                 ),
//                 SizedBox(height: 16),
//                 // Course Description Section
//                 Text(
//                   "Course Description:",
//                   style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
//                 ),
//                 SizedBox(height: 8),
//                 Text(course.description),
//               ],
//             ),
//           );
//         } else {
//           return Center(
//             child: Text("Course not found."),
//           );
//         }
//       },
//     );
//   }
// }
//

// lib/pages/course_details_page_content.dart
import 'package:flutter/material.dart';
import '../../models/course.dart';
import '../../services/course_details_service.dart';
import '../../widgets/video_popup.dart';

class CourseDetailsPageContent extends StatefulWidget {
  final String courseId;

  const CourseDetailsPageContent({Key? key, required this.courseId}) : super(key: key);

  @override
  _CourseDetailsPageContentState createState() => _CourseDetailsPageContentState();
}

class _CourseDetailsPageContentState extends State<CourseDetailsPageContent> {
  final CourseDetailsService _courseDetailsService = CourseDetailsService();
  late Future<Course> _courseFuture;

  @override
  void initState() {
    super.initState();
    _courseFuture = _courseDetailsService.fetchCourseDetails(widget.courseId);
  }

  void _showVideoPopup(BuildContext context, String videoUrl) {
    showDialog(
      context: context,
      barrierDismissible: true,
      builder: (context) {
        return VideoPopup(videoUrl: videoUrl);
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<Course>(
      future: _courseFuture,
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return Center(
            child: CircularProgressIndicator(),
          );
        } else if (snapshot.hasError) {
          return Center(
            child: Text("Failed to load course details."),
          );
        } else if (snapshot.hasData) {
          Course course = snapshot.data!;
          return SingleChildScrollView(
            padding: EdgeInsets.all(16),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // Card with Course Details
                Card(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(8),
                  ),
                  child: Column(
                    children: [
                      // Course Image
                      ClipRRect(
                        borderRadius: BorderRadius.vertical(top: Radius.circular(8)),
                        child: Image.network(
                          course.image,
                          width: double.infinity,
                          height: 200,
                          fit: BoxFit.cover,
                        ),
                      ),
                      // Course Name and Discover Button
                      Padding(
                        padding: EdgeInsets.all(16),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            // Course Name
                            Expanded(
                              child: Text(
                                course.courseName,
                                style: TextStyle(
                                  fontSize: 20,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ),
                            // Discover Button
                            ElevatedButton(
                              onPressed: () {
                                _showVideoPopup(context, course.videoUrl);
                              },
                              child: Text("Discover"),
                              style: ElevatedButton.styleFrom(
                                backgroundColor: Colors.blue,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(height: 16),
                // Overview Section
                Text(
                  "Overview:",
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                    color: Colors.blue,
                  ),
                ),
                Divider(thickness: 1),
                SizedBox(height: 8),
                // Intro Section
                Text(
                  "Intro:",
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
                ),
                SizedBox(height: 8),
                Text(course.intro),
                SizedBox(height: 16),
                // Why Take This Course Section
                Text(
                  "Why take this course:",
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
                ),
                SizedBox(height: 8),
                Text(course.whyTakeThisCourse),
                SizedBox(height: 16),
                // What You Will Learn Section
                Text(
                  "What you will learn in this course:",
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
                ),
                SizedBox(height: 8),
                // List of What You Will Learn
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: course.whatYouWillLearn.map((item) {
                    return Padding(
                      padding: const EdgeInsets.symmetric(vertical: 4.0),
                      child: Row(
                        children: [
                          Icon(Icons.check_circle, color: Colors.blue),
                          SizedBox(width: 8),
                          Expanded(child: Text(item)),
                        ],
                      ),
                    );
                  }).toList(),
                ),
                SizedBox(height: 16),
                // Course Description Section
                Text(
                  "Course Description:",
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
                ),
                SizedBox(height: 8),
                Text(course.description),
              ],
            ),
          );
        } else {
          return const Center(
            child: Text("Course not found."),
          );
        }
      },
    );
  }
}

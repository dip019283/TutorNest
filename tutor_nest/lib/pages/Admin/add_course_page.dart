// // add_course_page.dart
// import 'package:flutter/material.dart';
// import 'package:cloud_firestore/cloud_firestore.dart'; // Import Firestore
//
// class AddCoursePage extends StatefulWidget {
//   @override
//   _AddCoursePageState createState() => _AddCoursePageState();
// }
//
// class _AddCoursePageState extends State<AddCoursePage> {
//   // Controllers for form fields
//   final TextEditingController _courseNameController = TextEditingController();
//   final TextEditingController _courseDescriptionController = TextEditingController();
//   final TextEditingController _coursePriceController = TextEditingController();
//   // Add more controllers as needed
//
//   // Method to handle form submission
//   Future<void> _submitCourse() async {
//     String courseName = _courseNameController.text.trim();
//     String courseDescription = _courseDescriptionController.text.trim();
//     String coursePrice = _coursePriceController.text.trim();
//
//     if (courseName.isEmpty || courseDescription.isEmpty || coursePrice.isEmpty) {
//       // Show error message
//       ScaffoldMessenger.of(context).showSnackBar(
//         SnackBar(content: Text('Please fill all fields')),
//       );
//       return;
//     }
//
//     // Validate course price
//     double? price = double.tryParse(coursePrice);
//     if (price == null || price < 0) {
//       ScaffoldMessenger.of(context).showSnackBar(
//         SnackBar(content: Text('Please enter a valid price')),
//       );
//       return;
//     }
//
//     try {
//       await FirebaseFirestore.instance.collection('courses').add({
//         'name': courseName,
//         'description': courseDescription,
//         'price': price,
//         'createdAt': FieldValue.serverTimestamp(),
//         // Add more fields as necessary
//       });
//
//       // Show success message
//       ScaffoldMessenger.of(context).showSnackBar(
//         SnackBar(content: Text('Course added successfully')),
//       );
//
//       // Clear the form
//       _courseNameController.clear();
//       _courseDescriptionController.clear();
//       _coursePriceController.clear();
//
//       // Optionally, navigate back to the dashboard
//       // Navigator.pop(context);
//     } catch (e) {
//       // Handle errors
//       ScaffoldMessenger.of(context).showSnackBar(
//         SnackBar(content: Text('Error adding course: $e')),
//       );
//     }
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text('Add Course'),
//         backgroundColor: Colors.teal,
//       ),
//       body: Padding(
//         padding: EdgeInsets.all(16.0),
//         child: Column(
//           children: [
//             // Course Name Field
//             TextField(
//               controller: _courseNameController,
//               decoration: InputDecoration(
//                 labelText: 'Course Name',
//                 border: OutlineInputBorder(),
//               ),
//             ),
//             SizedBox(height: 16.0),
//
//             // Course Description Field
//             TextField(
//               controller: _courseDescriptionController,
//               decoration: InputDecoration(
//                 labelText: 'Course Description',
//                 border: OutlineInputBorder(),
//               ),
//               maxLines: 3,
//             ),
//             SizedBox(height: 16.0),
//
//             // Course Price Field
//             TextField(
//               controller: _coursePriceController,
//               decoration: InputDecoration(
//                 labelText: 'Course Price',
//                 border: OutlineInputBorder(),
//               ),
//               keyboardType: TextInputType.numberWithOptions(decimal: true),
//             ),
//             SizedBox(height: 16.0),
//
//             // Add more fields as necessary (e.g., Course Duration, Category)
//
//             // Submit Button
//             ElevatedButton(
//               onPressed: _submitCourse,
//               style: ElevatedButton.styleFrom(
//                 backgroundColor: Colors.teal, // Button color
//               ),
//               child: Text('Add Course'),
//             ),
//           ],
//         ),
//       ),
//     );
//   }
//
//   @override
//   void dispose() {
//     // Dispose controllers when the widget is removed
//     _courseNameController.dispose();
//     _courseDescriptionController.dispose();
//     _coursePriceController.dispose();
//     super.dispose();
//   }
// }

// add_course_page.dart
// import 'package:flutter/material.dart';
// import 'package:cloud_firestore/cloud_firestore.dart'; // Firestore integration (to be used later)
//
// class AddCoursePage extends StatefulWidget {
//   @override
//   _AddCoursePageState createState() => _AddCoursePageState();
// }
//
// class _AddCoursePageState extends State<AddCoursePage> {
//   // Controllers for form fields
//   final TextEditingController _courseNameController = TextEditingController();
//   final TextEditingController _courseImageController = TextEditingController();
//   final TextEditingController _courseVideoController = TextEditingController();
//   final TextEditingController _courseIntroController = TextEditingController();
//   final TextEditingController _courseReasonController = TextEditingController();
//   final TextEditingController _learnCourseController = TextEditingController();
//   final TextEditingController _coursePageController = TextEditingController();
//
//   // Method to handle form submission
//   Future<void> _submitCourse() async {
//     // For now, using dummy data. Replace these with actual user inputs when integrating.
//     String courseName = _courseNameController.text.trim().isEmpty
//         ? 'Dummy Course Name'
//         : _courseNameController.text.trim();
//
//     String courseImage = _courseImageController.text.trim().isEmpty
//         ? 'https://via.placeholder.com/150' // Dummy image URL
//         : _courseImageController.text.trim();
//
//     String courseVideo = _courseVideoController.text.trim().isEmpty
//         ? 'https://www.example.com/dummyvideo.mp4' // Dummy video URL
//         : _courseVideoController.text.trim();
//
//     String courseIntro = _courseIntroController.text.trim().isEmpty
//         ? 'This is a dummy introduction to the course.'
//         : _courseIntroController.text.trim();
//
//     String courseReason = _courseReasonController.text.trim().isEmpty
//         ? 'This dummy reason explains why the course is valuable.'
//         : _courseReasonController.text.trim();
//
//     // Split the learn course field into bullet points
//     List<String> learnCourse = _learnCourseController.text.trim().isEmpty
//         ? [
//       'Dummy learning point 1',
//       'Dummy learning point 2',
//       'Dummy learning point 3',
//     ]
//         : _learnCourseController.text
//         .split('\n')
//         .where((point) => point.trim().isNotEmpty)
//         .toList();
//
//     String coursePage = _coursePageController.text.trim().isEmpty
//         ? 'https://www.example.com/dummycoursepage' // Dummy course page URL
//         : _coursePageController.text.trim();
//
//     // Create a map of the course data
//     Map<String, dynamic> courseData = {
//       'name': courseName,
//       'image': courseImage,
//       'video': courseVideo,
//       'intro': courseIntro,
//       'reason': courseReason,
//       'learnCourse': learnCourse,
//       'coursePage': coursePage,
//       'createdAt': FieldValue.serverTimestamp(), // Timestamp for future use
//     };
//
//     // For now, print the data. Replace this with Firestore integration later.
//     print('Course Data: $courseData');
//
//     // Show success message
//     ScaffoldMessenger.of(context).showSnackBar(
//       SnackBar(content: Text('Course data prepared successfully')),
//     );
//
//     // Clear the form (optional)
//     _clearForm();
//   }
//
//   // Method to clear the form fields
//   void _clearForm() {
//     _courseNameController.clear();
//     _courseImageController.clear();
//     _courseVideoController.clear();
//     _courseIntroController.clear();
//     _courseReasonController.clear();
//     _learnCourseController.clear();
//     _coursePageController.clear();
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text('Add Course'),
//         backgroundColor: Colors.teal,
//       ),
//       body: SingleChildScrollView(
//         padding: EdgeInsets.all(16.0),
//         child: Column(
//           children: [
//             // Course Name Field
//             TextField(
//               controller: _courseNameController,
//               decoration: InputDecoration(
//                 labelText: 'Course Name',
//                 border: OutlineInputBorder(),
//               ),
//             ),
//             SizedBox(height: 16.0),
//
//             // Course Image URL Field
//             TextField(
//               controller: _courseImageController,
//               decoration: InputDecoration(
//                 labelText: 'Course Image URL',
//                 border: OutlineInputBorder(),
//                 hintText: 'Enter image URL or select an image',
//               ),
//               keyboardType: TextInputType.url,
//             ),
//             SizedBox(height: 16.0),
//
//             // Course Video URL Field
//             TextField(
//               controller: _courseVideoController,
//               decoration: InputDecoration(
//                 labelText: 'Course Video URL',
//                 border: OutlineInputBorder(),
//                 hintText: 'Enter video URL or select a video',
//               ),
//               keyboardType: TextInputType.url,
//             ),
//             SizedBox(height: 16.0),
//
//             // Course Intro Field
//             TextField(
//               controller: _courseIntroController,
//               decoration: InputDecoration(
//                 labelText: 'Course Intro',
//                 border: OutlineInputBorder(),
//               ),
//               maxLines: 3,
//             ),
//             SizedBox(height: 16.0),
//
//             // Course Reason Field
//             TextField(
//               controller: _courseReasonController,
//               decoration: InputDecoration(
//                 labelText: 'Course Reason',
//                 border: OutlineInputBorder(),
//               ),
//               maxLines: 3,
//             ),
//             SizedBox(height: 16.0),
//
//             // Learn Course Field (Bullet Points)
//             TextField(
//               controller: _learnCourseController,
//               decoration: InputDecoration(
//                 labelText: 'Learn Course (Enter each point on a new line)',
//                 border: OutlineInputBorder(),
//                 hintText: '• Point 1\n• Point 2\n• Point 3',
//               ),
//               maxLines: 5,
//             ),
//             SizedBox(height: 16.0),
//
//             // Course Page URL Field
//             TextField(
//               controller: _coursePageController,
//               decoration: InputDecoration(
//                 labelText: 'Course Page URL',
//                 border: OutlineInputBorder(),
//                 hintText: 'Enter course page URL',
//               ),
//               keyboardType: TextInputType.url,
//             ),
//             SizedBox(height: 24.0),
//
//             // Submit Button
//             ElevatedButton(
//               onPressed: _submitCourse,
//               style: ElevatedButton.styleFrom(
//                 backgroundColor: Colors.teal, // Button color
//                 padding:
//                 EdgeInsets.symmetric(horizontal: 50.0, vertical: 15.0),
//                 textStyle: TextStyle(fontSize: 16.0),
//               ),
//               child: Text('Add Course'),
//             ),
//           ],
//         ),
//       ),
//     );
//   }
//
//   @override
//   void dispose() {
//     // Dispose controllers when the widget is removed
//     _courseNameController.dispose();
//     _courseImageController.dispose();
//     _courseVideoController.dispose();
//     _courseIntroController.dispose();
//     _courseReasonController.dispose();
//     _learnCourseController.dispose();
//     _coursePageController.dispose();
//     super.dispose();
//   }
// }


// add_course_page.dart
import 'package:flutter/material.dart';
import 'package:uuid/uuid.dart';
import 'package:image_picker/image_picker.dart';
import 'dart:io';

class AddCoursePage extends StatefulWidget {
  @override
  _AddCoursePageState createState() => _AddCoursePageState();
}

class _AddCoursePageState extends State<AddCoursePage> {
  final _formKey = GlobalKey<FormState>();

  // Controllers for form fields
  final TextEditingController _courseNameController = TextEditingController();
  final TextEditingController _courseIntroController = TextEditingController();
  final TextEditingController _courseReasonController = TextEditingController();
  final TextEditingController _courseDescriptionController =
  TextEditingController();
  final TextEditingController _learnCourseController = TextEditingController();

  // Variables for image and video
  File? _selectedImage;
  File? _selectedVideo;

  // UUID generator
  final Uuid _uuid = Uuid();
  String? _courseId;

  // Method to pick image
  Future<void> _pickImage() async {
    final picker = ImagePicker();
    final pickedFile =
    await picker.pickImage(source: ImageSource.gallery, imageQuality: 50);

    if (pickedFile != null) {
      setState(() {
        _selectedImage = File(pickedFile.path);
      });
    }
  }

  // Method to pick video
  Future<void> _pickVideo() async {
    final picker = ImagePicker();
    final pickedFile = await picker.pickVideo(source: ImageSource.gallery);

    if (pickedFile != null) {
      setState(() {
        _selectedVideo = File(pickedFile.path);
      });
    }
  }

  // Method to handle form submission
  void _submitCourse() {
    if (_formKey.currentState!.validate()) {
      // Generate a unique course ID
      _courseId = _uuid.v4();

      // Collect learn course points
      List<String> learnCoursePoints = _learnCourseController.text
          .split(',')
          .map((e) => e.trim())
          .where((e) => e.isNotEmpty)
          .toList();

      // Create a course map with dummy data
      Map<String, dynamic> courseData = {
        'id': _courseId,
        'name': _courseNameController.text.trim(),
        'intro': _courseIntroController.text.trim(),
        'reason': _courseReasonController.text.trim(),
        'learn_course': learnCoursePoints,
        'description': _courseDescriptionController.text.trim(),
        'image_path':
        _selectedImage != null ? _selectedImage!.path : 'dummy_image.jpg',
        'video_path':
        _selectedVideo != null ? _selectedVideo!.path : 'dummy_video.mp4',
        'created_at': DateTime.now().toIso8601String(),
        // Add more fields as necessary
      };

      // For now, print the data. Replace this with your database integration.
      print('Course Data: $courseData');

      // Show success message
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Course added successfully!')),
      );

      // Clear the form
      _formKey.currentState!.reset();
      setState(() {
        _selectedImage = null;
        _selectedVideo = null;
      });
    }
  }

  @override
  void dispose() {
    // Dispose controllers when the widget is removed
    _courseNameController.dispose();
    _courseIntroController.dispose();
    _courseReasonController.dispose();
    _courseDescriptionController.dispose();
    _learnCourseController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Add Course'),
        backgroundColor: Colors.teal,
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.all(16.0),
        child: Form(
          key: _formKey,
          child: Column(
            children: [
              // Course ID (auto-generated, hidden)
              // Display the course ID if available
              if (_courseId != null)
                Text(
                  'Course ID: $_courseId',
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
              SizedBox(height: 16.0),

              // Course Name Field
              TextFormField(
                controller: _courseNameController,
                decoration: InputDecoration(
                  labelText: 'Course Name',
                  border: OutlineInputBorder(),
                ),
                validator: (value) {
                  if (value == null || value.trim().isEmpty) {
                    return 'Please enter the course name';
                  }
                  return null;
                },
              ),
              SizedBox(height: 16.0),

              // Course Intro Field
              TextFormField(
                controller: _courseIntroController,
                decoration: InputDecoration(
                  labelText: 'Course Intro',
                  border: OutlineInputBorder(),
                ),
                maxLines: 2,
                validator: (value) {
                  if (value == null || value.trim().isEmpty) {
                    return 'Please enter the course intro';
                  }
                  return null;
                },
              ),
              SizedBox(height: 16.0),

              // Course Reason Field
              TextFormField(
                controller: _courseReasonController,
                decoration: InputDecoration(
                  labelText: 'Course Reason',
                  border: OutlineInputBorder(),
                ),
                maxLines: 2,
                validator: (value) {
                  if (value == null || value.trim().isEmpty) {
                    return 'Please enter the course reason';
                  }
                  return null;
                },
              ),
              SizedBox(height: 16.0),

              // Learn Course Field (Bullet Points)
              TextFormField(
                controller: _learnCourseController,
                decoration: InputDecoration(
                  labelText: 'Learn Course (separated by commas)',
                  border: OutlineInputBorder(),
                  hintText: 'e.g., Point 1, Point 2, Point 3',
                ),
                maxLines: 3,
                validator: (value) {
                  if (value == null || value.trim().isEmpty) {
                    return 'Please enter at least one learning point';
                  }
                  return null;
                },
              ),
              SizedBox(height: 16.0),

              // Course Description Field
              TextFormField(
                controller: _courseDescriptionController,
                decoration: InputDecoration(
                  labelText: 'Course Description',
                  border: OutlineInputBorder(),
                ),
                maxLines: 4,
                validator: (value) {
                  if (value == null || value.trim().isEmpty) {
                    return 'Please enter the course description';
                  }
                  return null;
                },
              ),
              SizedBox(height: 16.0),

              // Course Image Picker
              Row(
                children: [
                  ElevatedButton.icon(
                    onPressed: _pickImage,
                    icon: Icon(Icons.image),
                    label: Text('Select Course Image'),
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.teal,
                    ),
                  ),
                  SizedBox(width: 10),
                  _selectedImage != null
                      ? Image.file(
                    _selectedImage!,
                    width: 100,
                    height: 100,
                    fit: BoxFit.cover,
                  )
                      : Text('No image selected'),
                ],
              ),
              SizedBox(height: 16.0),

              // Course Video Picker
              Row(
                children: [
                  ElevatedButton.icon(
                    onPressed: _pickVideo,
                    icon: Icon(Icons.video_library),
                    label: Text('Select Course Video'),
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.teal,
                    ),
                  ),
                  SizedBox(width: 10),
                  _selectedVideo != null
                      ? Text(
                    'Video Selected',
                    style: TextStyle(fontWeight: FontWeight.bold),
                  )
                      : Text('No video selected'),
                ],
              ),
              SizedBox(height: 24.0),

              // Submit Button
              ElevatedButton(
                onPressed: _submitCourse,
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.teal,
                  padding:
                  EdgeInsets.symmetric(horizontal: 50.0, vertical: 15.0),
                  textStyle:
                  TextStyle(fontSize: 16.0, fontWeight: FontWeight.bold),
                ),
                child: Text('Add Course'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

// // add_tutor_page.dart
//
// import 'dart:io';
//
// import 'package:cloud_firestore/cloud_firestore.dart';
// // Removed Firebase Storage import
// import 'package:flutter/material.dart';
// import 'package:image_picker/image_picker.dart';
// import 'package:file_picker/file_picker.dart';
// import 'package:uuid/uuid.dart';
//
// class AddTutorPage extends StatefulWidget {
//   @override
//   _AddTutorPageState createState() => _AddTutorPageState();
// }
//
// class _AddTutorPageState extends State<AddTutorPage> {
//   // Controllers for form fields
//   final TextEditingController _nameController = TextEditingController();
//   final TextEditingController _emailController = TextEditingController();
//   final TextEditingController _addressController = TextEditingController();
//   final TextEditingController _dobController = TextEditingController();
//   final TextEditingController _interestsController = TextEditingController();
//   final TextEditingController _educationController = TextEditingController();
//   final TextEditingController _experienceController = TextEditingController();
//   final TextEditingController _professionController = TextEditingController();
//   final TextEditingController _instructionController = TextEditingController();
//   final TextEditingController _languageController = TextEditingController();
//
//   // Variables to hold selected files
//   File? _tutorImage;
//   File? _tutorVideo;
//   List<Certificate> _certificates = [];
//
//   // Loading state
//   bool _isLoading = false;
//
//   // Image Picker instance
//   final ImagePicker _picker = ImagePicker();
//
//   // UUID for unique file names
//   final Uuid _uuid = Uuid();
//
//   // Method to pick image from gallery
//   Future<void> _pickImage() async {
//     final pickedFile =
//     await _picker.pickImage(source: ImageSource.gallery, imageQuality: 80);
//     if (pickedFile != null) {
//       setState(() {
//         _tutorImage = File(pickedFile.path);
//       });
//     }
//   }
//
//   // Method to pick video from gallery
//   Future<void> _pickVideo() async {
//     final pickedFile = await _picker.pickVideo(
//         source: ImageSource.gallery, maxDuration: Duration(minutes: 5));
//     if (pickedFile != null) {
//       setState(() {
//         _tutorVideo = File(pickedFile.path);
//       });
//     }
//   }
//
//   // Method to pick certificate file
//   Future<void> _pickCertificateFile(Certificate certificate) async {
//     final result = await FilePicker.platform.pickFiles(
//       type: FileType.custom,
//       allowedExtensions: ['pdf', 'jpg', 'png'],
//     );
//
//     if (result != null && result.files.single.path != null) {
//       setState(() {
//         certificate.file = File(result.files.single.path!);
//         certificate.fileName = result.files.single.name;
//       });
//     }
//   }
//
//   // Method to add a new certificate
//   void _addCertificate() {
//     showDialog(
//       context: context,
//       builder: (context) {
//         String certificateType = '';
//         return AlertDialog(
//           title: Text('Add Certificate'),
//           content: Column(
//             mainAxisSize: MainAxisSize.min,
//             children: [
//               TextField(
//                 decoration: InputDecoration(labelText: 'Certificate Type'),
//                 onChanged: (value) {
//                   certificateType = value;
//                 },
//               ),
//               SizedBox(height: 10),
//               ElevatedButton(
//                 onPressed: () async {
//                   // Pick certificate file
//                   final result = await FilePicker.platform.pickFiles(
//                     type: FileType.custom,
//                     allowedExtensions: ['pdf', 'jpg', 'png'],
//                   );
//
//                   if (result != null && result.files.single.path != null) {
//                     setState(() {
//                       _certificates.add(Certificate(
//                         type: certificateType,
//                         file: File(result.files.single.path!),
//                         fileName: result.files.single.name,
//                       ));
//                     });
//                     Navigator.of(context).pop();
//                   }
//                 },
//                 child: Text('Upload Certificate'),
//                 style: ElevatedButton.styleFrom(
//                   backgroundColor: Colors.purple,
//                 ),
//               ),
//             ],
//           ),
//           actions: [
//             TextButton(
//               onPressed: () => Navigator.of(context).pop(),
//               child: Text('Cancel'),
//             ),
//           ],
//         );
//       },
//     );
//   }
//
//   // Method to delete a certificate
//   void _deleteCertificate(int index) {
//     setState(() {
//       _certificates.removeAt(index);
//     });
//   }
//
//   // Method to select date of birth
//   Future<void> _selectDOB() async {
//     DateTime? pickedDate = await showDatePicker(
//       context: context,
//       initialDate: DateTime(1990),
//       firstDate: DateTime(1950),
//       lastDate: DateTime.now(),
//     );
//
//     if (pickedDate != null) {
//       setState(() {
//         _dobController.text = "${pickedDate.toLocal()}".split(' ')[0];
//       });
//     }
//   }
//
//   // Placeholder method to upload files to your chosen storage
//   // Replace this method with your storage upload logic
//   Future<String?> _uploadFile(File file, String folder) async {
//     try {
//       // Example:
//       // 1. Upload the file to your storage and get the URL
//       // 2. Return the URL as a String
//
//       // Placeholder: Return the local file path or a mock URL
//       // Replace with actual upload logic
//       return 'https://your-storage-service.com/$folder/${_uuid.v4()}_${file.path.split('/').last}';
//     } catch (e) {
//       print('Error uploading file: $e');
//       return null;
//     }
//   }
//
//   // Method to handle form submission
//   Future<void> _submitTutor() async {
//     // Gather all inputs
//     String name = _nameController.text.trim();
//     String email = _emailController.text.trim();
//     String address = _addressController.text.trim();
//     String dob = _dobController.text.trim();
//     String interests = _interestsController.text.trim();
//     String education = _educationController.text.trim();
//     String experience = _experienceController.text.trim();
//     String profession = _professionController.text.trim();
//     String instruction = _instructionController.text.trim();
//     String language = _languageController.text.trim();
//
//     // Basic validation
//     if (name.isEmpty ||
//         email.isEmpty ||
//         address.isEmpty ||
//         dob.isEmpty ||
//         interests.isEmpty ||
//         education.isEmpty ||
//         experience.isEmpty ||
//         profession.isEmpty ||
//         instruction.isEmpty ||
//         language.isEmpty) {
//       ScaffoldMessenger.of(context).showSnackBar(
//         SnackBar(content: Text('Please fill all fields')),
//       );
//       return;
//     }
//
//     setState(() {
//       _isLoading = true;
//     });
//
//     try {
//       // Upload image
//       String? imageUrl;
//       if (_tutorImage != null) {
//         imageUrl = await _uploadFile(_tutorImage!, 'tutor_images');
//         // Implement your storage upload logic and get the imageUrl
//       }
//
//       // Upload video
//       String? videoUrl;
//       if (_tutorVideo != null) {
//         videoUrl = await _uploadFile(_tutorVideo!, 'tutor_videos');
//         // Implement your storage upload logic and get the videoUrl
//       }
//
//       // Upload certificates
//       List<Map<String, dynamic>> certificateData = [];
//       for (var cert in _certificates) {
//         if (cert.file != null) {
//           String? certUrl = await _uploadFile(cert.file!, 'tutor_certificates');
//           // Implement your storage upload logic and get the certUrl
//           if (certUrl != null) {
//             certificateData.add({
//               'type': cert.type,
//               'name': cert.fileName,
//               'url': certUrl,
//             });
//           }
//         }
//       }
//
//       // Add tutor data to Firestore
//       await FirebaseFirestore.instance.collection('tutors').add({
//         'name': name,
//         'email': email,
//         'address': address,
//         'date_of_birth': dob,
//         'interests': interests,
//         'education': education,
//         'experience': experience,
//         'profession': profession,
//         'instruction': instruction,
//         'language': language,
//         'image_url': imageUrl,
//         'video_url': videoUrl,
//         'certificates': certificateData,
//         'createdAt': FieldValue.serverTimestamp(),
//       });
//
//       // Show success message
//       ScaffoldMessenger.of(context).showSnackBar(
//         SnackBar(content: Text('Tutor added successfully')),
//       );
//
//       // Clear the form
//       _nameController.clear();
//       _emailController.clear();
//       _addressController.clear();
//       _dobController.clear();
//       _interestsController.clear();
//       _educationController.clear();
//       _experienceController.clear();
//       _professionController.clear();
//       _instructionController.clear();
//       _languageController.clear();
//       setState(() {
//         _tutorImage = null;
//         _tutorVideo = null;
//         _certificates.clear();
//       });
//
//       // Optionally, navigate back or to another page
//       // Navigator.pop(context);
//     } catch (e) {
//       // Handle errors
//       print('Error adding tutor: $e');
//       ScaffoldMessenger.of(context).showSnackBar(
//         SnackBar(content: Text('Error adding tutor: $e')),
//       );
//     } finally {
//       setState(() {
//         _isLoading = false;
//       });
//     }
//   }
//
//   @override
//   void dispose() {
//     // Dispose controllers when the widget is removed
//     _nameController.dispose();
//     _emailController.dispose();
//     _addressController.dispose();
//     _dobController.dispose();
//     _interestsController.dispose();
//     _educationController.dispose();
//     _experienceController.dispose();
//     _professionController.dispose();
//     _instructionController.dispose();
//     _languageController.dispose();
//     super.dispose();
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text('Add Tutor'),
//         backgroundColor: Colors.purple,
//       ),
//       body: _isLoading
//           ? Center(child: CircularProgressIndicator())
//           : SingleChildScrollView(
//         padding: EdgeInsets.all(16.0),
//         child: Column(
//           children: [
//             // Tutor Name
//             TextField(
//               controller: _nameController,
//               decoration: InputDecoration(
//                 labelText: 'Tutor Name',
//                 border: OutlineInputBorder(),
//               ),
//             ),
//             SizedBox(height: 16.0),
//
//             // Tutor Email
//             TextField(
//               controller: _emailController,
//               decoration: InputDecoration(
//                 labelText: 'Tutor Email',
//                 border: OutlineInputBorder(),
//               ),
//               keyboardType: TextInputType.emailAddress,
//             ),
//             SizedBox(height: 16.0),
//
//             // Tutor Address
//             TextField(
//               controller: _addressController,
//               decoration: InputDecoration(
//                 labelText: 'Tutor Address',
//                 border: OutlineInputBorder(),
//               ),
//             ),
//             SizedBox(height: 16.0),
//
//             // Tutor Date of Birth
//             TextField(
//               controller: _dobController,
//               decoration: InputDecoration(
//                 labelText: 'Date of Birth',
//                 border: OutlineInputBorder(),
//                 suffixIcon: Icon(Icons.calendar_today),
//               ),
//               readOnly: true,
//               onTap: _selectDOB,
//             ),
//             SizedBox(height: 16.0),
//
//             // Tutor Interests
//             TextField(
//               controller: _interestsController,
//               decoration: InputDecoration(
//                 labelText: 'Interests',
//                 border: OutlineInputBorder(),
//               ),
//             ),
//             SizedBox(height: 16.0),
//
//             // Tutor Education
//             TextField(
//               controller: _educationController,
//               decoration: InputDecoration(
//                 labelText: 'Education',
//                 border: OutlineInputBorder(),
//               ),
//             ),
//             SizedBox(height: 16.0),
//
//             // Tutor Experience
//             TextField(
//               controller: _experienceController,
//               decoration: InputDecoration(
//                 labelText: 'Experience',
//                 border: OutlineInputBorder(),
//               ),
//             ),
//             SizedBox(height: 16.0),
//
//             // Tutor Profession
//             TextField(
//               controller: _professionController,
//               decoration: InputDecoration(
//                 labelText: 'Current/Previous Profession',
//                 border: OutlineInputBorder(),
//               ),
//             ),
//             SizedBox(height: 16.0),
//
//             // Tutor Instruction
//             TextField(
//               controller: _instructionController,
//               decoration: InputDecoration(
//                 labelText: 'Instruction',
//                 border: OutlineInputBorder(),
//               ),
//             ),
//             SizedBox(height: 16.0),
//
//             // Tutor Language
//             TextField(
//               controller: _languageController,
//               decoration: InputDecoration(
//                 labelText: 'Language',
//                 border: OutlineInputBorder(),
//               ),
//             ),
//             SizedBox(height: 16.0),
//
//             // Tutor Image
//             Row(
//               children: [
//                 ElevatedButton.icon(
//                   onPressed: _pickImage,
//                   icon: Icon(Icons.image),
//                   label: Text('Upload Image'),
//                   style: ElevatedButton.styleFrom(
//                     backgroundColor: Colors.purple,
//                   ),
//                 ),
//                 SizedBox(width: 10),
//                 _tutorImage != null
//                     ? Image.file(
//                   _tutorImage!,
//                   width: 100,
//                   height: 100,
//                   fit: BoxFit.cover,
//                 )
//                     : Text('No image selected'),
//               ],
//             ),
//             SizedBox(height: 16.0),
//
//             // Tutor Video
//             Row(
//               children: [
//                 ElevatedButton.icon(
//                   onPressed: _pickVideo,
//                   icon: Icon(Icons.video_library),
//                   label: Text('Upload Video'),
//                   style: ElevatedButton.styleFrom(
//                     backgroundColor: Colors.purple,
//                   ),
//                 ),
//                 SizedBox(width: 10),
//                 _tutorVideo != null
//                     ? Expanded(
//                   child: Text(
//                       'Video Selected: ${_tutorVideo!.path.split('/').last}'),
//                 )
//                     : Text('No video selected'),
//               ],
//             ),
//             SizedBox(height: 16.0),
//
//             // Certificates
//             Row(
//               mainAxisAlignment: MainAxisAlignment.spaceBetween,
//               children: [
//                 Text(
//                   'Certificates',
//                   style: TextStyle(
//                       fontSize: 16, fontWeight: FontWeight.bold),
//                 ),
//                 ElevatedButton.icon(
//                   onPressed: _addCertificate,
//                   icon: Icon(Icons.add),
//                   label: Text('Add Certificate'),
//                   style: ElevatedButton.styleFrom(
//                     backgroundColor: Colors.purple,
//                   ),
//                 ),
//               ],
//             ),
//             SizedBox(height: 10),
//             _certificates.isEmpty
//                 ? Text('No certificates added')
//                 : ListView.builder(
//               shrinkWrap: true,
//               physics: NeverScrollableScrollPhysics(),
//               itemCount: _certificates.length,
//               itemBuilder: (context, index) {
//                 return Card(
//                   child: ListTile(
//                     title: Text(_certificates[index].type),
//                     subtitle: Text(_certificates[index]
//                         .fileName ??
//                         'No file selected'),
//                     trailing: IconButton(
//                       icon: Icon(Icons.delete, color: Colors.red),
//                       onPressed: () => _deleteCertificate(index),
//                     ),
//                   ),
//                 );
//               },
//             ),
//             SizedBox(height: 20),
//
//             // Submit Button
//             ElevatedButton(
//               onPressed: _submitTutor,
//               style: ElevatedButton.styleFrom(
//                 backgroundColor: Colors.purple,
//                 minimumSize: Size(double.infinity, 50), // Full width
//               ),
//               child: Text(
//                 'Add Tutor',
//                 style: TextStyle(fontSize: 16),
//               ),
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }
//
// // Certificate Model
// class Certificate {
//   String type;
//   File? file;
//   String? fileName;
//
//   Certificate({required this.type, this.file, this.fileName});
// }

// add_tutor_page.dart

// import 'dart:io';
//
// import 'package:cloud_firestore/cloud_firestore.dart';
// // Removed Firebase Storage import
// import 'package:flutter/material.dart';
// import 'package:image_picker/image_picker.dart';
// import 'package:file_picker/file_picker.dart';
// import 'package:uuid/uuid.dart';
//
// class AddTutorPage extends StatefulWidget {
//   @override
//   _AddTutorPageState createState() => _AddTutorPageState();
// }
//
// class _AddTutorPageState extends State<AddTutorPage> {
//   // Controllers for form fields
//   final TextEditingController _nameController = TextEditingController();
//   final TextEditingController _emailController = TextEditingController();
//   final TextEditingController _addressController = TextEditingController();
//   final TextEditingController _dobController = TextEditingController();
//   final TextEditingController _interestsController = TextEditingController();
//   final TextEditingController _educationController = TextEditingController();
//   final TextEditingController _experienceController = TextEditingController();
//   final TextEditingController _professionController = TextEditingController();
//   final TextEditingController _instructionController = TextEditingController();
//   final TextEditingController _languageController = TextEditingController();
//
//   // New: Variable to hold selected status
//   String _selectedStatus = 'Unverified'; // Default value
//
//   // Variables to hold selected files
//   File? _tutorImage;
//   File? _tutorVideo;
//   List<Certificate> _certificates = [];
//
//   // Loading state
//   bool _isLoading = false;
//
//   // Image Picker instance
//   final ImagePicker _picker = ImagePicker();
//
//   // UUID for unique file names
//   final Uuid _uuid = Uuid();
//
//   // Method to pick image from gallery
//   Future<void> _pickImage() async {
//     final pickedFile =
//     await _picker.pickImage(source: ImageSource.gallery, imageQuality: 80);
//     if (pickedFile != null) {
//       setState(() {
//         _tutorImage = File(pickedFile.path);
//       });
//     }
//   }
//
//   // Method to pick video from gallery
//   Future<void> _pickVideo() async {
//     final pickedFile = await _picker.pickVideo(
//         source: ImageSource.gallery, maxDuration: Duration(minutes: 5));
//     if (pickedFile != null) {
//       setState(() {
//         _tutorVideo = File(pickedFile.path);
//       });
//     }
//   }
//
//   // Method to pick certificate file
//   Future<void> _pickCertificateFile(Certificate certificate) async {
//     final result = await FilePicker.platform.pickFiles(
//       type: FileType.custom,
//       allowedExtensions: ['pdf', 'jpg', 'png'],
//     );
//
//     if (result != null && result.files.single.path != null) {
//       setState(() {
//         certificate.file = File(result.files.single.path!);
//         certificate.fileName = result.files.single.name;
//       });
//     }
//   }
//
//   // Method to add a new certificate
//   void _addCertificate() {
//     showDialog(
//       context: context,
//       builder: (context) {
//         String certificateType = '';
//         return AlertDialog(
//           title: Text('Add Certificate'),
//           content: Column(
//             mainAxisSize: MainAxisSize.min,
//             children: [
//               TextField(
//                 decoration: InputDecoration(labelText: 'Certificate Type'),
//                 onChanged: (value) {
//                   certificateType = value;
//                 },
//               ),
//               SizedBox(height: 10),
//               ElevatedButton(
//                 onPressed: () async {
//                   // Pick certificate file
//                   final result = await FilePicker.platform.pickFiles(
//                     type: FileType.custom,
//                     allowedExtensions: ['pdf', 'jpg', 'png'],
//                   );
//
//                   if (result != null && result.files.single.path != null) {
//                     setState(() {
//                       _certificates.add(Certificate(
//                         type: certificateType,
//                         file: File(result.files.single.path!),
//                         fileName: result.files.single.name,
//                       ));
//                     });
//                     Navigator.of(context).pop();
//                   }
//                 },
//                 child: Text('Upload Certificate'),
//                 style: ElevatedButton.styleFrom(
//                   backgroundColor: Colors.purple,
//                 ),
//               ),
//             ],
//           ),
//           actions: [
//             TextButton(
//               onPressed: () => Navigator.of(context).pop(),
//               child: Text('Cancel'),
//             ),
//           ],
//         );
//       },
//     );
//   }
//
//   // Method to delete a certificate
//   void _deleteCertificate(int index) {
//     setState(() {
//       _certificates.removeAt(index);
//     });
//   }
//
//   // Method to select date of birth
//   Future<void> _selectDOB() async {
//     DateTime? pickedDate = await showDatePicker(
//       context: context,
//       initialDate: DateTime(1990),
//       firstDate: DateTime(1950),
//       lastDate: DateTime.now(),
//     );
//
//     if (pickedDate != null) {
//       setState(() {
//         _dobController.text = "${pickedDate.toLocal()}".split(' ')[0];
//       });
//     }
//   }
//
//   // Placeholder method to upload files to your chosen storage
//   // Replace this method with your storage upload logic
//   Future<String?> _uploadFile(File file, String folder) async {
//     try {
//       // Example:
//       // 1. Upload the file to your storage and get the URL
//       // 2. Return the URL as a String
//
//       // Placeholder: Return the local file path or a mock URL
//       // Replace with actual upload logic
//       return 'https://your-storage-service.com/$folder/${_uuid.v4()}_${file.path.split('/').last}';
//     } catch (e) {
//       print('Error uploading file: $e');
//       return null;
//     }
//   }
//
//   // Method to handle form submission
//   Future<void> _submitTutor() async {
//     // Gather all inputs
//     String name = _nameController.text.trim();
//     String email = _emailController.text.trim();
//     String address = _addressController.text.trim();
//     String dob = _dobController.text.trim();
//     String interests = _interestsController.text.trim();
//     String education = _educationController.text.trim();
//     String experience = _experienceController.text.trim();
//     String profession = _professionController.text.trim();
//     String instruction = _instructionController.text.trim();
//     String language = _languageController.text.trim();
//     String status = _selectedStatus; // Get the selected status
//
//     // Basic validation
//     if (name.isEmpty ||
//         email.isEmpty ||
//         address.isEmpty ||
//         dob.isEmpty ||
//         interests.isEmpty ||
//         education.isEmpty ||
//         experience.isEmpty ||
//         profession.isEmpty ||
//         instruction.isEmpty ||
//         language.isEmpty) {
//       ScaffoldMessenger.of(context).showSnackBar(
//         SnackBar(content: Text('Please fill all fields')),
//       );
//       return;
//     }
//
//     setState(() {
//       _isLoading = true;
//     });
//
//     try {
//       // Upload image
//       String? imageUrl;
//       if (_tutorImage != null) {
//         imageUrl = await _uploadFile(_tutorImage!, 'tutor_images');
//         // Implement your storage upload logic and get the imageUrl
//       }
//
//       // Upload video
//       String? videoUrl;
//       if (_tutorVideo != null) {
//         videoUrl = await _uploadFile(_tutorVideo!, 'tutor_videos');
//         // Implement your storage upload logic and get the videoUrl
//       }
//
//       // Upload certificates
//       List<Map<String, dynamic>> certificateData = [];
//       for (var cert in _certificates) {
//         if (cert.file != null) {
//           String? certUrl =
//           await _uploadFile(cert.file!, 'tutor_certificates');
//           // Implement your storage upload logic and get the certUrl
//           if (certUrl != null) {
//             certificateData.add({
//               'type': cert.type,
//               'name': cert.fileName,
//               'url': certUrl,
//             });
//           }
//         }
//       }
//
//       // Add tutor data to Firestore
//       await FirebaseFirestore.instance.collection('tutors').add({
//         'name': name,
//         'email': email,
//         'address': address,
//         'date_of_birth': dob,
//         'interests': interests,
//         'education': education,
//         'experience': experience,
//         'profession': profession,
//         'instruction': instruction,
//         'language': language,
//         'status': status, // Add the status field
//         'image_url': imageUrl,
//         'video_url': videoUrl,
//         'certificates': certificateData,
//         'createdAt': FieldValue.serverTimestamp(),
//       });
//
//       // Show success message
//       ScaffoldMessenger.of(context).showSnackBar(
//         SnackBar(content: Text('Tutor added successfully')),
//       );
//
//       // Clear the form
//       _nameController.clear();
//       _emailController.clear();
//       _addressController.clear();
//       _dobController.clear();
//       _interestsController.clear();
//       _educationController.clear();
//       _experienceController.clear();
//       _professionController.clear();
//       _instructionController.clear();
//       _languageController.clear();
//       setState(() {
//         _selectedStatus = 'Unverified'; // Reset to default
//         _tutorImage = null;
//         _tutorVideo = null;
//         _certificates.clear();
//       });
//
//       // Optionally, navigate back or to another page
//       // Navigator.pop(context);
//     } catch (e) {
//       // Handle errors
//       print('Error adding tutor: $e');
//       ScaffoldMessenger.of(context).showSnackBar(
//         SnackBar(content: Text('Error adding tutor: $e')),
//       );
//     } finally {
//       setState(() {
//         _isLoading = false;
//       });
//     }
//   }
//
//   @override
//   void dispose() {
//     // Dispose controllers when the widget is removed
//     _nameController.dispose();
//     _emailController.dispose();
//     _addressController.dispose();
//     _dobController.dispose();
//     _interestsController.dispose();
//     _educationController.dispose();
//     _experienceController.dispose();
//     _professionController.dispose();
//     _instructionController.dispose();
//     _languageController.dispose();
//     super.dispose();
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text('Add Tutor'),
//         backgroundColor: Colors.purple,
//       ),
//       body: _isLoading
//           ? Center(child: CircularProgressIndicator())
//           : SingleChildScrollView(
//         padding: EdgeInsets.all(16.0),
//         child: Column(
//           children: [
//             // Tutor Name
//             TextField(
//               controller: _nameController,
//               decoration: InputDecoration(
//                 labelText: 'Tutor Name',
//                 border: OutlineInputBorder(),
//               ),
//             ),
//             SizedBox(height: 16.0),
//
//             // Tutor Email
//             TextField(
//               controller: _emailController,
//               decoration: InputDecoration(
//                 labelText: 'Tutor Email',
//                 border: OutlineInputBorder(),
//               ),
//               keyboardType: TextInputType.emailAddress,
//             ),
//             SizedBox(height: 16.0),
//
//             // Tutor Address
//             TextField(
//               controller: _addressController,
//               decoration: InputDecoration(
//                 labelText: 'Tutor Address',
//                 border: OutlineInputBorder(),
//               ),
//             ),
//             SizedBox(height: 16.0),
//
//             // Tutor Date of Birth
//             TextField(
//               controller: _dobController,
//               decoration: InputDecoration(
//                 labelText: 'Date of Birth',
//                 border: OutlineInputBorder(),
//                 suffixIcon: Icon(Icons.calendar_today),
//               ),
//               readOnly: true,
//               onTap: _selectDOB,
//             ),
//             SizedBox(height: 16.0),
//
//             // Tutor Interests
//             TextField(
//               controller: _interestsController,
//               decoration: InputDecoration(
//                 labelText: 'Interests',
//                 border: OutlineInputBorder(),
//               ),
//             ),
//             SizedBox(height: 16.0),
//
//             // Tutor Education
//             TextField(
//               controller: _educationController,
//               decoration: InputDecoration(
//                 labelText: 'Education',
//                 border: OutlineInputBorder(),
//               ),
//             ),
//             SizedBox(height: 16.0),
//
//             // Tutor Experience
//             TextField(
//               controller: _experienceController,
//               decoration: InputDecoration(
//                 labelText: 'Experience',
//                 border: OutlineInputBorder(),
//               ),
//             ),
//             SizedBox(height: 16.0),
//
//             // Tutor Profession
//             TextField(
//               controller: _professionController,
//               decoration: InputDecoration(
//                 labelText: 'Current/Previous Profession',
//                 border: OutlineInputBorder(),
//               ),
//             ),
//             SizedBox(height: 16.0),
//
//             // Tutor Instruction
//             TextField(
//               controller: _instructionController,
//               decoration: InputDecoration(
//                 labelText: 'Instruction',
//                 border: OutlineInputBorder(),
//               ),
//             ),
//             SizedBox(height: 16.0),
//
//             // Tutor Language
//             TextField(
//               controller: _languageController,
//               decoration: InputDecoration(
//                 labelText: 'Language',
//                 border: OutlineInputBorder(),
//               ),
//             ),
//             SizedBox(height: 16.0),
//
//             // New: Status Dropdown
//             DropdownButtonFormField<String>(
//               value: _selectedStatus,
//               decoration: InputDecoration(
//                 labelText: 'Status',
//                 border: OutlineInputBorder(),
//               ),
//               items: <String>['Verified', 'Unverified']
//                   .map<DropdownMenuItem<String>>((String value) {
//                 return DropdownMenuItem<String>(
//                   value: value,
//                   child: Text(value),
//                 );
//               }).toList(),
//               onChanged: (String? newValue) {
//                 setState(() {
//                   _selectedStatus = newValue!;
//                 });
//               },
//             ),
//             SizedBox(height: 16.0),
//
//             // Tutor Image
//             Row(
//               children: [
//                 ElevatedButton.icon(
//                   onPressed: _pickImage,
//                   icon: Icon(Icons.image),
//                   label: Text('Upload Image'),
//                   style: ElevatedButton.styleFrom(
//                     backgroundColor: Colors.purple,
//                   ),
//                 ),
//                 SizedBox(width: 10),
//                 _tutorImage != null
//                     ? Image.file(
//                   _tutorImage!,
//                   width: 100,
//                   height: 100,
//                   fit: BoxFit.cover,
//                 )
//                     : Text('No image selected'),
//               ],
//             ),
//             SizedBox(height: 16.0),
//
//             // Tutor Video
//             Row(
//               children: [
//                 ElevatedButton.icon(
//                   onPressed: _pickVideo,
//                   icon: Icon(Icons.video_library),
//                   label: Text('Upload Video'),
//                   style: ElevatedButton.styleFrom(
//                     backgroundColor: Colors.purple,
//                   ),
//                 ),
//                 SizedBox(width: 10),
//                 _tutorVideo != null
//                     ? Expanded(
//                   child: Text(
//                       'Video Selected: ${_tutorVideo!.path.split('/').last}'),
//                 )
//                     : Text('No video selected'),
//               ],
//             ),
//             SizedBox(height: 16.0),
//
//             // Certificates
//             Row(
//               mainAxisAlignment: MainAxisAlignment.spaceBetween,
//               children: [
//                 Text(
//                   'Certificates',
//                   style: TextStyle(
//                       fontSize: 16, fontWeight: FontWeight.bold),
//                 ),
//                 ElevatedButton.icon(
//                   onPressed: _addCertificate,
//                   icon: Icon(Icons.add),
//                   label: Text('Add Certificate'),
//                   style: ElevatedButton.styleFrom(
//                     backgroundColor: Colors.purple,
//                   ),
//                 ),
//               ],
//             ),
//             SizedBox(height: 10),
//             _certificates.isEmpty
//                 ? Text('No certificates added')
//                 : ListView.builder(
//               shrinkWrap: true,
//               physics: NeverScrollableScrollPhysics(),
//               itemCount: _certificates.length,
//               itemBuilder: (context, index) {
//                 return Card(
//                   child: ListTile(
//                     title: Text(_certificates[index].type),
//                     subtitle: Text(_certificates[index]
//                         .fileName ??
//                         'No file selected'),
//                     trailing: IconButton(
//                       icon: Icon(Icons.delete, color: Colors.red),
//                       onPressed: () => _deleteCertificate(index),
//                     ),
//                   ),
//                 );
//               },
//             ),
//             SizedBox(height: 20),
//
//             // Submit Button
//             ElevatedButton(
//               onPressed: _submitTutor,
//               style: ElevatedButton.styleFrom(
//                 backgroundColor: Colors.purple,
//                 minimumSize: Size(double.infinity, 50), // Full width
//               ),
//               child: Text(
//                 'Add Tutor',
//                 style: TextStyle(fontSize: 16),
//               ),
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }
//
// // Certificate Model
// class Certificate {
//   String type;
//   File? file;
//   String? fileName;
//
//   Certificate({required this.type, this.file, this.fileName});
// }


import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
// Removed Firebase Storage import
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:file_picker/file_picker.dart';
import 'package:uuid/uuid.dart';

class AddTutorPage extends StatefulWidget {
  @override
  _AddTutorPageState createState() => _AddTutorPageState();
}

class _AddTutorPageState extends State<AddTutorPage> {
  // Controllers for form fields
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _addressController = TextEditingController();
  final TextEditingController _dobController = TextEditingController();
  final TextEditingController _interestsController = TextEditingController();
  final TextEditingController _educationController = TextEditingController();
  final TextEditingController _experienceController = TextEditingController();
  final TextEditingController _professionController = TextEditingController();
  final TextEditingController _instructionController = TextEditingController();
  final TextEditingController _languageController = TextEditingController();

  // **New:** Controller for "About" field
  final TextEditingController _aboutController = TextEditingController();

  // New: Variable to hold selected status
  String _selectedStatus = 'Unverified'; // Default value

  // Variables to hold selected files
  File? _tutorImage;
  File? _tutorVideo;
  List<Certificate> _certificates = [];

  // Loading state
  bool _isLoading = false;

  // Image Picker instance
  final ImagePicker _picker = ImagePicker();

  // UUID for unique file names
  final Uuid _uuid = Uuid();

  // Method to pick image from gallery
  Future<void> _pickImage() async {
    final pickedFile =
    await _picker.pickImage(source: ImageSource.gallery, imageQuality: 80);
    if (pickedFile != null) {
      setState(() {
        _tutorImage = File(pickedFile.path);
      });
    }
  }

  // Method to pick video from gallery
  Future<void> _pickVideo() async {
    final pickedFile = await _picker.pickVideo(
        source: ImageSource.gallery, maxDuration: Duration(minutes: 5));
    if (pickedFile != null) {
      setState(() {
        _tutorVideo = File(pickedFile.path);
      });
    }
  }

  // Method to pick certificate file
  Future<void> _pickCertificateFile(Certificate certificate) async {
    final result = await FilePicker.platform.pickFiles(
      type: FileType.custom,
      allowedExtensions: ['pdf', 'jpg', 'png'],
    );

    if (result != null && result.files.single.path != null) {
      setState(() {
        certificate.file = File(result.files.single.path!);
        certificate.fileName = result.files.single.name;
      });
    }
  }

  // Method to add a new certificate
  void _addCertificate() {
    showDialog(
      context: context,
      builder: (context) {
        String certificateType = '';
        return AlertDialog(
          title: Text('Add Certificate'),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              TextField(
                decoration: InputDecoration(labelText: 'Certificate Type'),
                onChanged: (value) {
                  certificateType = value;
                },
              ),
              SizedBox(height: 10),
              ElevatedButton(
                onPressed: () async {
                  // Pick certificate file
                  final result = await FilePicker.platform.pickFiles(
                    type: FileType.custom,
                    allowedExtensions: ['pdf', 'jpg', 'png'],
                  );

                  if (result != null && result.files.single.path != null) {
                    setState(() {
                      _certificates.add(Certificate(
                        type: certificateType,
                        file: File(result.files.single.path!),
                        fileName: result.files.single.name,
                      ));
                    });
                    Navigator.of(context).pop();
                  }
                },
                child: Text('Upload Certificate'),
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.purple,
                ),
              ),
            ],
          ),
          actions: [
            TextButton(
              onPressed: () => Navigator.of(context).pop(),
              child: Text('Cancel'),
            ),
          ],
        );
      },
    );
  }

  // Method to delete a certificate
  void _deleteCertificate(int index) {
    setState(() {
      _certificates.removeAt(index);
    });
  }

  // Method to select date of birth
  Future<void> _selectDOB() async {
    DateTime? pickedDate = await showDatePicker(
      context: context,
      initialDate: DateTime(1990),
      firstDate: DateTime(1950),
      lastDate: DateTime.now(),
    );

    if (pickedDate != null) {
      setState(() {
        _dobController.text = "${pickedDate.toLocal()}".split(' ')[0];
      });
    }
  }

  // Placeholder method to upload files to your chosen storage
  // Replace this method with your storage upload logic
  Future<String?> _uploadFile(File file, String folder) async {
    try {
      // Example:
      // 1. Upload the file to your storage and get the URL
      // 2. Return the URL as a String

      // Placeholder: Return the local file path or a mock URL
      // Replace with actual upload logic
      return 'https://your-storage-service.com/$folder/${_uuid.v4()}_${file.path.split('/').last}';
    } catch (e) {
      print('Error uploading file: $e');
      return null;
    }
  }

  // Method to handle form submission
  Future<void> _submitTutor() async {
    // Gather all inputs
    String name = _nameController.text.trim();
    String email = _emailController.text.trim();
    String address = _addressController.text.trim();
    String dob = _dobController.text.trim();
    String interests = _interestsController.text.trim();
    String education = _educationController.text.trim();
    String experience = _experienceController.text.trim();
    String profession = _professionController.text.trim();
    String instruction = _instructionController.text.trim();
    String language = _languageController.text.trim();
    String about = _aboutController.text.trim(); // Get the "About" input
    String status = _selectedStatus; // Get the selected status

    // Basic validation
    if (name.isEmpty ||
        email.isEmpty ||
        address.isEmpty ||
        dob.isEmpty ||
        interests.isEmpty ||
        education.isEmpty ||
        experience.isEmpty ||
        profession.isEmpty ||
        instruction.isEmpty ||
        language.isEmpty ||
        about.isEmpty) { // Include "About" in validation
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Please fill all fields')),
      );
      return;
    }

    setState(() {
      _isLoading = true;
    });

    try {
      // Upload image
      String? imageUrl;
      if (_tutorImage != null) {
        imageUrl = await _uploadFile(_tutorImage!, 'tutor_images');
        // Implement your storage upload logic and get the imageUrl
      }

      // Upload video
      String? videoUrl;
      if (_tutorVideo != null) {
        videoUrl = await _uploadFile(_tutorVideo!, 'tutor_videos');
        // Implement your storage upload logic and get the videoUrl
      }

      // Upload certificates
      List<Map<String, dynamic>> certificateData = [];
      for (var cert in _certificates) {
        if (cert.file != null) {
          String? certUrl =
          await _uploadFile(cert.file!, 'tutor_certificates');
          // Implement your storage upload logic and get the certUrl
          if (certUrl != null) {
            certificateData.add({
              'type': cert.type,
              'name': cert.fileName,
              'url': certUrl,
            });
          }
        }
      }

      // Add tutor data to Firestore
      await FirebaseFirestore.instance.collection('tutors').add({
        'name': name,
        'email': email,
        'address': address,
        'date_of_birth': dob,
        'interests': interests,
        'education': education,
        'experience': experience,
        'profession': profession,
        'instruction': instruction,
        'language': language,
        'about': about, // Add the "About" field
        'status': status, // Add the status field
        'image_url': imageUrl,
        'video_url': videoUrl,
        'certificates': certificateData,
        'createdAt': FieldValue.serverTimestamp(),
      });

      // Show success message
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Tutor added successfully')),
      );

      // Clear the form
      _nameController.clear();
      _emailController.clear();
      _addressController.clear();
      _dobController.clear();
      _interestsController.clear();
      _educationController.clear();
      _experienceController.clear();
      _professionController.clear();
      _instructionController.clear();
      _languageController.clear();
      _aboutController.clear(); // Clear the "About" field
      setState(() {
        _selectedStatus = 'Unverified'; // Reset to default
        _tutorImage = null;
        _tutorVideo = null;
        _certificates.clear();
      });

      // Optionally, navigate back or to another page
      // Navigator.pop(context);
    } catch (e) {
      // Handle errors
      print('Error adding tutor: $e');
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Error adding tutor: $e')),
      );
    } finally {
      setState(() {
        _isLoading = false;
      });
    }
  }

  @override
  void dispose() {
    // Dispose controllers when the widget is removed
    _nameController.dispose();
    _emailController.dispose();
    _addressController.dispose();
    _dobController.dispose();
    _interestsController.dispose();
    _educationController.dispose();
    _experienceController.dispose();
    _professionController.dispose();
    _instructionController.dispose();
    _languageController.dispose();
    _aboutController.dispose(); // Dispose the "About" controller
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Add Tutor'),
        backgroundColor: Colors.purple,
      ),
      body: _isLoading
          ? Center(child: CircularProgressIndicator())
          : SingleChildScrollView(
        padding: EdgeInsets.all(16.0),
        child: Column(
          children: [
            // Tutor Name
            TextField(
              controller: _nameController,
              decoration: InputDecoration(
                labelText: 'Tutor Name',
                border: OutlineInputBorder(),
              ),
            ),
            SizedBox(height: 16.0),

            // Tutor Email
            TextField(
              controller: _emailController,
              decoration: InputDecoration(
                labelText: 'Tutor Email',
                border: OutlineInputBorder(),
              ),
              keyboardType: TextInputType.emailAddress,
            ),
            SizedBox(height: 16.0),

            // Tutor Address
            TextField(
              controller: _addressController,
              decoration: InputDecoration(
                labelText: 'Tutor Address',
                border: OutlineInputBorder(),
              ),
            ),
            SizedBox(height: 16.0),

            // Tutor Date of Birth
            TextField(
              controller: _dobController,
              decoration: InputDecoration(
                labelText: 'Date of Birth',
                border: OutlineInputBorder(),
                suffixIcon: Icon(Icons.calendar_today),
              ),
              readOnly: true,
              onTap: _selectDOB,
            ),
            SizedBox(height: 16.0),

            // Tutor Interests
            TextField(
              controller: _interestsController,
              decoration: InputDecoration(
                labelText: 'Interests',
                border: OutlineInputBorder(),
              ),
            ),
            SizedBox(height: 16.0),

            // Tutor Education
            TextField(
              controller: _educationController,
              decoration: InputDecoration(
                labelText: 'Education',
                border: OutlineInputBorder(),
              ),
            ),
            SizedBox(height: 16.0),

            // Tutor Experience
            TextField(
              controller: _experienceController,
              decoration: InputDecoration(
                labelText: 'Experience',
                border: OutlineInputBorder(),
              ),
            ),
            SizedBox(height: 16.0),

            // Tutor Profession
            TextField(
              controller: _professionController,
              decoration: InputDecoration(
                labelText: 'Current/Previous Profession',
                border: OutlineInputBorder(),
              ),
            ),
            SizedBox(height: 16.0),

            // Tutor Instruction
            TextField(
              controller: _instructionController,
              decoration: InputDecoration(
                labelText: 'Instruction',
                border: OutlineInputBorder(),
              ),
            ),
            SizedBox(height: 16.0),

            // Tutor Language
            TextField(
              controller: _languageController,
              decoration: InputDecoration(
                labelText: 'Language',
                border: OutlineInputBorder(),
              ),
            ),
            SizedBox(height: 16.0),

            // **New:** About TextField
            TextField(
              controller: _aboutController,
              decoration: InputDecoration(
                labelText: 'About',
                border: OutlineInputBorder(),
              ),
              maxLines: 4, // Allows multi-line input
            ),
            SizedBox(height: 16.0),

            // Status Dropdown
            DropdownButtonFormField<String>(
              value: _selectedStatus,
              decoration: InputDecoration(
                labelText: 'Status',
                border: OutlineInputBorder(),
              ),
              items: <String>['Verified', 'Unverified']
                  .map<DropdownMenuItem<String>>((String value) {
                return DropdownMenuItem<String>(
                  value: value,
                  child: Text(value),
                );
              }).toList(),
              onChanged: (String? newValue) {
                setState(() {
                  _selectedStatus = newValue!;
                });
              },
            ),
            SizedBox(height: 16.0),

            // Tutor Image
            Row(
              children: [
                ElevatedButton.icon(
                  onPressed: _pickImage,
                  icon: Icon(Icons.image),
                  label: Text('Upload Image'),
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.purple,
                  ),
                ),
                SizedBox(width: 10),
                _tutorImage != null
                    ? Image.file(
                  _tutorImage!,
                  width: 100,
                  height: 100,
                  fit: BoxFit.cover,
                )
                    : Text('No image selected'),
              ],
            ),
            SizedBox(height: 16.0),

            // Tutor Video
            Row(
              children: [
                ElevatedButton.icon(
                  onPressed: _pickVideo,
                  icon: Icon(Icons.video_library),
                  label: Text('Upload Video'),
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.purple,
                  ),
                ),
                SizedBox(width: 10),
                _tutorVideo != null
                    ? Expanded(
                  child: Text(
                      'Video Selected: ${_tutorVideo!.path.split('/').last}'),
                )
                    : Text('No video selected'),
              ],
            ),
            SizedBox(height: 16.0),

            // Certificates
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'Certificates',
                  style: TextStyle(
                      fontSize: 16, fontWeight: FontWeight.bold),
                ),
                ElevatedButton.icon(
                  onPressed: _addCertificate,
                  icon: Icon(Icons.add),
                  label: Text('Add Certificate'),
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.purple,
                  ),
                ),
              ],
            ),
            SizedBox(height: 10),
            _certificates.isEmpty
                ? Text('No certificates added')
                : ListView.builder(
              shrinkWrap: true,
              physics: NeverScrollableScrollPhysics(),
              itemCount: _certificates.length,
              itemBuilder: (context, index) {
                return Card(
                  child: ListTile(
                    title: Text(_certificates[index].type),
                    subtitle: Text(_certificates[index]
                        .fileName ??
                        'No file selected'),
                    trailing: IconButton(
                      icon: Icon(Icons.delete, color: Colors.red),
                      onPressed: () => _deleteCertificate(index),
                    ),
                  ),
                );
              },
            ),
            SizedBox(height: 20),

            // Submit Button
            ElevatedButton(
              onPressed: _submitTutor,
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.purple,
                minimumSize: Size(double.infinity, 50), // Full width
              ),
              child: Text(
                'Add Tutor',
                style: TextStyle(fontSize: 16),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

// Certificate Model
class Certificate {
  String type;
  File? file;
  String? fileName;

  Certificate({required this.type, this.file, this.fileName});
}

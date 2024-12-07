// import 'package:flutter/material.dart';
//
// void main() {
//   runApp(TutorProfileApp());
// }
//
// class TutorProfileApp extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       debugShowCheckedModeBanner: false,
//       home: TutorProfilePage(),
//     );
//   }
// }
//
// class TutorProfilePage extends StatefulWidget {
//   @override
//   _TutorProfilePageState createState() => _TutorProfilePageState();
// }
//
// class _TutorProfilePageState extends State<TutorProfilePage> {
//   final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
//
//   // Dummy controllers for form fields
//   final TextEditingController nameController = TextEditingController();
//   final TextEditingController fromController = TextEditingController();
//   final TextEditingController dobController = TextEditingController();
//   final TextEditingController interestsController = TextEditingController();
//   final TextEditingController educationController = TextEditingController();
//   final TextEditingController experienceController = TextEditingController();
//   final TextEditingController professionController = TextEditingController();
//   final TextEditingController instructionController = TextEditingController();
//   final TextEditingController languagesController = TextEditingController();
//
//   String selectedCertificationType = "Select Certification";
//   List<String> certifications = ["IELTS", "TOEFL", "Other"];
//   bool beginnerChecked = false;
//   bool intermediateChecked = false;
//   bool advancedChecked = false;
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: const Text("Set up your tutor profile"),
//         backgroundColor: Colors.blue,
//       ),
//       body: SingleChildScrollView(
//         padding: const EdgeInsets.all(16.0),
//         child: Form(
//           key: _formKey,
//           child: Column(
//             crossAxisAlignment: CrossAxisAlignment.start,
//             children: [
//               // Progress Steps
//               Row(
//                 mainAxisAlignment: MainAxisAlignment.spaceEvenly,
//                 children: [
//                   Column(
//                     children: const [
//                       CircleAvatar(
//                         backgroundColor: Colors.blue,
//                         child: Icon(Icons.person, color: Colors.white),
//                       ),
//                       SizedBox(height: 5),
//                       Text("Complete Profile"),
//                     ],
//                   ),
//                   Column(
//                     children: const [
//                       CircleAvatar(
//                         backgroundColor: Colors.grey,
//                         child: Icon(Icons.videocam, color: Colors.white),
//                       ),
//                       SizedBox(height: 5),
//                       Text("Video Introduction"),
//                     ],
//                   ),
//                   Column(
//                     children: const [
//                       CircleAvatar(
//                         backgroundColor: Colors.grey,
//                         child: Icon(Icons.approval, color: Colors.white),
//                       ),
//                       SizedBox(height: 5),
//                       Text("Approval"),
//                     ],
//                   ),
//                 ],
//               ),
//               const SizedBox(height: 20),
//
//               // Form Title
//               const Text(
//                 "Set up your tutor profile",
//                 style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
//               ),
//               const SizedBox(height: 10),
//               const Text(
//                 "Students will check your profile to decide whether to book a lesson with you. Please provide as much information as possible.",
//                 style: TextStyle(fontSize: 14, color: Colors.grey),
//               ),
//               const SizedBox(height: 20),
//
//               // Basic Info Section
//               const Text(
//                 "Basic Info",
//                 style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
//               ),
//               const SizedBox(height: 10),
//               TextFormField(
//                 controller: nameController,
//                 decoration: const InputDecoration(
//                   labelText: "Name",
//                   border: OutlineInputBorder(),
//                 ),
//               ),
//               const SizedBox(height: 10),
//               TextFormField(
//                 controller: fromController,
//                 decoration: const InputDecoration(
//                   labelText: "From",
//                   border: OutlineInputBorder(),
//                 ),
//               ),
//               const SizedBox(height: 10),
//               TextFormField(
//                 controller: dobController,
//                 decoration: const InputDecoration(
//                   labelText: "Date of Birth",
//                   border: OutlineInputBorder(),
//                 ),
//               ),
//               const SizedBox(height: 20),
//
//               // CV Section
//               const Text(
//                 "CV",
//                 style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
//               ),
//               const SizedBox(height: 10),
//               TextFormField(
//                 controller: interestsController,
//                 decoration: const InputDecoration(
//                   labelText: "Interests",
//                   border: OutlineInputBorder(),
//                 ),
//               ),
//               const SizedBox(height: 10),
//               TextFormField(
//                 controller: educationController,
//                 decoration: const InputDecoration(
//                   labelText: "Education",
//                   border: OutlineInputBorder(),
//                 ),
//               ),
//               const SizedBox(height: 10),
//               TextFormField(
//                 controller: experienceController,
//                 decoration: const InputDecoration(
//                   labelText: "Experience",
//                   border: OutlineInputBorder(),
//                 ),
//               ),
//               const SizedBox(height: 10),
//               TextFormField(
//                 controller: professionController,
//                 decoration: const InputDecoration(
//                   labelText: "Current or Previous Profession",
//                   border: OutlineInputBorder(),
//                 ),
//               ),
//               const SizedBox(height: 20),
//
//               // Certification Section
//               const Text(
//                 "Certification",
//                 style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
//               ),
//               const SizedBox(height: 10),
//               DropdownButtonFormField<String>(
//                 value: selectedCertificationType,
//                 items: ["Select Certification", ...certifications].map((cert) {
//                   return DropdownMenuItem(
//                     value: cert,
//                     child: Text(cert),
//                   );
//                 }).toList(),
//                 onChanged: (value) {
//                   setState(() {
//                     selectedCertificationType = value!;
//                   });
//                 },
//                 decoration: const InputDecoration(
//                   labelText: "Certification Type",
//                   border: OutlineInputBorder(),
//                 ),
//               ),
//
//               const SizedBox(height: 20),
//
//               // Languages Section
//               const Text(
//                 "Languages I Speak",
//                 style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
//               ),
//               const SizedBox(height: 10),
//               TextFormField(
//                 controller: languagesController,
//                 decoration: const InputDecoration(
//                   labelText: "Languages",
//                   border: OutlineInputBorder(),
//                 ),
//               ),
//               const SizedBox(height: 20),
//
//               // Teaching Section
//               const Text(
//                 "Who I Teach",
//                 style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
//               ),
//               const SizedBox(height: 10),
//               TextFormField(
//                 controller: instructionController,
//                 decoration: const InputDecoration(
//                   labelText: "Instruction",
//                   border: OutlineInputBorder(),
//                 ),
//               ),
//               const SizedBox(height: 10),
//               const Text("I am best at teaching students who are:"),
//               CheckboxListTile(
//                 value: beginnerChecked,
//                 title: const Text("Beginner"),
//                 onChanged: (value) {
//                   setState(() {
//                     beginnerChecked = value!;
//                   });
//                 },
//               ),
//               CheckboxListTile(
//                 value: intermediateChecked,
//                 title: const Text("Intermediate"),
//                 onChanged: (value) {
//                   setState(() {
//                     intermediateChecked = value!;
//                   });
//                 },
//               ),
//               CheckboxListTile(
//                 value: advancedChecked,
//                 title: const Text("Advanced"),
//                 onChanged: (value) {
//                   setState(() {
//                     advancedChecked = value!;
//                   });
//                 },
//               ),
//               const SizedBox(height: 20),
//
//               // Save Button
//               Center(
//                 child: ElevatedButton(
//                   onPressed: () {
//                     if (_formKey.currentState!.validate()) {
//                       // Process form data
//                       ScaffoldMessenger.of(context).showSnackBar(
//                         const SnackBar(content: Text("Profile saved!")),
//                       );
//                     }
//                   },
//                   child: const Text("Save"),
//                 ),
//               ),
//             ],
//           ),
//         ),
//       ),
//     );
//   }
// }

// import 'package:flutter/material.dart';
// import 'dart:io';
//
// void main() {
//   runApp(TutorProfileApp());
// }
//
// class TutorProfileApp extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       debugShowCheckedModeBanner: false,
//       home: TutorProfilePage(),
//     );
//   }
// }
//
// class TutorProfilePage extends StatefulWidget {
//   @override
//   _TutorProfilePageState createState() => _TutorProfilePageState();
// }
//
// class _TutorProfilePageState extends State<TutorProfilePage> {
//   final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
//
//   // Form controllers
//   final TextEditingController nameController = TextEditingController();
//   final TextEditingController fromController = TextEditingController();
//   final TextEditingController dobController = TextEditingController();
//
//   // Certification Data
//   List<Map<String, String>> certificates = [];
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: const Text("Set up your tutor profile"),
//         backgroundColor: Colors.blue,
//       ),
//       body: SingleChildScrollView(
//         padding: const EdgeInsets.all(16.0),
//         child: Form(
//           key: _formKey,
//           child: Column(
//             crossAxisAlignment: CrossAxisAlignment.start,
//             children: [
//               // Profile Header
//               const Text(
//                 "Set up your tutor profile",
//                 style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
//               ),
//               const SizedBox(height: 10),
//               const Text(
//                 "Provide as much information as possible to help students learn about you.",
//                 style: TextStyle(fontSize: 14, color: Colors.grey),
//               ),
//               const SizedBox(height: 20),
//
//               // Basic Info
//               const Text(
//                 "Basic Info",
//                 style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
//               ),
//               const SizedBox(height: 10),
//               TextFormField(
//                 controller: nameController,
//                 decoration: const InputDecoration(
//                   labelText: "Name",
//                   border: OutlineInputBorder(),
//                 ),
//               ),
//               const SizedBox(height: 10),
//               TextFormField(
//                 controller: fromController,
//                 decoration: const InputDecoration(
//                   labelText: "From",
//                   border: OutlineInputBorder(),
//                 ),
//               ),
//               const SizedBox(height: 10),
//               TextFormField(
//                 controller: dobController,
//                 decoration: const InputDecoration(
//                   labelText: "Date of Birth",
//                   border: OutlineInputBorder(),
//                 ),
//               ),
//               const SizedBox(height: 20),
//
//               // Certification Section
//               const Text(
//                 "Certificates",
//                 style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
//               ),
//               const SizedBox(height: 10),
//               // Add New Certificate Button
//               Align(
//                 alignment: Alignment.centerLeft,
//                 child: ElevatedButton(
//                   onPressed: () {
//                     _showAddCertificateDialog();
//                   },
//                   child: const Text("Add new certificate"),
//                 ),
//               ),
//               const SizedBox(height: 10),
//
//               // Certificate List
//               certificates.isEmpty
//                   ? const Center(
//                 child: Text(
//                   "No certificates added yet.",
//                   style: TextStyle(color: Colors.grey),
//                 ),
//               )
//                   : DataTable(
//                 columns: const [
//                   DataColumn(
//                     label: Text(
//                       "Certificate Type",
//                       style: TextStyle(fontWeight: FontWeight.bold),
//                     ),
//                   ),
//                   DataColumn(
//                     label: Text(
//                       "Certificate File",
//                       style: TextStyle(fontWeight: FontWeight.bold),
//                     ),
//                   ),
//                   DataColumn(
//                     label: Text(
//                       "Action",
//                       style: TextStyle(fontWeight: FontWeight.bold),
//                     ),
//                   ),
//                 ],
//                 rows: certificates
//                     .map(
//                       (cert) => DataRow(cells: [
//                     DataCell(Text(cert['type']!)),
//                     DataCell(Text(cert['file']!)),
//                     DataCell(
//                       IconButton(
//                         icon: const Icon(Icons.delete, color: Colors.red),
//                         onPressed: () {
//                           setState(() {
//                             certificates.remove(cert);
//                           });
//                         },
//                       ),
//                     ),
//                   ]),
//                 )
//                     .toList(),
//               ),
//               const SizedBox(height: 20),
//
//               // Save Button
//               Center(
//                 child: ElevatedButton(
//                   onPressed: () {
//                     if (_formKey.currentState!.validate()) {
//                       // Process form data
//                       ScaffoldMessenger.of(context).showSnackBar(
//                         const SnackBar(content: Text("Profile saved!")),
//                       );
//                     }
//                   },
//                   child: const Text("Save"),
//                 ),
//               ),
//             ],
//           ),
//         ),
//       ),
//     );
//   }
//
//   // Dialog to Add a New Certificate
//   void _showAddCertificateDialog() {
//     String selectedType = "Select Certification Type";
//     File? selectedFile;
//     TextEditingController fileController = TextEditingController();
//
//     showDialog(
//       context: context,
//       builder: (BuildContext context) {
//         return AlertDialog(
//           title: const Text("Add Certificate"),
//           content: StatefulBuilder(
//             builder: (BuildContext context, StateSetter setState) {
//               return Column(
//                 mainAxisSize: MainAxisSize.min,
//                 children: [
//                   DropdownButtonFormField<String>(
//                     value: selectedType,
//                     items: ["Select Certification Type", "IELTS", "TOEFL", "Other"]
//                         .map((type) {
//                       return DropdownMenuItem(
//                         value: type,
//                         child: Text(type),
//                       );
//                     }).toList(),
//                     onChanged: (value) {
//                       setState(() {
//                         selectedType = value!;
//                       });
//                     },
//                     decoration: const InputDecoration(
//                       labelText: "Certification Type",
//                       border: OutlineInputBorder(),
//                     ),
//                   ),
//                   const SizedBox(height: 10),
//                   TextFormField(
//                     controller: fileController,
//                     readOnly: true,
//                     decoration: const InputDecoration(
//                       labelText: "Click to Upload",
//                       border: OutlineInputBorder(),
//                     ),
//                     onTap: () async {
//                       // Simulate file picking
//                       setState(() {
//                         selectedFile = File("dummy_certificate.pdf");
//                         fileController.text = selectedFile!.path.split('/').last;
//                       });
//                     },
//                   ),
//                   const SizedBox(height: 10),
//                   const Text(
//                     "Only support certificate file less than 12 MB.",
//                     style: TextStyle(color: Colors.red),
//                   ),
//                 ],
//               );
//             },
//           ),
//           actions: [
//             TextButton(
//               onPressed: () {
//                 Navigator.pop(context);
//               },
//               child: const Text("Cancel"),
//             ),
//             ElevatedButton(
//               onPressed: () {
//                 if (selectedType != "Select Certification Type" &&
//                     selectedFile != null) {
//                   setState(() {
//                     certificates.add({
//                       "type": selectedType,
//                       "file": fileController.text,
//                     });
//                   });
//                   Navigator.pop(context);
//                 } else {
//                   ScaffoldMessenger.of(context).showSnackBar(
//                     const SnackBar(content: Text("Please complete the form!")),
//                   );
//                 }
//               },
//               child: const Text("Save"),
//             ),
//           ],
//         );
//       },
//     );
//   }
// }

// import 'dart:io';
//
// import 'package:flutter/material.dart';
// // Uncomment the following lines if you integrate image and video functionality
// // import 'package:image_picker/image_picker.dart';
// // import 'package:video_player/video_player.dart';
//
// void main() {
//   runApp(TutorProfileApp());
// }
//
// class TutorProfileApp extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       title: 'Tutor Profile Setup',
//       debugShowCheckedModeBanner: false,
//       home: TutorProfilePage(),
//     );
//   }
// }
//
// enum ProfileStep { Profile, VideoIntroduction, Approval }
//
// class Certificate {
//   String type;
//   String fileName;
//
//   Certificate({required this.type, required this.fileName});
// }
//
// class TutorProfilePage extends StatefulWidget {
//   @override
//   _TutorProfilePageState createState() => _TutorProfilePageState();
// }
//
// class _TutorProfilePageState extends State<TutorProfilePage> {
//   final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
//
//   // Current Step
//   ProfileStep currentStep = ProfileStep.Profile;
//
//   // Controllers for form fields
//   final TextEditingController nameController = TextEditingController();
//   final TextEditingController fromController = TextEditingController();
//   final TextEditingController dobController = TextEditingController();
//   final TextEditingController interestsController = TextEditingController();
//   final TextEditingController educationController = TextEditingController();
//   final TextEditingController experienceController = TextEditingController();
//   final TextEditingController professionController = TextEditingController();
//   final TextEditingController instructionController = TextEditingController();
//   final TextEditingController languagesController = TextEditingController();
//
//   // Image and File Uploads
//   File? profileImage;
//   File? professionFile;
//
//   // Certificates
//   List<Certificate> certificates = [];
//
//   // Video Introduction
//   File? videoFile;
//   // VideoPlayerController? _videoController; // Uncomment when using video_player
//
//   // Checkbox States
//   bool beginnerChecked = false;
//   bool intermediateChecked = false;
//   bool advancedChecked = false;
//
//   // Dummy Data for Video
//   bool isVideoPlaying = false;
//   double videoProgress = 0.0;
//
//   // Function to pick profile image
//   Future<void> _pickProfileImage() async {
//     // Uncomment and implement with image_picker
//     /*
//     final picker = ImagePicker();
//     final pickedFile = await picker.pickImage(source: ImageSource.gallery);
//     if (pickedFile != null) {
//       setState(() {
//         profileImage = File(pickedFile.path);
//       });
//     }
//     */
//     // Dummy implementation
//     setState(() {
//       profileImage = File('path/to/profile_image.png');
//     });
//   }
//
//   // Function to pick profession file
//   Future<void> _pickProfessionFile() async {
//     // Implement file picker logic
//     // For example, using file_picker package
//     /*
//     final picker = FilePicker.platform;
//     final pickedFile = await picker.pickFiles();
//     if (pickedFile != null && pickedFile.files.isNotEmpty) {
//       setState(() {
//         professionFile = File(pickedFile.files.first.path!);
//       });
//     }
//     */
//     // Dummy implementation
//     setState(() {
//       professionFile = File('path/to/profession_certificate.pdf');
//     });
//   }
//
//   // Function to pick video file
//   Future<void> _pickVideoFile() async {
//     // Implement video picker logic
//     // For example, using image_picker
//     /*
//     final picker = ImagePicker();
//     final pickedFile = await picker.pickVideo(source: ImageSource.gallery);
//     if (pickedFile != null) {
//       setState(() {
//         videoFile = File(pickedFile.path);
//         _videoController = VideoPlayerController.file(videoFile!)
//           ..initialize().then((_) {
//             setState(() {});
//             _videoController!.play();
//           });
//       });
//     }
//     */
//     // Dummy implementation
//     setState(() {
//       videoFile = File('path/to/introduction_video.mp4');
//     });
//   }
//
//   // Function to add a new certificate
//   void _addCertificate() {
//     String selectedType = "Select Certification";
//     String uploadedFile = "";
//
//     showDialog(
//       context: context,
//       builder: (context) {
//         return StatefulBuilder(builder: (context, setStateDialog) {
//           return AlertDialog(
//             title: Text("Add New Certificate"),
//             content: Column(
//               mainAxisSize: MainAxisSize.min,
//               children: [
//                 DropdownButtonFormField<String>(
//                   value: selectedType,
//                   items: ["Select Certification", "IELTS", "TOEFL", "Other"]
//                       .map((cert) {
//                     return DropdownMenuItem(
//                       value: cert,
//                       child: Text(cert),
//                     );
//                   }).toList(),
//                   onChanged: (value) {
//                     setStateDialog(() {
//                       selectedType = value!;
//                     });
//                   },
//                   decoration: InputDecoration(
//                     labelText: "Certificate Type",
//                     border: OutlineInputBorder(),
//                   ),
//                 ),
//                 SizedBox(height: 10),
//                 ElevatedButton(
//                   onPressed: () {
//                     // Implement file picker
//                     /*
//                     // Example using file_picker
//                     FilePickerResult? result = await FilePicker.platform.pickFiles();
//                     if (result != null) {
//                       setStateDialog(() {
//                         uploadedFile = result.files.first.name;
//                       });
//                     }
//                     */
//                     // Dummy implementation
//                     setStateDialog(() {
//                       uploadedFile = "certificate.pdf";
//                     });
//                   },
//                   child: Text("Upload Certificate"),
//                 ),
//                 if (uploadedFile.isNotEmpty) Text(uploadedFile),
//               ],
//             ),
//             actions: [
//               TextButton(
//                 onPressed: () {
//                   Navigator.of(context).pop();
//                 },
//                 child: Text("Cancel"),
//               ),
//               ElevatedButton(
//                 onPressed: () {
//                   if (selectedType != "Select Certification" &&
//                       uploadedFile.isNotEmpty) {
//                     setState(() {
//                       certificates.add(Certificate(
//                           type: selectedType, fileName: uploadedFile));
//                     });
//                     Navigator.of(context).pop();
//                   } else {
//                     // Show error or validation
//                   }
//                 },
//                 child: Text("Save"),
//               ),
//             ],
//           );
//         });
//       },
//     );
//   }
//
//   // Function to delete a certificate
//   void _deleteCertificate(int index) {
//     setState(() {
//       certificates.removeAt(index);
//     });
//   }
//
//   // Function to proceed to next step
//   void _nextStep() {
//     if (currentStep == ProfileStep.Profile) {
//       // Validate profile form
//       if (_formKey.currentState!.validate()) {
//         // Additional validations can be added here
//         setState(() {
//           currentStep = ProfileStep.VideoIntroduction;
//         });
//         ScaffoldMessenger.of(context).showSnackBar(
//           SnackBar(content: Text("Profile completed!")),
//         );
//       }
//     } else if (currentStep == ProfileStep.VideoIntroduction) {
//       if (videoFile != null) {
//         setState(() {
//           currentStep = ProfileStep.Approval;
//         });
//       } else {
//         ScaffoldMessenger.of(context).showSnackBar(
//           SnackBar(content: Text("Please upload a video introduction.")),
//         );
//       }
//     }
//   }
//
//   // Function to go back to previous step
//   void _backStep() {
//     if (currentStep == ProfileStep.VideoIntroduction) {
//       setState(() {
//         currentStep = ProfileStep.Profile;
//       });
//     } else if (currentStep == ProfileStep.Approval) {
//       setState(() {
//         currentStep = ProfileStep.VideoIntroduction;
//       });
//     }
//   }
//
//   @override
//   void dispose() {
//     // Dispose controllers
//     nameController.dispose();
//     fromController.dispose();
//     dobController.dispose();
//     interestsController.dispose();
//     educationController.dispose();
//     experienceController.dispose();
//     professionController.dispose();
//     instructionController.dispose();
//     languagesController.dispose();
//     // _videoController?.dispose(); // Uncomment when using video_player
//     super.dispose();
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: _buildAppBar(),
//       body: SingleChildScrollView(
//         padding: const EdgeInsets.all(16.0),
//         child: currentStep == ProfileStep.Profile
//             ? _buildProfileForm()
//             : currentStep == ProfileStep.VideoIntroduction
//             ? _buildVideoIntroduction()
//             : _buildApproval(),
//       ),
//     );
//   }
//
//   AppBar _buildAppBar() {
//     return AppBar(
//       title: const Text("Set up your tutor profile"),
//       backgroundColor: Colors.blue,
//     );
//   }
//
//   Widget _buildProfileForm() {
//     return Form(
//       key: _formKey,
//       child: Column(
//         crossAxisAlignment: CrossAxisAlignment.start,
//         children: [
//           // Progress Steps
//           _buildProgressSteps(),
//
//           const SizedBox(height: 20),
//
//           // Profile Image Upload
//           Center(
//             child: GestureDetector(
//               onTap: _pickProfileImage,
//               child: CircleAvatar(
//                 radius: 50,
//                 backgroundImage: profileImage != null
//                     ? FileImage(profileImage!)
//                     : AssetImage('assets/profile_placeholder.png')
//                 as ImageProvider,
//                 child: profileImage == null
//                     ? Icon(Icons.camera_alt, size: 50, color: Colors.white70)
//                     : null,
//               ),
//             ),
//           ),
//           const SizedBox(height: 10),
//           Center(
//             child: TextButton(
//               onPressed: _pickProfileImage,
//               child: Text("Upload Profile Image"),
//             ),
//           ),
//
//           const SizedBox(height: 20),
//
//           // Form Title
//           const Text(
//             "Set up your tutor profile",
//             style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
//           ),
//           const SizedBox(height: 10),
//           const Text(
//             "Students will check your profile to decide whether to book a lesson with you. Please provide as much information as possible.",
//             style: TextStyle(fontSize: 14, color: Colors.grey),
//           ),
//           const SizedBox(height: 20),
//
//           // Basic Info Section
//           const Text(
//             "Basic Info",
//             style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
//           ),
//           const SizedBox(height: 10),
//           TextFormField(
//             controller: nameController,
//             decoration: const InputDecoration(
//               labelText: "Name",
//               border: OutlineInputBorder(),
//             ),
//             validator: (value) {
//               if (value == null || value.isEmpty) {
//                 return 'Please enter your name';
//               }
//               return null;
//             },
//           ),
//           const SizedBox(height: 10),
//           TextFormField(
//             controller: fromController,
//             decoration: const InputDecoration(
//               labelText: "From",
//               border: OutlineInputBorder(),
//             ),
//           ),
//           const SizedBox(height: 10),
//           TextFormField(
//             controller: dobController,
//             decoration: const InputDecoration(
//               labelText: "Date of Birth",
//               border: OutlineInputBorder(),
//             ),
//             // You can add a date picker here
//           ),
//           const SizedBox(height: 20),
//
//           // CV Section
//           const Text(
//             "CV",
//             style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
//           ),
//           const SizedBox(height: 10),
//           TextFormField(
//             controller: interestsController,
//             decoration: const InputDecoration(
//               labelText: "Interests",
//               border: OutlineInputBorder(),
//             ),
//           ),
//           const SizedBox(height: 10),
//           TextFormField(
//             controller: educationController,
//             decoration: const InputDecoration(
//               labelText: "Education",
//               border: OutlineInputBorder(),
//             ),
//           ),
//           const SizedBox(height: 10),
//           TextFormField(
//             controller: experienceController,
//             decoration: const InputDecoration(
//               labelText: "Experience",
//               border: OutlineInputBorder(),
//             ),
//           ),
//           const SizedBox(height: 10),
//           TextFormField(
//             controller: professionController,
//             decoration: const InputDecoration(
//               labelText: "Current or Previous Profession",
//               border: OutlineInputBorder(),
//             ),
//           ),
//           const SizedBox(height: 10),
//           ElevatedButton.icon(
//             onPressed: _pickProfessionFile,
//             icon: Icon(Icons.upload_file),
//             label: Text(
//                 professionFile != null ? "File Uploaded" : "Upload Profession File"),
//           ),
//           if (professionFile != null)
//             Padding(
//               padding: const EdgeInsets.only(top: 5.0),
//               child: Text(
//                 professionFile!.path.split('/').last,
//                 style: TextStyle(color: Colors.green),
//               ),
//             ),
//           const SizedBox(height: 20),
//
//           // Languages Section
//           const Text(
//             "Languages I Speak",
//             style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
//           ),
//           const SizedBox(height: 10),
//           TextFormField(
//             controller: languagesController,
//             decoration: const InputDecoration(
//               labelText: "Languages",
//               border: OutlineInputBorder(),
//             ),
//           ),
//           const SizedBox(height: 20),
//
//           // Teaching Section
//           const Text(
//             "Who I Teach",
//             style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
//           ),
//           const SizedBox(height: 10),
//           TextFormField(
//             controller: instructionController,
//             decoration: const InputDecoration(
//               labelText: "Instruction",
//               border: OutlineInputBorder(),
//             ),
//           ),
//           const SizedBox(height: 10),
//           const Text("I am best at teaching students who are:"),
//           CheckboxListTile(
//             value: beginnerChecked,
//             title: const Text("Beginner"),
//             onChanged: (value) {
//               setState(() {
//                 beginnerChecked = value!;
//               });
//             },
//           ),
//           CheckboxListTile(
//             value: intermediateChecked,
//             title: const Text("Intermediate"),
//             onChanged: (value) {
//               setState(() {
//                 intermediateChecked = value!;
//               });
//             },
//           ),
//           CheckboxListTile(
//             value: advancedChecked,
//             title: const Text("Advanced"),
//             onChanged: (value) {
//               setState(() {
//                 advancedChecked = value!;
//               });
//             },
//           ),
//           const SizedBox(height: 20),
//
//           // Certificates Section
//           const Text(
//             "Certificates",
//             style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
//           ),
//           const SizedBox(height: 10),
//           ElevatedButton.icon(
//             onPressed: _addCertificate,
//             icon: Icon(Icons.add),
//             label: Text("Add New Certificate"),
//           ),
//           const SizedBox(height: 10),
//           certificates.isNotEmpty
//               ? DataTable(
//             columns: const [
//               DataColumn(label: Text("Certificate Type")),
//               DataColumn(label: Text("Certificate")),
//               DataColumn(label: Text("Action")),
//             ],
//             rows: List.generate(certificates.length, (index) {
//               return DataRow(cells: [
//                 DataCell(Text(certificates[index].type)),
//                 DataCell(Text(certificates[index].fileName)),
//                 DataCell(IconButton(
//                   icon: Icon(Icons.delete, color: Colors.red),
//                   onPressed: () => _deleteCertificate(index),
//                 )),
//               ]);
//             }),
//           )
//               : Text("No certificates added."),
//           const SizedBox(height: 20),
//
//           // Save and Next Buttons
//           Row(
//             mainAxisAlignment: MainAxisAlignment.spaceBetween,
//             children: [
//               ElevatedButton(
//                 onPressed: () {
//                   // Implement Save functionality if separate from Next
//                   if (_formKey.currentState!.validate()) {
//                     ScaffoldMessenger.of(context).showSnackBar(
//                       const SnackBar(content: Text("Profile saved!")),
//                     );
//                   }
//                 },
//                 child: Text("Save"),
//               ),
//               ElevatedButton(
//                 onPressed: _nextStep,
//                 child: Text("Next"),
//               ),
//             ],
//           ),
//         ],
//       ),
//     );
//   }
//
//   Widget _buildProgressSteps() {
//     return Row(
//       mainAxisAlignment: MainAxisAlignment.spaceEvenly,
//       children: [
//         // Profile Step
//         Column(
//           children: [
//             CircleAvatar(
//               backgroundColor: currentStep == ProfileStep.Profile ||
//                   currentStep == ProfileStep.VideoIntroduction ||
//                   currentStep == ProfileStep.Approval
//                   ? Colors.blue
//                   : Colors.grey,
//               child: Icon(Icons.person, color: Colors.white),
//             ),
//             SizedBox(height: 5),
//             Text(
//               "Complete Profile",
//               style: TextStyle(
//                 color: currentStep == ProfileStep.Profile ||
//                     currentStep == ProfileStep.VideoIntroduction ||
//                     currentStep == ProfileStep.Approval
//                     ? Colors.black
//                     : Colors.grey,
//               ),
//             ),
//           ],
//         ),
//         // Connecting Line
//         Expanded(
//           child: Container(
//             height: 2,
//             color: currentStep == ProfileStep.VideoIntroduction ||
//                 currentStep == ProfileStep.Approval
//                 ? Colors.blue
//                 : Colors.grey,
//           ),
//         ),
//         // Video Introduction Step
//         Column(
//           children: [
//             CircleAvatar(
//               backgroundColor: currentStep == ProfileStep.VideoIntroduction ||
//                   currentStep == ProfileStep.Approval
//                   ? Colors.blue
//                   : Colors.grey,
//               child: Icon(Icons.videocam, color: Colors.white),
//             ),
//             SizedBox(height: 5),
//             Text(
//               "Video Introduction",
//               style: TextStyle(
//                 color: currentStep == ProfileStep.VideoIntroduction ||
//                     currentStep == ProfileStep.Approval
//                     ? Colors.black
//                     : Colors.grey,
//               ),
//             ),
//           ],
//         ),
//         // Connecting Line
//         Expanded(
//           child: Container(
//             height: 2,
//             color: currentStep == ProfileStep.Approval
//                 ? Colors.blue
//                 : Colors.grey,
//           ),
//         ),
//         // Approval Step
//         Column(
//           children: [
//             CircleAvatar(
//               backgroundColor: currentStep == ProfileStep.Approval
//                   ? Colors.blue
//                   : Colors.grey,
//               child: Icon(Icons.check, color: Colors.white),
//             ),
//             SizedBox(height: 5),
//             Text(
//               "Approval",
//               style: TextStyle(
//                 color: currentStep == ProfileStep.Approval
//                     ? Colors.black
//                     : Colors.grey,
//               ),
//             ),
//           ],
//         ),
//       ],
//     );
//   }
//
//   Widget _buildVideoIntroduction() {
//     return Column(
//       crossAxisAlignment: CrossAxisAlignment.start,
//       children: [
//         // Progress Steps
//         _buildProgressSteps(),
//
//         const SizedBox(height: 20),
//
//         const Text(
//           "Introduce Yourself",
//           style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
//         ),
//         const SizedBox(height: 10),
//         const Text(
//           "Let students know what they can expect from a lesson with you by recording a video highlighting your teaching style, expertise, and personality. Students can be nervous to speak with a foreigner, so it really helps to have a friendly video that introduces yourself and invites students to call you.",
//           style: TextStyle(fontSize: 14, color: Colors.grey),
//         ),
//         const SizedBox(height: 20),
//
//         const Text(
//           "A few helpful tips:",
//           style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
//         ),
//         const SizedBox(height: 5),
//         Column(
//           crossAxisAlignment: CrossAxisAlignment.start,
//           children: [
//             _buildTipItem("Find a clean and quiet space"),
//             _buildTipItem("Smile and look at the camera"),
//             _buildTipItem("Dress smart"),
//             _buildTipItem("Speak for 1-3 minutes"),
//             _buildTipItem("Brand yourself and have fun!"),
//           ],
//         ),
//         const SizedBox(height: 10),
//         const Text(
//           "Note: We only support uploading video files that are less than 64 MB in size.",
//           style: TextStyle(fontSize: 12, color: Colors.red),
//         ),
//         const SizedBox(height: 20),
//
//         // Choose Video Button
//         Center(
//           child: ElevatedButton.icon(
//             onPressed: _pickVideoFile,
//             icon: Icon(Icons.video_call),
//             label: Text("Choose Video"),
//           ),
//         ),
//         if (videoFile != null)
//           Column(
//             children: [
//               const SizedBox(height: 10),
//               // Video Player Placeholder
//               Container(
//                 height: 200,
//                 color: Colors.black12,
//                 child: Center(
//                   child: Icon(Icons.play_arrow, size: 100, color: Colors.grey),
//                 ),
//               ),
//               /*
//               // Uncomment when using video_player
//               _videoController != null && _videoController!.value.isInitialized
//                   ? AspectRatio(
//                       aspectRatio: _videoController!.value.aspectRatio,
//                       child: VideoPlayer(_videoController!),
//                     )
//                   : Container(),
//               */
//               const SizedBox(height: 10),
//               // Video Controls
//               Row(
//                 mainAxisAlignment: MainAxisAlignment.center,
//                 children: [
//                   IconButton(
//                     icon: Icon(Icons.replay_10),
//                     onPressed: () {
//                       // Implement rewind 10 seconds
//                     },
//                   ),
//                   IconButton(
//                     icon: Icon(isVideoPlaying ? Icons.pause : Icons.play_arrow),
//                     onPressed: () {
//                       setState(() {
//                         isVideoPlaying = !isVideoPlaying;
//                         // _videoController!.value.isPlaying
//                         //     ? _videoController!.pause()
//                         //     : _videoController!.play();
//                       });
//                     },
//                   ),
//                   IconButton(
//                     icon: Icon(Icons.forward_10),
//                     onPressed: () {
//                       // Implement forward 10 seconds
//                     },
//                   ),
//                 ],
//               ),
//               Slider(
//                 value: videoProgress,
//                 onChanged: (value) {
//                   setState(() {
//                     videoProgress = value;
//                     // _videoController!.seekTo(Duration(seconds: value.toInt()));
//                   });
//                 },
//               ),
//             ],
//           ),
//         const SizedBox(height: 20),
//
//         // Back and Next Buttons
//         Row(
//           mainAxisAlignment: MainAxisAlignment.spaceBetween,
//           children: [
//             ElevatedButton(
//               onPressed: _backStep,
//               child: Text("Back"),
//             ),
//             ElevatedButton(
//               onPressed: _nextStep,
//               child: Text("Next"),
//             ),
//           ],
//         ),
//       ],
//     );
//   }
//
//   Widget _buildTipItem(String tip) {
//     return Row(
//       children: [
//         Icon(Icons.check, size: 16, color: Colors.green),
//         SizedBox(width: 5),
//         Expanded(child: Text(tip)),
//       ],
//     );
//   }
//
//   Widget _buildApproval() {
//     return Column(
//       crossAxisAlignment: CrossAxisAlignment.center,
//       children: [
//         // Progress Steps
//         _buildProgressSteps(),
//
//         const SizedBox(height: 50),
//
//         Icon(Icons.check_circle, color: Colors.green, size: 100),
//         const SizedBox(height: 20),
//         const Text(
//           "Congratulations!",
//           style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
//         ),
//         const SizedBox(height: 10),
//         const Text(
//           "Your application is being processed.",
//           style: TextStyle(fontSize: 16, color: Colors.grey),
//         ),
//         const SizedBox(height: 10),
//         const Text(
//           "You can now start receiving student bookings.",
//           style: TextStyle(fontSize: 16, color: Colors.grey),
//           textAlign: TextAlign.center,
//         ),
//
//         const SizedBox(height: 50),
//
//         // Optionally, you can add a button to go back or navigate elsewhere
//       ],
//     );
//   }
// }
//
// import 'dart:io';
//
// import 'package:flutter/material.dart';
// import 'package:image_picker/image_picker.dart';
// import 'package:file_picker/file_picker.dart';
// import 'package:video_player/video_player.dart';
//
// void main() {
//   runApp(TutorProfileApp());
// }
//
// class TutorProfileApp extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       title: 'Tutor Profile Setup',
//       debugShowCheckedModeBanner: false,
//       home: TutorProfilePage(),
//     );
//   }
// }
//
// enum ProfileStep { Profile, VideoIntroduction, Approval }
//
// class Certificate {
//   String type;
//   File file;
//
//   Certificate({required this.type, required this.file});
// }
//
// class TutorProfilePage extends StatefulWidget {
//   @override
//   _TutorProfilePageState createState() => _TutorProfilePageState();
// }
//
// class _TutorProfilePageState extends State<TutorProfilePage> {
//   final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
//
//   // Current Step
//   ProfileStep currentStep = ProfileStep.Profile;
//
//   // Controllers for form fields
//   final TextEditingController nameController = TextEditingController();
//   final TextEditingController fromController = TextEditingController();
//   final TextEditingController dobController = TextEditingController();
//   final TextEditingController interestsController = TextEditingController();
//   final TextEditingController educationController = TextEditingController();
//   final TextEditingController experienceController = TextEditingController();
//   final TextEditingController professionController = TextEditingController();
//   final TextEditingController instructionController = TextEditingController();
//   final TextEditingController languagesController = TextEditingController();
//
//   // Image and File Uploads
//   File? profileImage;
//
//   // Certificates
//   List<Certificate> certificates = [];
//
//   // Video Introduction
//   File? videoFile;
//   VideoPlayerController? _videoController;
//
//   // Checkbox States
//   bool beginnerChecked = false;
//   bool intermediateChecked = false;
//   bool advancedChecked = false;
//
//   // Video Playback State
//   bool isVideoPlaying = false;
//   double videoProgress = 0.0;
//
//   final ImagePicker _imagePicker = ImagePicker();
//
//   // Function to pick profile image
//   Future<void> _pickProfileImage() async {
//     try {
//       final pickedFile = await _imagePicker.pickImage(source: ImageSource.gallery);
//       if (pickedFile != null) {
//         setState(() {
//           profileImage = File(pickedFile.path);
//         });
//       }
//     } catch (e) {
//       // Handle any errors
//       ScaffoldMessenger.of(context).showSnackBar(
//         SnackBar(content: Text("Error picking image: $e")),
//       );
//     }
//   }
//
//   // Function to pick video file
//   Future<void> _pickVideoFile() async {
//     try {
//       final pickedFile = await _imagePicker.pickVideo(source: ImageSource.gallery);
//       if (pickedFile != null) {
//         _videoController?.dispose();
//         _videoController = VideoPlayerController.file(File(pickedFile.path))
//           ..initialize().then((_) {
//             setState(() {
//               videoFile = File(pickedFile.path);
//               _videoController!.play();
//               isVideoPlaying = true;
//             });
//           });
//       }
//     } catch (e) {
//       // Handle any errors
//       ScaffoldMessenger.of(context).showSnackBar(
//         SnackBar(content: Text("Error picking video: $e")),
//       );
//     }
//   }
//
//   // Function to add a new certificate
//   void _addCertificate() async {
//     String selectedType = "Select Certification";
//     File? uploadedFile;
//
//     await showDialog(
//       context: context,
//       builder: (context) {
//         return StatefulBuilder(builder: (context, setStateDialog) {
//           return AlertDialog(
//             title: Text("Add New Certificate"),
//             content: Column(
//               mainAxisSize: MainAxisSize.min,
//               children: [
//                 DropdownButtonFormField<String>(
//                   value: selectedType,
//                   items: ["Select Certification", "IELTS", "TOEFL", "Other"]
//                       .map((cert) {
//                     return DropdownMenuItem(
//                       value: cert,
//                       child: Text(cert),
//                     );
//                   }).toList(),
//                   onChanged: (value) {
//                     setStateDialog(() {
//                       selectedType = value!;
//                     });
//                   },
//                   decoration: InputDecoration(
//                     labelText: "Certificate Type",
//                     border: OutlineInputBorder(),
//                   ),
//                 ),
//                 SizedBox(height: 10),
//                 ElevatedButton(
//                   onPressed: () async {
//                     try {
//                       FilePickerResult? result = await FilePicker.platform.pickFiles(
//                         type: FileType.custom,
//                         allowedExtensions: ['pdf', 'doc', 'docx', 'jpg', 'png'],
//                       );
//                       if (result != null && result.files.single.path != null) {
//                         setStateDialog(() {
//                           uploadedFile = File(result.files.single.path!);
//                         });
//                       }
//                     } catch (e) {
//                       // Handle any errors
//                       ScaffoldMessenger.of(context).showSnackBar(
//                         SnackBar(content: Text("Error picking file: $e")),
//                       );
//                     }
//                   },
//                   child: Text("Upload Certificate"),
//                 ),
//                 SizedBox(height: 10),
//                 if (uploadedFile != null)
//                   Text(
//                     uploadedFile!.path.split('/').last,
//                     style: TextStyle(color: Colors.green),
//                   ),
//               ],
//             ),
//             actions: [
//               TextButton(
//                 onPressed: () {
//                   Navigator.of(context).pop();
//                 },
//                 child: Text("Cancel"),
//               ),
//               ElevatedButton(
//                 onPressed: () {
//                   if (selectedType != "Select Certification" &&
//                       uploadedFile != null) {
//                     setState(() {
//                       certificates.add(Certificate(
//                           type: selectedType, file: uploadedFile!));
//                     });
//                     Navigator.of(context).pop();
//                   } else {
//                     // Show error or validation
//                     ScaffoldMessenger.of(context).showSnackBar(
//                       SnackBar(content: Text("Please select type and upload file")),
//                     );
//                   }
//                 },
//                 child: Text("Save"),
//               ),
//             ],
//           );
//         });
//       },
//     );
//   }
//
//   // Function to delete a certificate
//   void _deleteCertificate(int index) {
//     setState(() {
//       certificates.removeAt(index);
//     });
//   }
//
//   // Function to pick Date of Birth
//   Future<void> _pickDateOfBirth() async {
//     DateTime initialDate = DateTime(1990);
//     DateTime firstDate = DateTime(1900);
//     DateTime lastDate = DateTime.now();
//
//     final DateTime? picked = await showDatePicker(
//       context: context,
//       initialDate: initialDate,
//       firstDate: firstDate,
//       lastDate: lastDate,
//     );
//
//     if (picked != null) {
//       setState(() {
//         dobController.text = "${picked.toLocal()}".split(' ')[0];
//       });
//     }
//   }
//
//   // Function to proceed to next step
//   void _nextStep() {
//     if (currentStep == ProfileStep.Profile) {
//       // Validate profile form
//       if (_formKey.currentState!.validate()) {
//         // Additional validations can be added here
//         setState(() {
//           currentStep = ProfileStep.VideoIntroduction;
//         });
//         ScaffoldMessenger.of(context).showSnackBar(
//           SnackBar(content: Text("Profile completed!")),
//         );
//       }
//     } else if (currentStep == ProfileStep.VideoIntroduction) {
//       if (videoFile != null) {
//         setState(() {
//           currentStep = ProfileStep.Approval;
//         });
//       } else {
//         ScaffoldMessenger.of(context).showSnackBar(
//           SnackBar(content: Text("Please upload a video introduction.")),
//         );
//       }
//     }
//   }
//
//   // Function to go back to previous step
//   void _backStep() {
//     if (currentStep == ProfileStep.VideoIntroduction) {
//       setState(() {
//         currentStep = ProfileStep.Profile;
//       });
//     } else if (currentStep == ProfileStep.Approval) {
//       setState(() {
//         currentStep = ProfileStep.VideoIntroduction;
//       });
//     }
//   }
//
//   @override
//   void dispose() {
//     // Dispose controllers
//     nameController.dispose();
//     fromController.dispose();
//     dobController.dispose();
//     interestsController.dispose();
//     educationController.dispose();
//     experienceController.dispose();
//     professionController.dispose();
//     instructionController.dispose();
//     languagesController.dispose();
//     _videoController?.dispose();
//     super.dispose();
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: _buildAppBar(),
//       body: SingleChildScrollView(
//         padding: const EdgeInsets.all(16.0),
//         child: currentStep == ProfileStep.Profile
//             ? _buildProfileForm()
//             : currentStep == ProfileStep.VideoIntroduction
//             ? _buildVideoIntroduction()
//             : _buildApproval(),
//       ),
//     );
//   }
//
//   AppBar _buildAppBar() {
//     return AppBar(
//       title: const Text("Set up your tutor profile"),
//       backgroundColor: Colors.blue,
//     );
//   }
//
//   Widget _buildProfileForm() {
//     return Form(
//       key: _formKey,
//       child: Column(
//         crossAxisAlignment: CrossAxisAlignment.start,
//         children: [
//           // Progress Steps
//           _buildProgressSteps(),
//
//           const SizedBox(height: 20),
//
//           // Profile Image Upload
//           Center(
//             child: GestureDetector(
//               onTap: _pickProfileImage,
//               child: CircleAvatar(
//                 radius: 50,
//                 backgroundImage: profileImage != null
//                     ? FileImage(profileImage!)
//                     : AssetImage('assets/profile_placeholder.png')
//                 as ImageProvider,
//                 child: profileImage == null
//                     ? Icon(Icons.camera_alt, size: 50, color: Colors.white70)
//                     : null,
//               ),
//             ),
//           ),
//           const SizedBox(height: 10),
//           Center(
//             child: TextButton.icon(
//               onPressed: _pickProfileImage,
//               icon: Icon(Icons.upload),
//               label: Text("Upload Profile Image"),
//             ),
//           ),
//
//           const SizedBox(height: 20),
//
//           // Form Title
//           const Text(
//             "Set up your tutor profile",
//             style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
//           ),
//           const SizedBox(height: 10),
//           const Text(
//             "Students will check your profile to decide whether to book a lesson with you. Please provide as much information as possible.",
//             style: TextStyle(fontSize: 14, color: Colors.grey),
//           ),
//           const SizedBox(height: 20),
//
//           // Basic Info Section
//           const Text(
//             "Basic Info",
//             style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
//           ),
//           const SizedBox(height: 10),
//           TextFormField(
//             controller: nameController,
//             decoration: const InputDecoration(
//               labelText: "Name",
//               border: OutlineInputBorder(),
//             ),
//             validator: (value) {
//               if (value == null || value.isEmpty) {
//                 return 'Please enter your name';
//               }
//               return null;
//             },
//           ),
//           const SizedBox(height: 10),
//           TextFormField(
//             controller: fromController,
//             decoration: const InputDecoration(
//               labelText: "From",
//               border: OutlineInputBorder(),
//             ),
//           ),
//           const SizedBox(height: 10),
//           GestureDetector(
//             onTap: _pickDateOfBirth,
//             child: AbsorbPointer(
//               child: TextFormField(
//                 controller: dobController,
//                 decoration: const InputDecoration(
//                   labelText: "Date of Birth",
//                   border: OutlineInputBorder(),
//                   suffixIcon: Icon(Icons.calendar_today),
//                 ),
//                 validator: (value) {
//                   if (value == null || value.isEmpty) {
//                     return 'Please select your date of birth';
//                   }
//                   return null;
//                 },
//               ),
//             ),
//           ),
//           const SizedBox(height: 20),
//
//           // CV Section
//           const Text(
//             "CV",
//             style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
//           ),
//           const SizedBox(height: 10),
//           TextFormField(
//             controller: interestsController,
//             decoration: const InputDecoration(
//               labelText: "Interests",
//               border: OutlineInputBorder(),
//             ),
//           ),
//           const SizedBox(height: 10),
//           TextFormField(
//             controller: educationController,
//             decoration: const InputDecoration(
//               labelText: "Education",
//               border: OutlineInputBorder(),
//             ),
//           ),
//           const SizedBox(height: 10),
//           TextFormField(
//             controller: experienceController,
//             decoration: const InputDecoration(
//               labelText: "Experience",
//               border: OutlineInputBorder(),
//             ),
//           ),
//           const SizedBox(height: 10),
//           TextFormField(
//             controller: professionController,
//             decoration: const InputDecoration(
//               labelText: "Current or Previous Profession",
//               border: OutlineInputBorder(),
//             ),
//           ),
//           const SizedBox(height: 20),
//
//           // Languages Section
//           const Text(
//             "Languages I Speak",
//             style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
//           ),
//           const SizedBox(height: 10),
//           TextFormField(
//             controller: languagesController,
//             decoration: const InputDecoration(
//               labelText: "Languages",
//               border: OutlineInputBorder(),
//             ),
//           ),
//           const SizedBox(height: 20),
//
//           // Teaching Section
//           const Text(
//             "Who I Teach",
//             style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
//           ),
//           const SizedBox(height: 10),
//           TextFormField(
//             controller: instructionController,
//             decoration: const InputDecoration(
//               labelText: "Instruction",
//               border: OutlineInputBorder(),
//             ),
//           ),
//           const SizedBox(height: 10),
//           const Text("I am best at teaching students who are:"),
//           CheckboxListTile(
//             value: beginnerChecked,
//             title: const Text("Beginner"),
//             onChanged: (value) {
//               setState(() {
//                 beginnerChecked = value!;
//               });
//             },
//           ),
//           CheckboxListTile(
//             value: intermediateChecked,
//             title: const Text("Intermediate"),
//             onChanged: (value) {
//               setState(() {
//                 intermediateChecked = value!;
//               });
//             },
//           ),
//           CheckboxListTile(
//             value: advancedChecked,
//             title: const Text("Advanced"),
//             onChanged: (value) {
//               setState(() {
//                 advancedChecked = value!;
//               });
//             },
//           ),
//           const SizedBox(height: 20),
//
//           // Certificates Section
//           const Text(
//             "Certificates",
//             style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
//           ),
//           const SizedBox(height: 10),
//           ElevatedButton.icon(
//             onPressed: _addCertificate,
//             icon: Icon(Icons.add),
//             label: Text("Add New Certificate"),
//           ),
//           const SizedBox(height: 10),
//           certificates.isNotEmpty
//               ? DataTable(
//             columns: const [
//               DataColumn(label: Text("Certificate Type")),
//               DataColumn(label: Text("Certificate")),
//               DataColumn(label: Text("Action")),
//             ],
//             rows: List.generate(certificates.length, (index) {
//               return DataRow(cells: [
//                 DataCell(Text(certificates[index].type)),
//                 DataCell(Text(certificates[index].file.path.split('/').last)),
//                 DataCell(IconButton(
//                   icon: Icon(Icons.delete, color: Colors.red),
//                   onPressed: () => _deleteCertificate(index),
//                 )),
//               ]);
//             }),
//           )
//               : Text("No certificates added."),
//           const SizedBox(height: 20),
//
//           // Save and Next Buttons
//           Row(
//             mainAxisAlignment: MainAxisAlignment.spaceBetween,
//             children: [
//               ElevatedButton(
//                 onPressed: () {
//                   // Implement Save functionality if separate from Next
//                   if (_formKey.currentState!.validate()) {
//                     ScaffoldMessenger.of(context).showSnackBar(
//                       const SnackBar(content: Text("Profile saved!")),
//                     );
//                   }
//                 },
//                 child: Text("Save"),
//               ),
//               ElevatedButton(
//                 onPressed: _nextStep,
//                 child: Text("Next"),
//               ),
//             ],
//           ),
//         ],
//       ),
//     );
//   }
//
//   Widget _buildProgressSteps() {
//     return Row(
//       mainAxisAlignment: MainAxisAlignment.spaceEvenly,
//       children: [
//         // Profile Step
//         Column(
//           children: [
//             CircleAvatar(
//               backgroundColor: currentStep == ProfileStep.Profile ||
//                   currentStep == ProfileStep.VideoIntroduction ||
//                   currentStep == ProfileStep.Approval
//                   ? Colors.blue
//                   : Colors.grey,
//               child: Icon(Icons.person, color: Colors.white),
//             ),
//             SizedBox(height: 5),
//             Text(
//               "Complete Profile",
//               style: TextStyle(
//                 color: currentStep == ProfileStep.Profile ||
//                     currentStep == ProfileStep.VideoIntroduction ||
//                     currentStep == ProfileStep.Approval
//                     ? Colors.black
//                     : Colors.grey,
//               ),
//             ),
//           ],
//         ),
//         // Connecting Line
//         Expanded(
//           child: Container(
//             height: 2,
//             color: currentStep == ProfileStep.VideoIntroduction ||
//                 currentStep == ProfileStep.Approval
//                 ? Colors.blue
//                 : Colors.grey,
//           ),
//         ),
//         // Video Introduction Step
//         Column(
//           children: [
//             CircleAvatar(
//               backgroundColor: currentStep == ProfileStep.VideoIntroduction ||
//                   currentStep == ProfileStep.Approval
//                   ? Colors.blue
//                   : Colors.grey,
//               child: Icon(Icons.videocam, color: Colors.white),
//             ),
//             SizedBox(height: 5),
//             Text(
//               "Video Introduction",
//               style: TextStyle(
//                 color: currentStep == ProfileStep.VideoIntroduction ||
//                     currentStep == ProfileStep.Approval
//                     ? Colors.black
//                     : Colors.grey,
//               ),
//             ),
//           ],
//         ),
//         // Connecting Line
//         Expanded(
//           child: Container(
//             height: 2,
//             color: currentStep == ProfileStep.Approval
//                 ? Colors.blue
//                 : Colors.grey,
//           ),
//         ),
//         // Approval Step
//         Column(
//           children: [
//             CircleAvatar(
//               backgroundColor: currentStep == ProfileStep.Approval
//                   ? Colors.blue
//                   : Colors.grey,
//               child: Icon(Icons.check, color: Colors.white),
//             ),
//             SizedBox(height: 5),
//             Text(
//               "Approval",
//               style: TextStyle(
//                 color: currentStep == ProfileStep.Approval
//                     ? Colors.black
//                     : Colors.grey,
//               ),
//             ),
//           ],
//         ),
//       ],
//     );
//   }
//
//   Widget _buildVideoIntroduction() {
//     return Column(
//       crossAxisAlignment: CrossAxisAlignment.start,
//       children: [
//         // Progress Steps
//         _buildProgressSteps(),
//
//         const SizedBox(height: 20),
//
//         const Text(
//           "Introduce Yourself",
//           style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
//         ),
//         const SizedBox(height: 10),
//         const Text(
//           "Let students know what they can expect from a lesson with you by recording a video highlighting your teaching style, expertise, and personality. Students can be nervous to speak with a foreigner, so it really helps to have a friendly video that introduces yourself and invites students to call you.",
//           style: TextStyle(fontSize: 14, color: Colors.grey),
//         ),
//         const SizedBox(height: 20),
//
//         const Text(
//           "A few helpful tips:",
//           style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
//         ),
//         const SizedBox(height: 5),
//         Column(
//           crossAxisAlignment: CrossAxisAlignment.start,
//           children: [
//             _buildTipItem("Find a clean and quiet space"),
//             _buildTipItem("Smile and look at the camera"),
//             _buildTipItem("Dress smart"),
//             _buildTipItem("Speak for 1-3 minutes"),
//             _buildTipItem("Brand yourself and have fun!"),
//           ],
//         ),
//         const SizedBox(height: 10),
//         const Text(
//           "Note: We only support uploading video files that are less than 64 MB in size.",
//           style: TextStyle(fontSize: 12, color: Colors.red),
//         ),
//         const SizedBox(height: 20),
//
//         // Choose Video Button
//         Center(
//           child: ElevatedButton.icon(
//             onPressed: _pickVideoFile,
//             icon: Icon(Icons.video_call),
//             label: Text("Choose Video"),
//           ),
//         ),
//         if (videoFile != null && _videoController != null)
//           Column(
//             children: [
//               const SizedBox(height: 10),
//               // Video Player
//               AspectRatio(
//                 aspectRatio: _videoController!.value.aspectRatio,
//                 child: VideoPlayer(_videoController!),
//               ),
//               const SizedBox(height: 10),
//               // Video Controls
//               Row(
//                 mainAxisAlignment: MainAxisAlignment.center,
//                 children: [
//                   IconButton(
//                     icon: Icon(Icons.replay_10),
//                     onPressed: () {
//                       final currentPosition = _videoController!.value.position;
//                       _videoController!.seekTo(
//                         currentPosition - Duration(seconds: 10),
//                       );
//                     },
//                   ),
//                   IconButton(
//                     icon:
//                     Icon(_videoController!.value.isPlaying ? Icons.pause : Icons.play_arrow),
//                     onPressed: () {
//                       setState(() {
//                         if (_videoController!.value.isPlaying) {
//                           _videoController!.pause();
//                         } else {
//                           _videoController!.play();
//                         }
//                       });
//                     },
//                   ),
//                   IconButton(
//                     icon: Icon(Icons.forward_10),
//                     onPressed: () {
//                       final currentPosition = _videoController!.value.position;
//                       _videoController!.seekTo(
//                         currentPosition + Duration(seconds: 10),
//                       );
//                     },
//                   ),
//                 ],
//               ),
//               VideoProgressIndicator(
//                 _videoController!,
//                 allowScrubbing: true,
//                 padding: EdgeInsets.symmetric(horizontal: 20.0),
//               ),
//             ],
//           ),
//         const SizedBox(height: 20),
//
//         // Back and Next Buttons
//         Row(
//           mainAxisAlignment: MainAxisAlignment.spaceBetween,
//           children: [
//             ElevatedButton(
//               onPressed: _backStep,
//               child: Text("Back"),
//             ),
//             ElevatedButton(
//               onPressed: _nextStep,
//               child: Text("Next"),
//             ),
//           ],
//         ),
//       ],
//     );
//   }
//
//   Widget _buildTipItem(String tip) {
//     return Row(
//       children: [
//         Icon(Icons.check, size: 16, color: Colors.green),
//         SizedBox(width: 5),
//         Expanded(child: Text(tip)),
//       ],
//     );
//   }
//
//   Widget _buildApproval() {
//     return Column(
//       crossAxisAlignment: CrossAxisAlignment.center,
//       children: [
//         // Progress Steps
//         _buildProgressSteps(),
//
//         const SizedBox(height: 50),
//
//         Icon(Icons.check_circle, color: Colors.green, size: 100),
//         const SizedBox(height: 20),
//         const Text(
//           "Congratulations!",
//           style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
//         ),
//         const SizedBox(height: 10),
//         const Text(
//           "Your application is being processed.",
//           style: TextStyle(fontSize: 16, color: Colors.grey),
//         ),
//         const SizedBox(height: 10),
//         const Text(
//           "You can now start receiving student bookings.",
//           style: TextStyle(fontSize: 16, color: Colors.grey),
//           textAlign: TextAlign.center,
//         ),
//
//         const SizedBox(height: 50),
//
//         // Optionally, you can add a button to go back or navigate elsewhere
//       ],
//     );
//   }
// }
//
// import 'dart:io';
//
// import 'package:flutter/material.dart';
// import 'package:image_picker/image_picker.dart';
// import 'package:file_picker/file_picker.dart';
// import 'package:video_player/video_player.dart';
// import 'package:path_provider/path_provider.dart';
//
// void main() {
//   runApp(TutorProfileApp());
// }
//
// class TutorProfileApp extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       title: 'Tutor Profile Setup',
//       debugShowCheckedModeBanner: false,
//       home: TutorProfilePage(),
//     );
//   }
// }
//
// enum ProfileStep { Profile, VideoIntroduction, Approval }
//
// class Certificate {
//   String type;
//   File file;
//
//   Certificate({required this.type, required this.file});
// }
//
// class TutorProfilePage extends StatefulWidget {
//   @override
//   _TutorProfilePageState createState() => _TutorProfilePageState();
// }
//
// class _TutorProfilePageState extends State<TutorProfilePage> {
//   final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
//
//   // Current Step
//   ProfileStep currentStep = ProfileStep.Profile;
//
//   // Controllers for form fields
//   final TextEditingController nameController = TextEditingController();
//   final TextEditingController fromController = TextEditingController();
//   final TextEditingController dobController = TextEditingController();
//   final TextEditingController interestsController = TextEditingController();
//   final TextEditingController educationController = TextEditingController();
//   final TextEditingController experienceController = TextEditingController();
//   final TextEditingController professionController = TextEditingController();
//   final TextEditingController instructionController = TextEditingController();
//   final TextEditingController languagesController = TextEditingController();
//
//   // Image and File Uploads
//   File? profileImage;
//
//   // Certificates
//   List<Certificate> certificates = [];
//
//   // Video Introduction
//   File? videoFile;
//   VideoPlayerController? _videoController;
//
//   // Checkbox States
//   bool beginnerChecked = false;
//   bool intermediateChecked = false;
//   bool advancedChecked = false;
//
//   // Video Playback State
//   bool isVideoPlaying = false;
//
//   final ImagePicker _imagePicker = ImagePicker();
//
//   // Function to pick profile image
//   Future<void> _pickProfileImage() async {
//     try {
//       final pickedFile = await _imagePicker.pickImage(source: ImageSource.gallery);
//       if (pickedFile != null) {
//         setState(() {
//           profileImage = File(pickedFile.path);
//         });
//       }
//     } catch (e) {
//       // Handle any errors
//       ScaffoldMessenger.of(context).showSnackBar(
//         SnackBar(content: Text("Error picking image: $e")),
//       );
//     }
//   }
//
//   // Function to pick video file
//   Future<void> _pickVideoFile() async {
//     try {
//       final pickedFile = await _imagePicker.pickVideo(source: ImageSource.gallery);
//       if (pickedFile != null) {
//         _videoController?.dispose();
//         _videoController = VideoPlayerController.file(File(pickedFile.path))
//           ..initialize().then((_) {
//             setState(() {
//               videoFile = File(pickedFile.path);
//               _videoController!.play();
//               isVideoPlaying = true;
//             });
//           });
//       }
//     } catch (e) {
//       // Handle any errors
//       ScaffoldMessenger.of(context).showSnackBar(
//         SnackBar(content: Text("Error picking video: $e")),
//       );
//     }
//   }
//
//   // Function to add a new certificate
//   void _addCertificate() async {
//     String selectedType = "Select Certification";
//     File? uploadedFile;
//
//     await showDialog(
//       context: context,
//       builder: (context) {
//         return StatefulBuilder(builder: (context, setStateDialog) {
//           return AlertDialog(
//             title: Text("Add New Certificate"),
//             content: Column(
//               mainAxisSize: MainAxisSize.min,
//               children: [
//                 DropdownButtonFormField<String>(
//                   value: selectedType,
//                   items: ["Select Certification", "IELTS", "TOEFL", "Other"]
//                       .map((cert) {
//                     return DropdownMenuItem(
//                       value: cert,
//                       child: Text(cert),
//                     );
//                   }).toList(),
//                   onChanged: (value) {
//                     setStateDialog(() {
//                       selectedType = value!;
//                     });
//                   },
//                   decoration: InputDecoration(
//                     labelText: "Certificate Type",
//                     border: OutlineInputBorder(),
//                   ),
//                 ),
//                 SizedBox(height: 10),
//                 ElevatedButton(
//                   onPressed: () async {
//                     try {
//                       FilePickerResult? result = await FilePicker.platform.pickFiles(
//                         type: FileType.custom,
//                         allowedExtensions: ['pdf', 'doc', 'docx', 'jpg', 'png'],
//                       );
//                       if (result != null && result.files.single.path != null) {
//                         File selectedFile = File(result.files.single.path!);
//                         final fileSize = await selectedFile.length();
//                         if (fileSize > 64 * 1024 * 1024) { // 64 MB
//                           setStateDialog(() {
//                             uploadedFile = null;
//                           });
//                           ScaffoldMessenger.of(context).showSnackBar(
//                             SnackBar(content: Text("File size exceeds 64 MB.")),
//                           );
//                           return;
//                         }
//                         setStateDialog(() {
//                           uploadedFile = selectedFile;
//                         });
//                       }
//                     } catch (e) {
//                       // Handle any errors
//                       ScaffoldMessenger.of(context).showSnackBar(
//                         SnackBar(content: Text("Error picking file: $e")),
//                       );
//                     }
//                   },
//                   child: Text("Upload Certificate"),
//                 ),
//                 SizedBox(height: 10),
//                 if (uploadedFile != null)
//                   Text(
//                     uploadedFile!.path.split('/').last,
//                     style: TextStyle(color: Colors.green),
//                   ),
//               ],
//             ),
//             actions: [
//               TextButton(
//                 onPressed: () {
//                   Navigator.of(context).pop();
//                 },
//                 child: Text("Cancel"),
//               ),
//               ElevatedButton(
//                 onPressed: () {
//                   if (selectedType != "Select Certification" &&
//                       uploadedFile != null) {
//                     setState(() {
//                       certificates.add(Certificate(
//                           type: selectedType, file: uploadedFile!));
//                     });
//                     Navigator.of(context).pop();
//                   } else {
//                     // Show error or validation
//                     ScaffoldMessenger.of(context).showSnackBar(
//                       SnackBar(content: Text("Please select type and upload file")),
//                     );
//                   }
//                 },
//                 child: Text("Save"),
//               ),
//             ],
//           );
//         });
//       },
//     );
//   }
//
//   // Function to delete a certificate
//   void _deleteCertificate(int index) {
//     setState(() {
//       certificates.removeAt(index);
//     });
//   }
//
//   // Function to pick Date of Birth
//   Future<void> _pickDateOfBirth() async {
//     DateTime initialDate = DateTime(1990);
//     DateTime firstDate = DateTime(1900);
//     DateTime lastDate = DateTime.now();
//
//     final DateTime? picked = await showDatePicker(
//       context: context,
//       initialDate: initialDate,
//       firstDate: firstDate,
//       lastDate: lastDate,
//     );
//
//     if (picked != null) {
//       setState(() {
//         dobController.text = "${picked.toLocal()}".split(' ')[0];
//       });
//     }
//   }
//
//   // Function to proceed to next step
//   void _nextStep() {
//     if (currentStep == ProfileStep.Profile) {
//       // Validate profile form
//       if (_formKey.currentState!.validate()) {
//         // Additional validations can be added here
//         setState(() {
//           currentStep = ProfileStep.VideoIntroduction;
//         });
//         ScaffoldMessenger.of(context).showSnackBar(
//           SnackBar(content: Text("Profile completed!")),
//         );
//       }
//     } else if (currentStep == ProfileStep.VideoIntroduction) {
//       if (videoFile != null) {
//         setState(() {
//           currentStep = ProfileStep.Approval;
//         });
//       } else {
//         ScaffoldMessenger.of(context).showSnackBar(
//           SnackBar(content: Text("Please upload a video introduction.")),
//         );
//       }
//     }
//   }
//
//   // Function to go back to previous step
//   void _backStep() {
//     if (currentStep == ProfileStep.VideoIntroduction) {
//       setState(() {
//         currentStep = ProfileStep.Profile;
//       });
//     } else if (currentStep == ProfileStep.Approval) {
//       setState(() {
//         currentStep = ProfileStep.VideoIntroduction;
//       });
//     }
//   }
//
//   @override
//   void dispose() {
//     // Dispose controllers
//     nameController.dispose();
//     fromController.dispose();
//     dobController.dispose();
//     interestsController.dispose();
//     educationController.dispose();
//     experienceController.dispose();
//     professionController.dispose();
//     instructionController.dispose();
//     languagesController.dispose();
//     _videoController?.dispose();
//     super.dispose();
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: _buildAppBar(),
//       body: SingleChildScrollView(
//         padding: const EdgeInsets.all(16.0),
//         child: currentStep == ProfileStep.Profile
//             ? _buildProfileForm()
//             : currentStep == ProfileStep.VideoIntroduction
//             ? _buildVideoIntroduction()
//             : _buildApproval(),
//       ),
//     );
//   }
//
//   AppBar _buildAppBar() {
//     return AppBar(
//       title: const Text("Set up your tutor profile"),
//       backgroundColor: Colors.blue,
//     );
//   }
//
//   Widget _buildProfileForm() {
//     return Form(
//       key: _formKey,
//       child: Column(
//         crossAxisAlignment: CrossAxisAlignment.start,
//         children: [
//           // Progress Steps
//           _buildProgressSteps(),
//
//           const SizedBox(height: 20),
//
//           // Profile Image Upload
//           Center(
//             child: GestureDetector(
//               onTap: _pickProfileImage,
//               child: CircleAvatar(
//                 radius: 50,
//                 backgroundImage: profileImage != null
//                     ? FileImage(profileImage!)
//                     : AssetImage('assets/profile_placeholder.png') as ImageProvider,
//                 child: profileImage == null
//                     ? Icon(Icons.camera_alt, size: 50, color: Colors.white70)
//                     : null,
//               ),
//             ),
//           ),
//           const SizedBox(height: 10),
//           Center(
//             child: TextButton.icon(
//               onPressed: _pickProfileImage,
//               icon: Icon(Icons.upload),
//               label: Text("Upload Profile Image"),
//             ),
//           ),
//
//           const SizedBox(height: 20),
//
//           // Form Title
//           const Text(
//             "Set up your tutor profile",
//             style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
//           ),
//           const SizedBox(height: 10),
//           const Text(
//             "Students will check your profile to decide whether to book a lesson with you. Please provide as much information as possible.",
//             style: TextStyle(fontSize: 14, color: Colors.grey),
//           ),
//           const SizedBox(height: 20),
//
//           // Basic Info Section
//           const Text(
//             "Basic Info",
//             style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
//           ),
//           const SizedBox(height: 10),
//           TextFormField(
//             controller: nameController,
//             decoration: const InputDecoration(
//               labelText: "Name",
//               border: OutlineInputBorder(),
//             ),
//             validator: (value) {
//               if (value == null || value.isEmpty) {
//                 return 'Please enter your name';
//               }
//               return null;
//             },
//           ),
//           const SizedBox(height: 10),
//           TextFormField(
//             controller: fromController,
//             decoration: const InputDecoration(
//               labelText: "From",
//               border: OutlineInputBorder(),
//             ),
//           ),
//           const SizedBox(height: 10),
//           GestureDetector(
//             onTap: _pickDateOfBirth,
//             child: AbsorbPointer(
//               child: TextFormField(
//                 controller: dobController,
//                 decoration: const InputDecoration(
//                   labelText: "Date of Birth",
//                   border: OutlineInputBorder(),
//                   suffixIcon: Icon(Icons.calendar_today),
//                 ),
//                 validator: (value) {
//                   if (value == null || value.isEmpty) {
//                     return 'Please select your date of birth';
//                   }
//                   return null;
//                 },
//               ),
//             ),
//           ),
//           const SizedBox(height: 20),
//
//           // CV Section
//           const Text(
//             "CV",
//             style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
//           ),
//           const SizedBox(height: 10),
//           TextFormField(
//             controller: interestsController,
//             decoration: const InputDecoration(
//               labelText: "Interests",
//               border: OutlineInputBorder(),
//             ),
//           ),
//           const SizedBox(height: 10),
//           TextFormField(
//             controller: educationController,
//             decoration: const InputDecoration(
//               labelText: "Education",
//               border: OutlineInputBorder(),
//             ),
//           ),
//           const SizedBox(height: 10),
//           TextFormField(
//             controller: experienceController,
//             decoration: const InputDecoration(
//               labelText: "Experience",
//               border: OutlineInputBorder(),
//             ),
//           ),
//           const SizedBox(height: 10),
//           TextFormField(
//             controller: professionController,
//             decoration: const InputDecoration(
//               labelText: "Current or Previous Profession",
//               border: OutlineInputBorder(),
//             ),
//           ),
//           const SizedBox(height: 20),
//
//           // Languages Section
//           const Text(
//             "Languages I Speak",
//             style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
//           ),
//           const SizedBox(height: 10),
//           TextFormField(
//             controller: languagesController,
//             decoration: const InputDecoration(
//               labelText: "Languages",
//               border: OutlineInputBorder(),
//             ),
//           ),
//           const SizedBox(height: 20),
//
//           // Teaching Section
//           const Text(
//             "Who I Teach",
//             style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
//           ),
//           const SizedBox(height: 10),
//           TextFormField(
//             controller: instructionController,
//             decoration: const InputDecoration(
//               labelText: "Instruction",
//               border: OutlineInputBorder(),
//             ),
//           ),
//           const SizedBox(height: 10),
//           const Text("I am best at teaching students who are:"),
//           CheckboxListTile(
//             value: beginnerChecked,
//             title: const Text("Beginner"),
//             onChanged: (value) {
//               setState(() {
//                 beginnerChecked = value!;
//               });
//             },
//           ),
//           CheckboxListTile(
//             value: intermediateChecked,
//             title: const Text("Intermediate"),
//             onChanged: (value) {
//               setState(() {
//                 intermediateChecked = value!;
//               });
//             },
//           ),
//           CheckboxListTile(
//             value: advancedChecked,
//             title: const Text("Advanced"),
//             onChanged: (value) {
//               setState(() {
//                 advancedChecked = value!;
//               });
//             },
//           ),
//           const SizedBox(height: 20),
//
//           // Certificates Section
//           const Text(
//             "Certificates",
//             style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
//           ),
//           const SizedBox(height: 10),
//           ElevatedButton.icon(
//             onPressed: _addCertificate,
//             icon: Icon(Icons.add),
//             label: Text("Add New Certificate"),
//           ),
//           const SizedBox(height: 10),
//           certificates.isNotEmpty
//               ? DataTable(
//             columns: const [
//               DataColumn(label: Text("Certificate Type")),
//               DataColumn(label: Text("Certificate")),
//               DataColumn(label: Text("Action")),
//             ],
//             rows: List.generate(certificates.length, (index) {
//               return DataRow(cells: [
//                 DataCell(Text(certificates[index].type)),
//                 DataCell(Text(certificates[index].file.path.split('/').last)),
//                 DataCell(IconButton(
//                   icon: Icon(Icons.delete, color: Colors.red),
//                   onPressed: () => _deleteCertificate(index),
//                 )),
//               ]);
//             }),
//           )
//               : Text("No certificates added."),
//           const SizedBox(height: 20),
//
//           // Save and Next Buttons
//           Row(
//             mainAxisAlignment: MainAxisAlignment.spaceBetween,
//             children: [
//               ElevatedButton(
//                 onPressed: () {
//                   // Implement Save functionality if separate from Next
//                   if (_formKey.currentState!.validate()) {
//                     ScaffoldMessenger.of(context).showSnackBar(
//                       const SnackBar(content: Text("Profile saved!")),
//                     );
//                   }
//                 },
//                 child: Text("Save"),
//               ),
//               ElevatedButton(
//                 onPressed: _nextStep,
//                 child: Text("Next"),
//               ),
//             ],
//           ),
//         ],
//       ),
//     );
//   }
//
//   Widget _buildProgressSteps() {
//     return Row(
//       mainAxisAlignment: MainAxisAlignment.spaceEvenly,
//       children: [
//         // Profile Step
//         Column(
//           children: [
//             CircleAvatar(
//               backgroundColor: currentStep == ProfileStep.Profile ||
//                   currentStep == ProfileStep.VideoIntroduction ||
//                   currentStep == ProfileStep.Approval
//                   ? Colors.blue
//                   : Colors.grey,
//               child: Icon(Icons.person, color: Colors.white),
//             ),
//             SizedBox(height: 5),
//             Text(
//               "Complete Profile",
//               style: TextStyle(
//                 color: currentStep == ProfileStep.Profile ||
//                     currentStep == ProfileStep.VideoIntroduction ||
//                     currentStep == ProfileStep.Approval
//                     ? Colors.black
//                     : Colors.grey,
//               ),
//             ),
//           ],
//         ),
//         // Connecting Line
//         Expanded(
//           child: Container(
//             height: 2,
//             color: currentStep == ProfileStep.VideoIntroduction ||
//                 currentStep == ProfileStep.Approval
//                 ? Colors.blue
//                 : Colors.grey,
//           ),
//         ),
//         // Video Introduction Step
//         Column(
//           children: [
//             CircleAvatar(
//               backgroundColor: currentStep == ProfileStep.VideoIntroduction ||
//                   currentStep == ProfileStep.Approval
//                   ? Colors.blue
//                   : Colors.grey,
//               child: Icon(Icons.videocam, color: Colors.white),
//             ),
//             SizedBox(height: 5),
//             Text(
//               "Video Introduction",
//               style: TextStyle(
//                 color: currentStep == ProfileStep.VideoIntroduction ||
//                     currentStep == ProfileStep.Approval
//                     ? Colors.black
//                     : Colors.grey,
//               ),
//             ),
//           ],
//         ),
//         // Connecting Line
//         Expanded(
//           child: Container(
//             height: 2,
//             color: currentStep == ProfileStep.Approval
//                 ? Colors.blue
//                 : Colors.grey,
//           ),
//         ),
//         // Approval Step
//         Column(
//           children: [
//             CircleAvatar(
//               backgroundColor: currentStep == ProfileStep.Approval
//                   ? Colors.blue
//                   : Colors.grey,
//               child: Icon(Icons.check, color: Colors.white),
//             ),
//             SizedBox(height: 5),
//             Text(
//               "Approval",
//               style: TextStyle(
//                 color: currentStep == ProfileStep.Approval
//                     ? Colors.black
//                     : Colors.grey,
//               ),
//             ),
//           ],
//         ),
//       ],
//     );
//   }
//
//   Widget _buildVideoIntroduction() {
//     return Column(
//       crossAxisAlignment: CrossAxisAlignment.start,
//       children: [
//         // Progress Steps
//         _buildProgressSteps(),
//
//         const SizedBox(height: 20),
//
//         const Text(
//           "Introduce Yourself",
//           style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
//         ),
//         const SizedBox(height: 10),
//         const Text(
//           "Let students know what they can expect from a lesson with you by recording a video highlighting your teaching style, expertise, and personality. Students can be nervous to speak with a foreigner, so it really helps to have a friendly video that introduces yourself and invites students to call you.",
//           style: TextStyle(fontSize: 14, color: Colors.grey),
//         ),
//         const SizedBox(height: 20),
//
//         const Text(
//           "A few helpful tips:",
//           style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
//         ),
//         const SizedBox(height: 5),
//         Column(
//           crossAxisAlignment: CrossAxisAlignment.start,
//           children: [
//             _buildTipItem("Find a clean and quiet space"),
//             _buildTipItem("Smile and look at the camera"),
//             _buildTipItem("Dress smart"),
//             _buildTipItem("Speak for 1-3 minutes"),
//             _buildTipItem("Brand yourself and have fun!"),
//           ],
//         ),
//         const SizedBox(height: 10),
//         const Text(
//           "Note: We only support uploading video files that are less than 64 MB in size.",
//           style: TextStyle(fontSize: 12, color: Colors.red),
//         ),
//         const SizedBox(height: 20),
//
//         // Choose Video Button
//         Center(
//           child: ElevatedButton.icon(
//             onPressed: _pickVideoFile,
//             icon: Icon(Icons.video_call),
//             label: Text("Choose Video"),
//           ),
//         ),
//         if (videoFile != null && _videoController != null && _videoController!.value.isInitialized)
//           Column(
//             children: [
//               const SizedBox(height: 10),
//               // Video Player
//               AspectRatio(
//                 aspectRatio: _videoController!.value.aspectRatio,
//                 child: VideoPlayer(_videoController!),
//               ),
//               const SizedBox(height: 10),
//               // Video Controls
//               Row(
//                 mainAxisAlignment: MainAxisAlignment.center,
//                 children: [
//                   IconButton(
//                     icon: Icon(Icons.replay_10),
//                     onPressed: () {
//                       final currentPosition = _videoController!.value.position;
//                       final newPosition = currentPosition - Duration(seconds: 10);
//                       _videoController!.seekTo(newPosition >= Duration.zero ? newPosition : Duration.zero);
//                     },
//                   ),
//                   IconButton(
//                     icon: Icon(_videoController!.value.isPlaying ? Icons.pause : Icons.play_arrow),
//                     onPressed: () {
//                       setState(() {
//                         if (_videoController!.value.isPlaying) {
//                           _videoController!.pause();
//                         } else {
//                           _videoController!.play();
//                         }
//                       });
//                     },
//                   ),
//                   IconButton(
//                     icon: Icon(Icons.forward_10),
//                     onPressed: () {
//                       final currentPosition = _videoController!.value.position;
//                       final maxPosition = _videoController!.value.duration;
//                       final newPosition = currentPosition + Duration(seconds: 10);
//                       _videoController!.seekTo(newPosition <= maxPosition ? newPosition : maxPosition);
//                     },
//                   ),
//                 ],
//               ),
//               VideoProgressIndicator(
//                 _videoController!,
//                 allowScrubbing: true,
//                 padding: EdgeInsets.symmetric(horizontal: 20.0),
//               ),
//             ],
//           ),
//         const SizedBox(height: 20),
//
//         // Back and Next Buttons
//         Row(
//           mainAxisAlignment: MainAxisAlignment.spaceBetween,
//           children: [
//             ElevatedButton(
//               onPressed: _backStep,
//               child: Text("Back"),
//             ),
//             ElevatedButton(
//               onPressed: _nextStep,
//               child: Text("Next"),
//             ),
//           ],
//         ),
//       ],
//     );
//   }
//
//   Widget _buildTipItem(String tip) {
//     return Row(
//       children: [
//         Icon(Icons.check, size: 16, color: Colors.green),
//         SizedBox(width: 5),
//         Expanded(child: Text(tip)),
//       ],
//     );
//   }
//
//   Widget _buildApproval() {
//     return Column(
//       crossAxisAlignment: CrossAxisAlignment.center,
//       children: [
//         // Progress Steps
//         _buildProgressSteps(),
//
//         const SizedBox(height: 50),
//
//         Icon(Icons.check_circle, color: Colors.green, size: 100),
//         const SizedBox(height: 20),
//         const Text(
//           "Congratulations!",
//           style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
//         ),
//         const SizedBox(height: 10),
//         const Text(
//           "Your application is being processed.",
//           style: TextStyle(fontSize: 16, color: Colors.grey),
//         ),
//         const SizedBox(height: 10),
//         const Text(
//           "You can now start receiving student bookings.",
//           style: TextStyle(fontSize: 16, color: Colors.grey),
//           textAlign: TextAlign.center,
//         ),
//
//         const SizedBox(height: 50),
//
//         // Optionally, you can add a button to go back or navigate elsewhere
//       ],
//     );
//   }
// }

// import 'dart:io';
//
// import 'package:flutter/material.dart';
// import 'package:image_picker/image_picker.dart';
// import 'package:file_picker/file_picker.dart';
// import 'package:video_player/video_player.dart';
// import 'package:path_provider/path_provider.dart';
//
//
//
// class TutorProfileApp extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       title: 'Tutor Profile Setup',
//       debugShowCheckedModeBanner: false,
//       home: TutorProfilePage(),
//     );
//   }
// }
//
// enum ProfileStep { Profile, VideoIntroduction, Approval }
//
// class Certificate {
//   String type;
//   File file;
//
//   Certificate({required this.type, required this.file});
// }
//
// class TutorProfilePage extends StatefulWidget {
//   @override
//   _TutorProfilePageState createState() => _TutorProfilePageState();
// }
//
// class _TutorProfilePageState extends State<TutorProfilePage> {
//   final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
//
//   // Current Step
//   ProfileStep currentStep = ProfileStep.Profile;
//
//   // Controllers for form fields
//   final TextEditingController nameController = TextEditingController();
//   final TextEditingController fromController = TextEditingController();
//   final TextEditingController dobController = TextEditingController();
//   final TextEditingController interestsController = TextEditingController();
//   final TextEditingController educationController = TextEditingController();
//   final TextEditingController experienceController = TextEditingController();
//   final TextEditingController professionController = TextEditingController();
//   final TextEditingController instructionController = TextEditingController();
//   final TextEditingController languagesController = TextEditingController();
//
//   // Image and File Uploads
//   File? profileImage;
//
//   // Certificates
//   List<Certificate> certificates = [];
//
//   // Video Introduction
//   File? videoFile;
//   VideoPlayerController? _videoController;
//
//   // Checkbox States
//   bool beginnerChecked = false;
//   bool intermediateChecked = false;
//   bool advancedChecked = false;
//
//   // Video Playback State
//   bool isVideoPlaying = false;
//
//   // Additional Controller for Custom Certification Type
//   final TextEditingController customTypeController = TextEditingController();
//
//   final ImagePicker _imagePicker = ImagePicker();
//
//   // Function to pick profile image
//   Future<void> _pickProfileImage() async {
//     try {
//       final pickedFile = await _imagePicker.pickImage(source: ImageSource.gallery);
//       if (pickedFile != null) {
//         setState(() {
//           profileImage = File(pickedFile.path);
//         });
//       }
//     } catch (e) {
//       // Handle any errors
//       ScaffoldMessenger.of(context).showSnackBar(
//         SnackBar(content: Text("Error picking image: $e")),
//       );
//     }
//   }
//
//   // Function to pick video file
//   Future<void> _pickVideoFile() async {
//     try {
//       final pickedFile = await _imagePicker.pickVideo(source: ImageSource.gallery);
//       if (pickedFile != null) {
//         _videoController?.dispose();
//         _videoController = VideoPlayerController.file(File(pickedFile.path))
//           ..initialize().then((_) {
//             setState(() {
//               videoFile = File(pickedFile.path);
//               _videoController!.play();
//               isVideoPlaying = true;
//             });
//           });
//       }
//     } catch (e) {
//       // Handle any errors
//       ScaffoldMessenger.of(context).showSnackBar(
//         SnackBar(content: Text("Error picking video: $e")),
//       );
//     }
//   }
//
//   // Function to add a new certificate
//   void _addCertificate() async {
//     String? selectedType; // Initialize as null
//     File? uploadedFile;
//     final _dialogFormKey = GlobalKey<FormState>(); // Form key for the dialog
//
//     await showDialog(
//       context: context,
//       builder: (context) {
//         return StatefulBuilder(builder: (context, setStateDialog) {
//           return AlertDialog(
//             title: Text("Add New Certificate"),
//             content: Form(
//               key: _dialogFormKey, // Assign the form key
//               child: Column(
//                 mainAxisSize: MainAxisSize.min,
//                 children: [
//                   DropdownButtonFormField<String>(
//                     value: selectedType,
//                     items: ["IELTS", "TOEFL", "Other"].map((cert) {
//                       return DropdownMenuItem(
//                         value: cert,
//                         child: Text(cert),
//                       );
//                     }).toList(),
//                     onChanged: (value) {
//                       setStateDialog(() {
//                         selectedType = value;
//                         if (value != "Other") {
//                           customTypeController.text = "";
//                         }
//                       });
//                     },
//                     decoration: InputDecoration(
//                       labelText: "Certificate Type",
//                       border: OutlineInputBorder(),
//                     ),
//                     validator: (value) {
//                       if (value == null || value.isEmpty) {
//                         return 'Please select a certification type';
//                       }
//                       return null;
//                     },
//                   ),
//                   SizedBox(height: 10),
//                   if (selectedType == "Other")
//                     TextFormField(
//                       controller: customTypeController,
//                       decoration: InputDecoration(
//                         labelText: "Enter Certification Type",
//                         border: OutlineInputBorder(),
//                       ),
//                       validator: (value) {
//                         if (selectedType == "Other") {
//                           if (value == null || value.isEmpty) {
//                             return 'Please enter the certification type';
//                           }
//                         }
//                         return null;
//                       },
//                     ),
//                   SizedBox(height: 10),
//                   ElevatedButton(
//                     onPressed: () async {
//                       try {
//                         FilePickerResult? result = await FilePicker.platform.pickFiles(
//                           type: FileType.custom,
//                           allowedExtensions: ['pdf', 'doc', 'docx', 'jpg', 'png'],
//                         );
//                         if (result != null && result.files.single.path != null) {
//                           File selectedFile = File(result.files.single.path!);
//                           final fileSize = await selectedFile.length();
//                           if (fileSize > 64 * 1024 * 1024) { // 64 MB
//                             setStateDialog(() {
//                               uploadedFile = null;
//                             });
//                             ScaffoldMessenger.of(context).showSnackBar(
//                               SnackBar(content: Text("File size exceeds 64 MB.")),
//                             );
//                             return;
//                           }
//                           setStateDialog(() {
//                             uploadedFile = selectedFile;
//                           });
//                         }
//                       } catch (e) {
//                         // Handle any errors
//                         ScaffoldMessenger.of(context).showSnackBar(
//                           SnackBar(content: Text("Error picking file: $e")),
//                         );
//                       }
//                     },
//                     child: Text("Upload Certificate"),
//                   ),
//                   SizedBox(height: 10),
//                   if (uploadedFile != null)
//                     Text(
//                       uploadedFile!.path.split('/').last,
//                       style: TextStyle(color: Colors.green),
//                     ),
//                 ],
//               ),
//             ),
//             actions: [
//               TextButton(
//                 onPressed: () {
//                   Navigator.of(context).pop();
//                 },
//                 child: Text("Cancel"),
//               ),
//               ElevatedButton(
//                 onPressed: () {
//                   if (_dialogFormKey.currentState!.validate()) {
//                     if (uploadedFile != null) {
//                       String finalType = selectedType!;
//                       if (selectedType == "Other") {
//                         finalType = customTypeController.text.trim();
//                       }
//                       setState(() {
//                         certificates.add(Certificate(
//                             type: finalType, file: uploadedFile!));
//                       });
//                       Navigator.of(context).pop();
//                     } else {
//                       ScaffoldMessenger.of(context).showSnackBar(
//                         SnackBar(content: Text("Please upload a certificate file")),
//                       );
//                     }
//                   }
//                 },
//                 child: Text("Save"),
//               ),
//             ],
//           );
//         });
//       },
//     );
//   }
//
//   // Function to delete a certificate
//   void _deleteCertificate(int index) {
//     setState(() {
//       certificates.removeAt(index);
//     });
//   }
//
//   // Function to pick Date of Birth
//   Future<void> _pickDateOfBirth() async {
//     DateTime initialDate = DateTime(1990);
//     DateTime firstDate = DateTime(1900);
//     DateTime lastDate = DateTime.now();
//
//     final DateTime? picked = await showDatePicker(
//       context: context,
//       initialDate: initialDate,
//       firstDate: firstDate,
//       lastDate: lastDate,
//     );
//
//     if (picked != null) {
//       setState(() {
//         dobController.text = "${picked.toLocal()}".split(' ')[0];
//       });
//     }
//   }
//
//   // Function to proceed to next step
//   void _nextStep() {
//     if (currentStep == ProfileStep.Profile) {
//       // Validate profile form
//       if (_formKey.currentState!.validate()) {
//         // Additional validations can be added here
//         setState(() {
//           currentStep = ProfileStep.VideoIntroduction;
//         });
//         ScaffoldMessenger.of(context).showSnackBar(
//           SnackBar(content: Text("Profile completed!")),
//         );
//       }
//     } else if (currentStep == ProfileStep.VideoIntroduction) {
//       if (videoFile != null) {
//         setState(() {
//           currentStep = ProfileStep.Approval;
//         });
//       } else {
//         ScaffoldMessenger.of(context).showSnackBar(
//           SnackBar(content: Text("Please upload a video introduction.")),
//         );
//       }
//     }
//   }
//
//   // Function to go back to previous step
//   void _backStep() {
//     if (currentStep == ProfileStep.VideoIntroduction) {
//       setState(() {
//         currentStep = ProfileStep.Profile;
//       });
//     } else if (currentStep == ProfileStep.Approval) {
//       setState(() {
//         currentStep = ProfileStep.VideoIntroduction;
//       });
//     }
//   }
//
//   @override
//   void dispose() {
//     // Dispose controllers
//     nameController.dispose();
//     fromController.dispose();
//     dobController.dispose();
//     interestsController.dispose();
//     educationController.dispose();
//     experienceController.dispose();
//     professionController.dispose();
//     instructionController.dispose();
//     languagesController.dispose();
//     customTypeController.dispose();
//     _videoController?.dispose();
//     super.dispose();
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: _buildAppBar(),
//       body: SingleChildScrollView(
//         padding: const EdgeInsets.all(16.0),
//         child: currentStep == ProfileStep.Profile
//             ? _buildProfileForm()
//             : currentStep == ProfileStep.VideoIntroduction
//             ? _buildVideoIntroduction()
//             : _buildApproval(),
//       ),
//     );
//   }
//
//   AppBar _buildAppBar() {
//     return AppBar(
//       title: const Text(
//         "Set up your tutor profile",
//         style: TextStyle(color: Colors.blue),
//       ),
//       backgroundColor: Colors.white,
//       centerTitle: true,
//       iconTheme: IconThemeData(color: Colors.blue),
//       elevation: 0,
//       leading: Navigator.canPop(context)
//           ? IconButton(
//         icon: Icon(Icons.arrow_back, color: Colors.blue),
//         onPressed: () {
//           Navigator.of(context).pop();
//         },
//       )
//           : null, // Shows back button only if there's a route to pop
//     );
//   }
//
//   Widget _buildProfileForm() {
//     return Form(
//       key: _formKey,
//       child: Column(
//         crossAxisAlignment: CrossAxisAlignment.start,
//         children: [
//           // Progress Steps
//           _buildProgressSteps(),
//
//           const SizedBox(height: 20),
//
//           // Profile Image Upload
//           Center(
//             child: GestureDetector(
//               onTap: _pickProfileImage,
//               child: CircleAvatar(
//                 radius: 50,
//                 backgroundImage: profileImage != null
//                     ? FileImage(profileImage!)
//                     : AssetImage('assets/profile_placeholder.png') as ImageProvider,
//                 child: profileImage == null
//                     ? Icon(Icons.camera_alt, size: 50, color: Colors.white70)
//                     : null,
//               ),
//             ),
//           ),
//           const SizedBox(height: 10),
//           Center(
//             child: TextButton.icon(
//               onPressed: _pickProfileImage,
//               icon: Icon(Icons.upload),
//               label: Text("Upload Profile Image"),
//             ),
//           ),
//
//           const SizedBox(height: 20),
//
//           // Form Title
//           const Text(
//             "Set up your tutor profile",
//             style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
//           ),
//           const SizedBox(height: 10),
//           const Text(
//             "Students will check your profile to decide whether to book a lesson with you. Please provide as much information as possible.",
//             style: TextStyle(fontSize: 14, color: Colors.grey),
//           ),
//           const SizedBox(height: 20),
//
//           // Basic Info Section
//           const Text(
//             "Basic Info",
//             style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
//           ),
//           const SizedBox(height: 10),
//           TextFormField(
//             controller: nameController,
//             decoration: const InputDecoration(
//               labelText: "Name",
//               border: OutlineInputBorder(),
//             ),
//             validator: (value) {
//               if (value == null || value.isEmpty) {
//                 return 'Please enter your name';
//               }
//               return null;
//             },
//           ),
//           const SizedBox(height: 10),
//           TextFormField(
//             controller: fromController,
//             decoration: const InputDecoration(
//               labelText: "From",
//               border: OutlineInputBorder(),
//             ),
//           ),
//           const SizedBox(height: 10),
//           GestureDetector(
//             onTap: _pickDateOfBirth,
//             child: AbsorbPointer(
//               child: TextFormField(
//                 controller: dobController,
//                 decoration: const InputDecoration(
//                   labelText: "Date of Birth",
//                   border: OutlineInputBorder(),
//                   suffixIcon: Icon(Icons.calendar_today),
//                 ),
//                 validator: (value) {
//                   if (value == null || value.isEmpty) {
//                     return 'Please select your date of birth';
//                   }
//                   return null;
//                 },
//               ),
//             ),
//           ),
//           const SizedBox(height: 20),
//
//           // CV Section
//           const Text(
//             "CV",
//             style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
//           ),
//           const SizedBox(height: 10),
//           TextFormField(
//             controller: interestsController,
//             decoration: const InputDecoration(
//               labelText: "Interests",
//               border: OutlineInputBorder(),
//             ),
//           ),
//           const SizedBox(height: 10),
//           TextFormField(
//             controller: educationController,
//             decoration: const InputDecoration(
//               labelText: "Education",
//               border: OutlineInputBorder(),
//             ),
//           ),
//           const SizedBox(height: 10),
//           TextFormField(
//             controller: experienceController,
//             decoration: const InputDecoration(
//               labelText: "Experience",
//               border: OutlineInputBorder(),
//             ),
//           ),
//           const SizedBox(height: 10),
//           TextFormField(
//             controller: professionController,
//             decoration: const InputDecoration(
//               labelText: "Current or Previous Profession",
//               border: OutlineInputBorder(),
//             ),
//           ),
//           const SizedBox(height: 20),
//
//           // Languages Section
//           const Text(
//             "Languages I Speak",
//             style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
//           ),
//           const SizedBox(height: 10),
//           TextFormField(
//             controller: languagesController,
//             decoration: const InputDecoration(
//               labelText: "Languages",
//               border: OutlineInputBorder(),
//             ),
//           ),
//           const SizedBox(height: 20),
//
//           // Teaching Section
//           const Text(
//             "Who I Teach",
//             style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
//           ),
//           const SizedBox(height: 10),
//           TextFormField(
//             controller: instructionController,
//             decoration: const InputDecoration(
//               labelText: "Instruction",
//               border: OutlineInputBorder(),
//             ),
//           ),
//           const SizedBox(height: 10),
//           const Text("I am best at teaching students who are:"),
//           CheckboxListTile(
//             value: beginnerChecked,
//             title: const Text("Beginner"),
//             onChanged: (value) {
//               setState(() {
//                 beginnerChecked = value!;
//               });
//             },
//           ),
//           CheckboxListTile(
//             value: intermediateChecked,
//             title: const Text("Intermediate"),
//             onChanged: (value) {
//               setState(() {
//                 intermediateChecked = value!;
//               });
//             },
//           ),
//           CheckboxListTile(
//             value: advancedChecked,
//             title: const Text("Advanced"),
//             onChanged: (value) {
//               setState(() {
//                 advancedChecked = value!;
//               });
//             },
//           ),
//           const SizedBox(height: 20),
//
//           // Certificates Section
//           const Text(
//             "Certificates",
//             style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
//           ),
//           const SizedBox(height: 10),
//           ElevatedButton.icon(
//             onPressed: _addCertificate,
//             icon: Icon(Icons.add),
//             label: Text("Add New Certificate"),
//           ),
//           const SizedBox(height: 10),
//           certificates.isNotEmpty
//               ? DataTable(
//             columns: const [
//               DataColumn(label: Text("Certificate Type")),
//               DataColumn(label: Text("Certificate")),
//               DataColumn(label: Text("Action")),
//             ],
//             rows: List.generate(certificates.length, (index) {
//               return DataRow(cells: [
//                 DataCell(Text(certificates[index].type)),
//                 DataCell(Text(certificates[index].file.path.split('/').last)),
//                 DataCell(IconButton(
//                   icon: Icon(Icons.delete, color: Colors.red),
//                   onPressed: () => _deleteCertificate(index),
//                 )),
//               ]);
//             }),
//           )
//               : Text("No certificates added."),
//           const SizedBox(height: 20),
//
//           // Save and Next Buttons
//           Row(
//             mainAxisAlignment: MainAxisAlignment.spaceBetween,
//             children: [
//               ElevatedButton(
//                 onPressed: () {
//                   // Implement Save functionality if separate from Next
//                   if (_formKey.currentState!.validate()) {
//                     ScaffoldMessenger.of(context).showSnackBar(
//                       const SnackBar(content: Text("Profile saved!")),
//                     );
//                   }
//                 },
//                 child: Text("Save"),
//               ),
//               ElevatedButton(
//                 onPressed: _nextStep,
//                 child: Text("Next"),
//               ),
//             ],
//           ),
//         ],
//       ),
//     );
//   }
//
//   Widget _buildProgressSteps() {
//     return Row(
//       mainAxisAlignment: MainAxisAlignment.spaceEvenly,
//       children: [
//         // Profile Step
//         Column(
//           children: [
//             CircleAvatar(
//               backgroundColor: currentStep == ProfileStep.Profile ||
//                   currentStep == ProfileStep.VideoIntroduction ||
//                   currentStep == ProfileStep.Approval
//                   ? Colors.blue
//                   : Colors.grey,
//               child: Icon(Icons.person, color: Colors.white),
//             ),
//             SizedBox(height: 5),
//             Text(
//               "Complete Profile",
//               style: TextStyle(
//                 color: currentStep == ProfileStep.Profile ||
//                     currentStep == ProfileStep.VideoIntroduction ||
//                     currentStep == ProfileStep.Approval
//                     ? Colors.black
//                     : Colors.grey,
//               ),
//             ),
//           ],
//         ),
//         // Connecting Line
//         Expanded(
//           child: Container(
//             height: 2,
//             color: currentStep == ProfileStep.VideoIntroduction ||
//                 currentStep == ProfileStep.Approval
//                 ? Colors.blue
//                 : Colors.grey,
//           ),
//         ),
//         // Video Introduction Step
//         Column(
//           children: [
//             CircleAvatar(
//               backgroundColor: currentStep == ProfileStep.VideoIntroduction ||
//                   currentStep == ProfileStep.Approval
//                   ? Colors.blue
//                   : Colors.grey,
//               child: Icon(Icons.videocam, color: Colors.white),
//             ),
//             SizedBox(height: 5),
//             Text(
//               "Video Introduction",
//               style: TextStyle(
//                 color: currentStep == ProfileStep.VideoIntroduction ||
//                     currentStep == ProfileStep.Approval
//                     ? Colors.black
//                     : Colors.grey,
//               ),
//             ),
//           ],
//         ),
//         // Connecting Line
//         Expanded(
//           child: Container(
//             height: 2,
//             color: currentStep == ProfileStep.Approval
//                 ? Colors.blue
//                 : Colors.grey,
//           ),
//         ),
//         // Approval Step
//         Column(
//           children: [
//             CircleAvatar(
//               backgroundColor: currentStep == ProfileStep.Approval
//                   ? Colors.blue
//                   : Colors.grey,
//               child: Icon(Icons.check, color: Colors.white),
//             ),
//             SizedBox(height: 5),
//             Text(
//               "Approval",
//               style: TextStyle(
//                 color: currentStep == ProfileStep.Approval
//                     ? Colors.black
//                     : Colors.grey,
//               ),
//             ),
//           ],
//         ),
//       ],
//     );
//   }
//
//   Widget _buildVideoIntroduction() {
//     return Column(
//       crossAxisAlignment: CrossAxisAlignment.start,
//       children: [
//         // Progress Steps
//         _buildProgressSteps(),
//
//         const SizedBox(height: 20),
//
//         const Text(
//           "Introduce Yourself",
//           style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
//         ),
//         const SizedBox(height: 10),
//         const Text(
//           "Let students know what they can expect from a lesson with you by recording a video highlighting your teaching style, expertise, and personality. Students can be nervous to speak with a foreigner, so it really helps to have a friendly video that introduces yourself and invites students to call you.",
//           style: TextStyle(fontSize: 14, color: Colors.grey),
//         ),
//         const SizedBox(height: 20),
//
//         const Text(
//           "A few helpful tips:",
//           style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
//         ),
//         const SizedBox(height: 5),
//         Column(
//           crossAxisAlignment: CrossAxisAlignment.start,
//           children: [
//             _buildTipItem("Find a clean and quiet space"),
//             _buildTipItem("Smile and look at the camera"),
//             _buildTipItem("Dress smart"),
//             _buildTipItem("Speak for 1-3 minutes"),
//             _buildTipItem("Brand yourself and have fun!"),
//           ],
//         ),
//         const SizedBox(height: 10),
//         const Text(
//           "Note: We only support uploading video files that are less than 64 MB in size.",
//           style: TextStyle(fontSize: 12, color: Colors.red),
//         ),
//         const SizedBox(height: 20),
//
//         // Choose Video Button
//         Center(
//           child: ElevatedButton.icon(
//             onPressed: _pickVideoFile,
//             icon: Icon(Icons.video_call),
//             label: Text("Choose Video"),
//           ),
//         ),
//         if (videoFile != null && _videoController != null && _videoController!.value.isInitialized)
//           Column(
//             children: [
//               const SizedBox(height: 10),
//               // Video Player
//               AspectRatio(
//                 aspectRatio: _videoController!.value.aspectRatio,
//                 child: VideoPlayer(_videoController!),
//               ),
//               const SizedBox(height: 10),
//               // Video Controls
//               Row(
//                 mainAxisAlignment: MainAxisAlignment.center,
//                 children: [
//                   IconButton(
//                     icon: Icon(Icons.replay_10),
//                     onPressed: () {
//                       final currentPosition = _videoController!.value.position;
//                       final newPosition = currentPosition - Duration(seconds: 10);
//                       _videoController!.seekTo(
//                         newPosition >= Duration.zero ? newPosition : Duration.zero,
//                       );
//                     },
//                   ),
//                   IconButton(
//                     icon: Icon(_videoController!.value.isPlaying ? Icons.pause : Icons.play_arrow),
//                     onPressed: () {
//                       setState(() {
//                         if (_videoController!.value.isPlaying) {
//                           _videoController!.pause();
//                         } else {
//                           _videoController!.play();
//                         }
//                       });
//                     },
//                   ),
//                   IconButton(
//                     icon: Icon(Icons.forward_10),
//                     onPressed: () {
//                       final currentPosition = _videoController!.value.position;
//                       final maxPosition = _videoController!.value.duration;
//                       final newPosition = currentPosition + Duration(seconds: 10);
//                       _videoController!.seekTo(
//                         newPosition <= maxPosition ? newPosition : maxPosition,
//                       );
//                     },
//                   ),
//                 ],
//               ),
//               VideoProgressIndicator(
//                 _videoController!,
//                 allowScrubbing: true,
//                 padding: EdgeInsets.symmetric(horizontal: 20.0),
//               ),
//             ],
//           ),
//         const SizedBox(height: 20),
//
//         // Back and Next Buttons
//         Row(
//           mainAxisAlignment: MainAxisAlignment.spaceBetween,
//           children: [
//             ElevatedButton(
//               onPressed: _backStep,
//               child: Text("Back"),
//             ),
//             ElevatedButton(
//               onPressed: _nextStep,
//               child: Text("Next"),
//             ),
//           ],
//         ),
//       ],
//     );
//   }
//
//   Widget _buildTipItem(String tip) {
//     return Row(
//       children: [
//         Icon(Icons.check, size: 16, color: Colors.green),
//         SizedBox(width: 5),
//         Expanded(child: Text(tip)),
//       ],
//     );
//   }
//
//   Widget _buildApproval() {
//     return Column(
//       crossAxisAlignment: CrossAxisAlignment.center,
//       children: [
//         // Progress Steps
//         _buildProgressSteps(),
//
//         const SizedBox(height: 50),
//
//         Icon(Icons.check_circle, color: Colors.green, size: 100),
//         const SizedBox(height: 20),
//         const Text(
//           "Congratulations!",
//           style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
//         ),
//         const SizedBox(height: 10),
//         const Text(
//           "Your application is being processed.",
//           style: TextStyle(fontSize: 16, color: Colors.grey),
//         ),
//         const SizedBox(height: 10),
//         const Text(
//           "You can now start receiving student bookings.",
//           style: TextStyle(fontSize: 16, color: Colors.grey),
//           textAlign: TextAlign.center,
//         ),
//
//         const SizedBox(height: 50),
//
//         // Optionally, you can add a button to go back or navigate elsewhere
//       ],
//     );
//   }
// }

// become_a_tutor.dart

// import 'dart:io';
//
// import 'package:flutter/material.dart';
// import 'package:image_picker/image_picker.dart';
// import 'package:file_picker/file_picker.dart';
// import 'package:video_player/video_player.dart';
//
// class BecomeATutorPage extends StatefulWidget {
//   @override
//   _BecomeATutorPageState createState() => _BecomeATutorPageState();
// }
//
// class _BecomeATutorPageState extends State<BecomeATutorPage> {
//   final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
//
//   // Current Step
//   ProfileStep currentStep = ProfileStep.Profile;
//
//   // Controllers for form fields
//   final TextEditingController nameController = TextEditingController();
//   final TextEditingController fromController = TextEditingController();
//   final TextEditingController dobController = TextEditingController();
//   final TextEditingController interestsController = TextEditingController();
//   final TextEditingController educationController = TextEditingController();
//   final TextEditingController experienceController = TextEditingController();
//   final TextEditingController professionController = TextEditingController();
//   final TextEditingController instructionController = TextEditingController();
//   final TextEditingController languagesController = TextEditingController();
//
//   // Image and File Uploads
//   File? profileImage;
//
//   // Certificates
//   List<Certificate> certificates = [];
//
//   // Video Introduction
//   File? videoFile;
//   VideoPlayerController? _videoController;
//
//   // Checkbox States
//   bool beginnerChecked = false;
//   bool intermediateChecked = false;
//   bool advancedChecked = false;
//
//   // Video Playback State
//   bool isVideoPlaying = false;
//
//   // Additional Controller for Custom Certification Type
//   final TextEditingController customTypeController = TextEditingController();
//
//   final ImagePicker _imagePicker = ImagePicker();
//
//   // Function to pick profile image
//   Future<void> _pickProfileImage() async {
//     try {
//       final pickedFile = await _imagePicker.pickImage(source: ImageSource.gallery);
//       if (pickedFile != null) {
//         setState(() {
//           profileImage = File(pickedFile.path);
//         });
//       }
//     } catch (e) {
//       // Handle any errors
//       ScaffoldMessenger.of(context).showSnackBar(
//         SnackBar(content: Text("Error picking image: $e")),
//       );
//     }
//   }
//
//   // Function to pick video file
//   Future<void> _pickVideoFile() async {
//     try {
//       final pickedFile = await _imagePicker.pickVideo(source: ImageSource.gallery);
//       if (pickedFile != null) {
//         _videoController?.dispose();
//         _videoController = VideoPlayerController.file(File(pickedFile.path))
//           ..initialize().then((_) {
//             setState(() {
//               videoFile = File(pickedFile.path);
//               _videoController!.play();
//               isVideoPlaying = true;
//             });
//           });
//       }
//     } catch (e) {
//       // Handle any errors
//       ScaffoldMessenger.of(context).showSnackBar(
//         SnackBar(content: Text("Error picking video: $e")),
//       );
//     }
//   }
//
//   // Function to add a new certificate
//   void _addCertificate() async {
//     String? selectedType; // Initialize as null
//     File? uploadedFile;
//     final _dialogFormKey = GlobalKey<FormState>(); // Form key for the dialog
//
//     await showDialog(
//       context: context,
//       builder: (context) {
//         return StatefulBuilder(builder: (context, setStateDialog) {
//           return AlertDialog(
//             title: Text("Add New Certificate"),
//             content: Form(
//               key: _dialogFormKey, // Assign the form key
//               child: SingleChildScrollView( // Ensures content is scrollable if overflow occurs
//                 child: Column(
//                   mainAxisSize: MainAxisSize.min,
//                   children: [
//                     DropdownButtonFormField<String>(
//                       value: selectedType,
//                       items: ["IELTS", "TOEFL", "Other"].map((cert) {
//                         return DropdownMenuItem(
//                           value: cert,
//                           child: Text(cert),
//                         );
//                       }).toList(),
//                       onChanged: (value) {
//                         setStateDialog(() {
//                           selectedType = value;
//                           if (value != "Other") {
//                             customTypeController.text = "";
//                           }
//                         });
//                       },
//                       decoration: InputDecoration(
//                         labelText: "Certificate Type",
//                         border: OutlineInputBorder(),
//                       ),
//                       validator: (value) {
//                         if (value == null || value.isEmpty) {
//                           return 'Please select a certification type';
//                         }
//                         return null;
//                       },
//                     ),
//                     SizedBox(height: 10),
//                     if (selectedType == "Other")
//                       TextFormField(
//                         controller: customTypeController,
//                         decoration: InputDecoration(
//                           labelText: "Enter Certification Type",
//                           border: OutlineInputBorder(),
//                         ),
//                         validator: (value) {
//                           if (selectedType == "Other") {
//                             if (value == null || value.trim().isEmpty) {
//                               return 'Please enter the certification type';
//                             }
//                           }
//                           return null;
//                         },
//                       ),
//                     SizedBox(height: 10),
//                     ElevatedButton(
//                       onPressed: () async {
//                         try {
//                           FilePickerResult? result = await FilePicker.platform.pickFiles(
//                             type: FileType.custom,
//                             allowedExtensions: ['pdf', 'doc', 'docx', 'jpg', 'png'],
//                           );
//                           if (result != null && result.files.single.path != null) {
//                             File selectedFile = File(result.files.single.path!);
//                             final fileSize = await selectedFile.length();
//                             if (fileSize > 64 * 1024 * 1024) { // 64 MB
//                               setStateDialog(() {
//                                 uploadedFile = null;
//                               });
//                               ScaffoldMessenger.of(context).showSnackBar(
//                                 SnackBar(content: Text("File size exceeds 64 MB.")),
//                               );
//                               return;
//                             }
//                             setStateDialog(() {
//                               uploadedFile = selectedFile;
//                             });
//                           }
//                         } catch (e) {
//                           // Handle any errors
//                           ScaffoldMessenger.of(context).showSnackBar(
//                             SnackBar(content: Text("Error picking file: $e")),
//                           );
//                         }
//                       },
//                       child: Text("Upload Certificate"),
//                       style: ElevatedButton.styleFrom(
//                         backgroundColor: Colors.blue, // Button background color
//                       ),
//                     ),
//                     SizedBox(height: 10),
//                     if (uploadedFile != null)
//                       Text(
//                         uploadedFile!.path.split('/').last,
//                         style: TextStyle(color: Colors.green),
//                       ),
//                   ],
//                 ),
//               ),
//             ),
//             actions: [
//               TextButton(
//                 onPressed: () {
//                   Navigator.of(context).pop();
//                 },
//                 child: Text(
//                   "Cancel",
//                   style: TextStyle(color: Colors.blue),
//                 ),
//               ),
//               ElevatedButton(
//                 onPressed: () {
//                   if (_dialogFormKey.currentState!.validate()) {
//                     if (uploadedFile != null) {
//                       String finalType = selectedType!;
//                       if (selectedType == "Other") {
//                         finalType = customTypeController.text.trim();
//                       }
//                       setState(() {
//                         certificates.add(Certificate(
//                             type: finalType, file: uploadedFile!));
//                       });
//                       Navigator.of(context).pop();
//                     } else {
//                       ScaffoldMessenger.of(context).showSnackBar(
//                         SnackBar(content: Text("Please upload a certificate file")),
//                       );
//                     }
//                   }
//                 },
//                 child: Text("Save"),
//                 style: ElevatedButton.styleFrom(
//                   backgroundColor: Colors.blue, // Button background color
//                 ),
//               ),
//             ],
//           );
//         });
//       },
//     );
//   }
//
//   // Function to delete a certificate
//   void _deleteCertificate(int index) {
//     setState(() {
//       certificates.removeAt(index);
//     });
//   }
//
//   // Function to pick Date of Birth
//   Future<void> _pickDateOfBirth() async {
//     DateTime initialDate = DateTime(1990);
//     DateTime firstDate = DateTime(1900);
//     DateTime lastDate = DateTime.now();
//
//     final DateTime? picked = await showDatePicker(
//       context: context,
//       initialDate: initialDate,
//       firstDate: firstDate,
//       lastDate: lastDate,
//     );
//
//     if (picked != null) {
//       setState(() {
//         dobController.text = "${picked.toLocal()}".split(' ')[0];
//       });
//     }
//   }
//
//   // Function to proceed to next step
//   void _nextStep() {
//     if (currentStep == ProfileStep.Profile) {
//       // Validate profile form
//       if (_formKey.currentState!.validate()) {
//         // Additional validations can be added here
//         setState(() {
//           currentStep = ProfileStep.VideoIntroduction;
//         });
//         ScaffoldMessenger.of(context).showSnackBar(
//           SnackBar(content: Text("Profile completed!")),
//         );
//       }
//     } else if (currentStep == ProfileStep.VideoIntroduction) {
//       if (videoFile != null) {
//         setState(() {
//           currentStep = ProfileStep.Approval;
//         });
//       } else {
//         ScaffoldMessenger.of(context).showSnackBar(
//           SnackBar(content: Text("Please upload a video introduction.")),
//         );
//       }
//     }
//   }
//
//   // Function to go back to previous step
//   void _backStep() {
//     if (currentStep == ProfileStep.VideoIntroduction) {
//       setState(() {
//         currentStep = ProfileStep.Profile;
//       });
//     } else if (currentStep == ProfileStep.Approval) {
//       setState(() {
//         currentStep = ProfileStep.VideoIntroduction;
//       });
//     }
//   }
//
//   @override
//   void dispose() {
//     // Dispose controllers
//     nameController.dispose();
//     fromController.dispose();
//     dobController.dispose();
//     interestsController.dispose();
//     educationController.dispose();
//     experienceController.dispose();
//     professionController.dispose();
//     instructionController.dispose();
//     languagesController.dispose();
//     customTypeController.dispose();
//     _videoController?.dispose();
//     super.dispose();
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: _buildAppBar(),
//       body: SingleChildScrollView(
//         padding: const EdgeInsets.all(16.0),
//         child: currentStep == ProfileStep.Profile
//             ? _buildProfileForm()
//             : currentStep == ProfileStep.VideoIntroduction
//             ? _buildVideoIntroduction()
//             : _buildApproval(),
//       ),
//     );
//   }
//
//   AppBar _buildAppBar() {
//     return AppBar(
//       title: const Text(
//         "Become a Tutor",
//         style: TextStyle(color: Colors.blue),
//       ),
//       backgroundColor: Colors.white,
//       centerTitle: true,
//       iconTheme: IconThemeData(color: Colors.blue),
//       elevation: 0,
//       leading: IconButton(
//         icon: Icon(Icons.arrow_back, color: Colors.blue),
//         onPressed: () {
//           Navigator.of(context).pop(); // Navigate back to Settings Page
//         },
//       ),
//     );
//   }
//
//   Widget _buildProfileForm() {
//     return Form(
//       key: _formKey,
//       child: Column(
//         crossAxisAlignment: CrossAxisAlignment.start,
//         children: [
//           // Progress Steps
//           _buildProgressSteps(),
//
//           const SizedBox(height: 20),
//
//           // Profile Image Upload
//           Center(
//             child: GestureDetector(
//               onTap: _pickProfileImage,
//               child: CircleAvatar(
//                 radius: 50,
//                 backgroundImage: profileImage != null
//                     ? FileImage(profileImage!)
//                     : AssetImage('assets/profile_placeholder.png') as ImageProvider,
//                 child: profileImage == null
//                     ? Icon(Icons.camera_alt, size: 50, color: Colors.white70)
//                     : null,
//               ),
//             ),
//           ),
//           const SizedBox(height: 10),
//           Center(
//             child: TextButton.icon(
//               onPressed: _pickProfileImage,
//               icon: Icon(Icons.upload, color: Colors.blue),
//               label: Text(
//                 "Upload Profile Image",
//                 style: TextStyle(color: Colors.blue),
//               ),
//             ),
//           ),
//
//           const SizedBox(height: 20),
//
//           // Form Title
//           const Text(
//             "Set up your tutor profile",
//             style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
//           ),
//           const SizedBox(height: 10),
//           const Text(
//             "Students will check your profile to decide whether to book a lesson with you. Please provide as much information as possible.",
//             style: TextStyle(fontSize: 14, color: Colors.grey),
//           ),
//           const SizedBox(height: 20),
//
//           // Basic Info Section
//           const Text(
//             "Basic Info",
//             style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
//           ),
//           const SizedBox(height: 10),
//           TextFormField(
//             controller: nameController,
//             decoration: const InputDecoration(
//               labelText: "Name",
//               border: OutlineInputBorder(),
//             ),
//             validator: (value) {
//               if (value == null || value.isEmpty) {
//                 return 'Please enter your name';
//               }
//               return null;
//             },
//           ),
//           const SizedBox(height: 10),
//           TextFormField(
//             controller: fromController,
//             decoration: const InputDecoration(
//               labelText: "From",
//               border: OutlineInputBorder(),
//             ),
//           ),
//           const SizedBox(height: 10),
//           GestureDetector(
//             onTap: _pickDateOfBirth,
//             child: AbsorbPointer(
//               child: TextFormField(
//                 controller: dobController,
//                 decoration: const InputDecoration(
//                   labelText: "Date of Birth",
//                   border: OutlineInputBorder(),
//                   suffixIcon: Icon(Icons.calendar_today),
//                 ),
//                 validator: (value) {
//                   if (value == null || value.isEmpty) {
//                     return 'Please select your date of birth';
//                   }
//                   return null;
//                 },
//               ),
//             ),
//           ),
//           const SizedBox(height: 20),
//
//           // CV Section
//           const Text(
//             "CV",
//             style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
//           ),
//           const SizedBox(height: 10),
//           TextFormField(
//             controller: interestsController,
//             decoration: const InputDecoration(
//               labelText: "Interests",
//               border: OutlineInputBorder(),
//             ),
//           ),
//           const SizedBox(height: 10),
//           TextFormField(
//             controller: educationController,
//             decoration: const InputDecoration(
//               labelText: "Education",
//               border: OutlineInputBorder(),
//             ),
//           ),
//           const SizedBox(height: 10),
//           TextFormField(
//             controller: experienceController,
//             decoration: const InputDecoration(
//               labelText: "Experience",
//               border: OutlineInputBorder(),
//             ),
//           ),
//           const SizedBox(height: 10),
//           TextFormField(
//             controller: professionController,
//             decoration: const InputDecoration(
//               labelText: "Current or Previous Profession",
//               border: OutlineInputBorder(),
//             ),
//           ),
//           const SizedBox(height: 20),
//
//           // Languages Section
//           const Text(
//             "Languages I Speak",
//             style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
//           ),
//           const SizedBox(height: 10),
//           TextFormField(
//             controller: languagesController,
//             decoration: const InputDecoration(
//               labelText: "Languages",
//               border: OutlineInputBorder(),
//             ),
//           ),
//           const SizedBox(height: 20),
//
//           // Teaching Section
//           const Text(
//             "Who I Teach",
//             style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
//           ),
//           const SizedBox(height: 10),
//           TextFormField(
//             controller: instructionController,
//             decoration: const InputDecoration(
//               labelText: "Instruction",
//               border: OutlineInputBorder(),
//             ),
//           ),
//           const SizedBox(height: 10),
//           const Text("I am best at teaching students who are:"),
//           CheckboxListTile(
//             value: beginnerChecked,
//             title: const Text("Beginner"),
//             onChanged: (value) {
//               setState(() {
//                 beginnerChecked = value!;
//               });
//             },
//           ),
//           CheckboxListTile(
//             value: intermediateChecked,
//             title: const Text("Intermediate"),
//             onChanged: (value) {
//               setState(() {
//                 intermediateChecked = value!;
//               });
//             },
//           ),
//           CheckboxListTile(
//             value: advancedChecked,
//             title: const Text("Advanced"),
//             onChanged: (value) {
//               setState(() {
//                 advancedChecked = value!;
//               });
//             },
//           ),
//           const SizedBox(height: 20),
//
//           // Certificates Section
//           const Text(
//             "Certificates",
//             style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
//           ),
//           const SizedBox(height: 10),
//           ElevatedButton.icon(
//             onPressed: _addCertificate,
//             icon: Icon(Icons.add, color: Colors.white),
//             label: Text(
//               "Add New Certificate",
//               style: TextStyle(color: Colors.white),
//             ),
//             style: ElevatedButton.styleFrom(
//               backgroundColor: Colors.blue, // Button background color
//             ),
//           ),
//           const SizedBox(height: 10),
//           certificates.isNotEmpty
//               ? DataTable(
//             columns: const [
//               DataColumn(label: Text("Certificate Type")),
//               DataColumn(label: Text("Certificate")),
//               DataColumn(label: Text("Action")),
//             ],
//             rows: List.generate(certificates.length, (index) {
//               return DataRow(cells: [
//                 DataCell(Text(certificates[index].type)),
//                 DataCell(Text(certificates[index].file.path.split('/').last)),
//                 DataCell(IconButton(
//                   icon: Icon(Icons.delete, color: Colors.red),
//                   onPressed: () => _deleteCertificate(index),
//                 )),
//               ]);
//             }),
//           )
//               : Text(
//             "No certificates added.",
//             style: TextStyle(color: Colors.grey),
//           ),
//           const SizedBox(height: 20),
//
//           // Save and Next Buttons
//           Row(
//             mainAxisAlignment: MainAxisAlignment.spaceBetween,
//             children: [
//               ElevatedButton(
//                 onPressed: () {
//                   // Implement Save functionality if separate from Next
//                   if (_formKey.currentState!.validate()) {
//                     ScaffoldMessenger.of(context).showSnackBar(
//                       const SnackBar(content: Text("Profile saved!")),
//                     );
//                   }
//                 },
//                 child: Text("Save"),
//                 style: ElevatedButton.styleFrom(
//                   backgroundColor: Colors.blue, // Button background color
//                 ),
//               ),
//               ElevatedButton(
//                 onPressed: _nextStep,
//                 child: Text("Next"),
//                 style: ElevatedButton.styleFrom(
//                   backgroundColor: Colors.blue, // Button background color
//                 ),
//               ),
//             ],
//           ),
//         ],
//       ),
//     );
//   }
//
//   Widget _buildProgressSteps() {
//     return Row(
//       mainAxisAlignment: MainAxisAlignment.spaceEvenly,
//       children: [
//         // Profile Step
//         Column(
//           children: [
//             CircleAvatar(
//               backgroundColor: currentStep == ProfileStep.Profile ||
//                   currentStep == ProfileStep.VideoIntroduction ||
//                   currentStep == ProfileStep.Approval
//                   ? Colors.blue
//                   : Colors.grey,
//               child: Icon(Icons.person, color: Colors.white),
//             ),
//             SizedBox(height: 5),
//             Text(
//               "Complete Profile",
//               style: TextStyle(
//                 color: currentStep == ProfileStep.Profile ||
//                     currentStep == ProfileStep.VideoIntroduction ||
//                     currentStep == ProfileStep.Approval
//                     ? Colors.black
//                     : Colors.grey,
//               ),
//             ),
//           ],
//         ),
//         // Connecting Line
//         Expanded(
//           child: Container(
//             height: 2,
//             color: currentStep == ProfileStep.VideoIntroduction ||
//                 currentStep == ProfileStep.Approval
//                 ? Colors.blue
//                 : Colors.grey,
//           ),
//         ),
//         // Video Introduction Step
//         Column(
//           children: [
//             CircleAvatar(
//               backgroundColor: currentStep == ProfileStep.VideoIntroduction ||
//                   currentStep == ProfileStep.Approval
//                   ? Colors.blue
//                   : Colors.grey,
//               child: Icon(Icons.videocam, color: Colors.white),
//             ),
//             SizedBox(height: 5),
//             Text(
//               "Video Introduction",
//               style: TextStyle(
//                 color: currentStep == ProfileStep.VideoIntroduction ||
//                     currentStep == ProfileStep.Approval
//                     ? Colors.black
//                     : Colors.grey,
//               ),
//             ),
//           ],
//         ),
//         // Connecting Line
//         Expanded(
//           child: Container(
//             height: 2,
//             color: currentStep == ProfileStep.Approval
//                 ? Colors.blue
//                 : Colors.grey,
//           ),
//         ),
//         // Approval Step
//         Column(
//           children: [
//             CircleAvatar(
//               backgroundColor: currentStep == ProfileStep.Approval
//                   ? Colors.blue
//                   : Colors.grey,
//               child: Icon(Icons.check, color: Colors.white),
//             ),
//             SizedBox(height: 5),
//             Text(
//               "Approval",
//               style: TextStyle(
//                 color: currentStep == ProfileStep.Approval
//                     ? Colors.black
//                     : Colors.grey,
//               ),
//             ),
//           ],
//         ),
//       ],
//     );
//   }
//
//   Widget _buildVideoIntroduction() {
//     return Column(
//       crossAxisAlignment: CrossAxisAlignment.start,
//       children: [
//         // Progress Steps
//         _buildProgressSteps(),
//
//         const SizedBox(height: 20),
//
//         const Text(
//           "Introduce Yourself",
//           style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
//         ),
//         const SizedBox(height: 10),
//         const Text(
//           "Let students know what they can expect from a lesson with you by recording a video highlighting your teaching style, expertise, and personality. Students can be nervous to speak with a foreigner, so it really helps to have a friendly video that introduces yourself and invites students to call you.",
//           style: TextStyle(fontSize: 14, color: Colors.grey),
//         ),
//         const SizedBox(height: 20),
//
//         const Text(
//           "A few helpful tips:",
//           style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
//         ),
//         const SizedBox(height: 5),
//         Column(
//           crossAxisAlignment: CrossAxisAlignment.start,
//           children: [
//             _buildTipItem("Find a clean and quiet space"),
//             _buildTipItem("Smile and look at the camera"),
//             _buildTipItem("Dress smart"),
//             _buildTipItem("Speak for 1-3 minutes"),
//             _buildTipItem("Brand yourself and have fun!"),
//           ],
//         ),
//         const SizedBox(height: 10),
//         const Text(
//           "Note: We only support uploading video files that are less than 64 MB in size.",
//           style: TextStyle(fontSize: 12, color: Colors.red),
//         ),
//         const SizedBox(height: 20),
//
//         // Choose Video Button
//         Center(
//           child: ElevatedButton.icon(
//             onPressed: _pickVideoFile,
//             icon: Icon(Icons.video_call, color: Colors.white),
//             label: Text(
//               "Choose Video",
//               style: TextStyle(color: Colors.white),
//             ),
//             style: ElevatedButton.styleFrom(
//               backgroundColor: Colors.blue, // Button background color
//             ),
//           ),
//         ),
//         if (videoFile != null && _videoController != null && _videoController!.value.isInitialized)
//           Column(
//             children: [
//               const SizedBox(height: 10),
//               // Video Player
//               AspectRatio(
//                 aspectRatio: _videoController!.value.aspectRatio,
//                 child: VideoPlayer(_videoController!),
//               ),
//               const SizedBox(height: 10),
//               // Video Controls
//               Row(
//                 mainAxisAlignment: MainAxisAlignment.center,
//                 children: [
//                   IconButton(
//                     icon: Icon(Icons.replay_10, color: Colors.blue),
//                     onPressed: () {
//                       final currentPosition = _videoController!.value.position;
//                       final newPosition = currentPosition - Duration(seconds: 10);
//                       _videoController!.seekTo(
//                         newPosition >= Duration.zero ? newPosition : Duration.zero,
//                       );
//                     },
//                   ),
//                   IconButton(
//                     icon: Icon(
//                       _videoController!.value.isPlaying ? Icons.pause : Icons.play_arrow,
//                       color: Colors.blue,
//                     ),
//                     onPressed: () {
//                       setState(() {
//                         if (_videoController!.value.isPlaying) {
//                           _videoController!.pause();
//                         } else {
//                           _videoController!.play();
//                         }
//                       });
//                     },
//                   ),
//                   IconButton(
//                     icon: Icon(Icons.forward_10, color: Colors.blue),
//                     onPressed: () {
//                       final currentPosition = _videoController!.value.position;
//                       final maxPosition = _videoController!.value.duration;
//                       final newPosition = currentPosition + Duration(seconds: 10);
//                       _videoController!.seekTo(
//                         newPosition <= maxPosition ? newPosition : maxPosition,
//                       );
//                     },
//                   ),
//                 ],
//               ),
//               VideoProgressIndicator(
//                 _videoController!,
//                 allowScrubbing: true,
//                 padding: EdgeInsets.symmetric(horizontal: 20.0),
//                 colors: VideoProgressColors(
//                   playedColor: Colors.blue,
//                   bufferedColor: Colors.grey,
//                   backgroundColor: Colors.grey.shade300,
//                 ),
//               ),
//             ],
//           ),
//         const SizedBox(height: 20),
//
//         // Back and Next Buttons
//         Row(
//           mainAxisAlignment: MainAxisAlignment.spaceBetween,
//           children: [
//             ElevatedButton(
//               onPressed: _backStep,
//               child: Text("Back"),
//               style: ElevatedButton.styleFrom(
//                 backgroundColor: Colors.blue, // Button background color
//               ),
//             ),
//             ElevatedButton(
//               onPressed: _nextStep,
//               child: Text("Next"),
//               style: ElevatedButton.styleFrom(
//                 backgroundColor: Colors.blue, // Button background color
//               ),
//             ),
//           ],
//         ),
//       ],
//     );
//   }
//
//   Widget _buildTipItem(String tip) {
//     return Row(
//       children: [
//         Icon(Icons.check, size: 16, color: Colors.green),
//         SizedBox(width: 5),
//         Expanded(child: Text(tip)),
//       ],
//     );
//   }
//
//   Widget _buildApproval() {
//     return Column(
//       crossAxisAlignment: CrossAxisAlignment.center,
//       children: [
//         // Progress Steps
//         _buildProgressSteps(),
//
//         const SizedBox(height: 50),
//
//         Icon(Icons.check_circle, color: Colors.green, size: 100),
//         const SizedBox(height: 20),
//         const Text(
//           "Congratulations!",
//           style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
//         ),
//         const SizedBox(height: 10),
//         const Text(
//           "Your application is being processed.",
//           style: TextStyle(fontSize: 16, color: Colors.grey),
//         ),
//         const SizedBox(height: 10),
//         const Text(
//           "You can now start receiving student bookings.",
//           style: TextStyle(fontSize: 16, color: Colors.grey),
//           textAlign: TextAlign.center,
//         ),
//
//         const SizedBox(height: 50),
//
//         // Optionally, you can add a button to go back or navigate elsewhere
//       ],
//     );
//   }
// }
//
// enum ProfileStep { Profile, VideoIntroduction, Approval }
//
// class Certificate {
//   String type;
//   File file;
//
//   Certificate({required this.type, required this.file});
// }

// become_a_tutor.dart

// import 'dart:io';
//
// import 'package:flutter/material.dart';
// import 'package:image_picker/image_picker.dart';
// import 'package:file_picker/file_picker.dart';
// import 'package:video_player/video_player.dart';
//
// class BecomeATutorPage extends StatefulWidget {
//   @override
//   _BecomeATutorPageState createState() => _BecomeATutorPageState();
// }
//
// enum ProfileStep { Profile, VideoIntroduction, Approval }
//
// class Certificate {
//   String type;
//   File file;
//
//   Certificate({required this.type, required this.file});
// }
//
// class _BecomeATutorPageState extends State<BecomeATutorPage> {
//   final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
//
//   // Current Step
//   ProfileStep currentStep = ProfileStep.Profile;
//
//   // Controllers for form fields
//   final TextEditingController nameController = TextEditingController();
//   final TextEditingController fromController = TextEditingController();
//   final TextEditingController dobController = TextEditingController();
//   final TextEditingController interestsController = TextEditingController();
//   final TextEditingController educationController = TextEditingController();
//   final TextEditingController experienceController = TextEditingController();
//   final TextEditingController professionController = TextEditingController();
//   final TextEditingController instructionController = TextEditingController();
//   final TextEditingController languagesController = TextEditingController();
//
//   // Image and File Uploads
//   File? profileImage;
//
//   // Certificates
//   List<Certificate> certificates = [];
//
//   // Video Introduction
//   File? videoFile;
//   VideoPlayerController? _videoController;
//
//   // Checkbox States
//   bool beginnerChecked = false;
//   bool intermediateChecked = false;
//   bool advancedChecked = false;
//
//   // Video Playback State
//   bool isVideoPlaying = false;
//
//   // Additional Controller for Custom Certification Type
//   final TextEditingController customTypeController = TextEditingController();
//
//   final ImagePicker _imagePicker = ImagePicker();
//
//   // Function to pick profile image
//   Future<void> _pickProfileImage() async {
//     try {
//       final pickedFile = await _imagePicker.pickImage(source: ImageSource.gallery);
//       if (pickedFile != null) {
//         setState(() {
//           profileImage = File(pickedFile.path);
//         });
//       }
//     } catch (e) {
//       // Handle any errors
//       ScaffoldMessenger.of(context).showSnackBar(
//         SnackBar(content: Text("Error picking image: $e")),
//       );
//     }
//   }
//
//   // Function to pick video file
//   Future<void> _pickVideoFile() async {
//     try {
//       final pickedFile = await _imagePicker.pickVideo(source: ImageSource.gallery);
//       if (pickedFile != null) {
//         _videoController?.dispose();
//         _videoController = VideoPlayerController.file(File(pickedFile.path))
//           ..initialize().then((_) {
//             setState(() {
//               videoFile = File(pickedFile.path);
//               _videoController!.play();
//               isVideoPlaying = true;
//             });
//           });
//       }
//     } catch (e) {
//       // Handle any errors
//       ScaffoldMessenger.of(context).showSnackBar(
//         SnackBar(content: Text("Error picking video: $e")),
//       );
//     }
//   }
//
//   // Function to add a new certificate
//   void _addCertificate() async {
//     String? selectedType; // Initialize as null
//     File? uploadedFile;
//     final _dialogFormKey = GlobalKey<FormState>(); // Form key for the dialog
//
//     await showDialog(
//       context: context,
//       builder: (context) {
//         return StatefulBuilder(builder: (context, setStateDialog) {
//           return AlertDialog(
//             title: Text("Add New Certificate"),
//             content: Form(
//               key: _dialogFormKey, // Assign the form key
//               child: SingleChildScrollView( // Ensures content is scrollable if overflow occurs
//                 child: Column(
//                   mainAxisSize: MainAxisSize.min,
//                   children: [
//                     DropdownButtonFormField<String>(
//                       value: selectedType,
//                       items: ["IELTS", "TOEFL", "Other"].map((cert) {
//                         return DropdownMenuItem(
//                           value: cert,
//                           child: Text(cert),
//                         );
//                       }).toList(),
//                       onChanged: (value) {
//                         setStateDialog(() {
//                           selectedType = value;
//                           if (value != "Other") {
//                             customTypeController.text = "";
//                           }
//                         });
//                       },
//                       decoration: InputDecoration(
//                         labelText: "Certificate Type",
//                         border: OutlineInputBorder(),
//                       ),
//                       validator: (value) {
//                         if (value == null || value.isEmpty) {
//                           return 'Please select a certification type';
//                         }
//                         return null;
//                       },
//                     ),
//                     SizedBox(height: 10),
//                     if (selectedType == "Other")
//                       TextFormField(
//                         controller: customTypeController,
//                         decoration: InputDecoration(
//                           labelText: "Enter Certification Type",
//                           border: OutlineInputBorder(),
//                         ),
//                         validator: (value) {
//                           if (selectedType == "Other") {
//                             if (value == null || value.trim().isEmpty) {
//                               return 'Please enter the certification type';
//                             }
//                           }
//                           return null;
//                         },
//                       ),
//                     SizedBox(height: 10),
//                     ElevatedButton(
//                       onPressed: () async {
//                         try {
//                           FilePickerResult? result = await FilePicker.platform.pickFiles(
//                             type: FileType.custom,
//                             allowedExtensions: ['pdf', 'doc', 'docx', 'jpg', 'png'],
//                           );
//                           if (result != null && result.files.single.path != null) {
//                             File selectedFile = File(result.files.single.path!);
//                             final fileSize = await selectedFile.length();
//                             if (fileSize > 64 * 1024 * 1024) { // 64 MB
//                               setStateDialog(() {
//                                 uploadedFile = null;
//                               });
//                               ScaffoldMessenger.of(context).showSnackBar(
//                                 SnackBar(content: Text("File size exceeds 64 MB.")),
//                               );
//                               return;
//                             }
//                             setStateDialog(() {
//                               uploadedFile = selectedFile;
//                             });
//                           }
//                         } catch (e) {
//                           // Handle any errors
//                           ScaffoldMessenger.of(context).showSnackBar(
//                             SnackBar(content: Text("Error picking file: $e")),
//                           );
//                         }
//                       },
//                       child: Text("Upload Certificate"),
//                       style: ElevatedButton.styleFrom(
//                         backgroundColor: Colors.blue, // Button background color
//                       ),
//                     ),
//                     SizedBox(height: 10),
//                     if (uploadedFile != null)
//                       Text(
//                         uploadedFile!.path.split('/').last,
//                         style: TextStyle(color: Colors.green),
//                       ),
//                   ],
//                 ),
//               ),
//             ),
//             actions: [
//               TextButton(
//                 onPressed: () {
//                   Navigator.of(context).pop();
//                 },
//                 child: Text(
//                   "Cancel",
//                   style: TextStyle(color: Colors.blue),
//                 ),
//               ),
//               ElevatedButton(
//                 onPressed: () {
//                   if (_dialogFormKey.currentState!.validate()) {
//                     if (uploadedFile != null) {
//                       String finalType = selectedType!;
//                       if (selectedType == "Other") {
//                         finalType = customTypeController.text.trim();
//                       }
//                       setState(() {
//                         certificates.add(Certificate(
//                             type: finalType, file: uploadedFile!));
//                       });
//                       Navigator.of(context).pop();
//                     } else {
//                       ScaffoldMessenger.of(context).showSnackBar(
//                         SnackBar(content: Text("Please upload a certificate file")),
//                       );
//                     }
//                   }
//                 },
//                 child: Text("Save"),
//                 style: ElevatedButton.styleFrom(
//                   backgroundColor: Colors.blue, // Button background color
//                 ),
//               ),
//             ],
//           );
//         });
//       },
//     );
//   }
//
//   // Function to delete a certificate
//   void _deleteCertificate(int index) {
//     setState(() {
//       certificates.removeAt(index);
//     });
//   }
//
//   // Function to pick Date of Birth
//   Future<void> _pickDateOfBirth() async {
//     DateTime initialDate = DateTime(1990);
//     DateTime firstDate = DateTime(1900);
//     DateTime lastDate = DateTime.now();
//
//     final DateTime? picked = await showDatePicker(
//       context: context,
//       initialDate: initialDate,
//       firstDate: firstDate,
//       lastDate: lastDate,
//     );
//
//     if (picked != null) {
//       setState(() {
//         dobController.text = "${picked.toLocal()}".split(' ')[0];
//       });
//     }
//   }
//
//   // Function to proceed to next step
//   void _nextStep() {
//     if (currentStep == ProfileStep.Profile) {
//       // Validate profile form
//       if (_formKey.currentState!.validate()) {
//         // Additional validations can be added here
//         setState(() {
//           currentStep = ProfileStep.VideoIntroduction;
//         });
//         ScaffoldMessenger.of(context).showSnackBar(
//           SnackBar(content: Text("Profile completed!")),
//         );
//       }
//     } else if (currentStep == ProfileStep.VideoIntroduction) {
//       if (videoFile != null) {
//         setState(() {
//           currentStep = ProfileStep.Approval;
//         });
//       } else {
//         ScaffoldMessenger.of(context).showSnackBar(
//           SnackBar(content: Text("Please upload a video introduction.")),
//         );
//       }
//     }
//   }
//
//   // Function to go back to previous step
//   void _backStep() {
//     if (currentStep == ProfileStep.VideoIntroduction) {
//       setState(() {
//         currentStep = ProfileStep.Profile;
//       });
//     } else if (currentStep == ProfileStep.Approval) {
//       setState(() {
//         currentStep = ProfileStep.VideoIntroduction;
//       });
//     }
//   }
//
//   @override
//   void dispose() {
//     // Dispose controllers
//     nameController.dispose();
//     fromController.dispose();
//     dobController.dispose();
//     interestsController.dispose();
//     educationController.dispose();
//     experienceController.dispose();
//     professionController.dispose();
//     instructionController.dispose();
//     languagesController.dispose();
//     customTypeController.dispose();
//     _videoController?.dispose();
//     super.dispose();
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: _buildAppBar(),
//       body: SingleChildScrollView(
//         padding: const EdgeInsets.all(16.0),
//         child: currentStep == ProfileStep.Profile
//             ? _buildProfileForm()
//             : currentStep == ProfileStep.VideoIntroduction
//             ? _buildVideoIntroduction()
//             : _buildApproval(),
//       ),
//     );
//   }
//
//   AppBar _buildAppBar() {
//     return AppBar(
//       title: const Text(
//         "Become a Tutor",
//         style: TextStyle(color: Colors.blue),
//       ),
//       backgroundColor: Colors.white,
//       centerTitle: true,
//       iconTheme: IconThemeData(color: Colors.blue),
//       elevation: 0,
//       leading: IconButton(
//         icon: Icon(Icons.arrow_back, color: Colors.blue),
//         onPressed: () {
//           Navigator.of(context).pop(); // Navigate back to Settings Page
//         },
//       ),
//     );
//   }
//
//   Widget _buildProfileForm() {
//     return Form(
//       key: _formKey,
//       child: Column(
//         crossAxisAlignment: CrossAxisAlignment.start,
//         children: [
//           // Progress Steps
//           _buildProgressSteps(),
//
//           const SizedBox(height: 20),
//
//           // Profile Image Upload
//           Center(
//             child: GestureDetector(
//               onTap: _pickProfileImage,
//               child: CircleAvatar(
//                 radius: 50,
//                 backgroundImage: profileImage != null
//                     ? FileImage(profileImage!)
//                     : AssetImage('assets/profile_placeholder.png') as ImageProvider,
//                 child: profileImage == null
//                     ? Icon(Icons.camera_alt, size: 50, color: Colors.white70)
//                     : null,
//               ),
//             ),
//           ),
//           const SizedBox(height: 10),
//           Center(
//             child: TextButton.icon(
//               onPressed: _pickProfileImage,
//               icon: Icon(Icons.upload, color: Colors.blue),
//               label: Text(
//                 "Upload Profile Image",
//                 style: TextStyle(color: Colors.blue),
//               ),
//             ),
//           ),
//
//           const SizedBox(height: 20),
//
//           // Form Title
//           const Text(
//             "Set up your tutor profile",
//             style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
//           ),
//           const SizedBox(height: 10),
//           const Text(
//             "Students will check your profile to decide whether to book a lesson with you. Please provide as much information as possible.",
//             style: TextStyle(fontSize: 14, color: Colors.grey),
//           ),
//           const SizedBox(height: 20),
//
//           // Basic Info Section
//           const Text(
//             "Basic Info",
//             style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
//           ),
//           const SizedBox(height: 10),
//           TextFormField(
//             controller: nameController,
//             decoration: const InputDecoration(
//               labelText: "Name",
//               border: OutlineInputBorder(),
//             ),
//             validator: (value) {
//               if (value == null || value.isEmpty) {
//                 return 'Please enter your name';
//               }
//               return null;
//             },
//           ),
//           const SizedBox(height: 10),
//           TextFormField(
//             controller: fromController,
//             decoration: const InputDecoration(
//               labelText: "From",
//               border: OutlineInputBorder(),
//             ),
//           ),
//           const SizedBox(height: 10),
//           GestureDetector(
//             onTap: _pickDateOfBirth,
//             child: AbsorbPointer(
//               child: TextFormField(
//                 controller: dobController,
//                 decoration: const InputDecoration(
//                   labelText: "Date of Birth",
//                   border: OutlineInputBorder(),
//                   suffixIcon: Icon(Icons.calendar_today),
//                 ),
//                 validator: (value) {
//                   if (value == null || value.isEmpty) {
//                     return 'Please select your date of birth';
//                   }
//                   return null;
//                 },
//               ),
//             ),
//           ),
//           const SizedBox(height: 20),
//
//           // CV Section
//           const Text(
//             "CV",
//             style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
//           ),
//           const SizedBox(height: 10),
//           TextFormField(
//             controller: interestsController,
//             decoration: const InputDecoration(
//               labelText: "Interests",
//               border: OutlineInputBorder(),
//             ),
//           ),
//           const SizedBox(height: 10),
//           TextFormField(
//             controller: educationController,
//             decoration: const InputDecoration(
//               labelText: "Education",
//               border: OutlineInputBorder(),
//             ),
//           ),
//           const SizedBox(height: 10),
//           TextFormField(
//             controller: experienceController,
//             decoration: const InputDecoration(
//               labelText: "Experience",
//               border: OutlineInputBorder(),
//             ),
//           ),
//           const SizedBox(height: 10),
//           TextFormField(
//             controller: professionController,
//             decoration: const InputDecoration(
//               labelText: "Current or Previous Profession",
//               border: OutlineInputBorder(),
//             ),
//           ),
//           const SizedBox(height: 20),
//
//           // Languages Section
//           const Text(
//             "Languages I Speak",
//             style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
//           ),
//           const SizedBox(height: 10),
//           TextFormField(
//             controller: languagesController,
//             decoration: const InputDecoration(
//               labelText: "Languages",
//               border: OutlineInputBorder(),
//             ),
//           ),
//           const SizedBox(height: 20),
//
//           // Teaching Section
//           const Text(
//             "Who I Teach",
//             style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
//           ),
//           const SizedBox(height: 10),
//           TextFormField(
//             controller: instructionController,
//             decoration: const InputDecoration(
//               labelText: "Instruction",
//               border: OutlineInputBorder(),
//             ),
//           ),
//           const SizedBox(height: 10),
//           const Text("I am best at teaching students who are:"),
//           CheckboxListTile(
//             value: beginnerChecked,
//             title: const Text("Beginner"),
//             onChanged: (value) {
//               setState(() {
//                 beginnerChecked = value!;
//               });
//             },
//           ),
//           CheckboxListTile(
//             value: intermediateChecked,
//             title: const Text("Intermediate"),
//             onChanged: (value) {
//               setState(() {
//                 intermediateChecked = value!;
//               });
//             },
//           ),
//           CheckboxListTile(
//             value: advancedChecked,
//             title: const Text("Advanced"),
//             onChanged: (value) {
//               setState(() {
//                 advancedChecked = value!;
//               });
//             },
//           ),
//           const SizedBox(height: 20),
//
//           // Certificates Section
//           const Text(
//             "Certificates",
//             style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
//           ),
//           const SizedBox(height: 10),
//           ElevatedButton.icon(
//             onPressed: _addCertificate,
//             icon: Icon(Icons.add, color: Colors.white),
//             label: Text(
//               "Add New Certificate",
//               style: TextStyle(color: Colors.white),
//             ),
//             style: ElevatedButton.styleFrom(
//               backgroundColor: Colors.blue, // Button background color
//             ),
//           ),
//           const SizedBox(height: 10),
//           certificates.isNotEmpty
//               ? DataTable(
//             columns: const [
//               DataColumn(label: Text("Certificate Type")),
//               DataColumn(label: Text("Certificate")),
//               DataColumn(label: Text("Action")),
//             ],
//             rows: List.generate(certificates.length, (index) {
//               return DataRow(cells: [
//                 DataCell(Text(certificates[index].type)),
//                 DataCell(Text(certificates[index].file.path.split('/').last)),
//                 DataCell(IconButton(
//                   icon: Icon(Icons.delete, color: Colors.red),
//                   onPressed: () => _deleteCertificate(index),
//                 )),
//               ]);
//             }),
//           )
//               : Text(
//             "No certificates added.",
//             style: TextStyle(color: Colors.grey),
//           ),
//           const SizedBox(height: 20),
//
//           // Save and Next Buttons
//           Row(
//             mainAxisAlignment: MainAxisAlignment.spaceBetween,
//             children: [
//               ElevatedButton(
//                 onPressed: () {
//                   // Implement Save functionality if separate from Next
//                   if (_formKey.currentState!.validate()) {
//                     ScaffoldMessenger.of(context).showSnackBar(
//                       const SnackBar(content: Text("Profile saved!")),
//                     );
//                   }
//                 },
//                 child: Text("Save"),
//                 style: ElevatedButton.styleFrom(
//                   backgroundColor: Colors.blue, // Button background color
//                 ),
//               ),
//               ElevatedButton(
//                 onPressed: _nextStep,
//                 child: Text("Next"),
//                 style: ElevatedButton.styleFrom(
//                   backgroundColor: Colors.blue, // Button background color
//                 ),
//               ),
//             ],
//           ),
//         ],
//       ),
//     );
//   }
//
//   // Widget _buildProgressSteps() {
//   //   return Row(
//   //     mainAxisAlignment: MainAxisAlignment.center, // Center the entire Row
//   //     children: [
//   //       // Complete Profile Step
//   //       Column(
//   //         children: [
//   //           CircleAvatar(
//   //             radius: 20, // Reduced size for uniformity
//   //             backgroundColor: currentStep == ProfileStep.Profile ||
//   //                 currentStep == ProfileStep.VideoIntroduction ||
//   //                 currentStep == ProfileStep.Approval
//   //                 ? Colors.blue
//   //                 : Colors.grey,
//   //             child: Icon(Icons.person, color: Colors.white, size: 20),
//   //           ),
//   //           SizedBox(height: 5),
//   //           Container(
//   //             width: 80, // Fixed width to prevent overflow
//   //             child: Text(
//   //               "Complete\nProfile",
//   //               style: TextStyle(
//   //                 fontSize: 12, // Reduced font size
//   //                 color: currentStep == ProfileStep.Profile ||
//   //                     currentStep == ProfileStep.VideoIntroduction ||
//   //                     currentStep == ProfileStep.Approval
//   //                     ? Colors.black
//   //                     : Colors.grey,
//   //                 textAlign: TextAlign.center, // Center-align the text
//   //               ),
//   //               overflow: TextOverflow.ellipsis,
//   //               maxLines: 2,
//   //             ),
//   //           ),
//   //         ],
//   //       ),
//   //       Spacer(), // Uniform spacing
//   //       // Connecting Line
//   //       Container(
//   //         width: 40, // Fixed width for connecting line
//   //         height: 2,
//   //         color: currentStep == ProfileStep.VideoIntroduction ||
//   //             currentStep == ProfileStep.Approval
//   //             ? Colors.blue
//   //             : Colors.grey,
//   //       ),
//   //       Spacer(), // Uniform spacing
//   //       // Video Introduction Step
//   //       Column(
//   //         children: [
//   //           CircleAvatar(
//   //             radius: 20, // Reduced size for uniformity
//   //             backgroundColor: currentStep == ProfileStep.VideoIntroduction ||
//   //                 currentStep == ProfileStep.Approval
//   //                 ? Colors.blue
//   //                 : Colors.grey,
//   //             child: Icon(Icons.videocam, color: Colors.white, size: 20),
//   //           ),
//   //           SizedBox(height: 5),
//   //           Container(
//   //             width: 80, // Fixed width to prevent overflow
//   //             child: Text(
//   //               "Video\nIntroduction",
//   //               style: TextStyle(
//   //                 fontSize: 12, // Reduced font size
//   //                 color: currentStep == ProfileStep.VideoIntroduction ||
//   //                     currentStep == ProfileStep.Approval
//   //                     ? Colors.black
//   //                     : Colors.grey,
//   //                 textAlign: TextAlign.center, // Center-align the text
//   //               ),
//   //               overflow: TextOverflow.ellipsis,
//   //               maxLines: 2,
//   //             ),
//   //           ),
//   //         ],
//   //       ),
//   //       Spacer(), // Uniform spacing
//   //       // Connecting Line
//   //       Container(
//   //         width: 40, // Fixed width for connecting line
//   //         height: 2,
//   //         color: currentStep == ProfileStep.Approval
//   //             ? Colors.blue
//   //             : Colors.grey,
//   //       ),
//   //       Spacer(), // Uniform spacing
//   //       // Approval Step
//   //       Column(
//   //         children: [
//   //           CircleAvatar(
//   //             radius: 20, // Reduced size for uniformity
//   //             backgroundColor: currentStep == ProfileStep.Approval
//   //                 ? Colors.blue
//   //                 : Colors.grey,
//   //             child: Icon(Icons.check, color: Colors.white, size: 20),
//   //           ),
//   //           SizedBox(height: 5),
//   //           Container(
//   //             width: 80, // Fixed width to prevent overflow
//   //             child: Text(
//   //               "Approval",
//   //               style: TextStyle(
//   //                 fontSize: 12, // Reduced font size
//   //                 color: currentStep == ProfileStep.Approval
//   //                     ? Colors.black
//   //                     : Colors.grey,
//   //                 textAlign: TextAlign.center, // Center-align the text
//   //               ),
//   //               overflow: TextOverflow.ellipsis,
//   //               maxLines: 1,
//   //             ),
//   //           ),
//   //         ],
//   //       ),
//   //     ],
//   //   );
//   // }
//   // Widget _buildProgressSteps() {
//   //   return Row(
//   //     mainAxisAlignment: MainAxisAlignment.center, // Center the entire Row
//   //     children: [
//   //       // Complete Profile Step
//   //       Column(
//   //         children: [
//   //           CircleAvatar(
//   //             radius: 20, // Reduced size for uniformity
//   //             backgroundColor: currentStep == ProfileStep.Profile ||
//   //                 currentStep == ProfileStep.VideoIntroduction ||
//   //                 currentStep == ProfileStep.Approval
//   //                 ? Colors.blue
//   //                 : Colors.grey,
//   //             child: Icon(Icons.person, color: Colors.white, size: 20),
//   //           ),
//   //           SizedBox(height: 5),
//   //           Container(
//   //             width: 80, // Fixed width to prevent overflow
//   //             child: Text(
//   //               "Complete\nProfile",
//   //               style: TextStyle(
//   //                 fontSize: 12, // Reduced font size
//   //                 color: currentStep == ProfileStep.Profile ||
//   //                     currentStep == ProfileStep.VideoIntroduction ||
//   //                     currentStep == ProfileStep.Approval
//   //                     ? Colors.black
//   //                     : Colors.grey,
//   //                 // Removed textAlign from TextStyle
//   //               ),
//   //               textAlign: TextAlign.center, // Correct placement
//   //               overflow: TextOverflow.ellipsis,
//   //               maxLines: 2,
//   //             ),
//   //           ),
//   //         ],
//   //       ),
//   //       Spacer(), // Uniform spacing
//   //       // Connecting Line
//   //       Container(
//   //         width: 40, // Fixed width for connecting line
//   //         height: 2,
//   //         color: currentStep == ProfileStep.VideoIntroduction ||
//   //             currentStep == ProfileStep.Approval
//   //             ? Colors.blue
//   //             : Colors.grey,
//   //       ),
//   //       Spacer(), // Uniform spacing
//   //       // Video Introduction Step
//   //       Column(
//   //         children: [
//   //           CircleAvatar(
//   //             radius: 20, // Reduced size for uniformity
//   //             backgroundColor: currentStep == ProfileStep.VideoIntroduction ||
//   //                 currentStep == ProfileStep.Approval
//   //                 ? Colors.blue
//   //                 : Colors.grey,
//   //             child: Icon(Icons.videocam, color: Colors.white, size: 20),
//   //           ),
//   //           SizedBox(height: 5),
//   //           Container(
//   //             width: 80, // Fixed width to prevent overflow
//   //             child: Text(
//   //               "Video\nIntroduction",
//   //               style: TextStyle(
//   //                 fontSize: 12, // Reduced font size
//   //                 color: currentStep == ProfileStep.VideoIntroduction ||
//   //                     currentStep == ProfileStep.Approval
//   //                     ? Colors.black
//   //                     : Colors.grey,
//   //                 // Removed textAlign from TextStyle
//   //               ),
//   //               textAlign: TextAlign.center, // Correct placement
//   //               overflow: TextOverflow.ellipsis,
//   //               maxLines: 2,
//   //             ),
//   //           ),
//   //         ],
//   //       ),
//   //       Spacer(), // Uniform spacing
//   //       // Connecting Line
//   //       Container(
//   //         width: 40, // Fixed width for connecting line
//   //         height: 2,
//   //         color: currentStep == ProfileStep.Approval
//   //             ? Colors.blue
//   //             : Colors.grey,
//   //       ),
//   //       Spacer(), // Uniform spacing
//   //       // Approval Step
//   //       Column(
//   //         children: [
//   //           CircleAvatar(
//   //             radius: 20, // Reduced size for uniformity
//   //             backgroundColor: currentStep == ProfileStep.Approval
//   //                 ? Colors.blue
//   //                 : Colors.grey,
//   //             child: Icon(Icons.check, color: Colors.white, size: 20),
//   //           ),
//   //           SizedBox(height: 5),
//   //           Container(
//   //             width: 80, // Fixed width to prevent overflow
//   //             child: Text(
//   //               "Approval",
//   //               style: TextStyle(
//   //                 fontSize: 12, // Reduced font size
//   //                 color: currentStep == ProfileStep.Approval
//   //                     ? Colors.black
//   //                     : Colors.grey,
//   //                 // Removed textAlign from TextStyle
//   //               ),
//   //               textAlign: TextAlign.center, // Correct placement
//   //               overflow: TextOverflow.ellipsis,
//   //               maxLines: 1,
//   //             ),
//   //           ),
//   //         ],
//   //       ),
//   //     ],
//   //   );
//   // }
//
//   Widget _buildProgressSteps() {
//     return Row(
//       mainAxisAlignment: MainAxisAlignment.center, // Center the entire Row
//       crossAxisAlignment: CrossAxisAlignment.center, // Center align vertically
//       children: [
//         // Complete Profile Step
//         Column(
//           children: [
//             CircleAvatar(
//               radius: 20, // Uniform size for all avatars
//               backgroundColor: currentStep == ProfileStep.Profile ||
//                   currentStep == ProfileStep.VideoIntroduction ||
//                   currentStep == ProfileStep.Approval
//                   ? Colors.blue
//                   : Colors.grey,
//               child: Icon(Icons.person, color: Colors.white, size: 20),
//             ),
//             SizedBox(height: 5),
//             Container(
//               width: 80, // Fixed width to prevent overflow
//               child: Text(
//                 "Complete\nProfile",
//                 style: TextStyle(
//                   fontSize: 12, // Reduced font size
//                   color: currentStep == ProfileStep.Profile ||
//                       currentStep == ProfileStep.VideoIntroduction ||
//                       currentStep == ProfileStep.Approval
//                       ? Colors.black
//                       : Colors.grey,
//                 ),
//                 textAlign: TextAlign.center, // Correct placement
//                 overflow: TextOverflow.ellipsis,
//                 maxLines: 2,
//               ),
//             ),
//           ],
//         ),
//         SizedBox(width: 10), // Fixed spacing between Profile and line
//         // Connecting Line
//         Container(
//           width: 40, // Fixed width for connecting line
//           height: 2,
//           color: currentStep == ProfileStep.VideoIntroduction ||
//               currentStep == ProfileStep.Approval
//               ? Colors.blue
//               : Colors.grey,
//         ),
//         SizedBox(width: 10), // Fixed spacing between line and Video Introduction
//         // Video Introduction Step
//         Column(
//           children: [
//             CircleAvatar(
//               radius: 20, // Uniform size for all avatars
//               backgroundColor: currentStep == ProfileStep.VideoIntroduction ||
//                   currentStep == ProfileStep.Approval
//                   ? Colors.blue
//                   : Colors.grey,
//               child: Icon(Icons.videocam, color: Colors.white, size: 20),
//             ),
//             SizedBox(height: 5),
//             Container(
//               width: 80, // Fixed width to prevent overflow
//               child: Text(
//                 "Video\nIntroduction",
//                 style: TextStyle(
//                   fontSize: 12, // Reduced font size
//                   color: currentStep == ProfileStep.VideoIntroduction ||
//                       currentStep == ProfileStep.Approval
//                       ? Colors.black
//                       : Colors.grey,
//                 ),
//                 textAlign: TextAlign.center, // Correct placement
//                 overflow: TextOverflow.ellipsis,
//                 maxLines: 2,
//               ),
//             ),
//           ],
//         ),
//         SizedBox(width: 10), // Fixed spacing between Video Introduction and line
//         // Connecting Line
//         Container(
//           width: 40, // Fixed width for connecting line
//           height: 2,
//           color: currentStep == ProfileStep.Approval
//               ? Colors.blue
//               : Colors.grey,
//         ),
//         SizedBox(width: 10), // Fixed spacing between line and Approval
//         // Approval Step
//         Column(
//           children: [
//             CircleAvatar(
//               radius: 20, // Uniform size for all avatars
//               backgroundColor: currentStep == ProfileStep.Approval
//                   ? Colors.blue
//                   : Colors.grey,
//               child: Icon(Icons.check, color: Colors.white, size: 20),
//             ),
//             SizedBox(height: 5),
//             Container(
//               width: 80, // Fixed width to prevent overflow
//               child: Text(
//                 "Approval",
//                 style: TextStyle(
//                   fontSize: 12, // Reduced font size
//                   color: currentStep == ProfileStep.Approval
//                       ? Colors.black
//                       : Colors.grey,
//                 ),
//                 textAlign: TextAlign.center, // Correct placement
//                 overflow: TextOverflow.ellipsis,
//                 maxLines: 1,
//               ),
//             ),
//           ],
//         ),
//       ],
//     );
//   }
//
//
//
//   Widget _buildVideoIntroduction() {
//     return Column(
//       crossAxisAlignment: CrossAxisAlignment.start,
//       children: [
//         // Progress Steps
//         _buildProgressSteps(),
//
//         const SizedBox(height: 20),
//
//         const Text(
//           "Introduce Yourself",
//           style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
//         ),
//         const SizedBox(height: 10),
//         const Text(
//           "Let students know what they can expect from a lesson with you by recording a video highlighting your teaching style, expertise, and personality. Students can be nervous to speak with a foreigner, so it really helps to have a friendly video that introduces yourself and invites students to call you.",
//           style: TextStyle(fontSize: 14, color: Colors.grey),
//         ),
//         const SizedBox(height: 20),
//
//         const Text(
//           "A few helpful tips:",
//           style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
//         ),
//         const SizedBox(height: 5),
//         Column(
//           crossAxisAlignment: CrossAxisAlignment.start,
//           children: [
//             _buildTipItem("Find a clean and quiet space"),
//             _buildTipItem("Smile and look at the camera"),
//             _buildTipItem("Dress smart"),
//             _buildTipItem("Speak for 1-3 minutes"),
//             _buildTipItem("Brand yourself and have fun!"),
//           ],
//         ),
//         const SizedBox(height: 10),
//         const Text(
//           "Note: We only support uploading video files that are less than 64 MB in size.",
//           style: TextStyle(fontSize: 12, color: Colors.red),
//         ),
//         const SizedBox(height: 20),
//
//         // Choose Video Button
//         Center(
//           child: ElevatedButton.icon(
//             onPressed: _pickVideoFile,
//             icon: Icon(Icons.video_call, color: Colors.white),
//             label: Text(
//               "Choose Video",
//               style: TextStyle(color: Colors.white),
//             ),
//             style: ElevatedButton.styleFrom(
//               backgroundColor: Colors.blue, // Button background color
//             ),
//           ),
//         ),
//         if (videoFile != null && _videoController != null && _videoController!.value.isInitialized)
//           Column(
//             children: [
//               const SizedBox(height: 10),
//               // Video Player
//               AspectRatio(
//                 aspectRatio: _videoController!.value.aspectRatio,
//                 child: VideoPlayer(_videoController!),
//               ),
//               const SizedBox(height: 10),
//               // Video Controls
//               Row(
//                 mainAxisAlignment: MainAxisAlignment.center,
//                 children: [
//                   IconButton(
//                     icon: Icon(Icons.replay_10, color: Colors.blue),
//                     onPressed: () {
//                       final currentPosition = _videoController!.value.position;
//                       final newPosition = currentPosition - Duration(seconds: 10);
//                       _videoController!.seekTo(
//                         newPosition >= Duration.zero ? newPosition : Duration.zero,
//                       );
//                     },
//                   ),
//                   IconButton(
//                     icon: Icon(
//                       _videoController!.value.isPlaying ? Icons.pause : Icons.play_arrow,
//                       color: Colors.blue,
//                     ),
//                     onPressed: () {
//                       setState(() {
//                         if (_videoController!.value.isPlaying) {
//                           _videoController!.pause();
//                         } else {
//                           _videoController!.play();
//                         }
//                       });
//                     },
//                   ),
//                   IconButton(
//                     icon: Icon(Icons.forward_10, color: Colors.blue),
//                     onPressed: () {
//                       final currentPosition = _videoController!.value.position;
//                       final maxPosition = _videoController!.value.duration;
//                       final newPosition = currentPosition + Duration(seconds: 10);
//                       _videoController!.seekTo(
//                         newPosition <= maxPosition ? newPosition : maxPosition,
//                       );
//                     },
//                   ),
//                 ],
//               ),
//               VideoProgressIndicator(
//                 _videoController!,
//                 allowScrubbing: true,
//                 padding: EdgeInsets.symmetric(horizontal: 20.0),
//                 colors: VideoProgressColors(
//                   playedColor: Colors.blue,
//                   bufferedColor: Colors.grey,
//                   backgroundColor: Colors.grey.shade300,
//                 ),
//               ),
//             ],
//           ),
//         const SizedBox(height: 20),
//
//         // Back and Next Buttons
//         Row(
//           mainAxisAlignment: MainAxisAlignment.spaceBetween,
//           children: [
//             ElevatedButton(
//               onPressed: _backStep,
//               child: Text("Back"),
//               style: ElevatedButton.styleFrom(
//                 backgroundColor: Colors.blue, // Button background color
//               ),
//             ),
//             ElevatedButton(
//               onPressed: _nextStep,
//               child: Text("Next"),
//               style: ElevatedButton.styleFrom(
//                 backgroundColor: Colors.blue, // Button background color
//               ),
//             ),
//           ],
//         ),
//       ],
//     );
//   }
//
//   Widget _buildTipItem(String tip) {
//     return Row(
//       children: [
//         Icon(Icons.check, size: 16, color: Colors.green),
//         SizedBox(width: 5),
//         Expanded(child: Text(tip)),
//       ],
//     );
//   }
//
//   Widget _buildApproval() {
//     return Column(
//       crossAxisAlignment: CrossAxisAlignment.center,
//       children: [
//         // Progress Steps
//         _buildProgressSteps(),
//
//         const SizedBox(height: 50),
//
//         Icon(Icons.check_circle, color: Colors.green, size: 100),
//         const SizedBox(height: 20),
//         const Text(
//           "Congratulations!",
//           style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
//         ),
//         const SizedBox(height: 10),
//         const Text(
//           "Your application is being processed.",
//           style: TextStyle(fontSize: 16, color: Colors.grey),
//         ),
//         const SizedBox(height: 10),
//         const Text(
//           "You can now start receiving student bookings.",
//           style: TextStyle(fontSize: 16, color: Colors.grey),
//           textAlign: TextAlign.center,
//         ),
//
//         const SizedBox(height: 50),
//
//         // Optionally, you can add a button to go back or navigate elsewhere
//       ],
//     );
//   }
// }

// lib/pages/become_a_tutor.dart

// import 'dart:io';
//
// import 'package:flutter/material.dart';
// import 'package:image_picker/image_picker.dart';
// import 'package:file_picker/file_picker.dart';
// import 'package:video_player/video_player.dart';
//
// class BecomeATutorPage extends StatefulWidget {
//   @override
//   _BecomeATutorPageState createState() => _BecomeATutorPageState();
// }
//
// enum ProfileStep { Profile, VideoIntroduction, Approval }
//
// class Certificate {
//   String type;
//   File file;
//
//   Certificate({required this.type, required this.file});
// }
//
// class _BecomeATutorPageState extends State<BecomeATutorPage> {
//   final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
//
//   // Current Step
//   ProfileStep currentStep = ProfileStep.Profile;
//
//   // Controllers for form fields
//   final TextEditingController nameController = TextEditingController();
//   final TextEditingController fromController = TextEditingController();
//   final TextEditingController dobController = TextEditingController();
//   final TextEditingController interestsController = TextEditingController();
//   final TextEditingController educationController = TextEditingController();
//   final TextEditingController experienceController = TextEditingController();
//   final TextEditingController professionController = TextEditingController();
//   final TextEditingController instructionController = TextEditingController();
//   final TextEditingController languagesController = TextEditingController();
//
//   // Image and File Uploads
//   File? profileImage;
//
//   // Certificates
//   List<Certificate> certificates = [];
//
//   // Video Introduction
//   File? videoFile;
//   VideoPlayerController? _videoController;
//
//   // Checkbox States
//   bool beginnerChecked = false;
//   bool intermediateChecked = false;
//   bool advancedChecked = false;
//
//   // Video Playback State
//   bool isVideoPlaying = false;
//
//   // Additional Controller for Custom Certification Type
//   final TextEditingController customTypeController = TextEditingController();
//
//   final ImagePicker _imagePicker = ImagePicker();
//
//   // Function to pick profile image
//   Future<void> _pickProfileImage() async {
//     try {
//       final pickedFile = await _imagePicker.pickImage(source: ImageSource.gallery);
//       if (pickedFile != null) {
//         setState(() {
//           profileImage = File(pickedFile.path);
//         });
//       }
//     } catch (e) {
//       // Handle any errors
//       ScaffoldMessenger.of(context).showSnackBar(
//         SnackBar(content: Text("Error picking image: $e")),
//       );
//     }
//   }
//
//   // Function to pick video file
//   Future<void> _pickVideoFile() async {
//     try {
//       final pickedFile = await _imagePicker.pickVideo(source: ImageSource.gallery);
//       if (pickedFile != null) {
//         _videoController?.dispose();
//         _videoController = VideoPlayerController.file(File(pickedFile.path))
//           ..initialize().then((_) {
//             setState(() {
//               videoFile = File(pickedFile.path);
//               _videoController!.play();
//               isVideoPlaying = true;
//             });
//           });
//       }
//     } catch (e) {
//       // Handle any errors
//       ScaffoldMessenger.of(context).showSnackBar(
//         SnackBar(content: Text("Error picking video: $e")),
//       );
//     }
//   }
//
//   // Function to add a new certificate
//   void _addCertificate() async {
//     String? selectedType; // Initialize as null
//     File? uploadedFile;
//     final _dialogFormKey = GlobalKey<FormState>(); // Form key for the dialog
//
//     await showDialog(
//       context: context,
//       builder: (context) {
//         return StatefulBuilder(builder: (context, setStateDialog) {
//           return AlertDialog(
//             title: Text("Add New Certificate"),
//             content: Form(
//               key: _dialogFormKey, // Assign the form key
//               child: SingleChildScrollView( // Ensures content is scrollable if overflow occurs
//                 child: Column(
//                   mainAxisSize: MainAxisSize.min,
//                   children: [
//                     DropdownButtonFormField<String>(
//                       value: selectedType,
//                       items: ["IELTS", "TOEFL", "Other"].map((cert) {
//                         return DropdownMenuItem(
//                           value: cert,
//                           child: Text(cert),
//                         );
//                       }).toList(),
//                       onChanged: (value) {
//                         setStateDialog(() {
//                           selectedType = value;
//                           if (value != "Other") {
//                             customTypeController.text = "";
//                           }
//                         });
//                       },
//                       decoration: InputDecoration(
//                         labelText: "Certificate Type",
//                         border: OutlineInputBorder(),
//                       ),
//                       validator: (value) {
//                         if (value == null || value.isEmpty) {
//                           return 'Please select a certification type';
//                         }
//                         return null;
//                       },
//                     ),
//                     SizedBox(height: 10),
//                     if (selectedType == "Other")
//                       TextFormField(
//                         controller: customTypeController,
//                         decoration: InputDecoration(
//                           labelText: "Enter Certification Type",
//                           border: OutlineInputBorder(),
//                         ),
//                         validator: (value) {
//                           if (selectedType == "Other") {
//                             if (value == null || value.trim().isEmpty) {
//                               return 'Please enter the certification type';
//                             }
//                           }
//                           return null;
//                         },
//                       ),
//                     SizedBox(height: 10),
//                     ElevatedButton(
//                       onPressed: () async {
//                         try {
//                           FilePickerResult? result = await FilePicker.platform.pickFiles(
//                             type: FileType.custom,
//                             allowedExtensions: ['pdf', 'doc', 'docx', 'jpg', 'png'],
//                           );
//                           if (result != null && result.files.single.path != null) {
//                             File selectedFile = File(result.files.single.path!);
//                             final fileSize = await selectedFile.length();
//                             if (fileSize > 64 * 1024 * 1024) { // 64 MB
//                               setStateDialog(() {
//                                 uploadedFile = null;
//                               });
//                               ScaffoldMessenger.of(context).showSnackBar(
//                                 SnackBar(content: Text("File size exceeds 64 MB.")),
//                               );
//                               return;
//                             }
//                             setStateDialog(() {
//                               uploadedFile = selectedFile;
//                             });
//                           }
//                         } catch (e) {
//                           // Handle any errors
//                           ScaffoldMessenger.of(context).showSnackBar(
//                             SnackBar(content: Text("Error picking file: $e")),
//                           );
//                         }
//                       },
//                       child: Text("Upload Certificate"),
//                       style: ElevatedButton.styleFrom(
//                         backgroundColor: Colors.blue, // Button background color
//                       ),
//                     ),
//                     SizedBox(height: 10),
//                     if (uploadedFile != null)
//                       Text(
//                         uploadedFile!.path.split('/').last,
//                         style: TextStyle(color: Colors.green),
//                       ),
//                   ],
//                 ),
//               ),
//             ),
//             actions: [
//               TextButton(
//                 onPressed: () {
//                   Navigator.of(context).pop();
//                 },
//                 child: Text(
//                   "Cancel",
//                   style: TextStyle(color: Colors.blue),
//                 ),
//               ),
//               ElevatedButton(
//                 onPressed: () {
//                   if (_dialogFormKey.currentState!.validate()) {
//                     if (uploadedFile != null) {
//                       String finalType = selectedType!;
//                       if (selectedType == "Other") {
//                         finalType = customTypeController.text.trim();
//                       }
//                       setState(() {
//                         certificates.add(Certificate(
//                             type: finalType, file: uploadedFile!));
//                       });
//                       Navigator.of(context).pop();
//                     } else {
//                       ScaffoldMessenger.of(context).showSnackBar(
//                         SnackBar(content: Text("Please upload a certificate file")),
//                       );
//                     }
//                   }
//                 },
//                 child: Text("Save"),
//                 style: ElevatedButton.styleFrom(
//                   backgroundColor: Colors.blue, // Button background color
//                 ),
//               ),
//             ],
//           );
//         });
//       },
//     );
//   }
//
//   // Function to delete a certificate
//   void _deleteCertificate(int index) {
//     setState(() {
//       certificates.removeAt(index);
//     });
//   }
//
//   // Function to pick Date of Birth
//   Future<void> _pickDateOfBirth() async {
//     DateTime initialDate = DateTime(1990);
//     DateTime firstDate = DateTime(1900);
//     DateTime lastDate = DateTime.now();
//
//     final DateTime? picked = await showDatePicker(
//       context: context,
//       initialDate: initialDate,
//       firstDate: firstDate,
//       lastDate: lastDate,
//     );
//
//     if (picked != null) {
//       setState(() {
//         dobController.text = "${picked.toLocal()}".split(' ')[0];
//       });
//     }
//   }
//
//   // Function to proceed to next step
//   void _nextStep() {
//     if (currentStep == ProfileStep.Profile) {
//       // Validate profile form
//       if (_formKey.currentState!.validate()) {
//         // Additional validations can be added here
//         setState(() {
//           currentStep = ProfileStep.VideoIntroduction;
//         });
//         ScaffoldMessenger.of(context).showSnackBar(
//           SnackBar(content: Text("Profile completed!")),
//         );
//       }
//     } else if (currentStep == ProfileStep.VideoIntroduction) {
//       if (videoFile != null) {
//         setState(() {
//           currentStep = ProfileStep.Approval;
//         });
//       } else {
//         ScaffoldMessenger.of(context).showSnackBar(
//           SnackBar(content: Text("Please upload a video introduction.")),
//         );
//       }
//     }
//   }
//
//   // Function to go back to previous step
//   void _backStep() {
//     if (currentStep == ProfileStep.VideoIntroduction) {
//       setState(() {
//         currentStep = ProfileStep.Profile;
//       });
//     } else if (currentStep == ProfileStep.Approval) {
//       setState(() {
//         currentStep = ProfileStep.VideoIntroduction;
//       });
//     }
//   }
//
//   @override
//   void dispose() {
//     // Dispose controllers
//     nameController.dispose();
//     fromController.dispose();
//     dobController.dispose();
//     interestsController.dispose();
//     educationController.dispose();
//     experienceController.dispose();
//     professionController.dispose();
//     instructionController.dispose();
//     languagesController.dispose();
//     customTypeController.dispose();
//     _videoController?.dispose();
//     super.dispose();
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: _buildAppBar(),
//       body: SingleChildScrollView(
//         padding: const EdgeInsets.all(16.0),
//         child: currentStep == ProfileStep.Profile
//             ? _buildProfileForm()
//             : currentStep == ProfileStep.VideoIntroduction
//             ? _buildVideoIntroduction()
//             : _buildApproval(),
//       ),
//     );
//   }
//
//   AppBar _buildAppBar() {
//     return AppBar(
//       title: const Text(
//         "Become a Tutor",
//         style: TextStyle(color: Colors.blue),
//       ),
//       backgroundColor: Colors.white,
//       centerTitle: true,
//       iconTheme: IconThemeData(color: Colors.blue),
//       elevation: 0,
//       leading: IconButton(
//         icon: Icon(Icons.arrow_back, color: Colors.blue),
//         onPressed: () {
//           Navigator.of(context).pop(); // Navigate back to Settings Page
//         },
//       ),
//     );
//   }
//
//   Widget _buildProfileForm() {
//     return Form(
//       key: _formKey,
//       child: Column(
//         crossAxisAlignment: CrossAxisAlignment.start,
//         children: [
//           // Progress Steps
//           _buildProgressSteps(),
//
//           const SizedBox(height: 20),
//
//           // Profile Image Upload
//           Center(
//             child: GestureDetector(
//               onTap: _pickProfileImage,
//               child: CircleAvatar(
//                 radius: 50,
//                 backgroundImage: profileImage != null
//                     ? FileImage(profileImage!)
//                     : AssetImage('assets/profile_placeholder.png') as ImageProvider,
//                 child: profileImage == null
//                     ? Icon(Icons.camera_alt, size: 50, color: Colors.white70)
//                     : null,
//               ),
//             ),
//           ),
//           const SizedBox(height: 10),
//           Center(
//             child: TextButton.icon(
//               onPressed: _pickProfileImage,
//               icon: Icon(Icons.upload, color: Colors.blue),
//               label: Text(
//                 "Upload Profile Image",
//                 style: TextStyle(color: Colors.blue),
//               ),
//             ),
//           ),
//
//           const SizedBox(height: 20),
//
//           // Form Title
//           const Text(
//             "Set up your tutor profile",
//             style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
//           ),
//           const SizedBox(height: 10),
//           const Text(
//             "Students will check your profile to decide whether to book a lesson with you. Please provide as much information as possible.",
//             style: TextStyle(fontSize: 14, color: Colors.grey),
//           ),
//           const SizedBox(height: 20),
//
//           // Basic Info Section
//           const Text(
//             "Basic Info",
//             style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
//           ),
//           const SizedBox(height: 10),
//           TextFormField(
//             controller: nameController,
//             decoration: const InputDecoration(
//               labelText: "Name",
//               border: OutlineInputBorder(),
//             ),
//             validator: (value) {
//               if (value == null || value.isEmpty) {
//                 return 'Please enter your name';
//               }
//               return null;
//             },
//           ),
//           const SizedBox(height: 10),
//           TextFormField(
//             controller: fromController,
//             decoration: const InputDecoration(
//               labelText: "From",
//               border: OutlineInputBorder(),
//             ),
//           ),
//           const SizedBox(height: 10),
//           GestureDetector(
//             onTap: _pickDateOfBirth,
//             child: AbsorbPointer(
//               child: TextFormField(
//                 controller: dobController,
//                 decoration: const InputDecoration(
//                   labelText: "Date of Birth",
//                   border: OutlineInputBorder(),
//                   suffixIcon: Icon(Icons.calendar_today),
//                 ),
//                 validator: (value) {
//                   if (value == null || value.isEmpty) {
//                     return 'Please select your date of birth';
//                   }
//                   return null;
//                 },
//               ),
//             ),
//           ),
//           const SizedBox(height: 20),
//
//           // CV Section
//           const Text(
//             "CV",
//             style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
//           ),
//           const SizedBox(height: 10),
//           TextFormField(
//             controller: interestsController,
//             decoration: const InputDecoration(
//               labelText: "Interests",
//               border: OutlineInputBorder(),
//             ),
//           ),
//           const SizedBox(height: 10),
//           TextFormField(
//             controller: educationController,
//             decoration: const InputDecoration(
//               labelText: "Education",
//               border: OutlineInputBorder(),
//             ),
//           ),
//           const SizedBox(height: 10),
//           TextFormField(
//             controller: experienceController,
//             decoration: const InputDecoration(
//               labelText: "Experience",
//               border: OutlineInputBorder(),
//             ),
//           ),
//           const SizedBox(height: 10),
//           TextFormField(
//             controller: professionController,
//             decoration: const InputDecoration(
//               labelText: "Current or Previous Profession",
//               border: OutlineInputBorder(),
//             ),
//           ),
//           const SizedBox(height: 20),
//
//           // Languages Section
//           const Text(
//             "Languages I Speak",
//             style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
//           ),
//           const SizedBox(height: 10),
//           TextFormField(
//             controller: languagesController,
//             decoration: const InputDecoration(
//               labelText: "Languages",
//               border: OutlineInputBorder(),
//             ),
//           ),
//           const SizedBox(height: 20),
//
//           // Teaching Section
//           const Text(
//             "Who I Teach",
//             style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
//           ),
//           const SizedBox(height: 10),
//           TextFormField(
//             controller: instructionController,
//             decoration: const InputDecoration(
//               labelText: "Instruction",
//               border: OutlineInputBorder(),
//             ),
//           ),
//           const SizedBox(height: 10),
//           const Text("I am best at teaching students who are:"),
//           CheckboxListTile(
//             value: beginnerChecked,
//             title: const Text("Beginner"),
//             onChanged: (value) {
//               setState(() {
//                 beginnerChecked = value!;
//               });
//             },
//           ),
//           CheckboxListTile(
//             value: intermediateChecked,
//             title: const Text("Intermediate"),
//             onChanged: (value) {
//               setState(() {
//                 intermediateChecked = value!;
//               });
//             },
//           ),
//           CheckboxListTile(
//             value: advancedChecked,
//             title: const Text("Advanced"),
//             onChanged: (value) {
//               setState(() {
//                 advancedChecked = value!;
//               });
//             },
//           ),
//           const SizedBox(height: 20),
//
//           // Certificates Section
//           const Text(
//             "Certificates",
//             style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
//           ),
//           const SizedBox(height: 10),
//           ElevatedButton.icon(
//             onPressed: _addCertificate,
//             icon: Icon(Icons.add, color: Colors.white),
//             label: Text(
//               "Add New Certificate",
//               style: TextStyle(color: Colors.white),
//             ),
//             style: ElevatedButton.styleFrom(
//               backgroundColor: Colors.blue, // Button background color
//             ),
//           ),
//           const SizedBox(height: 10),
//           certificates.isNotEmpty
//               ? DataTable(
//             columns: const [
//               DataColumn(label: Text("Certificate Type")),
//               DataColumn(label: Text("Certificate")),
//               DataColumn(label: Text("Action")),
//             ],
//             rows: List.generate(certificates.length, (index) {
//               return DataRow(cells: [
//                 DataCell(Text(certificates[index].type)),
//                 DataCell(Text(certificates[index].file.path.split('/').last)),
//                 DataCell(IconButton(
//                   icon: Icon(Icons.delete, color: Colors.red),
//                   onPressed: () => _deleteCertificate(index),
//                 )),
//               ]);
//             }),
//           )
//               : Text(
//             "No certificates added.",
//             style: TextStyle(color: Colors.grey),
//           ),
//           const SizedBox(height: 20),
//
//           // Save and Next Buttons
//           Row(
//             mainAxisAlignment: MainAxisAlignment.spaceBetween,
//             children: [
//               ElevatedButton(
//                 onPressed: () {
//                   // Implement Save functionality if separate from Next
//                   if (_formKey.currentState!.validate()) {
//                     ScaffoldMessenger.of(context).showSnackBar(
//                       const SnackBar(content: Text("Profile saved!")),
//                     );
//                   }
//                 },
//                 child: Text("Save"),
//                 style: ElevatedButton.styleFrom(
//                   backgroundColor: Colors.blue, // Button background color
//                 ),
//               ),
//               ElevatedButton(
//                 onPressed: _nextStep,
//                 child: Text("Next"),
//                 style: ElevatedButton.styleFrom(
//                   backgroundColor: Colors.blue, // Button background color
//                 ),
//               ),
//             ],
//           ),
//         ],
//       ),
//     );
//   }
//
//   Widget _buildProgressSteps() {
//     return Row(
//       mainAxisAlignment: MainAxisAlignment.center, // Center the entire Row
//       crossAxisAlignment: CrossAxisAlignment.center, // Center align vertically
//       children: [
//         // Complete Profile Step
//         Column(
//           children: [
//             CircleAvatar(
//               radius: 20, // Uniform size for all avatars
//               backgroundColor: currentStep == ProfileStep.Profile ||
//                   currentStep == ProfileStep.VideoIntroduction ||
//                   currentStep == ProfileStep.Approval
//                   ? Colors.blue
//                   : Colors.grey,
//               child: Icon(Icons.person, color: Colors.white, size: 20),
//             ),
//             SizedBox(height: 5),
//             Container(
//               width: 80, // Fixed width to prevent overflow
//               child: Text(
//                 "Complete\nProfile",
//                 style: TextStyle(
//                   fontSize: 12, // Reduced font size
//                   color: currentStep == ProfileStep.Profile ||
//                       currentStep == ProfileStep.VideoIntroduction ||
//                       currentStep == ProfileStep.Approval
//                       ? Colors.black
//                       : Colors.grey,
//                 ),
//                 textAlign: TextAlign.center, // Center-align the text
//                 overflow: TextOverflow.ellipsis,
//                 maxLines: 2,
//               ),
//             ),
//           ],
//         ),
//         SizedBox(width: 10), // Fixed spacing between Profile and line
//         // Connecting Line
//         Container(
//           width: 40, // Fixed width for connecting line
//           height: 2,
//           color: currentStep == ProfileStep.VideoIntroduction ||
//               currentStep == ProfileStep.Approval
//               ? Colors.blue
//               : Colors.grey,
//         ),
//         SizedBox(width: 10), // Fixed spacing between line and Video Introduction
//         // Video Introduction Step
//         Column(
//           children: [
//             CircleAvatar(
//               radius: 20, // Uniform size for all avatars
//               backgroundColor: currentStep == ProfileStep.VideoIntroduction ||
//                   currentStep == ProfileStep.Approval
//                   ? Colors.blue
//                   : Colors.grey,
//               child: Icon(Icons.videocam, color: Colors.white, size: 20),
//             ),
//             SizedBox(height: 5),
//             Container(
//               width: 80, // Fixed width to prevent overflow
//               child: Text(
//                 "Video\nIntroduction",
//                 style: TextStyle(
//                   fontSize: 12, // Reduced font size
//                   color: currentStep == ProfileStep.VideoIntroduction ||
//                       currentStep == ProfileStep.Approval
//                       ? Colors.black
//                       : Colors.grey,
//                 ),
//                 textAlign: TextAlign.center, // Center-align the text
//                 overflow: TextOverflow.ellipsis,
//                 maxLines: 2,
//               ),
//             ),
//           ],
//         ),
//         SizedBox(width: 10), // Fixed spacing between Video Introduction and line
//         // Connecting Line
//         Container(
//           width: 40, // Fixed width for connecting line
//           height: 2,
//           color: currentStep == ProfileStep.Approval
//               ? Colors.blue
//               : Colors.grey,
//         ),
//         SizedBox(width: 10), // Fixed spacing between line and Approval
//         // Approval Step
//         Column(
//           children: [
//             CircleAvatar(
//               radius: 20, // Uniform size for all avatars
//               backgroundColor: currentStep == ProfileStep.Approval
//                   ? Colors.blue
//                   : Colors.grey,
//               child: Icon(Icons.check, color: Colors.white, size: 20),
//             ),
//             SizedBox(height: 5),
//             Container(
//               width: 80, // Fixed width to prevent overflow
//               child: Text(
//                 "Approval\n", // Added newline for uniform height
//                 style: TextStyle(
//                   fontSize: 12, // Reduced font size
//                   color: currentStep == ProfileStep.Approval
//                       ? Colors.black
//                       : Colors.grey,
//                 ),
//                 textAlign: TextAlign.center, // Center-align the text
//                 overflow: TextOverflow.ellipsis,
//                 maxLines: 2, // Allow two lines even if the second is empty
//               ),
//             ),
//           ],
//         ),
//       ],
//     );
//   }
//
//   Widget _buildVideoIntroduction() {
//     return Column(
//       crossAxisAlignment: CrossAxisAlignment.start,
//       children: [
//         // Progress Steps
//         _buildProgressSteps(),
//
//         const SizedBox(height: 20),
//
//         const Text(
//           "Introduce Yourself",
//           style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
//         ),
//         const SizedBox(height: 10),
//         const Text(
//           "Let students know what they can expect from a lesson with you by recording a video highlighting your teaching style, expertise, and personality. Students can be nervous to speak with a foreigner, so it really helps to have a friendly video that introduces yourself and invites students to call you.",
//           style: TextStyle(fontSize: 14, color: Colors.grey),
//         ),
//         const SizedBox(height: 20),
//
//         const Text(
//           "A few helpful tips:",
//           style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
//         ),
//         const SizedBox(height: 5),
//         Column(
//           crossAxisAlignment: CrossAxisAlignment.start,
//           children: [
//             _buildTipItem("Find a clean and quiet space"),
//             _buildTipItem("Smile and look at the camera"),
//             _buildTipItem("Dress smart"),
//             _buildTipItem("Speak for 1-3 minutes"),
//             _buildTipItem("Brand yourself and have fun!"),
//           ],
//         ),
//         const SizedBox(height: 10),
//         const Text(
//           "Note: We only support uploading video files that are less than 64 MB in size.",
//           style: TextStyle(fontSize: 12, color: Colors.red),
//         ),
//         const SizedBox(height: 20),
//
//         // Choose Video Button
//         Center(
//           child: ElevatedButton.icon(
//             onPressed: _pickVideoFile,
//             icon: Icon(Icons.video_call, color: Colors.white),
//             label: Text(
//               "Choose Video",
//               style: TextStyle(color: Colors.white),
//             ),
//             style: ElevatedButton.styleFrom(
//               backgroundColor: Colors.blue, // Button background color
//             ),
//           ),
//         ),
//         if (videoFile != null && _videoController != null && _videoController!.value.isInitialized)
//           Column(
//             children: [
//               const SizedBox(height: 10),
//               // Video Player
//               AspectRatio(
//                 aspectRatio: _videoController!.value.aspectRatio,
//                 child: VideoPlayer(_videoController!),
//               ),
//               const SizedBox(height: 10),
//               // Video Controls
//               Row(
//                 mainAxisAlignment: MainAxisAlignment.center,
//                 children: [
//                   IconButton(
//                     icon: Icon(Icons.replay_10, color: Colors.blue),
//                     onPressed: () {
//                       final currentPosition = _videoController!.value.position;
//                       final newPosition = currentPosition - Duration(seconds: 10);
//                       _videoController!.seekTo(
//                         newPosition >= Duration.zero ? newPosition : Duration.zero,
//                       );
//                     },
//                   ),
//                   IconButton(
//                     icon: Icon(
//                       _videoController!.value.isPlaying ? Icons.pause : Icons.play_arrow,
//                       color: Colors.blue,
//                     ),
//                     onPressed: () {
//                       setState(() {
//                         if (_videoController!.value.isPlaying) {
//                           _videoController!.pause();
//                         } else {
//                           _videoController!.play();
//                         }
//                       });
//                     },
//                   ),
//                   IconButton(
//                     icon: Icon(Icons.forward_10, color: Colors.blue),
//                     onPressed: () {
//                       final currentPosition = _videoController!.value.position;
//                       final maxPosition = _videoController!.value.duration;
//                       final newPosition = currentPosition + Duration(seconds: 10);
//                       _videoController!.seekTo(
//                         newPosition <= maxPosition ? newPosition : maxPosition,
//                       );
//                     },
//                   ),
//                 ],
//               ),
//               VideoProgressIndicator(
//                 _videoController!,
//                 allowScrubbing: true,
//                 padding: EdgeInsets.symmetric(horizontal: 20.0),
//                 colors: VideoProgressColors(
//                   playedColor: Colors.blue,
//                   bufferedColor: Colors.grey,
//                   backgroundColor: Colors.grey.shade300,
//                 ),
//               ),
//             ],
//           ),
//         const SizedBox(height: 20),
//
//         // Back and Next Buttons
//         Row(
//           mainAxisAlignment: MainAxisAlignment.spaceBetween,
//           children: [
//             ElevatedButton(
//               onPressed: _backStep,
//               child: Text("Back"),
//               style: ElevatedButton.styleFrom(
//                 backgroundColor: Colors.blue, // Button background color
//               ),
//             ),
//             ElevatedButton(
//               onPressed: _nextStep,
//               child: Text("Next"),
//               style: ElevatedButton.styleFrom(
//                 backgroundColor: Colors.blue, // Button background color
//               ),
//             ),
//           ],
//         ),
//       ],
//     );
//   }
//
//   Widget _buildTipItem(String tip) {
//     return Row(
//       children: [
//         Icon(Icons.check, size: 16, color: Colors.green),
//         SizedBox(width: 5),
//         Expanded(child: Text(tip)),
//       ],
//     );
//   }
//
//   Widget _buildApproval() {
//     return Column(
//       crossAxisAlignment: CrossAxisAlignment.center,
//       children: [
//         // Progress Steps
//         _buildProgressSteps(),
//
//         const SizedBox(height: 50),
//
//         Icon(Icons.check_circle, color: Colors.green, size: 100),
//         const SizedBox(height: 20),
//         const Text(
//           "Congratulations!",
//           style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
//         ),
//         const SizedBox(height: 10),
//         const Text(
//           "Your application is being processed.",
//           style: TextStyle(fontSize: 16, color: Colors.grey),
//         ),
//         const SizedBox(height: 10),
//         const Text(
//           "You can now start receiving student bookings.",
//           style: TextStyle(fontSize: 16, color: Colors.grey),
//           textAlign: TextAlign.center,
//         ),
//
//         const SizedBox(height: 50),
//
//         // Optionally, you can add a button to go back or navigate elsewhere
//       ],
//     );
//   }
// }

// lib/pages/become_a_tutor.dart

// import 'dart:io';
//
// import 'package:flutter/material.dart';
// import 'package:image_picker/image_picker.dart';
// import 'package:file_picker/file_picker.dart';
// import 'package:video_player/video_player.dart';
//
// class BecomeATutorPage extends StatefulWidget {
//   @override
//   _BecomeATutorPageState createState() => _BecomeATutorPageState();
// }
//
// enum ProfileStep { Profile, VideoIntroduction, Approval }
//
// class Certificate {
//   String type;
//   File file;
//
//   Certificate({required this.type, required this.file});
// }
//
// class _BecomeATutorPageState extends State<BecomeATutorPage> {
//   final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
//
//   // Current Step
//   ProfileStep currentStep = ProfileStep.Profile;
//
//   // Controllers for form fields
//   final TextEditingController nameController = TextEditingController();
//   final TextEditingController fromController = TextEditingController();
//   final TextEditingController dobController = TextEditingController();
//   final TextEditingController interestsController = TextEditingController();
//   final TextEditingController educationController = TextEditingController();
//   final TextEditingController experienceController = TextEditingController();
//   final TextEditingController professionController = TextEditingController();
//   final TextEditingController instructionController = TextEditingController();
//   final TextEditingController languagesController = TextEditingController();
//
//   // Image and File Uploads
//   File? profileImage;
//
//   // Certificates
//   List<Certificate> certificates = [];
//
//   // Video Introduction
//   File? videoFile;
//   VideoPlayerController? _videoController;
//
//   // Checkbox States
//   bool beginnerChecked = false;
//   bool intermediateChecked = false;
//   bool advancedChecked = false;
//
//   // Video Playback State
//   bool isVideoPlaying = false;
//
//   // Additional Controller for Custom Certification Type
//   final TextEditingController customTypeController = TextEditingController();
//
//   final ImagePicker _imagePicker = ImagePicker();
//
//   // Function to pick profile image
//   Future<void> _pickProfileImage() async {
//     try {
//       final pickedFile = await _imagePicker.pickImage(source: ImageSource.gallery);
//       if (pickedFile != null) {
//         setState(() {
//           profileImage = File(pickedFile.path);
//         });
//       }
//     } catch (e) {
//       // Handle any errors
//       ScaffoldMessenger.of(context).showSnackBar(
//         SnackBar(content: Text("Error picking image: $e")),
//       );
//     }
//   }
//
//   // Function to pick video file
//   Future<void> _pickVideoFile() async {
//     try {
//       final pickedFile = await _imagePicker.pickVideo(source: ImageSource.gallery);
//       if (pickedFile != null) {
//         _videoController?.dispose();
//         _videoController = VideoPlayerController.file(File(pickedFile.path))
//           ..initialize().then((_) {
//             setState(() {
//               videoFile = File(pickedFile.path);
//               _videoController!.play();
//               isVideoPlaying = true;
//             });
//           });
//       }
//     } catch (e) {
//       // Handle any errors
//       ScaffoldMessenger.of(context).showSnackBar(
//         SnackBar(content: Text("Error picking video: $e")),
//       );
//     }
//   }
//
//   // Function to add a new certificate
//   void _addCertificate() async {
//     String? selectedType; // Initialize as null
//     File? uploadedFile;
//     final _dialogFormKey = GlobalKey<FormState>(); // Form key for the dialog
//
//     await showDialog(
//       context: context,
//       builder: (context) {
//         return StatefulBuilder(builder: (context, setStateDialog) {
//           return AlertDialog(
//             title: Text("Add New Certificate"),
//             content: Form(
//               key: _dialogFormKey, // Assign the form key
//               child: SingleChildScrollView( // Ensures content is scrollable if overflow occurs
//                 child: Column(
//                   mainAxisSize: MainAxisSize.min,
//                   children: [
//                     DropdownButtonFormField<String>(
//                       value: selectedType,
//                       items: ["IELTS", "TOEFL", "Other"].map((cert) {
//                         return DropdownMenuItem(
//                           value: cert,
//                           child: Text(cert),
//                         );
//                       }).toList(),
//                       onChanged: (value) {
//                         setStateDialog(() {
//                           selectedType = value;
//                           if (value != "Other") {
//                             customTypeController.text = "";
//                           }
//                         });
//                       },
//                       decoration: InputDecoration(
//                         labelText: "Certificate Type",
//                         border: OutlineInputBorder(),
//                       ),
//                       validator: (value) {
//                         if (value == null || value.isEmpty) {
//                           return 'Please select a certification type';
//                         }
//                         return null;
//                       },
//                     ),
//                     SizedBox(height: 10),
//                     if (selectedType == "Other")
//                       TextFormField(
//                         controller: customTypeController,
//                         decoration: InputDecoration(
//                           labelText: "Enter Certification Type",
//                           border: OutlineInputBorder(),
//                         ),
//                         validator: (value) {
//                           if (selectedType == "Other") {
//                             if (value == null || value.trim().isEmpty) {
//                               return 'Please enter the certification type';
//                             }
//                           }
//                           return null;
//                         },
//                       ),
//                     SizedBox(height: 10),
//                     ElevatedButton(
//                       onPressed: () async {
//                         try {
//                           FilePickerResult? result = await FilePicker.platform.pickFiles(
//                             type: FileType.custom,
//                             allowedExtensions: ['pdf', 'doc', 'docx', 'jpg', 'png'],
//                           );
//                           if (result != null && result.files.single.path != null) {
//                             File selectedFile = File(result.files.single.path!);
//                             final fileSize = await selectedFile.length();
//                             if (fileSize > 64 * 1024 * 1024) { // 64 MB
//                               setStateDialog(() {
//                                 uploadedFile = null;
//                               });
//                               ScaffoldMessenger.of(context).showSnackBar(
//                                 SnackBar(content: Text("File size exceeds 64 MB.")),
//                               );
//                               return;
//                             }
//                             setStateDialog(() {
//                               uploadedFile = selectedFile;
//                             });
//                           }
//                         } catch (e) {
//                           // Handle any errors
//                           ScaffoldMessenger.of(context).showSnackBar(
//                             SnackBar(content: Text("Error picking file: $e")),
//                           );
//                         }
//                       },
//                       child: Text("Upload Certificate"),
//                       style: ElevatedButton.styleFrom(
//                         backgroundColor: Colors.blue, // Button background color
//                       ),
//                     ),
//                     SizedBox(height: 10),
//                     if (uploadedFile != null)
//                       Text(
//                         uploadedFile!.path.split('/').last,
//                         style: TextStyle(color: Colors.green),
//                       ),
//                   ],
//                 ),
//               ),
//             ),
//             actions: [
//               TextButton(
//                 onPressed: () {
//                   Navigator.of(context).pop();
//                 },
//                 child: Text(
//                   "Cancel",
//                   style: TextStyle(color: Colors.blue),
//                 ),
//               ),
//               ElevatedButton(
//                 onPressed: () {
//                   if (_dialogFormKey.currentState!.validate()) {
//                     if (uploadedFile != null) {
//                       String finalType = selectedType!;
//                       if (selectedType == "Other") {
//                         finalType = customTypeController.text.trim();
//                       }
//                       setState(() {
//                         certificates.add(Certificate(
//                             type: finalType, file: uploadedFile!));
//                       });
//                       Navigator.of(context).pop();
//                     } else {
//                       ScaffoldMessenger.of(context).showSnackBar(
//                         SnackBar(content: Text("Please upload a certificate file")),
//                       );
//                     }
//                   }
//                 },
//                 child: Text("Save"),
//                 style: ElevatedButton.styleFrom(
//                   backgroundColor: Colors.blue, // Button background color
//                 ),
//               ),
//             ],
//           );
//         });
//       },
//     );
//   }
//
//   // Function to delete a certificate
//   void _deleteCertificate(int index) {
//     setState(() {
//       certificates.removeAt(index);
//     });
//   }
//
//   // Function to pick Date of Birth
//   Future<void> _pickDateOfBirth() async {
//     DateTime initialDate = DateTime(1990);
//     DateTime firstDate = DateTime(1900);
//     DateTime lastDate = DateTime.now();
//
//     final DateTime? picked = await showDatePicker(
//       context: context,
//       initialDate: initialDate,
//       firstDate: firstDate,
//       lastDate: lastDate,
//     );
//
//     if (picked != null) {
//       setState(() {
//         dobController.text = "${picked.toLocal()}".split(' ')[0];
//       });
//     }
//   }
//
//   // Function to proceed to next step
//   void _nextStep() {
//     if (currentStep == ProfileStep.Profile) {
//       // Validate profile form
//       if (_formKey.currentState!.validate()) {
//         // Check if profile image is uploaded
//         if (profileImage == null) {
//           ScaffoldMessenger.of(context).showSnackBar(
//             SnackBar(content: Text("Please upload a profile image.")),
//           );
//           return;
//         }
//
//         // Check if at least one teaching level is selected
//         if (!beginnerChecked && !intermediateChecked && !advancedChecked) {
//           ScaffoldMessenger.of(context).showSnackBar(
//             SnackBar(content: Text("Please select at least one teaching level.")),
//           );
//           return;
//         }
//
//         // Additional validations can be added here
//
//         setState(() {
//           currentStep = ProfileStep.VideoIntroduction;
//         });
//         ScaffoldMessenger.of(context).showSnackBar(
//           SnackBar(content: Text("Profile completed!")),
//         );
//       }
//     } else if (currentStep == ProfileStep.VideoIntroduction) {
//       if (videoFile != null) {
//         setState(() {
//           currentStep = ProfileStep.Approval;
//         });
//       } else {
//         ScaffoldMessenger.of(context).showSnackBar(
//           SnackBar(content: Text("Please upload a video introduction.")),
//         );
//       }
//     }
//   }
//
//   // Function to go back to previous step
//   void _backStep() {
//     if (currentStep == ProfileStep.VideoIntroduction) {
//       setState(() {
//         currentStep = ProfileStep.Profile;
//       });
//     } else if (currentStep == ProfileStep.Approval) {
//       setState(() {
//         currentStep = ProfileStep.VideoIntroduction;
//       });
//     }
//   }
//
//   @override
//   void dispose() {
//     // Dispose controllers
//     nameController.dispose();
//     fromController.dispose();
//     dobController.dispose();
//     interestsController.dispose();
//     educationController.dispose();
//     experienceController.dispose();
//     professionController.dispose();
//     instructionController.dispose();
//     languagesController.dispose();
//     customTypeController.dispose();
//     _videoController?.dispose();
//     super.dispose();
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: _buildAppBar(),
//       body: SingleChildScrollView(
//         padding: const EdgeInsets.all(16.0),
//         child: currentStep == ProfileStep.Profile
//             ? _buildProfileForm()
//             : currentStep == ProfileStep.VideoIntroduction
//             ? _buildVideoIntroduction()
//             : _buildApproval(),
//       ),
//     );
//   }
//
//   AppBar _buildAppBar() {
//     return AppBar(
//       title: const Text(
//         "Become a Tutor",
//         style: TextStyle(color: Colors.blue),
//       ),
//       backgroundColor: Colors.white,
//       centerTitle: true,
//       iconTheme: IconThemeData(color: Colors.blue),
//       elevation: 0,
//       leading: IconButton(
//         icon: Icon(Icons.arrow_back, color: Colors.blue),
//         onPressed: () {
//           Navigator.of(context).pop(); // Navigate back to Settings Page
//         },
//       ),
//     );
//   }
//
//   Widget _buildProfileForm() {
//     return Form(
//       key: _formKey,
//       child: Column(
//         crossAxisAlignment: CrossAxisAlignment.start,
//         children: [
//           // Progress Steps
//           _buildProgressSteps(),
//
//           const SizedBox(height: 20),
//
//           // Profile Image Upload
//           Center(
//             child: GestureDetector(
//               onTap: _pickProfileImage,
//               child: CircleAvatar(
//                 radius: 50,
//                 backgroundImage: profileImage != null
//                     ? FileImage(profileImage!)
//                     : AssetImage('assets/profile_placeholder.png') as ImageProvider,
//                 child: profileImage == null
//                     ? Icon(Icons.camera_alt, size: 50, color: Colors.white70)
//                     : null,
//               ),
//             ),
//           ),
//           const SizedBox(height: 10),
//           Center(
//             child: TextButton.icon(
//               onPressed: _pickProfileImage,
//               icon: Icon(Icons.upload, color: Colors.blue),
//               label: Text(
//                 "Upload Profile Image",
//                 style: TextStyle(color: Colors.blue),
//               ),
//             ),
//           ),
//
//           const SizedBox(height: 20),
//
//           // Form Title
//           const Text(
//             "Set up your tutor profile",
//             style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
//           ),
//           const SizedBox(height: 10),
//           const Text(
//             "Students will check your profile to decide whether to book a lesson with you. Please provide as much information as possible.",
//             style: TextStyle(fontSize: 14, color: Colors.grey),
//           ),
//           const SizedBox(height: 20),
//
//           // Basic Info Section
//           const Text(
//             "Basic Info",
//             style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
//           ),
//           const SizedBox(height: 10),
//           TextFormField(
//             controller: nameController,
//             decoration: const InputDecoration(
//               labelText: "Name *",
//               border: OutlineInputBorder(),
//             ),
//             validator: (value) {
//               if (value == null || value.isEmpty) {
//                 return 'Please enter your name';
//               }
//               return null;
//             },
//           ),
//           const SizedBox(height: 10),
//           TextFormField(
//             controller: fromController,
//             decoration: const InputDecoration(
//               labelText: "From *",
//               border: OutlineInputBorder(),
//             ),
//             validator: (value) {
//               if (value == null || value.isEmpty) {
//                 return 'Please enter your origin';
//               }
//               return null;
//             },
//           ),
//           const SizedBox(height: 10),
//           GestureDetector(
//             onTap: _pickDateOfBirth,
//             child: AbsorbPointer(
//               child: TextFormField(
//                 controller: dobController,
//                 decoration: const InputDecoration(
//                   labelText: "Date of Birth *",
//                   border: OutlineInputBorder(),
//                   suffixIcon: Icon(Icons.calendar_today),
//                 ),
//                 validator: (value) {
//                   if (value == null || value.isEmpty) {
//                     return 'Please select your date of birth';
//                   }
//                   return null;
//                 },
//               ),
//             ),
//           ),
//           const SizedBox(height: 20),
//
//           // CV Section
//           const Text(
//             "CV",
//             style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
//           ),
//           const SizedBox(height: 10),
//           TextFormField(
//             controller: interestsController,
//             decoration: const InputDecoration(
//               labelText: "Interests *",
//               border: OutlineInputBorder(),
//             ),
//             validator: (value) {
//               if (value == null || value.isEmpty) {
//                 return 'Please enter your interests';
//               }
//               return null;
//             },
//           ),
//           const SizedBox(height: 10),
//           TextFormField(
//             controller: educationController,
//             decoration: const InputDecoration(
//               labelText: "Education *",
//               border: OutlineInputBorder(),
//             ),
//             validator: (value) {
//               if (value == null || value.isEmpty) {
//                 return 'Please enter your education details';
//               }
//               return null;
//             },
//           ),
//           const SizedBox(height: 10),
//           TextFormField(
//             controller: experienceController,
//             decoration: const InputDecoration(
//               labelText: "Experience *",
//               border: OutlineInputBorder(),
//             ),
//             validator: (value) {
//               if (value == null || value.isEmpty) {
//                 return 'Please enter your experience';
//               }
//               return null;
//             },
//           ),
//           const SizedBox(height: 10),
//           TextFormField(
//             controller: professionController,
//             decoration: const InputDecoration(
//               labelText: "Current or Previous Profession *",
//               border: OutlineInputBorder(),
//             ),
//             validator: (value) {
//               if (value == null || value.isEmpty) {
//                 return 'Please enter your profession';
//               }
//               return null;
//             },
//           ),
//           const SizedBox(height: 20),
//
//           // Languages Section
//           const Text(
//             "Languages I Speak",
//             style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
//           ),
//           const SizedBox(height: 10),
//           TextFormField(
//             controller: languagesController,
//             decoration: const InputDecoration(
//               labelText: "Languages *",
//               border: OutlineInputBorder(),
//             ),
//             validator: (value) {
//               if (value == null || value.isEmpty) {
//                 return 'Please enter the languages you speak';
//               }
//               return null;
//             },
//           ),
//           const SizedBox(height: 20),
//
//           // Teaching Section
//           const Text(
//             "Who I Teach",
//             style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
//           ),
//           const SizedBox(height: 10),
//           TextFormField(
//             controller: instructionController,
//             decoration: const InputDecoration(
//               labelText: "Instruction *",
//               border: OutlineInputBorder(),
//             ),
//             validator: (value) {
//               if (value == null || value.isEmpty) {
//                 return 'Please enter your teaching instructions';
//               }
//               return null;
//             },
//           ),
//           const SizedBox(height: 10),
//           const Text("I am best at teaching students who are:"),
//           CheckboxListTile(
//             value: beginnerChecked,
//             title: const Text("Beginner"),
//             onChanged: (value) {
//               setState(() {
//                 beginnerChecked = value!;
//               });
//             },
//           ),
//           CheckboxListTile(
//             value: intermediateChecked,
//             title: const Text("Intermediate"),
//             onChanged: (value) {
//               setState(() {
//                 intermediateChecked = value!;
//               });
//             },
//           ),
//           CheckboxListTile(
//             value: advancedChecked,
//             title: const Text("Advanced"),
//             onChanged: (value) {
//               setState(() {
//                 advancedChecked = value!;
//               });
//             },
//           ),
//           // Validate that at least one checkbox is selected
//           if (!beginnerChecked && !intermediateChecked && !advancedChecked)
//             Padding(
//               padding: const EdgeInsets.symmetric(horizontal: 16.0),
//               child: Text(
//                 'Please select at least one teaching level.',
//                 style: TextStyle(color: Colors.red[700], fontSize: 12),
//               ),
//             ),
//           const SizedBox(height: 20),
//
//           // Certificates Section
//           const Text(
//             "Certificates",
//             style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
//           ),
//           const SizedBox(height: 10),
//           ElevatedButton.icon(
//             onPressed: _addCertificate,
//             icon: Icon(Icons.add, color: Colors.white),
//             label: Text(
//               "Add New Certificate",
//               style: TextStyle(color: Colors.white),
//             ),
//             style: ElevatedButton.styleFrom(
//               backgroundColor: Colors.blue, // Button background color
//             ),
//           ),
//           const SizedBox(height: 10),
//           certificates.isNotEmpty
//               ? DataTable(
//             columns: const [
//               DataColumn(label: Text("Certificate Type")),
//               DataColumn(label: Text("Certificate")),
//               DataColumn(label: Text("Action")),
//             ],
//             rows: List.generate(certificates.length, (index) {
//               return DataRow(cells: [
//                 DataCell(Text(certificates[index].type)),
//                 DataCell(Text(certificates[index].file.path.split('/').last)),
//                 DataCell(IconButton(
//                   icon: Icon(Icons.delete, color: Colors.red),
//                   onPressed: () => _deleteCertificate(index),
//                 )),
//               ]);
//             }),
//           )
//               : Text(
//             "No certificates added.",
//             style: TextStyle(color: Colors.grey),
//           ),
//           const SizedBox(height: 20),
//
//           // Save and Next Buttons
//           Row(
//             mainAxisAlignment: MainAxisAlignment.spaceBetween,
//             children: [
//               ElevatedButton(
//                 onPressed: () {
//                   // Implement Save functionality if separate from Next
//                   if (_formKey.currentState!.validate()) {
//                     // Check if profile image is uploaded
//                     if (profileImage == null) {
//                       ScaffoldMessenger.of(context).showSnackBar(
//                         SnackBar(content: Text("Please upload a profile image.")),
//                       );
//                       return;
//                     }
//
//                     // Check if at least one teaching level is selected
//                     if (!beginnerChecked && !intermediateChecked && !advancedChecked) {
//                       ScaffoldMessenger.of(context).showSnackBar(
//                         SnackBar(content: Text("Please select at least one teaching level.")),
//                       );
//                       return;
//                     }
//
//                     ScaffoldMessenger.of(context).showSnackBar(
//                       const SnackBar(content: Text("Profile saved!")),
//                     );
//                   }
//                 },
//                 child: Text("Save"),
//                 style: ElevatedButton.styleFrom(
//                   backgroundColor: Colors.blue, // Button background color
//                 ),
//               ),
//               ElevatedButton(
//                 onPressed: _nextStep,
//                 child: Text("Next"),
//                 style: ElevatedButton.styleFrom(
//                   backgroundColor: Colors.blue, // Button background color
//                 ),
//               ),
//             ],
//           ),
//         ],
//       ),
//     );
//   }
//
//   Widget _buildProgressSteps() {
//     return Row(
//       mainAxisAlignment: MainAxisAlignment.center, // Center the entire Row
//       crossAxisAlignment: CrossAxisAlignment.center, // Center align vertically
//       children: [
//         // Complete Profile Step
//         Column(
//           children: [
//             CircleAvatar(
//               radius: 20, // Uniform size for all avatars
//               backgroundColor: currentStep == ProfileStep.Profile ||
//                   currentStep == ProfileStep.VideoIntroduction ||
//                   currentStep == ProfileStep.Approval
//                   ? Colors.blue
//                   : Colors.grey,
//               child: Icon(Icons.person, color: Colors.white, size: 20),
//             ),
//             SizedBox(height: 5),
//             Container(
//               width: 80, // Fixed width to prevent overflow
//               child: Text(
//                 "Complete\nProfile",
//                 style: TextStyle(
//                   fontSize: 12, // Reduced font size
//                   color: currentStep == ProfileStep.Profile ||
//                       currentStep == ProfileStep.VideoIntroduction ||
//                       currentStep == ProfileStep.Approval
//                       ? Colors.black
//                       : Colors.grey,
//                 ),
//                 textAlign: TextAlign.center, // Center-align the text
//                 overflow: TextOverflow.ellipsis,
//                 maxLines: 2,
//               ),
//             ),
//           ],
//         ),
//         SizedBox(width: 10), // Fixed spacing between Profile and line
//         // Connecting Line
//         Container(
//           width: 40, // Fixed width for connecting line
//           height: 2,
//           color: currentStep == ProfileStep.VideoIntroduction ||
//               currentStep == ProfileStep.Approval
//               ? Colors.blue
//               : Colors.grey,
//         ),
//         SizedBox(width: 10), // Fixed spacing between line and Video Introduction
//         // Video Introduction Step
//         Column(
//           children: [
//             CircleAvatar(
//               radius: 20, // Uniform size for all avatars
//               backgroundColor: currentStep == ProfileStep.VideoIntroduction ||
//                   currentStep == ProfileStep.Approval
//                   ? Colors.blue
//                   : Colors.grey,
//               child: Icon(Icons.videocam, color: Colors.white, size: 20),
//             ),
//             SizedBox(height: 5),
//             Container(
//               width: 80, // Fixed width to prevent overflow
//               child: Text(
//                 "Video\nIntroduction",
//                 style: TextStyle(
//                   fontSize: 12, // Reduced font size
//                   color: currentStep == ProfileStep.VideoIntroduction ||
//                       currentStep == ProfileStep.Approval
//                       ? Colors.black
//                       : Colors.grey,
//                 ),
//                 textAlign: TextAlign.center, // Center-align the text
//                 overflow: TextOverflow.ellipsis,
//                 maxLines: 2,
//               ),
//             ),
//           ],
//         ),
//         SizedBox(width: 10), // Fixed spacing between Video Introduction and line
//         // Connecting Line
//         Container(
//           width: 40, // Fixed width for connecting line
//           height: 2,
//           color: currentStep == ProfileStep.Approval
//               ? Colors.blue
//               : Colors.grey,
//         ),
//         SizedBox(width: 10), // Fixed spacing between line and Approval
//         // Approval Step
//         Column(
//           children: [
//             CircleAvatar(
//               radius: 20, // Uniform size for all avatars
//               backgroundColor: currentStep == ProfileStep.Approval
//                   ? Colors.blue
//                   : Colors.grey,
//               child: Icon(Icons.check, color: Colors.white, size: 20),
//             ),
//             SizedBox(height: 5),
//             Container(
//               width: 80, // Fixed width to prevent overflow
//               child: Text(
//                 "Approval\n", // Added newline for uniform height
//                 style: TextStyle(
//                   fontSize: 12, // Reduced font size
//                   color: currentStep == ProfileStep.Approval
//                       ? Colors.black
//                       : Colors.grey,
//                 ),
//                 textAlign: TextAlign.center, // Center-align the text
//                 overflow: TextOverflow.ellipsis,
//                 maxLines: 2, // Allow two lines even if the second is empty
//               ),
//             ),
//           ],
//         ),
//       ],
//     );
//   }
//
//   Widget _buildVideoIntroduction() {
//     return Column(
//       crossAxisAlignment: CrossAxisAlignment.start,
//       children: [
//         // Progress Steps
//         _buildProgressSteps(),
//
//         const SizedBox(height: 20),
//
//         const Text(
//           "Introduce Yourself",
//           style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
//         ),
//         const SizedBox(height: 10),
//         const Text(
//           "Let students know what they can expect from a lesson with you by recording a video highlighting your teaching style, expertise, and personality. Students can be nervous to speak with a foreigner, so it really helps to have a friendly video that introduces yourself and invites students to call you.",
//           style: TextStyle(fontSize: 14, color: Colors.grey),
//         ),
//         const SizedBox(height: 20),
//
//         const Text(
//           "A few helpful tips:",
//           style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
//         ),
//         const SizedBox(height: 5),
//         Column(
//           crossAxisAlignment: CrossAxisAlignment.start,
//           children: [
//             _buildTipItem("Find a clean and quiet space"),
//             _buildTipItem("Smile and look at the camera"),
//             _buildTipItem("Dress smart"),
//             _buildTipItem("Speak for 1-3 minutes"),
//             _buildTipItem("Brand yourself and have fun!"),
//           ],
//         ),
//         const SizedBox(height: 10),
//         const Text(
//           "Note: We only support uploading video files that are less than 64 MB in size.",
//           style: TextStyle(fontSize: 12, color: Colors.red),
//         ),
//         const SizedBox(height: 20),
//
//         // Choose Video Button
//         Center(
//           child: ElevatedButton.icon(
//             onPressed: _pickVideoFile,
//             icon: Icon(Icons.video_call, color: Colors.white),
//             label: Text(
//               "Choose Video",
//               style: TextStyle(color: Colors.white),
//             ),
//             style: ElevatedButton.styleFrom(
//               backgroundColor: Colors.blue, // Button background color
//             ),
//           ),
//         ),
//         if (videoFile != null && _videoController != null && _videoController!.value.isInitialized)
//           Column(
//             children: [
//               const SizedBox(height: 10),
//               // Video Player
//               AspectRatio(
//                 aspectRatio: _videoController!.value.aspectRatio,
//                 child: VideoPlayer(_videoController!),
//               ),
//               const SizedBox(height: 10),
//               // Video Controls
//               Row(
//                 mainAxisAlignment: MainAxisAlignment.center,
//                 children: [
//                   IconButton(
//                     icon: Icon(Icons.replay_10, color: Colors.blue),
//                     onPressed: () {
//                       final currentPosition = _videoController!.value.position;
//                       final newPosition = currentPosition - Duration(seconds: 10);
//                       _videoController!.seekTo(
//                         newPosition >= Duration.zero ? newPosition : Duration.zero,
//                       );
//                     },
//                   ),
//                   IconButton(
//                     icon: Icon(
//                       _videoController!.value.isPlaying ? Icons.pause : Icons.play_arrow,
//                       color: Colors.blue,
//                     ),
//                     onPressed: () {
//                       setState(() {
//                         if (_videoController!.value.isPlaying) {
//                           _videoController!.pause();
//                         } else {
//                           _videoController!.play();
//                         }
//                       });
//                     },
//                   ),
//                   IconButton(
//                     icon: Icon(Icons.forward_10, color: Colors.blue),
//                     onPressed: () {
//                       final currentPosition = _videoController!.value.position;
//                       final maxPosition = _videoController!.value.duration;
//                       final newPosition = currentPosition + Duration(seconds: 10);
//                       _videoController!.seekTo(
//                         newPosition <= maxPosition ? newPosition : maxPosition,
//                       );
//                     },
//                   ),
//                 ],
//               ),
//               VideoProgressIndicator(
//                 _videoController!,
//                 allowScrubbing: true,
//                 padding: EdgeInsets.symmetric(horizontal: 20.0),
//                 colors: VideoProgressColors(
//                   playedColor: Colors.blue,
//                   bufferedColor: Colors.grey,
//                   backgroundColor: Colors.grey.shade300,
//                 ),
//               ),
//             ],
//           ),
//         const SizedBox(height: 20),
//
//         // Back and Next Buttons
//         Row(
//           mainAxisAlignment: MainAxisAlignment.spaceBetween,
//           children: [
//             ElevatedButton(
//               onPressed: _backStep,
//               child: Text("Back"),
//               style: ElevatedButton.styleFrom(
//                 backgroundColor: Colors.blue, // Button background color
//               ),
//             ),
//             ElevatedButton(
//               onPressed: _nextStep,
//               child: Text("Next"),
//               style: ElevatedButton.styleFrom(
//                 backgroundColor: Colors.blue, // Button background color
//               ),
//             ),
//           ],
//         ),
//       ],
//     );
//   }
//
//   Widget _buildTipItem(String tip) {
//     return Row(
//       children: [
//         Icon(Icons.check, size: 16, color: Colors.green),
//         SizedBox(width: 5),
//         Expanded(child: Text(tip)),
//       ],
//     );
//   }
//
//   Widget _buildApproval() {
//     return Column(
//       crossAxisAlignment: CrossAxisAlignment.center,
//       children: [
//         // Progress Steps
//         _buildProgressSteps(),
//
//         const SizedBox(height: 50),
//
//         Icon(Icons.check_circle, color: Colors.green, size: 100),
//         const SizedBox(height: 20),
//         const Text(
//           "Congratulations!",
//           style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
//         ),
//         const SizedBox(height: 10),
//         const Text(
//           "Your application is being processed.",
//           style: TextStyle(fontSize: 16, color: Colors.grey),
//         ),
//         const SizedBox(height: 10),
//         const Text(
//           "You can now start receiving student bookings.",
//           style: TextStyle(fontSize: 16, color: Colors.grey),
//           textAlign: TextAlign.center,
//         ),
//
//         const SizedBox(height: 50),
//
//         // Optionally, you can add a button to go back or navigate elsewhere
//       ],
//     );
//   }
// }

// import 'dart:io';
//
// import 'package:flutter/material.dart';
// import 'package:image_picker/image_picker.dart';
// import 'package:file_picker/file_picker.dart';
// import 'package:video_player/video_player.dart';
//
// class BecomeATutorPage extends StatefulWidget {
//   @override
//   _BecomeATutorPageState createState() => _BecomeATutorPageState();
// }
//
// enum ProfileStep { Profile, VideoIntroduction, Approval }
//
// class Certificate {
//   String type;
//   File file;
//
//   Certificate({required this.type, required this.file});
// }
//
// class _BecomeATutorPageState extends State<BecomeATutorPage> {
//   final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
//
//   // Current Step
//   ProfileStep currentStep = ProfileStep.Profile;
//
//   // Controllers for form fields
//   final TextEditingController nameController = TextEditingController();
//   final TextEditingController fromController = TextEditingController();
//   final TextEditingController dobController = TextEditingController();
//   final TextEditingController interestsController = TextEditingController();
//   final TextEditingController educationController = TextEditingController();
//   final TextEditingController experienceController = TextEditingController();
//   final TextEditingController professionController = TextEditingController();
//   final TextEditingController instructionController = TextEditingController();
//   final TextEditingController languagesController = TextEditingController();
//
//   // Image and File Uploads
//   File? profileImage;
//
//   // Certificates
//   List<Certificate> certificates = [];
//
//   // Video Introduction
//   File? videoFile;
//   VideoPlayerController? _videoController;
//
//   // Checkbox States
//   bool beginnerChecked = false;
//   bool intermediateChecked = false;
//   bool advancedChecked = false;
//
//   // Video Playback State
//   bool isVideoPlaying = false;
//
//   // Additional Controller for Custom Certification Type
//   final TextEditingController customTypeController = TextEditingController();
//
//   final ImagePicker _imagePicker = ImagePicker();
//
//   // Function to pick profile image
//   Future<void> _pickProfileImage() async {
//     try {
//       final pickedFile = await _imagePicker.pickImage(source: ImageSource.gallery);
//       if (pickedFile != null) {
//         setState(() {
//           profileImage = File(pickedFile.path);
//         });
//       }
//     } catch (e) {
//       // Handle any errors
//       ScaffoldMessenger.of(context).showSnackBar(
//         SnackBar(content: Text("Error picking image: $e")),
//       );
//     }
//   }
//
//   // Function to pick video file
//   Future<void> _pickVideoFile() async {
//     try {
//       final pickedFile = await _imagePicker.pickVideo(source: ImageSource.gallery);
//       if (pickedFile != null) {
//         _videoController?.dispose();
//         _videoController = VideoPlayerController.file(File(pickedFile.path))
//           ..initialize().then((_) {
//             setState(() {
//               videoFile = File(pickedFile.path);
//               _videoController!.play();
//               isVideoPlaying = true;
//             });
//           });
//       }
//     } catch (e) {
//       // Handle any errors
//       ScaffoldMessenger.of(context).showSnackBar(
//         SnackBar(content: Text("Error picking video: $e")),
//       );
//     }
//   }
//
//   // Function to add a new certificate
//   void _addCertificate() async {
//     String? selectedType; // Initialize as null
//     File? uploadedFile;
//     final _dialogFormKey = GlobalKey<FormState>(); // Form key for the dialog
//
//     await showDialog(
//       context: context,
//       builder: (context) {
//         return StatefulBuilder(builder: (context, setStateDialog) {
//           return AlertDialog(
//             title: Text("Add New Certificate"),
//             content: Form(
//               key: _dialogFormKey, // Assign the form key
//               child: SingleChildScrollView( // Ensures content is scrollable if overflow occurs
//                 child: Column(
//                   mainAxisSize: MainAxisSize.min,
//                   children: [
//                     DropdownButtonFormField<String>(
//                       value: selectedType,
//                       items: ["IELTS", "TOEFL", "Other"].map((cert) {
//                         return DropdownMenuItem(
//                           value: cert,
//                           child: Text(cert),
//                         );
//                       }).toList(),
//                       onChanged: (value) {
//                         setStateDialog(() {
//                           selectedType = value;
//                           if (value != "Other") {
//                             customTypeController.text = "";
//                           }
//                         });
//                       },
//                       decoration: InputDecoration(
//                         labelText: "Certificate Type",
//                         border: OutlineInputBorder(),
//                       ),
//                       validator: (value) {
//                         if (value == null || value.isEmpty) {
//                           return 'Please select a certification type';
//                         }
//                         return null;
//                       },
//                     ),
//                     SizedBox(height: 10),
//                     if (selectedType == "Other")
//                       TextFormField(
//                         controller: customTypeController,
//                         decoration: InputDecoration(
//                           labelText: "Enter Certification Type",
//                           border: OutlineInputBorder(),
//                         ),
//                         validator: (value) {
//                           if (selectedType == "Other") {
//                             if (value == null || value.trim().isEmpty) {
//                               return 'Please enter the certification type';
//                             }
//                           }
//                           return null;
//                         },
//                       ),
//                     SizedBox(height: 10),
//                     ElevatedButton(
//                       onPressed: () async {
//                         try {
//                           FilePickerResult? result = await FilePicker.platform.pickFiles(
//                             type: FileType.custom,
//                             allowedExtensions: ['pdf', 'doc', 'docx', 'jpg', 'png'],
//                           );
//                           if (result != null && result.files.single.path != null) {
//                             File selectedFile = File(result.files.single.path!);
//                             final fileSize = await selectedFile.length();
//                             if (fileSize > 64 * 1024 * 1024) { // 64 MB
//                               setStateDialog(() {
//                                 uploadedFile = null;
//                               });
//                               ScaffoldMessenger.of(context).showSnackBar(
//                                 SnackBar(content: Text("File size exceeds 64 MB.")),
//                               );
//                               return;
//                             }
//                             setStateDialog(() {
//                               uploadedFile = selectedFile;
//                             });
//                           }
//                         } catch (e) {
//                           // Handle any errors
//                           ScaffoldMessenger.of(context).showSnackBar(
//                             SnackBar(content: Text("Error picking file: $e")),
//                           );
//                         }
//                       },
//                       child: Text("Upload Certificate"),
//                       style: ElevatedButton.styleFrom(
//                         backgroundColor: Colors.blue, // Button background color
//                       ),
//                     ),
//                     SizedBox(height: 10),
//                     if (uploadedFile != null)
//                       Text(
//                         uploadedFile!.path.split('/').last,
//                         style: TextStyle(color: Colors.green),
//                       ),
//                   ],
//                 ),
//               ),
//             ),
//             actions: [
//               TextButton(
//                 onPressed: () {
//                   Navigator.of(context).pop();
//                 },
//                 child: Text(
//                   "Cancel",
//                   style: TextStyle(color: Colors.blue),
//                 ),
//               ),
//               ElevatedButton(
//                 onPressed: () {
//                   if (_dialogFormKey.currentState!.validate()) {
//                     if (uploadedFile != null) {
//                       String finalType = selectedType!;
//                       if (selectedType == "Other") {
//                         finalType = customTypeController.text.trim();
//                       }
//                       setState(() {
//                         certificates.add(Certificate(
//                             type: finalType, file: uploadedFile!));
//                       });
//                       Navigator.of(context).pop();
//                       ScaffoldMessenger.of(context).showSnackBar(
//                         SnackBar(content: Text("Certificate added successfully.")),
//                       );
//                     } else {
//                       ScaffoldMessenger.of(context).showSnackBar(
//                         SnackBar(content: Text("Please upload a certificate file")),
//                       );
//                     }
//                   }
//                 },
//                 child: Text("Save"),
//                 style: ElevatedButton.styleFrom(
//                   backgroundColor: Colors.blue, // Button background color
//                 ),
//               ),
//             ],
//           );
//         });
//       },
//     );
//   }
//
//   // Function to delete a certificate with confirmation
//   void _deleteCertificate(int index) {
//     showDialog(
//       context: context,
//       builder: (context) {
//         return AlertDialog(
//           title: Text("Delete Certificate"),
//           content: Text("Are you sure you want to delete this certificate?"),
//           actions: [
//             TextButton(
//               child: Text(
//                 "Cancel",
//                 style: TextStyle(color: Colors.blue),
//               ),
//               onPressed: () {
//                 Navigator.of(context).pop(); // Close the dialog
//               },
//             ),
//             ElevatedButton(
//               child: Text("Delete"),
//               style: ElevatedButton.styleFrom(
//                 backgroundColor: Colors.red, // Red color for delete action
//               ),
//               onPressed: () {
//                 setState(() {
//                   certificates.removeAt(index);
//                 });
//                 Navigator.of(context).pop(); // Close the dialog
//                 ScaffoldMessenger.of(context).showSnackBar(
//                   SnackBar(content: Text("Certificate deleted successfully.")),
//                 );
//               },
//             ),
//           ],
//         );
//       },
//     );
//   }
//
//   // Function to pick Date of Birth
//   Future<void> _pickDateOfBirth() async {
//     DateTime initialDate = DateTime(1990);
//     DateTime firstDate = DateTime(1900);
//     DateTime lastDate = DateTime.now();
//
//     final DateTime? picked = await showDatePicker(
//       context: context,
//       initialDate: initialDate,
//       firstDate: firstDate,
//       lastDate: lastDate,
//     );
//
//     if (picked != null) {
//       setState(() {
//         dobController.text = "${picked.toLocal()}".split(' ')[0];
//       });
//     }
//   }
//
//   // Function to proceed to next step
//   void _nextStep() {
//     if (currentStep == ProfileStep.Profile) {
//       // Validate profile form
//       if (_formKey.currentState!.validate()) {
//         // Check if profile image is uploaded
//         if (profileImage == null) {
//           ScaffoldMessenger.of(context).showSnackBar(
//             SnackBar(content: Text("Please upload a profile image.")),
//           );
//           return;
//         }
//
//         // Check if at least one teaching level is selected
//         if (!beginnerChecked && !intermediateChecked && !advancedChecked) {
//           ScaffoldMessenger.of(context).showSnackBar(
//             SnackBar(content: Text("Please select at least one teaching level.")),
//           );
//           return;
//         }
//
//         // Additional validations can be added here
//
//         setState(() {
//           currentStep = ProfileStep.VideoIntroduction;
//         });
//         ScaffoldMessenger.of(context).showSnackBar(
//           SnackBar(content: Text("Profile completed!")),
//         );
//       }
//     } else if (currentStep == ProfileStep.VideoIntroduction) {
//       if (videoFile != null) {
//         setState(() {
//           currentStep = ProfileStep.Approval;
//         });
//       } else {
//         ScaffoldMessenger.of(context).showSnackBar(
//           SnackBar(content: Text("Please upload a video introduction.")),
//         );
//       }
//     }
//   }
//
//   // Function to go back to previous step
//   void _backStep() {
//     if (currentStep == ProfileStep.VideoIntroduction) {
//       setState(() {
//         currentStep = ProfileStep.Profile;
//       });
//     } else if (currentStep == ProfileStep.Approval) {
//       setState(() {
//         currentStep = ProfileStep.VideoIntroduction;
//       });
//     }
//   }
//
//   @override
//   void dispose() {
//     // Dispose controllers
//     nameController.dispose();
//     fromController.dispose();
//     dobController.dispose();
//     interestsController.dispose();
//     educationController.dispose();
//     experienceController.dispose();
//     professionController.dispose();
//     instructionController.dispose();
//     languagesController.dispose();
//     customTypeController.dispose();
//     _videoController?.dispose();
//     super.dispose();
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: _buildAppBar(),
//       body: SingleChildScrollView(
//         padding: const EdgeInsets.all(16.0),
//         child: currentStep == ProfileStep.Profile
//             ? _buildProfileForm()
//             : currentStep == ProfileStep.VideoIntroduction
//             ? _buildVideoIntroduction()
//             : _buildApproval(),
//       ),
//     );
//   }
//
//   AppBar _buildAppBar() {
//     return AppBar(
//       title: const Text(
//         "Become a Tutor",
//         style: TextStyle(color: Colors.blue),
//       ),
//       backgroundColor: Colors.white,
//       centerTitle: true,
//       iconTheme: IconThemeData(color: Colors.blue),
//       elevation: 0,
//       leading: IconButton(
//         icon: Icon(Icons.arrow_back, color: Colors.blue),
//         onPressed: () {
//           Navigator.of(context).pop(); // Navigate back to Settings Page
//         },
//       ),
//     );
//   }
//
//   Widget _buildProfileForm() {
//     return Form(
//       key: _formKey,
//       child: Column(
//         crossAxisAlignment: CrossAxisAlignment.start,
//         children: [
//           // Progress Steps
//           _buildProgressSteps(),
//
//           const SizedBox(height: 20),
//
//           // Profile Image Upload
//           Center(
//             child: GestureDetector(
//               onTap: _pickProfileImage,
//               child: CircleAvatar(
//                 radius: 50,
//                 backgroundImage: profileImage != null
//                     ? FileImage(profileImage!)
//                     : AssetImage('assets/profile_placeholder.png') as ImageProvider,
//                 child: profileImage == null
//                     ? Icon(Icons.camera_alt, size: 50, color: Colors.white70)
//                     : null,
//               ),
//             ),
//           ),
//           const SizedBox(height: 10),
//           Center(
//             child: TextButton.icon(
//               onPressed: _pickProfileImage,
//               icon: Icon(Icons.upload, color: Colors.blue),
//               label: Text(
//                 "Upload Profile Image",
//                 style: TextStyle(color: Colors.blue),
//               ),
//             ),
//           ),
//
//           const SizedBox(height: 20),
//
//           // Form Title
//           const Text(
//             "Set up your tutor profile",
//             style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
//           ),
//           const SizedBox(height: 10),
//           const Text(
//             "Students will check your profile to decide whether to book a lesson with you. Please provide as much information as possible.",
//             style: TextStyle(fontSize: 14, color: Colors.grey),
//           ),
//           const SizedBox(height: 20),
//
//           // Basic Info Section
//           const Text(
//             "Basic Info",
//             style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
//           ),
//           const SizedBox(height: 10),
//           TextFormField(
//             controller: nameController,
//             decoration: const InputDecoration(
//               labelText: "Name *",
//               border: OutlineInputBorder(),
//             ),
//             validator: (value) {
//               if (value == null || value.isEmpty) {
//                 return 'Please enter your name';
//               }
//               return null;
//             },
//           ),
//           const SizedBox(height: 10),
//           TextFormField(
//             controller: fromController,
//             decoration: const InputDecoration(
//               labelText: "From *",
//               border: OutlineInputBorder(),
//             ),
//             validator: (value) {
//               if (value == null || value.isEmpty) {
//                 return 'Please enter your origin';
//               }
//               return null;
//             },
//           ),
//           const SizedBox(height: 10),
//           GestureDetector(
//             onTap: _pickDateOfBirth,
//             child: AbsorbPointer(
//               child: TextFormField(
//                 controller: dobController,
//                 decoration: const InputDecoration(
//                   labelText: "Date of Birth *",
//                   border: OutlineInputBorder(),
//                   suffixIcon: Icon(Icons.calendar_today),
//                 ),
//                 validator: (value) {
//                   if (value == null || value.isEmpty) {
//                     return 'Please select your date of birth';
//                   }
//                   return null;
//                 },
//               ),
//             ),
//           ),
//           const SizedBox(height: 20),
//
//           // CV Section
//           const Text(
//             "CV",
//             style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
//           ),
//           const SizedBox(height: 10),
//           TextFormField(
//             controller: interestsController,
//             decoration: const InputDecoration(
//               labelText: "Interests *",
//               border: OutlineInputBorder(),
//             ),
//             validator: (value) {
//               if (value == null || value.isEmpty) {
//                 return 'Please enter your interests';
//               }
//               return null;
//             },
//           ),
//           const SizedBox(height: 10),
//           TextFormField(
//             controller: educationController,
//             decoration: const InputDecoration(
//               labelText: "Education *",
//               border: OutlineInputBorder(),
//             ),
//             validator: (value) {
//               if (value == null || value.isEmpty) {
//                 return 'Please enter your education details';
//               }
//               return null;
//             },
//           ),
//           const SizedBox(height: 10),
//           TextFormField(
//             controller: experienceController,
//             decoration: const InputDecoration(
//               labelText: "Experience *",
//               border: OutlineInputBorder(),
//             ),
//             validator: (value) {
//               if (value == null || value.isEmpty) {
//                 return 'Please enter your experience';
//               }
//               return null;
//             },
//           ),
//           const SizedBox(height: 10),
//           TextFormField(
//             controller: professionController,
//             decoration: const InputDecoration(
//               labelText: "Current or Previous Profession *",
//               border: OutlineInputBorder(),
//             ),
//             validator: (value) {
//               if (value == null || value.isEmpty) {
//                 return 'Please enter your profession';
//               }
//               return null;
//             },
//           ),
//           const SizedBox(height: 20),
//
//           // Languages Section
//           const Text(
//             "Languages I Speak",
//             style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
//           ),
//           const SizedBox(height: 10),
//           TextFormField(
//             controller: languagesController,
//             decoration: const InputDecoration(
//               labelText: "Languages *",
//               border: OutlineInputBorder(),
//             ),
//             validator: (value) {
//               if (value == null || value.isEmpty) {
//                 return 'Please enter the languages you speak';
//               }
//               return null;
//             },
//           ),
//           const SizedBox(height: 20),
//
//           // Teaching Section
//           const Text(
//             "Who I Teach",
//             style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
//           ),
//           const SizedBox(height: 10),
//           TextFormField(
//             controller: instructionController,
//             decoration: const InputDecoration(
//               labelText: "Instruction *",
//               border: OutlineInputBorder(),
//             ),
//             validator: (value) {
//               if (value == null || value.isEmpty) {
//                 return 'Please enter your teaching instructions';
//               }
//               return null;
//             },
//           ),
//           const SizedBox(height: 10),
//           const Text("I am best at teaching students who are:"),
//           CheckboxListTile(
//             value: beginnerChecked,
//             title: const Text("Beginner"),
//             onChanged: (value) {
//               setState(() {
//                 beginnerChecked = value!;
//               });
//             },
//           ),
//           CheckboxListTile(
//             value: intermediateChecked,
//             title: const Text("Intermediate"),
//             onChanged: (value) {
//               setState(() {
//                 intermediateChecked = value!;
//               });
//             },
//           ),
//           CheckboxListTile(
//             value: advancedChecked,
//             title: const Text("Advanced"),
//             onChanged: (value) {
//               setState(() {
//                 advancedChecked = value!;
//               });
//             },
//           ),
//           // Validate that at least one checkbox is selected
//           if (!beginnerChecked && !intermediateChecked && !advancedChecked)
//             Padding(
//               padding: const EdgeInsets.symmetric(horizontal: 16.0),
//               child: Text(
//                 'Please select at least one teaching level.',
//                 style: TextStyle(color: Colors.red[700], fontSize: 12),
//               ),
//             ),
//           const SizedBox(height: 20),
//
//           // Certificates Section
//           const Text(
//             "Certificates",
//             style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
//           ),
//           const SizedBox(height: 10),
//           ElevatedButton.icon(
//             onPressed: _addCertificate,
//             icon: Icon(Icons.add, color: Colors.white),
//             label: Text(
//               "Add New Certificate",
//               style: TextStyle(color: Colors.white),
//             ),
//             style: ElevatedButton.styleFrom(
//               backgroundColor: Colors.blue, // Button background color
//             ),
//           ),
//           const SizedBox(height: 10),
//           certificates.isNotEmpty
//               ? ListView.builder(
//             shrinkWrap: true,
//             physics: NeverScrollableScrollPhysics(),
//             itemCount: certificates.length,
//             itemBuilder: (context, index) {
//               final cert = certificates[index];
//               return Card(
//                 elevation: 3,
//                 margin: EdgeInsets.symmetric(vertical: 5),
//                 child: ListTile(
//                   leading: Icon(Icons.verified, color: Colors.green),
//                   title: Text(cert.type),
//                   subtitle: Text(cert.file.path.split('/').last),
//                   trailing: IconButton(
//                     icon: Icon(Icons.delete, color: Colors.red),
//                     onPressed: () => _deleteCertificate(index),
//                   ),
//                 ),
//               );
//             },
//           )
//               : Text(
//             "No certificates added.",
//             style: TextStyle(color: Colors.grey),
//           ),
//           const SizedBox(height: 20),
//
//           // Save and Next Buttons
//           Row(
//             mainAxisAlignment: MainAxisAlignment.spaceBetween,
//             children: [
//               ElevatedButton(
//                 onPressed: () {
//                   // Implement Save functionality if separate from Next
//                   if (_formKey.currentState!.validate()) {
//                     // Check if profile image is uploaded
//                     if (profileImage == null) {
//                       ScaffoldMessenger.of(context).showSnackBar(
//                         SnackBar(content: Text("Please upload a profile image.")),
//                       );
//                       return;
//                     }
//
//                     // Check if at least one teaching level is selected
//                     if (!beginnerChecked && !intermediateChecked && !advancedChecked) {
//                       ScaffoldMessenger.of(context).showSnackBar(
//                         SnackBar(content: Text("Please select at least one teaching level.")),
//                       );
//                       return;
//                     }
//
//                     ScaffoldMessenger.of(context).showSnackBar(
//                       const SnackBar(content: Text("Profile saved!")),
//                     );
//                   }
//                 },
//                 child: Text("Save"),
//                 style: ElevatedButton.styleFrom(
//                   backgroundColor: Colors.blue, // Button background color
//                 ),
//               ),
//               ElevatedButton(
//                 onPressed: _nextStep,
//                 child: Text("Next"),
//                 style: ElevatedButton.styleFrom(
//                   backgroundColor: Colors.blue, // Button background color
//                 ),
//               ),
//             ],
//           ),
//         ],
//       ),
//     );
//   }
//
//   Widget _buildProgressSteps() {
//     return Row(
//       mainAxisAlignment: MainAxisAlignment.center, // Center the entire Row
//       crossAxisAlignment: CrossAxisAlignment.center, // Center align vertically
//       children: [
//         // Complete Profile Step
//         Column(
//           children: [
//             CircleAvatar(
//               radius: 20, // Uniform size for all avatars
//               backgroundColor: currentStep == ProfileStep.Profile ||
//                   currentStep == ProfileStep.VideoIntroduction ||
//                   currentStep == ProfileStep.Approval
//                   ? Colors.blue
//                   : Colors.grey,
//               child: Icon(Icons.person, color: Colors.white, size: 20),
//             ),
//             SizedBox(height: 5),
//             Container(
//               width: 80, // Fixed width to prevent overflow
//               child: Text(
//                 "Complete\nProfile",
//                 style: TextStyle(
//                   fontSize: 12, // Reduced font size
//                   color: currentStep == ProfileStep.Profile ||
//                       currentStep == ProfileStep.VideoIntroduction ||
//                       currentStep == ProfileStep.Approval
//                       ? Colors.black
//                       : Colors.grey,
//                 ),
//                 textAlign: TextAlign.center, // Center-align the text
//                 overflow: TextOverflow.ellipsis,
//                 maxLines: 2,
//               ),
//             ),
//           ],
//         ),
//         SizedBox(width: 10), // Fixed spacing between Profile and line
//         // Connecting Line
//         Container(
//           width: 40, // Fixed width for connecting line
//           height: 2,
//           color: currentStep == ProfileStep.VideoIntroduction ||
//               currentStep == ProfileStep.Approval
//               ? Colors.blue
//               : Colors.grey,
//         ),
//         SizedBox(width: 10), // Fixed spacing between line and Video Introduction
//         // Video Introduction Step
//         Column(
//           children: [
//             CircleAvatar(
//               radius: 20, // Uniform size for all avatars
//               backgroundColor: currentStep == ProfileStep.VideoIntroduction ||
//                   currentStep == ProfileStep.Approval
//                   ? Colors.blue
//                   : Colors.grey,
//               child: Icon(Icons.videocam, color: Colors.white, size: 20),
//             ),
//             SizedBox(height: 5),
//             Container(
//               width: 80, // Fixed width to prevent overflow
//               child: Text(
//                 "Video\nIntroduction",
//                 style: TextStyle(
//                   fontSize: 12, // Reduced font size
//                   color: currentStep == ProfileStep.VideoIntroduction ||
//                       currentStep == ProfileStep.Approval
//                       ? Colors.black
//                       : Colors.grey,
//                 ),
//                 textAlign: TextAlign.center, // Center-align the text
//                 overflow: TextOverflow.ellipsis,
//                 maxLines: 2,
//               ),
//             ),
//           ],
//         ),
//         SizedBox(width: 10), // Fixed spacing between Video Introduction and line
//         // Connecting Line
//         Container(
//           width: 40, // Fixed width for connecting line
//           height: 2,
//           color: currentStep == ProfileStep.Approval
//               ? Colors.blue
//               : Colors.grey,
//         ),
//         SizedBox(width: 10), // Fixed spacing between line and Approval
//         // Approval Step
//         Column(
//           children: [
//             CircleAvatar(
//               radius: 20, // Uniform size for all avatars
//               backgroundColor: currentStep == ProfileStep.Approval
//                   ? Colors.blue
//                   : Colors.grey,
//               child: Icon(Icons.check, color: Colors.white, size: 20),
//             ),
//             SizedBox(height: 5),
//             Container(
//               width: 80, // Fixed width to prevent overflow
//               child: Text(
//                 "Approval\n",
//                 style: TextStyle(
//                   fontSize: 12, // Reduced font size
//                   color: currentStep == ProfileStep.Approval
//                       ? Colors.black
//                       : Colors.grey,
//                 ),
//                 textAlign: TextAlign.center, // Center-align the text
//                 overflow: TextOverflow.ellipsis,
//                 maxLines: 2, // Allow two lines even if the second is empty
//               ),
//             ),
//           ],
//         ),
//       ],
//     );
//   }
//
//   Widget _buildVideoIntroduction() {
//     return Column(
//       crossAxisAlignment: CrossAxisAlignment.start,
//       children: [
//         // Progress Steps
//         _buildProgressSteps(),
//
//         const SizedBox(height: 20),
//
//         const Text(
//           "Introduce Yourself",
//           style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
//         ),
//         const SizedBox(height: 10),
//         const Text(
//           "Let students know what they can expect from a lesson with you by recording a video highlighting your teaching style, expertise, and personality. Students can be nervous to speak with a foreigner, so it really helps to have a friendly video that introduces yourself and invites students to call you.",
//           style: TextStyle(fontSize: 14, color: Colors.grey),
//         ),
//         const SizedBox(height: 20),
//
//         const Text(
//           "A few helpful tips:",
//           style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
//         ),
//         const SizedBox(height: 5),
//         Column(
//           crossAxisAlignment: CrossAxisAlignment.start,
//           children: [
//             _buildTipItem("Find a clean and quiet space"),
//             _buildTipItem("Smile and look at the camera"),
//             _buildTipItem("Dress smart"),
//             _buildTipItem("Speak for 1-3 minutes"),
//             _buildTipItem("Brand yourself and have fun!"),
//           ],
//         ),
//         const SizedBox(height: 10),
//         const Text(
//           "Note: We only support uploading video files that are less than 64 MB in size.",
//           style: TextStyle(fontSize: 12, color: Colors.red),
//         ),
//         const SizedBox(height: 20),
//
//         // Choose Video Button
//         Center(
//           child: ElevatedButton.icon(
//             onPressed: _pickVideoFile,
//             icon: Icon(Icons.video_call, color: Colors.white),
//             label: Text(
//               "Choose Video",
//               style: TextStyle(color: Colors.white),
//             ),
//             style: ElevatedButton.styleFrom(
//               backgroundColor: Colors.blue, // Button background color
//             ),
//           ),
//         ),
//         if (videoFile != null && _videoController != null && _videoController!.value.isInitialized)
//           Column(
//             children: [
//               const SizedBox(height: 10),
//               // Video Player
//               AspectRatio(
//                 aspectRatio: _videoController!.value.aspectRatio,
//                 child: VideoPlayer(_videoController!),
//               ),
//               const SizedBox(height: 10),
//               // Video Controls
//               Row(
//                 mainAxisAlignment: MainAxisAlignment.center,
//                 children: [
//                   IconButton(
//                     icon: Icon(Icons.replay_10, color: Colors.blue),
//                     onPressed: () {
//                       final currentPosition = _videoController!.value.position;
//                       final newPosition = currentPosition - Duration(seconds: 10);
//                       _videoController!.seekTo(
//                         newPosition >= Duration.zero ? newPosition : Duration.zero,
//                       );
//                     },
//                   ),
//                   IconButton(
//                     icon: Icon(
//                       _videoController!.value.isPlaying ? Icons.pause : Icons.play_arrow,
//                       color: Colors.blue,
//                     ),
//                     onPressed: () {
//                       setState(() {
//                         if (_videoController!.value.isPlaying) {
//                           _videoController!.pause();
//                         } else {
//                           _videoController!.play();
//                         }
//                       });
//                     },
//                   ),
//                   IconButton(
//                     icon: Icon(Icons.forward_10, color: Colors.blue),
//                     onPressed: () {
//                       final currentPosition = _videoController!.value.position;
//                       final maxPosition = _videoController!.value.duration;
//                       final newPosition = currentPosition + Duration(seconds: 10);
//                       _videoController!.seekTo(
//                         newPosition <= maxPosition ? newPosition : maxPosition,
//                       );
//                     },
//                   ),
//                 ],
//               ),
//               VideoProgressIndicator(
//                 _videoController!,
//                 allowScrubbing: true,
//                 padding: EdgeInsets.symmetric(horizontal: 20.0),
//                 colors: VideoProgressColors(
//                   playedColor: Colors.blue,
//                   bufferedColor: Colors.grey,
//                   backgroundColor: Colors.grey.shade300,
//                 ),
//               ),
//             ],
//           ),
//         const SizedBox(height: 20),
//
//         // Back and Next Buttons
//         Row(
//           mainAxisAlignment: MainAxisAlignment.spaceBetween,
//           children: [
//             ElevatedButton(
//               onPressed: _backStep,
//               child: Text("Back"),
//               style: ElevatedButton.styleFrom(
//                 backgroundColor: Colors.blue, // Button background color
//               ),
//             ),
//             ElevatedButton(
//               onPressed: _nextStep,
//               child: Text("Next"),
//               style: ElevatedButton.styleFrom(
//                 backgroundColor: Colors.blue, // Button background color
//               ),
//             ),
//           ],
//         ),
//       ],
//     );
//   }
//
//   Widget _buildTipItem(String tip) {
//     return Row(
//       children: [
//         Icon(Icons.check, size: 16, color: Colors.green),
//         SizedBox(width: 5),
//         Expanded(child: Text(tip)),
//       ],
//     );
//   }
//
//   Widget _buildApproval() {
//     return Column(
//       crossAxisAlignment: CrossAxisAlignment.center,
//       children: [
//         // Progress Steps
//         _buildProgressSteps(),
//
//         const SizedBox(height: 50),
//
//         Icon(Icons.check_circle, color: Colors.green, size: 100),
//         const SizedBox(height: 20),
//         const Text(
//           "Congratulations!",
//           style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
//         ),
//         const SizedBox(height: 10),
//         const Text(
//           "Your application is being processed.",
//           style: TextStyle(fontSize: 16, color: Colors.grey),
//         ),
//         const SizedBox(height: 10),
//         const Text(
//           "You can now start receiving student bookings.",
//           style: TextStyle(fontSize: 16, color: Colors.grey),
//           textAlign: TextAlign.center,
//         ),
//
//         const SizedBox(height: 50),
//
//         // Optionally, you can add a button to go back or navigate elsewhere
//       ],
//     );
//   }
// }

// import 'dart:io';
//
// import 'package:flutter/material.dart';
// import 'package:image_picker/image_picker.dart';
// import 'package:file_picker/file_picker.dart';
// import 'package:video_player/video_player.dart';
//
// class BecomeATutorPage extends StatefulWidget {
//   @override
//   _BecomeATutorPageState createState() => _BecomeATutorPageState();
// }
//
// enum ProfileStep { Profile, VideoIntroduction, Approval }
//
// class Certificate {
//   String type;
//   File file;
//
//   Certificate({required this.type, required this.file});
// }
//
// class _BecomeATutorPageState extends State<BecomeATutorPage> {
//   final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
//
//   // Current Step
//   ProfileStep currentStep = ProfileStep.Profile;
//
//   // Controllers for form fields
//   final TextEditingController nameController = TextEditingController();
//   final TextEditingController fromController = TextEditingController();
//   final TextEditingController dobController = TextEditingController();
//   final TextEditingController interestsController = TextEditingController();
//   final TextEditingController educationController = TextEditingController();
//   final TextEditingController experienceController = TextEditingController();
//   final TextEditingController professionController = TextEditingController();
//   final TextEditingController instructionController = TextEditingController();
//   final TextEditingController languagesController = TextEditingController();
//
//   // **New:** Controller for "About" field
//   final TextEditingController aboutController = TextEditingController();
//
//   // Image and File Uploads
//   File? profileImage;
//
//   // Certificates
//   List<Certificate> certificates = [];
//
//   // Video Introduction
//   File? videoFile;
//   VideoPlayerController? _videoController;
//
//   // **Removed:** Checkbox States
//   // bool beginnerChecked = false;
//   // bool intermediateChecked = false;
//   // bool advancedChecked = false;
//
//   // Video Playback State
//   bool isVideoPlaying = false;
//
//   // Additional Controller for Custom Certification Type
//   final TextEditingController customTypeController = TextEditingController();
//
//   final ImagePicker _imagePicker = ImagePicker();
//
//   // Function to pick profile image
//   Future<void> _pickProfileImage() async {
//     try {
//       final pickedFile = await _imagePicker.pickImage(source: ImageSource.gallery);
//       if (pickedFile != null) {
//         setState(() {
//           profileImage = File(pickedFile.path);
//         });
//       }
//     } catch (e) {
//       // Handle any errors
//       ScaffoldMessenger.of(context).showSnackBar(
//         SnackBar(content: Text("Error picking image: $e")),
//       );
//     }
//   }
//
//   // Function to pick video file
//   Future<void> _pickVideoFile() async {
//     try {
//       final pickedFile = await _imagePicker.pickVideo(source: ImageSource.gallery);
//       if (pickedFile != null) {
//         _videoController?.dispose();
//         _videoController = VideoPlayerController.file(File(pickedFile.path))
//           ..initialize().then((_) {
//             setState(() {
//               videoFile = File(pickedFile.path);
//               _videoController!.play();
//               isVideoPlaying = true;
//             });
//           });
//       }
//     } catch (e) {
//       // Handle any errors
//       ScaffoldMessenger.of(context).showSnackBar(
//         SnackBar(content: Text("Error picking video: $e")),
//       );
//     }
//   }
//
//   // Function to add a new certificate
//   void _addCertificate() async {
//     String? selectedType; // Initialize as null
//     File? uploadedFile;
//     final _dialogFormKey = GlobalKey<FormState>(); // Form key for the dialog
//
//     await showDialog(
//       context: context,
//       builder: (context) {
//         return StatefulBuilder(builder: (context, setStateDialog) {
//           return AlertDialog(
//             title: Text("Add New Certificate"),
//             content: Form(
//               key: _dialogFormKey, // Assign the form key
//               child: SingleChildScrollView( // Ensures content is scrollable if overflow occurs
//                 child: Column(
//                   mainAxisSize: MainAxisSize.min,
//                   children: [
//                     DropdownButtonFormField<String>(
//                       value: selectedType,
//                       items: ["IELTS", "TOEFL", "Other"].map((cert) {
//                         return DropdownMenuItem(
//                           value: cert,
//                           child: Text(cert),
//                         );
//                       }).toList(),
//                       onChanged: (value) {
//                         setStateDialog(() {
//                           selectedType = value;
//                           if (value != "Other") {
//                             customTypeController.text = "";
//                           }
//                         });
//                       },
//                       decoration: InputDecoration(
//                         labelText: "Certificate Type",
//                         border: OutlineInputBorder(),
//                       ),
//                       validator: (value) {
//                         if (value == null || value.isEmpty) {
//                           return 'Please select a certification type';
//                         }
//                         return null;
//                       },
//                     ),
//                     SizedBox(height: 10),
//                     if (selectedType == "Other")
//                       TextFormField(
//                         controller: customTypeController,
//                         decoration: InputDecoration(
//                           labelText: "Enter Certification Type",
//                           border: OutlineInputBorder(),
//                         ),
//                         validator: (value) {
//                           if (selectedType == "Other") {
//                             if (value == null || value.trim().isEmpty) {
//                               return 'Please enter the certification type';
//                             }
//                           }
//                           return null;
//                         },
//                       ),
//                     SizedBox(height: 10),
//                     ElevatedButton(
//                       onPressed: () async {
//                         try {
//                           FilePickerResult? result = await FilePicker.platform.pickFiles(
//                             type: FileType.custom,
//                             allowedExtensions: ['pdf', 'doc', 'docx', 'jpg', 'png'],
//                           );
//                           if (result != null && result.files.single.path != null) {
//                             File selectedFile = File(result.files.single.path!);
//                             final fileSize = await selectedFile.length();
//                             if (fileSize > 64 * 1024 * 1024) { // 64 MB
//                               setStateDialog(() {
//                                 uploadedFile = null;
//                               });
//                               ScaffoldMessenger.of(context).showSnackBar(
//                                 SnackBar(content: Text("File size exceeds 64 MB.")),
//                               );
//                               return;
//                             }
//                             setStateDialog(() {
//                               uploadedFile = selectedFile;
//                             });
//                           }
//                         } catch (e) {
//                           // Handle any errors
//                           ScaffoldMessenger.of(context).showSnackBar(
//                             SnackBar(content: Text("Error picking file: $e")),
//                           );
//                         }
//                       },
//                       child: Text("Upload Certificate"),
//                       style: ElevatedButton.styleFrom(
//                         backgroundColor: Colors.blue, // Button background color
//                       ),
//                     ),
//                     SizedBox(height: 10),
//                     if (uploadedFile != null)
//                       Text(
//                         uploadedFile!.path.split('/').last,
//                         style: TextStyle(color: Colors.green),
//                       ),
//                   ],
//                 ),
//               ),
//             ),
//             actions: [
//               TextButton(
//                 onPressed: () => Navigator.of(context).pop(),
//                 child: Text(
//                   "Cancel",
//                   style: TextStyle(color: Colors.blue),
//                 ),
//               ),
//               ElevatedButton(
//                 onPressed: () {
//                   if (_dialogFormKey.currentState!.validate()) {
//                     if (uploadedFile != null) {
//                       String finalType = selectedType!;
//                       if (selectedType == "Other") {
//                         finalType = customTypeController.text.trim();
//                       }
//                       setState(() {
//                         certificates.add(Certificate(
//                             type: finalType, file: uploadedFile!));
//                       });
//                       Navigator.of(context).pop();
//                       ScaffoldMessenger.of(context).showSnackBar(
//                         SnackBar(content: Text("Certificate added successfully.")),
//                       );
//                     } else {
//                       ScaffoldMessenger.of(context).showSnackBar(
//                         SnackBar(content: Text("Please upload a certificate file")),
//                       );
//                     }
//                   }
//                 },
//                 child: Text("Save"),
//                 style: ElevatedButton.styleFrom(
//                   backgroundColor: Colors.blue, // Button background color
//                 ),
//               ),
//             ],
//           );
//         });
//       },
//     );
//   }
//
//   // Function to delete a certificate with confirmation
//   void _deleteCertificate(int index) {
//     showDialog(
//       context: context,
//       builder: (context) {
//         return AlertDialog(
//           title: Text("Delete Certificate"),
//           content: Text("Are you sure you want to delete this certificate?"),
//           actions: [
//             TextButton(
//               child: Text(
//                 "Cancel",
//                 style: TextStyle(color: Colors.blue),
//               ),
//               onPressed: () {
//                 Navigator.of(context).pop(); // Close the dialog
//               },
//             ),
//             ElevatedButton(
//               child: Text("Delete"),
//               style: ElevatedButton.styleFrom(
//                 backgroundColor: Colors.red, // Red color for delete action
//               ),
//               onPressed: () {
//                 setState(() {
//                   certificates.removeAt(index);
//                 });
//                 Navigator.of(context).pop(); // Close the dialog
//                 ScaffoldMessenger.of(context).showSnackBar(
//                   SnackBar(content: Text("Certificate deleted successfully.")),
//                 );
//               },
//             ),
//           ],
//         );
//       },
//     );
//   }
//
//   // Function to pick Date of Birth
//   Future<void> _pickDateOfBirth() async {
//     DateTime initialDate = DateTime(1990);
//     DateTime firstDate = DateTime(1900);
//     DateTime lastDate = DateTime.now();
//
//     final DateTime? picked = await showDatePicker(
//       context: context,
//       initialDate: initialDate,
//       firstDate: firstDate,
//       lastDate: lastDate,
//     );
//
//     if (picked != null) {
//       setState(() {
//         dobController.text = "${picked.toLocal()}".split(' ')[0];
//       });
//     }
//   }
//
//   // Function to proceed to next step
//   void _nextStep() {
//     if (currentStep == ProfileStep.Profile) {
//       // Validate profile form
//       if (_formKey.currentState!.validate()) {
//         // **Removed:** Check if at least one teaching level is selected
//         // if (!beginnerChecked && !intermediateChecked && !advancedChecked) {
//         //   ScaffoldMessenger.of(context).showSnackBar(
//         //     SnackBar(content: Text("Please select at least one teaching level.")),
//         //   );
//         //   return;
//         // }
//
//         // Check if profile image is uploaded
//         if (profileImage == null) {
//           ScaffoldMessenger.of(context).showSnackBar(
//             SnackBar(content: Text("Please upload a profile image.")),
//           );
//           return;
//         }
//
//         // **Removed:** Additional validations related to teaching levels
//
//         setState(() {
//           currentStep = ProfileStep.VideoIntroduction;
//         });
//         ScaffoldMessenger.of(context).showSnackBar(
//           SnackBar(content: Text("Profile completed!")),
//         );
//       }
//     } else if (currentStep == ProfileStep.VideoIntroduction) {
//       if (videoFile != null) {
//         setState(() {
//           currentStep = ProfileStep.Approval;
//         });
//       } else {
//         ScaffoldMessenger.of(context).showSnackBar(
//           SnackBar(content: Text("Please upload a video introduction.")),
//         );
//       }
//     }
//   }
//
//   // Function to go back to previous step
//   void _backStep() {
//     if (currentStep == ProfileStep.VideoIntroduction) {
//       setState(() {
//         currentStep = ProfileStep.Profile;
//       });
//     } else if (currentStep == ProfileStep.Approval) {
//       setState(() {
//         currentStep = ProfileStep.VideoIntroduction;
//       });
//     }
//   }
//
//   @override
//   void dispose() {
//     // Dispose controllers
//     nameController.dispose();
//     fromController.dispose();
//     dobController.dispose();
//     interestsController.dispose();
//     educationController.dispose();
//     experienceController.dispose();
//     professionController.dispose();
//     instructionController.dispose();
//     languagesController.dispose();
//     customTypeController.dispose();
//     aboutController.dispose(); // Dispose the "About" controller
//     _videoController?.dispose();
//     super.dispose();
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: _buildAppBar(),
//       body: SingleChildScrollView(
//         padding: const EdgeInsets.all(16.0),
//         child: currentStep == ProfileStep.Profile
//             ? _buildProfileForm()
//             : currentStep == ProfileStep.VideoIntroduction
//             ? _buildVideoIntroduction()
//             : _buildApproval(),
//       ),
//     );
//   }
//
//   AppBar _buildAppBar() {
//     return AppBar(
//       title: const Text(
//         "Become a Tutor",
//         style: TextStyle(color: Colors.blue),
//       ),
//       backgroundColor: Colors.white,
//       centerTitle: true,
//       iconTheme: IconThemeData(color: Colors.blue),
//       elevation: 0,
//       leading: IconButton(
//         icon: Icon(Icons.arrow_back, color: Colors.blue),
//         onPressed: () {
//           Navigator.of(context).pop(); // Navigate back to Settings Page
//         },
//       ),
//     );
//   }
//
//   Widget _buildProfileForm() {
//     return Form(
//       key: _formKey,
//       child: Column(
//         crossAxisAlignment: CrossAxisAlignment.start,
//         children: [
//           // Progress Steps
//           _buildProgressSteps(),
//
//           const SizedBox(height: 20),
//
//           // Profile Image Upload
//           Center(
//             child: GestureDetector(
//               onTap: _pickProfileImage,
//               child: CircleAvatar(
//                 radius: 50,
//                 backgroundImage: profileImage != null
//                     ? FileImage(profileImage!)
//                     : AssetImage('assets/profile_placeholder.png') as ImageProvider,
//                 child: profileImage == null
//                     ? Icon(Icons.camera_alt, size: 50, color: Colors.white70)
//                     : null,
//               ),
//             ),
//           ),
//           const SizedBox(height: 10),
//           Center(
//             child: TextButton.icon(
//               onPressed: _pickProfileImage,
//               icon: Icon(Icons.upload, color: Colors.blue),
//               label: Text(
//                 "Upload Profile Image",
//                 style: TextStyle(color: Colors.blue),
//               ),
//             ),
//           ),
//
//           const SizedBox(height: 20),
//
//           // Form Title
//           const Text(
//             "Set up your tutor profile",
//             style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
//           ),
//           const SizedBox(height: 10),
//           const Text(
//             "Students will check your profile to decide whether to book a lesson with you. Please provide as much information as possible.",
//             style: TextStyle(fontSize: 14, color: Colors.grey),
//           ),
//           const SizedBox(height: 20),
//
//           // Basic Info Section
//           const Text(
//             "Basic Info",
//             style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
//           ),
//           const SizedBox(height: 10),
//           TextFormField(
//             controller: nameController,
//             decoration: const InputDecoration(
//               labelText: "Name *",
//               border: OutlineInputBorder(),
//             ),
//             validator: (value) {
//               if (value == null || value.isEmpty) {
//                 return 'Please enter your name';
//               }
//               return null;
//             },
//           ),
//           const SizedBox(height: 10),
//           TextFormField(
//             controller: fromController,
//             decoration: const InputDecoration(
//               labelText: "From *",
//               border: OutlineInputBorder(),
//             ),
//             validator: (value) {
//               if (value == null || value.isEmpty) {
//                 return 'Please enter your origin';
//               }
//               return null;
//             },
//           ),
//           const SizedBox(height: 10),
//           GestureDetector(
//             onTap: _pickDateOfBirth,
//             child: AbsorbPointer(
//               child: TextFormField(
//                 controller: dobController,
//                 decoration: const InputDecoration(
//                   labelText: "Date of Birth *",
//                   border: OutlineInputBorder(),
//                   suffixIcon: Icon(Icons.calendar_today),
//                 ),
//                 validator: (value) {
//                   if (value == null || value.isEmpty) {
//                     return 'Please select your date of birth';
//                   }
//                   return null;
//                 },
//               ),
//             ),
//           ),
//           const SizedBox(height: 20),
//
//           // CV Section
//           const Text(
//             "CV",
//             style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
//           ),
//           const SizedBox(height: 10),
//           TextFormField(
//             controller: interestsController,
//             decoration: const InputDecoration(
//               labelText: "Interests *",
//               border: OutlineInputBorder(),
//             ),
//             validator: (value) {
//               if (value == null || value.isEmpty) {
//                 return 'Please enter your interests';
//               }
//               return null;
//             },
//           ),
//           const SizedBox(height: 10),
//           TextFormField(
//             controller: educationController,
//             decoration: const InputDecoration(
//               labelText: "Education *",
//               border: OutlineInputBorder(),
//             ),
//             validator: (value) {
//               if (value == null || value.isEmpty) {
//                 return 'Please enter your education details';
//               }
//               return null;
//             },
//           ),
//           const SizedBox(height: 10),
//           TextFormField(
//             controller: experienceController,
//             decoration: const InputDecoration(
//               labelText: "Experience *",
//               border: OutlineInputBorder(),
//             ),
//             validator: (value) {
//               if (value == null || value.isEmpty) {
//                 return 'Please enter your experience';
//               }
//               return null;
//             },
//           ),
//           const SizedBox(height: 10),
//           TextFormField(
//             controller: professionController,
//             decoration: const InputDecoration(
//               labelText: "Current or Previous Profession *",
//               border: OutlineInputBorder(),
//             ),
//             validator: (value) {
//               if (value == null || value.isEmpty) {
//                 return 'Please enter your profession';
//               }
//               return null;
//             },
//           ),
//           const SizedBox(height: 20),
//
//           // Languages Section
//           const Text(
//             "Languages I Speak",
//             style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
//           ),
//           const SizedBox(height: 10),
//           TextFormField(
//             controller: languagesController,
//             decoration: const InputDecoration(
//               labelText: "Languages *",
//               border: OutlineInputBorder(),
//             ),
//             validator: (value) {
//               if (value == null || value.isEmpty) {
//                 return 'Please enter the languages you speak';
//               }
//               return null;
//             },
//           ),
//           const SizedBox(height: 20),
//
//           // **New:** About Section
//           const Text(
//             "About",
//             style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
//           ),
//           const SizedBox(height: 10),
//           TextFormField(
//             controller: aboutController,
//             decoration: const InputDecoration(
//               labelText: "About *",
//               border: OutlineInputBorder(),
//             ),
//             maxLines: 4, // Allows multi-line input
//             validator: (value) {
//               if (value == null || value.isEmpty) {
//                 return 'Please provide some information about yourself';
//               }
//               return null;
//             },
//           ),
//           const SizedBox(height: 20),
//
//           // **Removed:** Teaching Section with Checkboxes
//           /*
//           const Text(
//             "Who I Teach",
//             style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
//           ),
//           const SizedBox(height: 10),
//           TextFormField(
//             controller: instructionController,
//             decoration: const InputDecoration(
//               labelText: "Instruction *",
//               border: OutlineInputBorder(),
//             ),
//             validator: (value) {
//               if (value == null || value.isEmpty) {
//                 return 'Please enter your teaching instructions';
//               }
//               return null;
//             },
//           ),
//           const SizedBox(height: 10),
//           const Text("I am best at teaching students who are:"),
//           CheckboxListTile(
//             value: beginnerChecked,
//             title: const Text("Beginner"),
//             onChanged: (value) {
//               setState(() {
//                 beginnerChecked = value!;
//               });
//             },
//           ),
//           CheckboxListTile(
//             value: intermediateChecked,
//             title: const Text("Intermediate"),
//             onChanged: (value) {
//               setState(() {
//                 intermediateChecked = value!;
//               });
//             },
//           ),
//           CheckboxListTile(
//             value: advancedChecked,
//             title: const Text("Advanced"),
//             onChanged: (value) {
//               setState(() {
//                 advancedChecked = value!;
//               });
//             },
//           ),
//           // Validate that at least one checkbox is selected
//           if (!beginnerChecked && !intermediateChecked && !advancedChecked)
//             Padding(
//               padding: const EdgeInsets.symmetric(horizontal: 16.0),
//               child: Text(
//                 'Please select at least one teaching level.',
//                 style: TextStyle(color: Colors.red[700], fontSize: 12),
//               ),
//             ),
//           const SizedBox(height: 20),
//           */
//
//           // Certificates Section
//           const Text(
//             "Certificates",
//             style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
//           ),
//           const SizedBox(height: 10),
//           ElevatedButton.icon(
//             onPressed: _addCertificate,
//             icon: Icon(Icons.add, color: Colors.white),
//             label: Text(
//               "Add New Certificate",
//               style: TextStyle(color: Colors.white),
//             ),
//             style: ElevatedButton.styleFrom(
//               backgroundColor: Colors.blue, // Button background color
//             ),
//           ),
//           const SizedBox(height: 10),
//           certificates.isNotEmpty
//               ? ListView.builder(
//             shrinkWrap: true,
//             physics: NeverScrollableScrollPhysics(),
//             itemCount: certificates.length,
//             itemBuilder: (context, index) {
//               final cert = certificates[index];
//               return Card(
//                 elevation: 3,
//                 margin: EdgeInsets.symmetric(vertical: 5),
//                 child: ListTile(
//                   leading: Icon(Icons.verified, color: Colors.green),
//                   title: Text(cert.type),
//                   subtitle: Text(cert.file.path.split('/').last),
//                   trailing: IconButton(
//                     icon: Icon(Icons.delete, color: Colors.red),
//                     onPressed: () => _deleteCertificate(index),
//                   ),
//                 ),
//               );
//             },
//           )
//               : Text(
//             "No certificates added.",
//             style: TextStyle(color: Colors.grey),
//           ),
//           const SizedBox(height: 20),
//
//           // Save and Next Buttons
//           Row(
//             mainAxisAlignment: MainAxisAlignment.spaceBetween,
//             children: [
//               ElevatedButton(
//                 onPressed: () {
//                   // Implement Save functionality if separate from Next
//                   if (_formKey.currentState!.validate()) {
//                     // Check if profile image is uploaded
//                     if (profileImage == null) {
//                       ScaffoldMessenger.of(context).showSnackBar(
//                         SnackBar(content: Text("Please upload a profile image.")),
//                       );
//                       return;
//                     }
//
//                     // **Removed:** Check if at least one teaching level is selected
//                     /*
//                     if (!beginnerChecked && !intermediateChecked && !advancedChecked) {
//                       ScaffoldMessenger.of(context).showSnackBar(
//                         SnackBar(content: Text("Please select at least one teaching level.")),
//                       );
//                       return;
//                     }
//                     */
//
//                     ScaffoldMessenger.of(context).showSnackBar(
//                       const SnackBar(content: Text("Profile saved!")),
//                     );
//                   }
//                 },
//                 child: Text("Save"),
//                 style: ElevatedButton.styleFrom(
//                   backgroundColor: Colors.blue, // Button background color
//                 ),
//               ),
//               ElevatedButton(
//                 onPressed: _nextStep,
//                 child: Text("Next"),
//                 style: ElevatedButton.styleFrom(
//                   backgroundColor: Colors.blue, // Button background color
//                 ),
//               ),
//             ],
//           ),
//         ],
//       ),
//     );
//   }
//
//   Widget _buildProgressSteps() {
//     return Row(
//       mainAxisAlignment: MainAxisAlignment.center, // Center the entire Row
//       crossAxisAlignment: CrossAxisAlignment.center, // Center align vertically
//       children: [
//         // Complete Profile Step
//         Column(
//           children: [
//             CircleAvatar(
//               radius: 20, // Uniform size for all avatars
//               backgroundColor: currentStep == ProfileStep.Profile ||
//                   currentStep == ProfileStep.VideoIntroduction ||
//                   currentStep == ProfileStep.Approval
//                   ? Colors.blue
//                   : Colors.grey,
//               child: Icon(Icons.person, color: Colors.white, size: 20),
//             ),
//             SizedBox(height: 5),
//             Container(
//               width: 80, // Fixed width to prevent overflow
//               child: Text(
//                 "Complete\nProfile",
//                 style: TextStyle(
//                   fontSize: 12, // Reduced font size
//                   color: currentStep == ProfileStep.Profile ||
//                       currentStep == ProfileStep.VideoIntroduction ||
//                       currentStep == ProfileStep.Approval
//                       ? Colors.black
//                       : Colors.grey,
//                 ),
//                 textAlign: TextAlign.center, // Center-align the text
//                 overflow: TextOverflow.ellipsis,
//                 maxLines: 2,
//               ),
//             ),
//           ],
//         ),
//         SizedBox(width: 10), // Fixed spacing between Profile and line
//         // Connecting Line
//         Container(
//           width: 40, // Fixed width for connecting line
//           height: 2,
//           color: currentStep == ProfileStep.VideoIntroduction ||
//               currentStep == ProfileStep.Approval
//               ? Colors.blue
//               : Colors.grey,
//         ),
//         SizedBox(width: 10), // Fixed spacing between line and Video Introduction
//         // Video Introduction Step
//         Column(
//           children: [
//             CircleAvatar(
//               radius: 20, // Uniform size for all avatars
//               backgroundColor: currentStep == ProfileStep.VideoIntroduction ||
//                   currentStep == ProfileStep.Approval
//                   ? Colors.blue
//                   : Colors.grey,
//               child: Icon(Icons.videocam, color: Colors.white, size: 20),
//             ),
//             SizedBox(height: 5),
//             Container(
//               width: 80, // Fixed width to prevent overflow
//               child: Text(
//                 "Video\nIntroduction",
//                 style: TextStyle(
//                   fontSize: 12, // Reduced font size
//                   color: currentStep == ProfileStep.VideoIntroduction ||
//                       currentStep == ProfileStep.Approval
//                       ? Colors.black
//                       : Colors.grey,
//                 ),
//                 textAlign: TextAlign.center, // Center-align the text
//                 overflow: TextOverflow.ellipsis,
//                 maxLines: 2,
//               ),
//             ),
//           ],
//         ),
//         SizedBox(width: 10), // Fixed spacing between Video Introduction and line
//         // Connecting Line
//         Container(
//           width: 40, // Fixed width for connecting line
//           height: 2,
//           color: currentStep == ProfileStep.Approval
//               ? Colors.blue
//               : Colors.grey,
//         ),
//         SizedBox(width: 10), // Fixed spacing between line and Approval
//         // Approval Step
//         Column(
//           children: [
//             CircleAvatar(
//               radius: 20, // Uniform size for all avatars
//               backgroundColor: currentStep == ProfileStep.Approval
//                   ? Colors.blue
//                   : Colors.grey,
//               child: Icon(Icons.check, color: Colors.white, size: 20),
//             ),
//             SizedBox(height: 5),
//             Container(
//               width: 80, // Fixed width to prevent overflow
//               child: Text(
//                 "Approval\n",
//                 style: TextStyle(
//                   fontSize: 12, // Reduced font size
//                   color: currentStep == ProfileStep.Approval
//                       ? Colors.black
//                       : Colors.grey,
//                 ),
//                 textAlign: TextAlign.center, // Center-align the text
//                 overflow: TextOverflow.ellipsis,
//                 maxLines: 2, // Allow two lines even if the second is empty
//               ),
//             ),
//           ],
//         ),
//       ],
//     );
//   }
//
//   Widget _buildVideoIntroduction() {
//     return Column(
//       crossAxisAlignment: CrossAxisAlignment.start,
//       children: [
//         // Progress Steps
//         _buildProgressSteps(),
//
//         const SizedBox(height: 20),
//
//         const Text(
//           "Introduce Yourself",
//           style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
//         ),
//         const SizedBox(height: 10),
//         const Text(
//           "Let students know what they can expect from a lesson with you by recording a video highlighting your teaching style, expertise, and personality. Students can be nervous to speak with a foreigner, so it really helps to have a friendly video that introduces yourself and invites students to call you.",
//           style: TextStyle(fontSize: 14, color: Colors.grey),
//         ),
//         const SizedBox(height: 20),
//
//         const Text(
//           "A few helpful tips:",
//           style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
//         ),
//         const SizedBox(height: 5),
//         Column(
//           crossAxisAlignment: CrossAxisAlignment.start,
//           children: [
//             _buildTipItem("Find a clean and quiet space"),
//             _buildTipItem("Smile and look at the camera"),
//             _buildTipItem("Dress smart"),
//             _buildTipItem("Speak for 1-3 minutes"),
//             _buildTipItem("Brand yourself and have fun!"),
//           ],
//         ),
//         const SizedBox(height: 10),
//         const Text(
//           "Note: We only support uploading video files that are less than 64 MB in size.",
//           style: TextStyle(fontSize: 12, color: Colors.red),
//         ),
//         const SizedBox(height: 20),
//
//         // Choose Video Button
//         Center(
//           child: ElevatedButton.icon(
//             onPressed: _pickVideoFile,
//             icon: Icon(Icons.video_call, color: Colors.white),
//             label: Text(
//               "Choose Video",
//               style: TextStyle(color: Colors.white),
//             ),
//             style: ElevatedButton.styleFrom(
//               backgroundColor: Colors.blue, // Button background color
//             ),
//           ),
//         ),
//         if (videoFile != null && _videoController != null && _videoController!.value.isInitialized)
//           Column(
//             children: [
//               const SizedBox(height: 10),
//               // Video Player
//               AspectRatio(
//                 aspectRatio: _videoController!.value.aspectRatio,
//                 child: VideoPlayer(_videoController!),
//               ),
//               const SizedBox(height: 10),
//               // Video Controls
//               Row(
//                 mainAxisAlignment: MainAxisAlignment.center,
//                 children: [
//                   IconButton(
//                     icon: Icon(Icons.replay_10, color: Colors.blue),
//                     onPressed: () {
//                       final currentPosition = _videoController!.value.position;
//                       final newPosition = currentPosition - Duration(seconds: 10);
//                       _videoController!.seekTo(
//                         newPosition >= Duration.zero ? newPosition : Duration.zero,
//                       );
//                     },
//                   ),
//                   IconButton(
//                     icon: Icon(
//                       _videoController!.value.isPlaying ? Icons.pause : Icons.play_arrow,
//                       color: Colors.blue,
//                     ),
//                     onPressed: () {
//                       setState(() {
//                         if (_videoController!.value.isPlaying) {
//                           _videoController!.pause();
//                         } else {
//                           _videoController!.play();
//                         }
//                       });
//                     },
//                   ),
//                   IconButton(
//                     icon: Icon(Icons.forward_10, color: Colors.blue),
//                     onPressed: () {
//                       final currentPosition = _videoController!.value.position;
//                       final maxPosition = _videoController!.value.duration;
//                       final newPosition = currentPosition + Duration(seconds: 10);
//                       _videoController!.seekTo(
//                         newPosition <= maxPosition ? newPosition : maxPosition,
//                       );
//                     },
//                   ),
//                 ],
//               ),
//               VideoProgressIndicator(
//                 _videoController!,
//                 allowScrubbing: true,
//                 padding: EdgeInsets.symmetric(horizontal: 20.0),
//                 colors: VideoProgressColors(
//                   playedColor: Colors.blue,
//                   bufferedColor: Colors.grey,
//                   backgroundColor: Colors.grey.shade300,
//                 ),
//               ),
//             ],
//           ),
//         const SizedBox(height: 20),
//
//         // Back and Next Buttons
//         Row(
//           mainAxisAlignment: MainAxisAlignment.spaceBetween,
//           children: [
//             ElevatedButton(
//               onPressed: _backStep,
//               child: Text("Back"),
//               style: ElevatedButton.styleFrom(
//                 backgroundColor: Colors.blue, // Button background color
//               ),
//             ),
//             ElevatedButton(
//               onPressed: _nextStep,
//               child: Text("Next"),
//               style: ElevatedButton.styleFrom(
//                 backgroundColor: Colors.blue, // Button background color
//               ),
//             ),
//           ],
//         ),
//       ],
//     );
//   }
//
//   Widget _buildTipItem(String tip) {
//     return Row(
//       children: [
//         Icon(Icons.check, size: 16, color: Colors.green),
//         SizedBox(width: 5),
//         Expanded(child: Text(tip)),
//       ],
//     );
//   }
//
//   Widget _buildApproval() {
//     return Column(
//       crossAxisAlignment: CrossAxisAlignment.center,
//       children: [
//         // Progress Steps
//         _buildProgressSteps(),
//
//         const SizedBox(height: 50),
//
//         Icon(Icons.check_circle, color: Colors.green, size: 100),
//         const SizedBox(height: 20),
//         const Text(
//           "Congratulations!",
//           style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
//         ),
//         const SizedBox(height: 10),
//         const Text(
//           "Your application is being processed.",
//           style: TextStyle(fontSize: 16, color: Colors.grey),
//         ),
//         const SizedBox(height: 10),
//         const Text(
//           "You can now start receiving student bookings.",
//           style: TextStyle(fontSize: 16, color: Colors.grey),
//           textAlign: TextAlign.center,
//         ),
//
//         const SizedBox(height: 50),
//
//         // Optionally, you can add a button to go back or navigate elsewhere
//       ],
//     );
//   }
// }

import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:file_picker/file_picker.dart';
import 'package:video_player/video_player.dart';

class BecomeATutorPage extends StatefulWidget {
  @override
  _BecomeATutorPageState createState() => _BecomeATutorPageState();
}

enum ProfileStep { Profile, VideoIntroduction, Approval }

class Certificate {
  String type;
  File file;

  Certificate({required this.type, required this.file});
}

class _BecomeATutorPageState extends State<BecomeATutorPage> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  // Current Step
  ProfileStep currentStep = ProfileStep.Profile;

  // Controllers for form fields
  final TextEditingController nameController = TextEditingController();
  final TextEditingController fromController = TextEditingController();
  final TextEditingController dobController = TextEditingController();
  final TextEditingController interestsController = TextEditingController();
  final TextEditingController educationController = TextEditingController();
  final TextEditingController experienceController = TextEditingController();
  final TextEditingController professionController = TextEditingController();
  final TextEditingController instructionController = TextEditingController();
  final TextEditingController languagesController = TextEditingController();

  // New Controller for About Section
  final TextEditingController aboutController = TextEditingController();

  // Image and File Uploads
  File? profileImage;

  // Certificates
  List<Certificate> certificates = [];

  // Video Introduction
  File? videoFile;
  VideoPlayerController? _videoController;

  // Removed Checkbox States
  // bool beginnerChecked = false;
  // bool intermediateChecked = false;
  // bool advancedChecked = false;

  // Video Playback State
  bool isVideoPlaying = false;

  // Additional Controller for Custom Certification Type
  final TextEditingController customTypeController = TextEditingController();

  final ImagePicker _imagePicker = ImagePicker();

  // Function to pick profile image
  Future<void> _pickProfileImage() async {
    try {
      final pickedFile = await _imagePicker.pickImage(source: ImageSource.gallery);
      if (pickedFile != null) {
        setState(() {
          profileImage = File(pickedFile.path);
        });
      }
    } catch (e) {
      // Handle any errors
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text("Error picking image: $e")),
      );
    }
  }

  // Function to pick video file
  Future<void> _pickVideoFile() async {
    try {
      final pickedFile = await _imagePicker.pickVideo(source: ImageSource.gallery);
      if (pickedFile != null) {
        _videoController?.dispose();
        _videoController = VideoPlayerController.file(File(pickedFile.path))
          ..initialize().then((_) {
            setState(() {
              videoFile = File(pickedFile.path);
              _videoController!.play();
              isVideoPlaying = true;
            });
          });
      }
    } catch (e) {
      // Handle any errors
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text("Error picking video: $e")),
      );
    }
  }

  // Function to add a new certificate
  void _addCertificate() async {
    String? selectedType; // Initialize as null
    File? uploadedFile;
    final _dialogFormKey = GlobalKey<FormState>(); // Form key for the dialog

    await showDialog(
      context: context,
      builder: (context) {
        return StatefulBuilder(builder: (context, setStateDialog) {
          return AlertDialog(
            title: Text("Add New Certificate"),
            content: Form(
              key: _dialogFormKey, // Assign the form key
              child: SingleChildScrollView( // Ensures content is scrollable if overflow occurs
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    DropdownButtonFormField<String>(
                      value: selectedType,
                      items: ["IELTS", "TOEFL", "Other"].map((cert) {
                        return DropdownMenuItem(
                          value: cert,
                          child: Text(cert),
                        );
                      }).toList(),
                      onChanged: (value) {
                        setStateDialog(() {
                          selectedType = value;
                          if (value != "Other") {
                            customTypeController.text = "";
                          }
                        });
                      },
                      decoration: InputDecoration(
                        labelText: "Certificate Type",
                        border: OutlineInputBorder(),
                      ),
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Please select a certification type';
                        }
                        return null;
                      },
                    ),
                    SizedBox(height: 10),
                    if (selectedType == "Other")
                      TextFormField(
                        controller: customTypeController,
                        decoration: InputDecoration(
                          labelText: "Enter Certification Type",
                          border: OutlineInputBorder(),
                        ),
                        validator: (value) {
                          if (selectedType == "Other") {
                            if (value == null || value.trim().isEmpty) {
                              return 'Please enter the certification type';
                            }
                          }
                          return null;
                        },
                      ),
                    SizedBox(height: 10),
                    ElevatedButton(
                      onPressed: () async {
                        try {
                          FilePickerResult? result = await FilePicker.platform.pickFiles(
                            type: FileType.custom,
                            allowedExtensions: ['pdf', 'doc', 'docx', 'jpg', 'png'],
                          );
                          if (result != null && result.files.single.path != null) {
                            File selectedFile = File(result.files.single.path!);
                            final fileSize = await selectedFile.length();
                            if (fileSize > 64 * 1024 * 1024) { // 64 MB
                              setStateDialog(() {
                                uploadedFile = null;
                              });
                              ScaffoldMessenger.of(context).showSnackBar(
                                SnackBar(content: Text("File size exceeds 64 MB.")),
                              );
                              return;
                            }
                            setStateDialog(() {
                              uploadedFile = selectedFile;
                            });
                          }
                        } catch (e) {
                          // Handle any errors
                          ScaffoldMessenger.of(context).showSnackBar(
                            SnackBar(content: Text("Error picking file: $e")),
                          );
                        }
                      },
                      child: Text("Upload Certificate"),
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.blue, // Button background color
                      ),
                    ),
                    SizedBox(height: 10),
                    if (uploadedFile != null)
                      Text(
                        uploadedFile!.path.split('/').last,
                        style: TextStyle(color: Colors.green),
                      ),
                  ],
                ),
              ),
            ),
            actions: [
              TextButton(
                onPressed: () {
                  Navigator.of(context).pop();
                },
                child: Text(
                  "Cancel",
                  style: TextStyle(color: Colors.blue),
                ),
              ),
              ElevatedButton(
                onPressed: () {
                  if (_dialogFormKey.currentState!.validate()) {
                    if (uploadedFile != null) {
                      String finalType = selectedType!;
                      if (selectedType == "Other") {
                        finalType = customTypeController.text.trim();
                      }
                      setState(() {
                        certificates.add(Certificate(
                            type: finalType, file: uploadedFile!));
                      });
                      Navigator.of(context).pop();
                      ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(content: Text("Certificate added successfully.")),
                      );
                    } else {
                      ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(content: Text("Please upload a certificate file")),
                      );
                    }
                  }
                },
                child: Text("Save"),
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.blue, // Button background color
                ),
              ),
            ],
          );
        });
      },
    );
  }

  // Function to delete a certificate with confirmation
  void _deleteCertificate(int index) {
    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: Text("Delete Certificate"),
          content: Text("Are you sure you want to delete this certificate?"),
          actions: [
            TextButton(
              child: Text(
                "Cancel",
                style: TextStyle(color: Colors.blue),
              ),
              onPressed: () {
                Navigator.of(context).pop(); // Close the dialog
              },
            ),
            ElevatedButton(
              child: Text("Delete"),
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.red, // Red color for delete action
              ),
              onPressed: () {
                setState(() {
                  certificates.removeAt(index);
                });
                Navigator.of(context).pop(); // Close the dialog
                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(content: Text("Certificate deleted successfully.")),
                );
              },
            ),
          ],
        );
      },
    );
  }

  // Function to pick Date of Birth
  Future<void> _pickDateOfBirth() async {
    DateTime initialDate = DateTime(1990);
    DateTime firstDate = DateTime(1900);
    DateTime lastDate = DateTime.now();

    final DateTime? picked = await showDatePicker(
      context: context,
      initialDate: initialDate,
      firstDate: firstDate,
      lastDate: lastDate,
    );

    if (picked != null) {
      setState(() {
        dobController.text = "${picked.toLocal()}".split(' ')[0];
      });
    }
  }

  // Function to proceed to next step
  void _nextStep() {
    if (currentStep == ProfileStep.Profile) {
      // Validate profile form
      if (_formKey.currentState!.validate()) {
        // Check if profile image is uploaded
        if (profileImage == null) {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(content: Text("Please upload a profile image.")),
          );
          return;
        }

        // Additional validations can be added here

        setState(() {
          currentStep = ProfileStep.VideoIntroduction;
        });
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text("Profile completed!")),
        );
      }
    } else if (currentStep == ProfileStep.VideoIntroduction) {
      if (videoFile != null) {
        setState(() {
          currentStep = ProfileStep.Approval;
        });
      } else {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text("Please upload a video introduction.")),
        );
      }
    }
  }

  // Function to go back to previous step
  void _backStep() {
    if (currentStep == ProfileStep.VideoIntroduction) {
      setState(() {
        currentStep = ProfileStep.Profile;
      });
    } else if (currentStep == ProfileStep.Approval) {
      setState(() {
        currentStep = ProfileStep.VideoIntroduction;
      });
    }
  }

  @override
  void dispose() {
    // Dispose controllers
    nameController.dispose();
    fromController.dispose();
    dobController.dispose();
    interestsController.dispose();
    educationController.dispose();
    experienceController.dispose();
    professionController.dispose();
    instructionController.dispose();
    languagesController.dispose();
    aboutController.dispose(); // Dispose the new About controller
    customTypeController.dispose();
    _videoController?.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _buildAppBar(),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: currentStep == ProfileStep.Profile
            ? _buildProfileForm()
            : currentStep == ProfileStep.VideoIntroduction
            ? _buildVideoIntroduction()
            : _buildApproval(),
      ),
    );
  }

  AppBar _buildAppBar() {
    return AppBar(
      title: const Text(
        "Become a Tutor",
        style: TextStyle(color: Colors.blue),
      ),
      backgroundColor: Colors.white,
      centerTitle: true,
      iconTheme: IconThemeData(color: Colors.blue),
      elevation: 0,
      leading: IconButton(
        icon: Icon(Icons.arrow_back, color: Colors.blue),
        onPressed: () {
          Navigator.of(context).pop(); // Navigate back to Settings Page
        },
      ),
    );
  }

  Widget _buildProfileForm() {
    return Form(
      key: _formKey,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Progress Steps
          _buildProgressSteps(),

          const SizedBox(height: 20),

          // Profile Image Upload
          Center(
            child: GestureDetector(
              onTap: _pickProfileImage,
              child: CircleAvatar(
                radius: 50,
                backgroundImage: profileImage != null
                    ? FileImage(profileImage!)
                    : AssetImage('assets/profile_placeholder.png') as ImageProvider,
                child: profileImage == null
                    ? Icon(Icons.camera_alt, size: 50, color: Colors.white70)
                    : null,
              ),
            ),
          ),
          const SizedBox(height: 10),
          Center(
            child: TextButton.icon(
              onPressed: _pickProfileImage,
              icon: Icon(Icons.upload, color: Colors.blue),
              label: Text(
                "Upload Profile Image",
                style: TextStyle(color: Colors.blue),
              ),
            ),
          ),

          const SizedBox(height: 20),

          // Form Title
          const Text(
            "Set up your tutor profile",
            style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 10),
          const Text(
            "Students will check your profile to decide whether to book a lesson with you. Please provide as much information as possible.",
            style: TextStyle(fontSize: 14, color: Colors.grey),
          ),
          const SizedBox(height: 20),

          // Basic Info Section
          const Text(
            "Basic Info",
            style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 10),
          TextFormField(
            controller: nameController,
            decoration: const InputDecoration(
              labelText: "Name *",
              border: OutlineInputBorder(),
            ),
            validator: (value) {
              if (value == null || value.isEmpty) {
                return 'Please enter your name';
              }
              return null;
            },
          ),
          const SizedBox(height: 10),
          TextFormField(
            controller: fromController,
            decoration: const InputDecoration(
              labelText: "From *",
              border: OutlineInputBorder(),
            ),
            validator: (value) {
              if (value == null || value.isEmpty) {
                return 'Please enter your origin';
              }
              return null;
            },
          ),
          const SizedBox(height: 10),
          GestureDetector(
            onTap: _pickDateOfBirth,
            child: AbsorbPointer(
              child: TextFormField(
                controller: dobController,
                decoration: const InputDecoration(
                  labelText: "Date of Birth *",
                  border: OutlineInputBorder(),
                  suffixIcon: Icon(Icons.calendar_today),
                ),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please select your date of birth';
                  }
                  return null;
                },
              ),
            ),
          ),
          const SizedBox(height: 20),

          // CV Section
          const Text(
            "CV",
            style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 10),
          TextFormField(
            controller: interestsController,
            decoration: const InputDecoration(
              labelText: "Interests *",
              border: OutlineInputBorder(),
            ),
            validator: (value) {
              if (value == null || value.isEmpty) {
                return 'Please enter your interests';
              }
              return null;
            },
          ),
          const SizedBox(height: 10),
          TextFormField(
            controller: educationController,
            decoration: const InputDecoration(
              labelText: "Education *",
              border: OutlineInputBorder(),
            ),
            validator: (value) {
              if (value == null || value.isEmpty) {
                return 'Please enter your education details';
              }
              return null;
            },
          ),
          const SizedBox(height: 10),
          TextFormField(
            controller: experienceController,
            decoration: const InputDecoration(
              labelText: "Experience *",
              border: OutlineInputBorder(),
            ),
            validator: (value) {
              if (value == null || value.isEmpty) {
                return 'Please enter your experience';
              }
              return null;
            },
          ),
          const SizedBox(height: 10),
          TextFormField(
            controller: professionController,
            decoration: const InputDecoration(
              labelText: "Current or Previous Profession *",
              border: OutlineInputBorder(),
            ),
            validator: (value) {
              if (value == null || value.isEmpty) {
                return 'Please enter your profession';
              }
              return null;
            },
          ),
          const SizedBox(height: 20),

          // Languages Section
          const Text(
            "Languages I Speak",
            style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 10),
          TextFormField(
            controller: languagesController,
            decoration: const InputDecoration(
              labelText: "Languages *",
              border: OutlineInputBorder(),
            ),
            validator: (value) {
              if (value == null || value.isEmpty) {
                return 'Please enter the languages you speak';
              }
              return null;
            },
          ),
          const SizedBox(height: 20),

          // Instruction Section
          const Text(
            "Instruction",
            style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 10),
          TextFormField(
            controller: instructionController,
            decoration: const InputDecoration(
              labelText: "Instruction *",
              border: OutlineInputBorder(),
            ),
            validator: (value) {
              if (value == null || value.isEmpty) {
                return 'Please enter your teaching instructions';
              }
              return null;
            },
          ),
          const SizedBox(height: 20),

          // New About Section
          const Text(
            "About",
            style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 10),
          TextFormField(
            controller: aboutController,
            decoration: const InputDecoration(
              labelText: "Tell us about yourself",
              border: OutlineInputBorder(),
            ),
            maxLines: 4,
            validator: (value) {
              if (value == null || value.isEmpty) {
                return 'Please provide some information about yourself';
              }
              return null;
            },
          ),
          const SizedBox(height: 20),

          // Certificates Section
          const Text(
            "Certificates",
            style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 10),
          ElevatedButton.icon(
            onPressed: _addCertificate,
            icon: Icon(Icons.add, color: Colors.white),
            label: Text(
              "Add New Certificate",
              style: TextStyle(color: Colors.white),
            ),
            style: ElevatedButton.styleFrom(
              backgroundColor: Colors.blue, // Button background color
            ),
          ),
          const SizedBox(height: 10),
          certificates.isNotEmpty
              ? ListView.builder(
            shrinkWrap: true,
            physics: NeverScrollableScrollPhysics(),
            itemCount: certificates.length,
            itemBuilder: (context, index) {
              final cert = certificates[index];
              return Card(
                elevation: 3,
                margin: EdgeInsets.symmetric(vertical: 5),
                child: ListTile(
                  leading: Icon(Icons.verified, color: Colors.green),
                  title: Text(cert.type),
                  subtitle: Text(cert.file.path.split('/').last),
                  trailing: IconButton(
                    icon: Icon(Icons.delete, color: Colors.red),
                    onPressed: () => _deleteCertificate(index),
                  ),
                ),
              );
            },
          )
              : Text(
            "No certificates added.",
            style: TextStyle(color: Colors.grey),
          ),
          const SizedBox(height: 20),

          // Save and Next Buttons
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              ElevatedButton(
                onPressed: () {
                  // Implement Save functionality if separate from Next
                  if (_formKey.currentState!.validate()) {
                    // Check if profile image is uploaded
                    if (profileImage == null) {
                      ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(content: Text("Please upload a profile image.")),
                      );
                      return;
                    }

                    ScaffoldMessenger.of(context).showSnackBar(
                      const SnackBar(content: Text("Profile saved!")),
                    );
                  }
                },
                child: Text("Save"),
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.blue, // Button background color
                ),
              ),
              ElevatedButton(
                onPressed: _nextStep,
                child: Text("Next"),
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.blue, // Button background color
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildProgressSteps() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center, // Center the entire Row
      crossAxisAlignment: CrossAxisAlignment.center, // Center align vertically
      children: [
        // Complete Profile Step
        Column(
          children: [
            CircleAvatar(
              radius: 20, // Uniform size for all avatars
              backgroundColor: currentStep == ProfileStep.Profile ||
                  currentStep == ProfileStep.VideoIntroduction ||
                  currentStep == ProfileStep.Approval
                  ? Colors.blue
                  : Colors.grey,
              child: Icon(Icons.person, color: Colors.white, size: 20),
            ),
            SizedBox(height: 5),
            Container(
              width: 80, // Fixed width to prevent overflow
              child: Text(
                "Complete\nProfile",
                style: TextStyle(
                  fontSize: 12, // Reduced font size
                  color: currentStep == ProfileStep.Profile ||
                      currentStep == ProfileStep.VideoIntroduction ||
                      currentStep == ProfileStep.Approval
                      ? Colors.black
                      : Colors.grey,
                ),
                textAlign: TextAlign.center, // Center-align the text
                overflow: TextOverflow.ellipsis,
                maxLines: 2,
              ),
            ),
          ],
        ),
        SizedBox(width: 10), // Fixed spacing between Profile and line
        // Connecting Line
        Container(
          width: 40, // Fixed width for connecting line
          height: 2,
          color: currentStep == ProfileStep.VideoIntroduction ||
              currentStep == ProfileStep.Approval
              ? Colors.blue
              : Colors.grey,
        ),
        SizedBox(width: 10), // Fixed spacing between line and Video Introduction
        // Video Introduction Step
        Column(
          children: [
            CircleAvatar(
              radius: 20, // Uniform size for all avatars
              backgroundColor: currentStep == ProfileStep.VideoIntroduction ||
                  currentStep == ProfileStep.Approval
                  ? Colors.blue
                  : Colors.grey,
              child: Icon(Icons.videocam, color: Colors.white, size: 20),
            ),
            SizedBox(height: 5),
            Container(
              width: 80, // Fixed width to prevent overflow
              child: Text(
                "Video\nIntroduction",
                style: TextStyle(
                  fontSize: 12, // Reduced font size
                  color: currentStep == ProfileStep.VideoIntroduction ||
                      currentStep == ProfileStep.Approval
                      ? Colors.black
                      : Colors.grey,
                ),
                textAlign: TextAlign.center, // Center-align the text
                overflow: TextOverflow.ellipsis,
                maxLines: 2,
              ),
            ),
          ],
        ),
        SizedBox(width: 10), // Fixed spacing between Video Introduction and line
        // Connecting Line
        Container(
          width: 40, // Fixed width for connecting line
          height: 2,
          color: currentStep == ProfileStep.Approval
              ? Colors.blue
              : Colors.grey,
        ),
        SizedBox(width: 10), // Fixed spacing between line and Approval
        // Approval Step
        Column(
          children: [
            CircleAvatar(
              radius: 20, // Uniform size for all avatars
              backgroundColor: currentStep == ProfileStep.Approval
                  ? Colors.blue
                  : Colors.grey,
              child: Icon(Icons.check, color: Colors.white, size: 20),
            ),
            SizedBox(height: 5),
            Container(
              width: 80, // Fixed width to prevent overflow
              child: Text(
                "Approval\n",
                style: TextStyle(
                  fontSize: 12, // Reduced font size
                  color: currentStep == ProfileStep.Approval
                      ? Colors.black
                      : Colors.grey,
                ),
                textAlign: TextAlign.center, // Center-align the text
                overflow: TextOverflow.ellipsis,
                maxLines: 2, // Allow two lines even if the second is empty
              ),
            ),
          ],
        ),
      ],
    );
  }

  Widget _buildVideoIntroduction() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        // Progress Steps
        _buildProgressSteps(),

        const SizedBox(height: 20),

        const Text(
          "Introduce Yourself",
          style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
        ),
        const SizedBox(height: 10),
        const Text(
          "Let students know what they can expect from a lesson with you by recording a video highlighting your teaching style, expertise, and personality. Students can be nervous to speak with a foreigner, so it really helps to have a friendly video that introduces yourself and invites students to call you.",
          style: TextStyle(fontSize: 14, color: Colors.grey),
        ),
        const SizedBox(height: 20),

        const Text(
          "A few helpful tips:",
          style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
        ),
        const SizedBox(height: 5),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _buildTipItem("Find a clean and quiet space"),
            _buildTipItem("Smile and look at the camera"),
            _buildTipItem("Dress smart"),
            _buildTipItem("Speak for 1-3 minutes"),
            _buildTipItem("Brand yourself and have fun!"),
          ],
        ),
        const SizedBox(height: 10),
        const Text(
          "Note: We only support uploading video files that are less than 64 MB in size.",
          style: TextStyle(fontSize: 12, color: Colors.red),
        ),
        const SizedBox(height: 20),

        // Choose Video Button
        Center(
          child: ElevatedButton.icon(
            onPressed: _pickVideoFile,
            icon: Icon(Icons.video_call, color: Colors.white),
            label: Text(
              "Choose Video",
              style: TextStyle(color: Colors.white),
            ),
            style: ElevatedButton.styleFrom(
              backgroundColor: Colors.blue, // Button background color
            ),
          ),
        ),
        if (videoFile != null && _videoController != null && _videoController!.value.isInitialized)
          Column(
            children: [
              const SizedBox(height: 10),
              // Video Player
              AspectRatio(
                aspectRatio: _videoController!.value.aspectRatio,
                child: VideoPlayer(_videoController!),
              ),
              const SizedBox(height: 10),
              // Video Controls
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  IconButton(
                    icon: Icon(Icons.replay_10, color: Colors.blue),
                    onPressed: () {
                      final currentPosition = _videoController!.value.position;
                      final newPosition = currentPosition - Duration(seconds: 10);
                      _videoController!.seekTo(
                        newPosition >= Duration.zero ? newPosition : Duration.zero,
                      );
                    },
                  ),
                  IconButton(
                    icon: Icon(
                      _videoController!.value.isPlaying ? Icons.pause : Icons.play_arrow,
                      color: Colors.blue,
                    ),
                    onPressed: () {
                      setState(() {
                        if (_videoController!.value.isPlaying) {
                          _videoController!.pause();
                        } else {
                          _videoController!.play();
                        }
                      });
                    },
                  ),
                  IconButton(
                    icon: Icon(Icons.forward_10, color: Colors.blue),
                    onPressed: () {
                      final currentPosition = _videoController!.value.position;
                      final maxPosition = _videoController!.value.duration;
                      final newPosition = currentPosition + Duration(seconds: 10);
                      _videoController!.seekTo(
                        newPosition <= maxPosition ? newPosition : maxPosition,
                      );
                    },
                  ),
                ],
              ),
              VideoProgressIndicator(
                _videoController!,
                allowScrubbing: true,
                padding: EdgeInsets.symmetric(horizontal: 20.0),
                colors: VideoProgressColors(
                  playedColor: Colors.blue,
                  bufferedColor: Colors.grey,
                  backgroundColor: Colors.grey.shade300,
                ),
              ),
            ],
          ),
        const SizedBox(height: 20),

        // Back and Next Buttons
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            ElevatedButton(
              onPressed: _backStep,
              child: Text("Back"),
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.blue, // Button background color
              ),
            ),
            ElevatedButton(
              onPressed: _nextStep,
              child: Text("Next"),
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.blue, // Button background color
              ),
            ),
          ],
        ),
      ],
    );
  }

  Widget _buildTipItem(String tip) {
    return Row(
      children: [
        Icon(Icons.check, size: 16, color: Colors.green),
        SizedBox(width: 5),
        Expanded(child: Text(tip)),
      ],
    );
  }

  Widget _buildApproval() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        // Progress Steps
        _buildProgressSteps(),

        const SizedBox(height: 50),

        Icon(Icons.check_circle, color: Colors.green, size: 100),
        const SizedBox(height: 20),
        const Text(
          "Congratulations!",
          style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
        ),
        const SizedBox(height: 10),
        const Text(
          "Your application is being processed.",
          style: TextStyle(fontSize: 16, color: Colors.grey),
        ),
        const SizedBox(height: 10),
        const Text(
          "You can now start receiving student bookings.",
          style: TextStyle(fontSize: 16, color: Colors.grey),
          textAlign: TextAlign.center,
        ),

        const SizedBox(height: 50),

        // Optionally, you can add a button to go back or navigate elsewhere
      ],
    );
  }
}

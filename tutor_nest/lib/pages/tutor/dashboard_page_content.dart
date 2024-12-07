// lib/pages/Tutor/dashboard_page_content.dart

// import 'package:flutter/material.dart';
//
// class DashboardPageContent extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     // Dummy data for the dashboard
//     List<Map<String, String>> upcomingSessions = [
//       {
//         "subject": "Mathematics",
//         "student": "John Doe",
//         "time": "10:00 AM",
//       },
//       {
//         "subject": "Physics",
//         "student": "Jane Smith",
//         "time": "2:00 PM",
//       },
//       {
//         "subject": "Chemistry",
//         "student": "Alice Johnson",
//         "time": "4:00 PM",
//       },
//     ];
//
//     return SingleChildScrollView(
//       padding: EdgeInsets.all(16.0),
//       child: Column(
//         crossAxisAlignment: CrossAxisAlignment.start,
//         children: [
//           Text(
//             "Dashboard",
//             style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
//           ),
//           SizedBox(height: 20),
//           Text(
//             "Upcoming Sessions",
//             style: TextStyle(fontSize: 18, fontWeight: FontWeight.w600),
//           ),
//           SizedBox(height: 10),
//           ...upcomingSessions.map((session) {
//             return Card(
//               child: ListTile(
//                 leading: Icon(Icons.book, color: Colors.blue),
//                 title: Text(session["subject"]!),
//                 subtitle: Text("Student: ${session["student"]!}"),
//                 trailing: Text(session["time"]!),
//               ),
//             );
//           }).toList(),
//         ],
//       ),
//     );
//   }
// }

// lib/pages/Tutor/dashboard_page_content.dart
//
// import 'package:flutter/material.dart';
// import 'dart:async';
//
// class DashboardPageContent extends StatefulWidget {
//   @override
//   _DashboardPageContentState createState() => _DashboardPageContentState();
// }
//
// class _DashboardPageContentState extends State<DashboardPageContent> {
//   // Dummy data for available time slots (9 AM to 5 PM)
//   List<TimeOfDay> allTimeSlots = List.generate(
//       9,
//           (index) => TimeOfDay(
//           hour: 9 + index,
//           minute: 0)); // Generates TimeOfDay from 9:00 to 17:00
//
//   // Map to track booked time slots
//   Map<TimeOfDay, bool> bookedTimeSlots = {};
//
//   // Dummy data for scheduled lessons
//   List<Lesson> scheduledLessons = [];
//
//   // Dummy data for history
//   List<LessonHistory> lessonHistory = [];
//
//   // Timer to check for completed lessons
//   Timer? _timer;
//
//   @override
//   void initState() {
//     super.initState();
//     // Initialize all time slots as available
//     for (var slot in allTimeSlots) {
//       bookedTimeSlots[slot] = false;
//     }
//
//     // Initialize with some scheduled lessons
//     scheduledLessons = [
//       Lesson(
//           subject: "Mathematics",
//           student: "John Doe",
//           dateTime: DateTime.now().add(Duration(hours: 1)),
//           durationMinutes: 60),
//       Lesson(
//           subject: "Physics",
//           student: "Jane Smith",
//           dateTime: DateTime.now().add(Duration(hours: 3)),
//           durationMinutes: 60),
//       Lesson(
//           subject: "Chemistry",
//           student: "Alice Johnson",
//           dateTime: DateTime.now().add(Duration(hours: 5)),
//           durationMinutes: 60),
//     ];
//
//     // Mark the booked time slots
//     for (var lesson in scheduledLessons) {
//       TimeOfDay slot = TimeOfDay(hour: lesson.dateTime.hour, minute: 0);
//       if (bookedTimeSlots.containsKey(slot)) {
//         bookedTimeSlots[slot] = true;
//       }
//     }
//
//     // Initialize the timer to check for completed lessons every minute
//     _timer = Timer.periodic(Duration(minutes: 1), (timer) {
//       _checkCompletedLessons();
//     });
//   }
//
//   @override
//   void dispose() {
//     _timer?.cancel();
//     super.dispose();
//   }
//
//   void _checkCompletedLessons() {
//     DateTime now = DateTime.now();
//     List<Lesson> completedLessons =
//     scheduledLessons.where((lesson) => now.isAfter(lesson.endTime)).toList();
//
//     if (completedLessons.isNotEmpty) {
//       setState(() {
//         for (var lesson in completedLessons) {
//           // Remove from scheduled lessons
//           scheduledLessons.remove(lesson);
//
//           // Mark the time slot as available
//           TimeOfDay slot = TimeOfDay(hour: lesson.dateTime.hour, minute: 0);
//           if (bookedTimeSlots.containsKey(slot)) {
//             bookedTimeSlots[slot] = false;
//           }
//
//           // Add to history with dummy feedback
//           lessonHistory.add(LessonHistory(
//               subject: lesson.subject,
//               student: lesson.student,
//               dateTime: lesson.dateTime,
//               feedback: "Great lesson!"));
//         }
//       });
//     }
//   }
//
//   // Function to add a new live lesson
//   void _addLiveLesson(Lesson newLesson) {
//     setState(() {
//       scheduledLessons.add(newLesson);
//       TimeOfDay slot =
//       TimeOfDay(hour: newLesson.dateTime.hour, minute: 0);
//       if (bookedTimeSlots.containsKey(slot)) {
//         bookedTimeSlots[slot] = true;
//       }
//     });
//   }
//
//   // Function to calculate total unique students
//   int _totalUniqueStudents() {
//     Set<String> students = {};
//     for (var lesson in lessonHistory) {
//       students.add(lesson.student);
//     }
//     for (var lesson in scheduledLessons) {
//       students.add(lesson.student);
//     }
//     return students.length;
//   }
//
//   // Function to calculate average lesson time
//   double _averageLessonTime() {
//     if (lessonHistory.isEmpty) return 0.0;
//     int totalMinutes = 0;
//     for (var lesson in lessonHistory) {
//       totalMinutes += lesson.durationMinutes;
//     }
//     return totalMinutes / lessonHistory.length;
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return SingleChildScrollView(
//       padding: EdgeInsets.all(16.0),
//       child: Column(
//         crossAxisAlignment: CrossAxisAlignment.start,
//         children: [
//           // Dashboard Title
//           Text(
//             "Dashboard",
//             style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
//           ),
//           SizedBox(height: 20),
//           // Available Time & Booked Time Table
//           _buildTimeSlotsCard(),
//           SizedBox(height: 20),
//           // Schedule Cards
//           _buildScheduleCards(),
//           SizedBox(height: 20),
//           // Start Live Lesson Card
//           _buildStartLiveLessonCard(),
//           SizedBox(height: 20),
//           // History Card
//           _buildHistoryCard(),
//           SizedBox(height: 20),
//           // Summary Cards
//           _buildSummaryCards(),
//         ],
//       ),
//     );
//   }
//
//   // Widget for Available Time & Booked Time Table
//   Widget _buildTimeSlotsCard() {
//     return Card(
//       elevation: 4,
//       child: Padding(
//         padding: EdgeInsets.all(16.0),
//         child: Column(
//           crossAxisAlignment: CrossAxisAlignment.start,
//           children: [
//             Text("Available Time Slots",
//                 style: TextStyle(
//                     fontSize: 18, fontWeight: FontWeight.w600)),
//             SizedBox(height: 10),
//             Table(
//               border: TableBorder.all(color: Colors.grey.shade300),
//               children: [
//                 TableRow(
//                   decoration: BoxDecoration(color: Colors.blue.shade50),
//                   children: [
//                     Padding(
//                       padding: EdgeInsets.all(8.0),
//                       child: Text("Time",
//                           style: TextStyle(
//                               fontWeight: FontWeight.bold)),
//                     ),
//                     Padding(
//                       padding: EdgeInsets.all(8.0),
//                       child: Text("Status",
//                           style: TextStyle(
//                               fontWeight: FontWeight.bold)),
//                     ),
//                   ],
//                 ),
//                 ...allTimeSlots.map((slot) {
//                   bool isBooked = bookedTimeSlots[slot] ?? false;
//                   return TableRow(
//                     children: [
//                       Padding(
//                         padding: EdgeInsets.all(8.0),
//                         child: Text(
//                             "${slot.format(context)}",
//                             style: TextStyle(fontSize: 16)),
//                       ),
//                       Padding(
//                         padding: EdgeInsets.all(8.0),
//                         child: Text(
//                           isBooked ? "Booked" : "Available",
//                           style: TextStyle(
//                               color: isBooked
//                                   ? Colors.red
//                                   : Colors.green,
//                               fontWeight: FontWeight.bold),
//                         ),
//                       ),
//                     ],
//                   );
//                 }).toList(),
//               ],
//             ),
//           ],
//         ),
//       ),
//     );
//   }
//
//   // Widget for Schedule Cards
//   Widget _buildScheduleCards() {
//     return Column(
//       crossAxisAlignment: CrossAxisAlignment.start,
//       children: [
//         Text(
//           "Today's Schedule",
//           style: TextStyle(fontSize: 18, fontWeight: FontWeight.w600),
//         ),
//         SizedBox(height: 10),
//         Container(
//           height: 150, // Adjust height as needed
//           child: scheduledLessons.isEmpty
//               ? Center(
//             child: Text(
//               "No scheduled lessons for today.",
//               style: TextStyle(color: Colors.grey),
//             ),
//           )
//               : ListView.builder(
//             scrollDirection: Axis.horizontal,
//             itemCount: scheduledLessons.length,
//             itemBuilder: (context, index) {
//               var lesson = scheduledLessons[index];
//               return Padding(
//                 padding: EdgeInsets.only(right: 16.0),
//                 child: Card(
//                   elevation: 4,
//                   child: Container(
//                     width: 200, // Adjust width as needed
//                     padding: EdgeInsets.all(16.0),
//                     child: Column(
//                       crossAxisAlignment: CrossAxisAlignment.start,
//                       children: [
//                         Text(
//                           lesson.subject,
//                           style: TextStyle(
//                               fontSize: 18,
//                               fontWeight: FontWeight.bold),
//                         ),
//                         SizedBox(height: 10),
//                         Text("Student: ${lesson.student}",
//                             style: TextStyle(fontSize: 16)),
//                         SizedBox(height: 10),
//                         Text(
//                             "Time: ${_formatDateTime(lesson.dateTime)}",
//                             style: TextStyle(fontSize: 16)),
//                       ],
//                     ),
//                   ),
//                 ),
//               );
//             },
//           ),
//         ),
//       ],
//     );
//   }
//
//   // Helper function to format DateTime
//   String _formatDateTime(DateTime dateTime) {
//     return "${_formatTimeOfDay(TimeOfDay.fromDateTime(dateTime))}";
//   }
//
//   // Helper function to format TimeOfDay
//   String _formatTimeOfDay(TimeOfDay time) {
//     final now = DateTime.now();
//     final dt =
//     DateTime(now.year, now.month, now.day, time.hour, time.minute);
//     final format = TimeOfDayFormat.h_colon_mm_a;
//     return MaterialLocalizations.of(context).formatTimeOfDay(time,
//         alwaysUse24HourFormat: false);
//   }
//
//   // Widget for Start Live Lesson Card
//   Widget _buildStartLiveLessonCard() {
//     return GestureDetector(
//       onTap: () {
//         _showStartLiveLessonDialog();
//       },
//       child: Card(
//         color: Colors.blue.shade100,
//         elevation: 4,
//         child: Container(
//           height: 100, // Adjust height as needed
//           child: Center(
//             child: Text(
//               "Start Live Lesson",
//               style: TextStyle(
//                   fontSize: 18,
//                   fontWeight: FontWeight.bold,
//                   color: Colors.blue.shade800),
//             ),
//           ),
//         ),
//       ),
//     );
//   }
//
//   // Function to show Start Live Lesson Dialog
//   void _showStartLiveLessonDialog() {
//     final _formKey = GlobalKey<FormState>();
//     String studentName = '';
//     String subject = '';
//     DateTime? selectedDate;
//     TimeOfDay? selectedTime;
//     int duration = 60; // default duration in minutes
//
//     showDialog(
//       context: context,
//       builder: (context) {
//         return AlertDialog(
//           title: Text("Start Live Lesson"),
//           content: SingleChildScrollView(
//             child: Form(
//               key: _formKey,
//               child: Column(
//                 children: [
//                   // Student Name
//                   TextFormField(
//                     decoration: InputDecoration(labelText: "Student Name"),
//                     validator: (value) {
//                       if (value == null || value.isEmpty) {
//                         return 'Please enter student name';
//                       }
//                       return null;
//                     },
//                     onSaved: (value) {
//                       studentName = value!;
//                     },
//                   ),
//                   SizedBox(height: 10),
//                   // Subject
//                   TextFormField(
//                     decoration: InputDecoration(labelText: "Subject"),
//                     validator: (value) {
//                       if (value == null || value.isEmpty) {
//                         return 'Please enter subject';
//                       }
//                       return null;
//                     },
//                     onSaved: (value) {
//                       subject = value!;
//                     },
//                   ),
//                   SizedBox(height: 10),
//                   // Date Picker
//                   Row(
//                     children: [
//                       Expanded(
//                         child: Text(selectedDate == null
//                             ? 'Select Date'
//                             : '${selectedDate!.toLocal()}'.split(' ')[0]),
//                       ),
//                       IconButton(
//                         icon: Icon(Icons.calendar_today),
//                         onPressed: () async {
//                           DateTime? picked = await showDatePicker(
//                             context: context,
//                             initialDate: DateTime.now(),
//                             firstDate: DateTime.now(),
//                             lastDate:
//                             DateTime.now().add(Duration(days: 365)),
//                           );
//                           if (picked != null) {
//                             setState(() {
//                               selectedDate = picked;
//                             });
//                           }
//                         },
//                       ),
//                     ],
//                   ),
//                   SizedBox(height: 10),
//                   // Time Picker
//                   Row(
//                     children: [
//                       Expanded(
//                         child: Text(selectedTime == null
//                             ? 'Select Time'
//                             : selectedTime!.format(context)),
//                       ),
//                       IconButton(
//                         icon: Icon(Icons.access_time),
//                         onPressed: () async {
//                           TimeOfDay? picked = await showTimePicker(
//                             context: context,
//                             initialTime: TimeOfDay.now(),
//                           );
//                           if (picked != null) {
//                             setState(() {
//                               selectedTime = picked;
//                             });
//                           }
//                         },
//                       ),
//                     ],
//                   ),
//                   SizedBox(height: 10),
//                   // Duration
//                   TextFormField(
//                     decoration:
//                     InputDecoration(labelText: "Duration (minutes)"),
//                     keyboardType: TextInputType.number,
//                     initialValue: '60',
//                     validator: (value) {
//                       if (value == null || value.isEmpty) {
//                         return 'Please enter duration';
//                       }
//                       if (int.tryParse(value) == null) {
//                         return 'Please enter a valid number';
//                       }
//                       return null;
//                     },
//                     onSaved: (value) {
//                       duration = int.parse(value!);
//                     },
//                   ),
//                 ],
//               ),
//             ),
//           ),
//           actions: [
//             TextButton(
//               child: Text("Cancel"),
//               onPressed: () => Navigator.of(context).pop(),
//             ),
//             ElevatedButton(
//               child: Text("Start"),
//               onPressed: () {
//                 if (_formKey.currentState!.validate()) {
//                   if (selectedDate == null || selectedTime == null) {
//                     ScaffoldMessenger.of(context).showSnackBar(
//                       SnackBar(
//                           content:
//                           Text("Please select both date and time")),
//                     );
//                     return;
//                   }
//                   _formKey.currentState!.save();
//                   DateTime lessonDateTime = DateTime(
//                       selectedDate!.year,
//                       selectedDate!.month,
//                       selectedDate!.day,
//                       selectedTime!.hour,
//                       selectedTime!.minute);
//                   Lesson newLesson = Lesson(
//                       subject: subject,
//                       student: studentName,
//                       dateTime: lessonDateTime,
//                       durationMinutes: duration);
//                   _addLiveLesson(newLesson);
//                   Navigator.of(context).pop();
//                 }
//               },
//             ),
//           ],
//         );
//       },
//     );
//   }
//
//   // Widget for History Card
//   Widget _buildHistoryCard() {
//     return Card(
//       elevation: 4,
//       child: Padding(
//         padding: EdgeInsets.all(16.0),
//         child: Column(
//           crossAxisAlignment: CrossAxisAlignment.start,
//           children: [
//             Text("History",
//                 style: TextStyle(
//                     fontSize: 18, fontWeight: FontWeight.w600)),
//             SizedBox(height: 10),
//             lessonHistory.isEmpty
//                 ? Text(
//               "No history available.",
//               style: TextStyle(color: Colors.grey),
//             )
//                 : ListView.builder(
//               shrinkWrap: true,
//               physics: NeverScrollableScrollPhysics(),
//               itemCount: lessonHistory.length,
//               itemBuilder: (context, index) {
//                 var history = lessonHistory[index];
//                 return Card(
//                   child: ListTile(
//                     leading: Icon(Icons.history, color: Colors.blue),
//                     title: Text(history.subject),
//                     subtitle: Column(
//                       crossAxisAlignment: CrossAxisAlignment.start,
//                       children: [
//                         Text("Student: ${history.student}"),
//                         Text(
//                             "Date: ${history.dateTime.toLocal()}".split(' ')[0]),
//                         Text(
//                             "Time: ${_formatTimeOfDay(TimeOfDay.fromDateTime(history.dateTime))}"),
//                         SizedBox(height: 5),
//                         Text("Feedback: ${history.feedback}"),
//                       ],
//                     ),
//                   ),
//                 );
//               },
//             ),
//           ],
//         ),
//       ),
//     );
//   }
//
//   // Widget for Summary Cards
//   Widget _buildSummaryCards() {
//     return Row(
//       mainAxisAlignment: MainAxisAlignment.spaceBetween,
//       children: [
//         // Total Students Taught
//         Expanded(
//           child: Card(
//             color: Colors.green.shade100,
//             elevation: 4,
//             child: Padding(
//               padding: EdgeInsets.all(16.0),
//               child: Column(
//                 children: [
//                   Icon(Icons.group, color: Colors.green.shade700, size: 40),
//                   SizedBox(height: 10),
//                   Text(
//                     "Total Students",
//                     style: TextStyle(
//                         fontSize: 16, fontWeight: FontWeight.w600),
//                   ),
//                   SizedBox(height: 5),
//                   Text(
//                     "${_totalUniqueStudents()}",
//                     style: TextStyle(
//                         fontSize: 20,
//                         fontWeight: FontWeight.bold,
//                         color: Colors.green.shade700),
//                   ),
//                 ],
//               ),
//             ),
//           ),
//         ),
//         SizedBox(width: 10),
//         // Average Lesson Time
//         Expanded(
//           child: Card(
//             color: Colors.orange.shade100,
//             elevation: 4,
//             child: Padding(
//               padding: EdgeInsets.all(16.0),
//               child: Column(
//                 children: [
//                   Icon(Icons.timer, color: Colors.orange.shade700, size: 40),
//                   SizedBox(height: 10),
//                   Text(
//                     "Avg Lesson Time",
//                     style: TextStyle(
//                         fontSize: 16, fontWeight: FontWeight.w600),
//                   ),
//                   SizedBox(height: 5),
//                   Text(
//                     "${_averageLessonTime().toStringAsFixed(1)} mins",
//                     style: TextStyle(
//                         fontSize: 20,
//                         fontWeight: FontWeight.bold,
//                         color: Colors.orange.shade700),
//                   ),
//                 ],
//               ),
//             ),
//           ),
//         ),
//       ],
//     );
//   }
// }
//
// // Data model for scheduled lessons
// class Lesson {
//   final String subject;
//   final String student;
//   final DateTime dateTime;
//   final int durationMinutes;
//
//   Lesson({
//     required this.subject,
//     required this.student,
//     required this.dateTime,
//     required this.durationMinutes,
//   });
//
//   DateTime get endTime => dateTime.add(Duration(minutes: durationMinutes));
// }
//
// // Data model for lesson history
// class LessonHistory {
//   final String subject;
//   final String student;
//   final DateTime dateTime;
//   final String feedback;
//   final int durationMinutes;
//
//   LessonHistory({
//     required this.subject,
//     required this.student,
//     required this.dateTime,
//     required this.feedback,
//     this.durationMinutes = 60, // Default duration
//   });
// }

// lib/pages/Tutor/dashboard_page_content.dart

// import 'package:flutter/material.dart';
// import 'dart:async';
//
// class DashboardPageContent extends StatefulWidget {
//   @override
//   _DashboardPageContentState createState() => _DashboardPageContentState();
// }
//
// class _DashboardPageContentState extends State<DashboardPageContent> {
//   // Dummy data for available time slots (9 AM to 5 PM)
//   List<TimeOfDay> allTimeSlots = List.generate(
//       9,
//           (index) => TimeOfDay(
//           hour: 9 + index,
//           minute: 0)); // Generates TimeOfDay from 9:00 to 17:00
//
//   // Map to track booked time slots
//   Map<TimeOfDay, bool> bookedTimeSlots = {};
//
//   // Dummy data for scheduled lessons
//   List<Lesson> scheduledLessons = [];
//
//   // Dummy data for history
//   List<LessonHistory> lessonHistory = [];
//
//   // Timer to check for completed lessons
//   Timer? _timer;
//
//   @override
//   void initState() {
//     super.initState();
//     // Initialize all time slots as available
//     for (var slot in allTimeSlots) {
//       bookedTimeSlots[slot] = false;
//     }
//
//     // Initialize with some scheduled lessons
//     scheduledLessons = [
//       Lesson(
//           subject: "Mathematics",
//           student: "John Doe",
//           dateTime: DateTime.now().add(Duration(hours: 1)),
//           durationMinutes: 60),
//       Lesson(
//           subject: "Physics",
//           student: "Jane Smith",
//           dateTime: DateTime.now().add(Duration(hours: 3)),
//           durationMinutes: 60),
//       Lesson(
//           subject: "Chemistry",
//           student: "Alice Johnson",
//           dateTime: DateTime.now().add(Duration(hours: 5)),
//           durationMinutes: 60),
//     ];
//
//     // Mark the booked time slots
//     for (var lesson in scheduledLessons) {
//       TimeOfDay slot =
//       TimeOfDay(hour: lesson.dateTime.hour, minute: 0);
//       if (bookedTimeSlots.containsKey(slot)) {
//         bookedTimeSlots[slot] = true;
//       }
//     }
//
//     // Initialize the timer to check for completed lessons every minute
//     _timer = Timer.periodic(Duration(minutes: 1), (timer) {
//       _checkCompletedLessons();
//     });
//   }
//
//   @override
//   void dispose() {
//     _timer?.cancel();
//     super.dispose();
//   }
//
//   void _checkCompletedLessons() {
//     DateTime now = DateTime.now();
//     List<Lesson> completedLessons = scheduledLessons
//         .where((lesson) => now.isAfter(lesson.endTime))
//         .toList();
//
//     if (completedLessons.isNotEmpty) {
//       setState(() {
//         for (var lesson in completedLessons) {
//           // Remove from scheduled lessons
//           scheduledLessons.remove(lesson);
//
//           // Mark the time slot as available
//           TimeOfDay slot = TimeOfDay(hour: lesson.dateTime.hour, minute: 0);
//           if (bookedTimeSlots.containsKey(slot)) {
//             bookedTimeSlots[slot] = false;
//           }
//
//           // Add to history with dummy feedback
//           lessonHistory.add(LessonHistory(
//               subject: lesson.subject,
//               student: lesson.student,
//               dateTime: lesson.dateTime,
//               feedback: "Great lesson!"));
//         }
//       });
//     }
//   }
//
//   // Function to add a new live lesson
//   void _addLiveLesson(Lesson newLesson) {
//     setState(() {
//       scheduledLessons.add(newLesson);
//       TimeOfDay slot =
//       TimeOfDay(hour: newLesson.dateTime.hour, minute: 0);
//       if (bookedTimeSlots.containsKey(slot)) {
//         bookedTimeSlots[slot] = true;
//       }
//     });
//   }
//
//   // Function to calculate total unique students
//   int _totalUniqueStudents() {
//     Set<String> students = {};
//     for (var lesson in lessonHistory) {
//       students.add(lesson.student);
//     }
//     for (var lesson in scheduledLessons) {
//       students.add(lesson.student);
//     }
//     return students.length;
//   }
//
//   // Function to calculate average lesson time
//   double _averageLessonTime() {
//     if (lessonHistory.isEmpty) return 0.0;
//     int totalMinutes = 0;
//     for (var lesson in lessonHistory) {
//       totalMinutes += lesson.durationMinutes;
//     }
//     return totalMinutes / lessonHistory.length;
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return SingleChildScrollView(
//       padding: EdgeInsets.all(16.0),
//       child: Column(
//         crossAxisAlignment: CrossAxisAlignment.start,
//         children: [
//           // Dashboard Title
//           Text(
//             "Dashboard",
//             style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
//           ),
//           SizedBox(height: 20),
//           // Available Time & Booked Time Table
//           _buildTimeSlotsCard(),
//           SizedBox(height: 20),
//           // Schedule Cards
//           _buildScheduleCards(),
//           SizedBox(height: 20),
//           // Start Live Lesson Card
//           _buildStartLiveLessonCard(),
//           SizedBox(height: 20),
//           // History Card
//           _buildHistoryCard(),
//           SizedBox(height: 20),
//           // Summary Cards
//           _buildSummaryCards(),
//         ],
//       ),
//     );
//   }
//
//   // Widget for Available Time & Booked Time Table
//   Widget _buildTimeSlotsCard() {
//     return Card(
//       elevation: 4,
//       child: Padding(
//         padding: EdgeInsets.all(16.0),
//         child: Column(
//           crossAxisAlignment: CrossAxisAlignment.start,
//           children: [
//             Text("Available Time Slots",
//                 style:
//                 TextStyle(fontSize: 18, fontWeight: FontWeight.w600)),
//             SizedBox(height: 10),
//             Table(
//               border: TableBorder.all(color: Colors.grey.shade300),
//               children: [
//                 TableRow(
//                   decoration: BoxDecoration(color: Colors.blue.shade50),
//                   children: [
//                     Padding(
//                       padding: EdgeInsets.all(8.0),
//                       child: Text("Time",
//                           style: TextStyle(fontWeight: FontWeight.bold)),
//                     ),
//                     Padding(
//                       padding: EdgeInsets.all(8.0),
//                       child: Text("Status",
//                           style: TextStyle(fontWeight: FontWeight.bold)),
//                     ),
//                   ],
//                 ),
//                 ...allTimeSlots.map((slot) {
//                   bool isBooked = bookedTimeSlots[slot] ?? false;
//                   return TableRow(
//                     children: [
//                       Padding(
//                         padding: EdgeInsets.all(8.0),
//                         child: Text(
//                           "${slot.format(context)}",
//                           style: TextStyle(fontSize: 16),
//                         ),
//                       ),
//                       Padding(
//                         padding: EdgeInsets.all(8.0),
//                         child: Text(
//                           isBooked ? "Booked" : "Available",
//                           style: TextStyle(
//                               color: isBooked ? Colors.red : Colors.green,
//                               fontWeight: FontWeight.bold),
//                         ),
//                       ),
//                     ],
//                   );
//                 }).toList(),
//               ],
//             ),
//           ],
//         ),
//       ),
//     );
//   }
//
//   // Widget for Schedule Cards
//   Widget _buildScheduleCards() {
//     return Column(
//       crossAxisAlignment: CrossAxisAlignment.start,
//       children: [
//         Text(
//           "Today's Schedule",
//           style: TextStyle(fontSize: 18, fontWeight: FontWeight.w600),
//         ),
//         SizedBox(height: 10),
//         Container(
//           height: 150, // Adjust height as needed
//           child: scheduledLessons.isEmpty
//               ? Center(
//             child: Text(
//               "No scheduled lessons for today.",
//               style: TextStyle(color: Colors.grey),
//             ),
//           )
//               : ListView.builder(
//             scrollDirection: Axis.horizontal,
//             itemCount: scheduledLessons.length,
//             itemBuilder: (context, index) {
//               var lesson = scheduledLessons[index];
//               return Padding(
//                 padding: EdgeInsets.only(right: 16.0),
//                 child: Card(
//                   elevation: 4,
//                   child: Container(
//                     width: 200, // Adjust width as needed
//                     padding: EdgeInsets.all(16.0),
//                     child: Column(
//                       crossAxisAlignment: CrossAxisAlignment.start,
//                       children: [
//                         Text(
//                           lesson.subject,
//                           style: TextStyle(
//                               fontSize: 18,
//                               fontWeight: FontWeight.bold),
//                         ),
//                         SizedBox(height: 10),
//                         Text("Student: ${lesson.student}",
//                             style: TextStyle(fontSize: 16)),
//                         SizedBox(height: 10),
//                         Text(
//                             "Time: ${_formatDateTime(lesson.dateTime)}",
//                             style: TextStyle(fontSize: 16)),
//                       ],
//                     ),
//                   ),
//                 ),
//               );
//             },
//           ),
//         ),
//       ],
//     );
//   }
//
//   // Helper function to format DateTime
//   String _formatDateTime(DateTime dateTime) {
//     return "${_formatTimeOfDay(TimeOfDay.fromDateTime(dateTime))}";
//   }
//
//   // Helper function to format TimeOfDay
//   String _formatTimeOfDay(TimeOfDay time) {
//     return MaterialLocalizations.of(context).formatTimeOfDay(time,
//         alwaysUse24HourFormat: false);
//   }
//
//   // Widget for Start Live Lesson Card
//   Widget _buildStartLiveLessonCard() {
//     return GestureDetector(
//       onTap: () {
//         _showStartLiveLessonDialog();
//       },
//       child: Card(
//         color: Colors.blue.shade100,
//         elevation: 4,
//         child: Container(
//           height: 100, // Adjust height as needed
//           child: Center(
//             child: Text(
//               "Start Live Lesson",
//               style: TextStyle(
//                   fontSize: 18,
//                   fontWeight: FontWeight.bold,
//                   color: Colors.blue.shade800),
//             ),
//           ),
//         ),
//       ),
//     );
//   }
//
//   // Function to show Start Live Lesson Dialog
//   void _showStartLiveLessonDialog() {
//     final _formKey = GlobalKey<FormState>();
//     String studentName = '';
//     String subject = '';
//     DateTime? selectedDate;
//     TimeOfDay? selectedTime;
//     int duration = 60; // default duration in minutes
//
//     showDialog(
//       context: context,
//       builder: (context) {
//         return AlertDialog(
//           title: Text("Start Live Lesson"),
//           content: SingleChildScrollView(
//             child: Form(
//               key: _formKey,
//               child: Column(
//                 children: [
//                   // Student Name
//                   TextFormField(
//                     decoration: InputDecoration(labelText: "Student Name"),
//                     validator: (value) {
//                       if (value == null || value.isEmpty) {
//                         return 'Please enter student name';
//                       }
//                       return null;
//                     },
//                     onSaved: (value) {
//                       studentName = value!;
//                     },
//                   ),
//                   SizedBox(height: 10),
//                   // Subject
//                   TextFormField(
//                     decoration: InputDecoration(labelText: "Subject"),
//                     validator: (value) {
//                       if (value == null || value.isEmpty) {
//                         return 'Please enter subject';
//                       }
//                       return null;
//                     },
//                     onSaved: (value) {
//                       subject = value!;
//                     },
//                   ),
//                   SizedBox(height: 10),
//                   // Date Picker
//                   Row(
//                     children: [
//                       Expanded(
//                         child: Text(selectedDate == null
//                             ? 'Select Date'
//                             : '${selectedDate!.toLocal()}'.split(' ')[0]),
//                       ),
//                       IconButton(
//                         icon: Icon(Icons.calendar_today),
//                         onPressed: () async {
//                           DateTime? picked = await showDatePicker(
//                             context: context,
//                             initialDate: DateTime.now(),
//                             firstDate: DateTime.now(),
//                             lastDate: DateTime.now().add(Duration(days: 365)),
//                           );
//                           if (picked != null) {
//                             setState(() {
//                               selectedDate = picked;
//                             });
//                           }
//                         },
//                       ),
//                     ],
//                   ),
//                   SizedBox(height: 10),
//                   // Time Picker
//                   Row(
//                     children: [
//                       Expanded(
//                         child: Text(selectedTime == null
//                             ? 'Select Time'
//                             : selectedTime!.format(context)),
//                       ),
//                       IconButton(
//                         icon: Icon(Icons.access_time),
//                         onPressed: () async {
//                           TimeOfDay? picked = await showTimePicker(
//                             context: context,
//                             initialTime: TimeOfDay.now(),
//                           );
//                           if (picked != null) {
//                             setState(() {
//                               selectedTime = picked;
//                             });
//                           }
//                         },
//                       ),
//                     ],
//                   ),
//                   SizedBox(height: 10),
//                   // Duration
//                   TextFormField(
//                     decoration:
//                     InputDecoration(labelText: "Duration (minutes)"),
//                     keyboardType: TextInputType.number,
//                     initialValue: '60',
//                     validator: (value) {
//                       if (value == null || value.isEmpty) {
//                         return 'Please enter duration';
//                       }
//                       if (int.tryParse(value) == null) {
//                         return 'Please enter a valid number';
//                       }
//                       return null;
//                     },
//                     onSaved: (value) {
//                       duration = int.parse(value!);
//                     },
//                   ),
//                 ],
//               ),
//             ),
//           ),
//           actions: [
//             TextButton(
//               child: Text("Cancel"),
//               onPressed: () => Navigator.of(context).pop(),
//             ),
//             ElevatedButton(
//               child: Text("Start"),
//               onPressed: () {
//                 if (_formKey.currentState!.validate()) {
//                   if (selectedDate == null || selectedTime == null) {
//                     ScaffoldMessenger.of(context).showSnackBar(
//                       SnackBar(content: Text("Please select both date and time")),
//                     );
//                     return;
//                   }
//                   _formKey.currentState!.save();
//                   DateTime lessonDateTime = DateTime(
//                       selectedDate!.year,
//                       selectedDate!.month,
//                       selectedDate!.day,
//                       selectedTime!.hour,
//                       selectedTime!.minute);
//                   Lesson newLesson = Lesson(
//                       subject: subject,
//                       student: studentName,
//                       dateTime: lessonDateTime,
//                       durationMinutes: duration);
//                   _addLiveLesson(newLesson);
//                   Navigator.of(context).pop();
//                 }
//               },
//             ),
//           ],
//         );
//       },
//     );
//   }
//
//   // Widget for History Card
//   Widget _buildHistoryCard() {
//     return Card(
//       elevation: 4,
//       child: Padding(
//         padding: EdgeInsets.all(16.0),
//         child: Column(
//           crossAxisAlignment: CrossAxisAlignment.start,
//           children: [
//             Text("History",
//                 style:
//                 TextStyle(fontSize: 18, fontWeight: FontWeight.w600)),
//             SizedBox(height: 10),
//             lessonHistory.isEmpty
//                 ? Text(
//               "No history available.",
//               style: TextStyle(color: Colors.grey),
//             )
//                 : ListView.builder(
//               shrinkWrap: true,
//               physics: NeverScrollableScrollPhysics(),
//               itemCount: lessonHistory.length,
//               itemBuilder: (context, index) {
//                 var history = lessonHistory[index];
//                 return Card(
//                   child: ListTile(
//                     leading: Icon(Icons.history, color: Colors.blue),
//                     title: Text(history.subject),
//                     subtitle: Column(
//                       crossAxisAlignment: CrossAxisAlignment.start,
//                       children: [
//                         Text("Student: ${history.student}"),
//                         Text(
//                             "Date: ${history.dateTime.toLocal()}".split(' ')[0]),
//                         Text(
//                             "Time: ${_formatTimeOfDay(TimeOfDay.fromDateTime(history.dateTime))}"),
//                         SizedBox(height: 5),
//                         Text("Feedback: ${history.feedback}"),
//                       ],
//                     ),
//                   ),
//                 );
//               },
//             ),
//           ],
//         ),
//       ),
//     );
//   }
//
//   // Widget for Summary Cards
//   Widget _buildSummaryCards() {
//     return Row(
//       mainAxisAlignment: MainAxisAlignment.spaceBetween,
//       children: [
//         // Total Students Taught
//         Expanded(
//           child: Card(
//             color: Colors.green.shade100,
//             elevation: 4,
//             child: Padding(
//               padding: EdgeInsets.all(16.0),
//               child: Column(
//                 children: [
//                   Icon(Icons.group,
//                       color: Colors.green.shade700, size: 40),
//                   SizedBox(height: 10),
//                   Text(
//                     "Total Students",
//                     style:
//                     TextStyle(fontSize: 16, fontWeight: FontWeight.w600),
//                   ),
//                   SizedBox(height: 5),
//                   Text(
//                     "${_totalUniqueStudents()}",
//                     style: TextStyle(
//                         fontSize: 20,
//                         fontWeight: FontWeight.bold,
//                         color: Colors.green.shade700),
//                   ),
//                 ],
//               ),
//             ),
//           ),
//         ),
//         SizedBox(width: 10),
//         // Average Lesson Time
//         Expanded(
//           child: Card(
//             color: Colors.orange.shade100,
//             elevation: 4,
//             child: Padding(
//               padding: EdgeInsets.all(16.0),
//               child: Column(
//                 children: [
//                   Icon(Icons.timer,
//                       color: Colors.orange.shade700, size: 40),
//                   SizedBox(height: 10),
//                   Text(
//                     "Avg Lesson Time",
//                     style:
//                     TextStyle(fontSize: 16, fontWeight: FontWeight.w600),
//                   ),
//                   SizedBox(height: 5),
//                   Text(
//                     "${_averageLessonTime().toStringAsFixed(1)} mins",
//                     style: TextStyle(
//                         fontSize: 20,
//                         fontWeight: FontWeight.bold,
//                         color: Colors.orange.shade700),
//                   ),
//                 ],
//               ),
//             ),
//           ),
//         ),
//       ],
//     );
//   }
// }
//
// // Data model for scheduled lessons
// class Lesson {
//   final String subject;
//   final String student;
//   final DateTime dateTime;
//   final int durationMinutes;
//
//   Lesson({
//     required this.subject,
//     required this.student,
//     required this.dateTime,
//     required this.durationMinutes,
//   });
//
//   DateTime get endTime => dateTime.add(Duration(minutes: durationMinutes));
// }
//
// // Data model for lesson history
// class LessonHistory {
//   final String subject;
//   final String student;
//   final DateTime dateTime;
//   final String feedback;
//   final int durationMinutes;
//
//   LessonHistory({
//     required this.subject,
//     required this.student,
//     required this.dateTime,
//     required this.feedback,
//     this.durationMinutes = 60, // Default duration
//   });
// }

// lib/pages/Tutor/dashboard_page_content.dart
//
// import 'package:flutter/material.dart';
// import 'dart:async';
//
// class DashboardPageContent extends StatefulWidget {
//   @override
//   _DashboardPageContentState createState() => _DashboardPageContentState();
// }
//
// class _DashboardPageContentState extends State<DashboardPageContent> {
//   // Define time slots from 9 AM to 5 PM, excluding 12 PM - 1 PM
//   List<TimeSlot> allTimeSlots = [
//     TimeSlot(start: TimeOfDay(hour: 9, minute: 0), end: TimeOfDay(hour: 10, minute: 0)),
//     TimeSlot(start: TimeOfDay(hour: 10, minute: 0), end: TimeOfDay(hour: 11, minute: 0)),
//     TimeSlot(start: TimeOfDay(hour: 11, minute: 0), end: TimeOfDay(hour: 12, minute: 0)),
//     // 12 PM - 1 PM Break
//     TimeSlot(start: TimeOfDay(hour: 12, minute: 0), end: TimeOfDay(hour: 13, minute: 0), isBreak: true),
//     TimeSlot(start: TimeOfDay(hour: 13, minute: 0), end: TimeOfDay(hour: 14, minute: 0)),
//     TimeSlot(start: TimeOfDay(hour: 14, minute: 0), end: TimeOfDay(hour: 15, minute: 0)),
//     TimeSlot(start: TimeOfDay(hour: 15, minute: 0), end: TimeOfDay(hour: 16, minute: 0)),
//     TimeSlot(start: TimeOfDay(hour: 16, minute: 0), end: TimeOfDay(hour: 17, minute: 0)),
//   ];
//
//   // Map to track booked time slots
//   Map<TimeSlot, bool> bookedTimeSlots = {};
//
//   // Dummy data for scheduled lessons
//   List<Lesson> scheduledLessons = [];
//
//   // Dummy data for history
//   List<LessonHistory> lessonHistory = [];
//
//   // Timer to check for completed lessons
//   Timer? _timer;
//
//   @override
//   void initState() {
//     super.initState();
//     // Initialize all time slots as available or break
//     for (var slot in allTimeSlots) {
//       bookedTimeSlots[slot] = slot.isBreak ? true : false; // Break slots are treated as booked
//     }
//
//     // Initialize with some scheduled lessons
//     scheduledLessons = [
//       Lesson(
//           subject: "Mathematics",
//           student: "John Doe",
//           dateTime: DateTime.now().add(Duration(hours: 1)),
//           durationMinutes: 60),
//       Lesson(
//           subject: "Physics",
//           student: "Jane Smith",
//           dateTime: DateTime.now().add(Duration(hours: 3)),
//           durationMinutes: 60),
//       Lesson(
//           subject: "Chemistry",
//           student: "Alice Johnson",
//           dateTime: DateTime.now().add(Duration(hours: 5)),
//           durationMinutes: 60),
//     ];
//
//     // Mark the booked time slots
//     for (var lesson in scheduledLessons) {
//       TimeSlot? slot = allTimeSlots.firstWhere(
//               (ts) => ts.start.hour == lesson.dateTime.hour && ts.start.minute == 0,
//           orElse: () => TimeSlot(start: TimeOfDay(hour: 0, minute: 0), end: TimeOfDay(hour: 0, minute: 0)));
//       if (slot.isValid) {
//         bookedTimeSlots[slot] = true;
//       }
//     }
//
//     // Initialize the timer to check for completed lessons every minute
//     _timer = Timer.periodic(Duration(minutes: 1), (timer) {
//       _checkCompletedLessons();
//     });
//   }
//
//   @override
//   void dispose() {
//     _timer?.cancel();
//     super.dispose();
//   }
//
//   // Function to check and handle completed lessons
//   void _checkCompletedLessons() {
//     DateTime now = DateTime.now();
//     List<Lesson> completedLessons = scheduledLessons
//         .where((lesson) => now.isAfter(lesson.endTime))
//         .toList();
//
//     if (completedLessons.isNotEmpty) {
//       setState(() {
//         for (var lesson in completedLessons) {
//           // Remove from scheduled lessons
//           scheduledLessons.remove(lesson);
//
//           // Mark the time slot as available
//           TimeSlot slot = allTimeSlots.firstWhere(
//                   (ts) => ts.start.hour == lesson.dateTime.hour && ts.start.minute == 0,
//               orElse: () => TimeSlot(start: TimeOfDay(hour: 0, minute: 0), end: TimeOfDay(hour: 0, minute: 0)));
//           if (slot.isValid && !slot.isBreak) {
//             bookedTimeSlots[slot] = false;
//           }
//
//           // Add to history with dummy feedback
//           lessonHistory.add(LessonHistory(
//               subject: lesson.subject,
//               student: lesson.student,
//               dateTime: lesson.dateTime,
//               feedback: "Great lesson!"));
//         }
//       });
//     }
//   }
//
//   // Function to add a new live lesson
//   void _addLiveLesson(Lesson newLesson) {
//     setState(() {
//       scheduledLessons.add(newLesson);
//       TimeSlot? slot = allTimeSlots.firstWhere(
//               (ts) => ts.start.hour == newLesson.dateTime.hour && ts.start.minute == 0,
//           orElse: () => TimeSlot(start: TimeOfDay(hour: 0, minute: 0), end: TimeOfDay(hour: 0, minute: 0)));
//       if (slot.isValid && !slot.isBreak) {
//         bookedTimeSlots[slot] = true;
//       }
//     });
//   }
//
//   // Function to calculate total unique students
//   int _totalUniqueStudents() {
//     Set<String> students = {};
//     for (var lesson in lessonHistory) {
//       students.add(lesson.student);
//     }
//     for (var lesson in scheduledLessons) {
//       students.add(lesson.student);
//     }
//     return students.length;
//   }
//
//   // Function to calculate average lesson time
//   double _averageLessonTime() {
//     if (lessonHistory.isEmpty) return 0.0;
//     int totalMinutes = 0;
//     for (var lesson in lessonHistory) {
//       totalMinutes += lesson.durationMinutes;
//     }
//     return totalMinutes / lessonHistory.length;
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return SingleChildScrollView(
//       padding: EdgeInsets.all(16.0),
//       child: Column(
//         crossAxisAlignment: CrossAxisAlignment.start,
//         children: [
//           // Summary Cards at the Top
//           _buildSummaryCards(),
//           SizedBox(height: 20),
//           // Available Time & Booked Time Table
//           _buildTimeSlotsCard(),
//           SizedBox(height: 20),
//           // Schedule Cards
//           _buildScheduleCards(),
//           SizedBox(height: 20),
//           // Start Live Lesson Card
//           _buildStartLiveLessonCard(),
//           SizedBox(height: 20),
//           // History Card
//           _buildHistoryCard(),
//         ],
//       ),
//     );
//   }
//
//   // Widget for Summary Cards
//   Widget _buildSummaryCards() {
//     return Row(
//       mainAxisAlignment: MainAxisAlignment.spaceBetween,
//       children: [
//         // Total Students Taught
//         Expanded(
//           child: Card(
//             color: Colors.green.shade100,
//             elevation: 4,
//             child: Padding(
//               padding: EdgeInsets.all(16.0),
//               child: Column(
//                 children: [
//                   Icon(Icons.group, color: Colors.green.shade700, size: 40),
//                   SizedBox(height: 10),
//                   Text(
//                     "Total Students",
//                     style: TextStyle(fontSize: 16, fontWeight: FontWeight.w600),
//                   ),
//                   SizedBox(height: 5),
//                   Text(
//                     "${_totalUniqueStudents()}",
//                     style: TextStyle(
//                         fontSize: 20,
//                         fontWeight: FontWeight.bold,
//                         color: Colors.green.shade700),
//                   ),
//                 ],
//               ),
//             ),
//           ),
//         ),
//         SizedBox(width: 10),
//         // Average Lesson Time
//         Expanded(
//           child: Card(
//             color: Colors.orange.shade100,
//             elevation: 4,
//             child: Padding(
//               padding: EdgeInsets.all(16.0),
//               child: Column(
//                 children: [
//                   Icon(Icons.timer, color: Colors.orange.shade700, size: 40),
//                   SizedBox(height: 10),
//                   Text(
//                     "Avg Lesson Time",
//                     style: TextStyle(fontSize: 16, fontWeight: FontWeight.w600),
//                   ),
//                   SizedBox(height: 5),
//                   Text(
//                     "${_averageLessonTime().toStringAsFixed(1)} mins",
//                     style: TextStyle(
//                         fontSize: 20,
//                         fontWeight: FontWeight.bold,
//                         color: Colors.orange.shade700),
//                   ),
//                 ],
//               ),
//             ),
//           ),
//         ),
//       ],
//     );
//   }
//
//   // Widget for Available Time & Booked Time Table
//   Widget _buildTimeSlotsCard() {
//     return Card(
//       elevation: 4,
//       child: Padding(
//         padding: EdgeInsets.all(16.0),
//         child: Column(
//           crossAxisAlignment: CrossAxisAlignment.start,
//           children: [
//             Text("Available Time Slots",
//                 style: TextStyle(fontSize: 18, fontWeight: FontWeight.w600)),
//             SizedBox(height: 10),
//             Table(
//               border: TableBorder.all(color: Colors.grey.shade300),
//               children: [
//                 TableRow(
//                   decoration: BoxDecoration(color: Colors.blue.shade50),
//                   children: [
//                     Padding(
//                       padding: EdgeInsets.all(8.0),
//                       child: Text("Time",
//                           style: TextStyle(fontWeight: FontWeight.bold)),
//                     ),
//                     Padding(
//                       padding: EdgeInsets.all(8.0),
//                       child: Text("Status",
//                           style: TextStyle(fontWeight: FontWeight.bold)),
//                     ),
//                   ],
//                 ),
//                 ...allTimeSlots.map((slot) {
//                   if (slot.isBreak) {
//                     // Display break slot
//                     return TableRow(
//                       decoration: BoxDecoration(color: Colors.grey.shade200),
//                       children: [
//                         Padding(
//                           padding: EdgeInsets.all(8.0),
//                           child: Text(
//                             "${_formatTimeRange(slot.start, slot.end)}",
//                             style: TextStyle(
//                                 fontSize: 16, fontWeight: FontWeight.bold),
//                           ),
//                         ),
//                         Padding(
//                           padding: EdgeInsets.all(8.0),
//                           child: Text(
//                             "Break",
//                             style: TextStyle(
//                                 color: Colors.grey, fontWeight: FontWeight.bold),
//                           ),
//                         ),
//                       ],
//                     );
//                   } else {
//                     // Display available or booked slot
//                     bool isBooked = bookedTimeSlots[slot] ?? false;
//                     return TableRow(
//                       children: [
//                         Padding(
//                           padding: EdgeInsets.all(8.0),
//                           child: Text(
//                             "${_formatTimeRange(slot.start, slot.end)}",
//                             style: TextStyle(fontSize: 16),
//                           ),
//                         ),
//                         Padding(
//                           padding: EdgeInsets.all(8.0),
//                           child: Text(
//                             isBooked ? "Booked" : "Available",
//                             style: TextStyle(
//                                 color: isBooked ? Colors.red : Colors.green,
//                                 fontWeight: FontWeight.bold),
//                           ),
//                         ),
//                       ],
//                     );
//                   }
//                 }).toList(),
//               ],
//             ),
//           ],
//         ),
//       ),
//     );
//   }
//
//   // Helper function to format time range
//   String _formatTimeRange(TimeOfDay start, TimeOfDay end) {
//     return "${_formatTimeOfDay(start)} - ${_formatTimeOfDay(end)}";
//   }
//
//   // Helper function to format TimeOfDay
//   String _formatTimeOfDay(TimeOfDay time) {
//     return MaterialLocalizations.of(context).formatTimeOfDay(time,
//         alwaysUse24HourFormat: false);
//   }
//
//   // Widget for Schedule Cards
//   Widget _buildScheduleCards() {
//     return Column(
//       crossAxisAlignment: CrossAxisAlignment.start,
//       children: [
//         Text(
//           "Today's Schedule",
//           style: TextStyle(fontSize: 18, fontWeight: FontWeight.w600),
//         ),
//         SizedBox(height: 10),
//         Container(
//           height: 150, // Adjust height as needed
//           child: scheduledLessons.isEmpty
//               ? Center(
//             child: Text(
//               "No scheduled lessons for today.",
//               style: TextStyle(color: Colors.grey),
//             ),
//           )
//               : ListView.builder(
//             scrollDirection: Axis.horizontal,
//             itemCount: scheduledLessons.length,
//             itemBuilder: (context, index) {
//               var lesson = scheduledLessons[index];
//               return Padding(
//                 padding: EdgeInsets.only(right: 16.0),
//                 child: Card(
//                   elevation: 4,
//                   child: Container(
//                     width: 200, // Adjust width as needed
//                     padding: EdgeInsets.all(16.0),
//                     child: Column(
//                       crossAxisAlignment: CrossAxisAlignment.start,
//                       children: [
//                         Text(
//                           lesson.subject,
//                           style: TextStyle(
//                               fontSize: 18, fontWeight: FontWeight.bold),
//                         ),
//                         SizedBox(height: 10),
//                         Text("Student: ${lesson.student}",
//                             style: TextStyle(fontSize: 16)),
//                         SizedBox(height: 10),
//                         Text(
//                             "Time: ${_formatDateTime(lesson.dateTime)}",
//                             style: TextStyle(fontSize: 16)),
//                       ],
//                     ),
//                   ),
//                 ),
//               );
//             },
//           ),
//         ),
//       ],
//     );
//   }
//
//   // Helper function to format DateTime
//   String _formatDateTime(DateTime dateTime) {
//     return "${_formatTimeOfDay(TimeOfDay.fromDateTime(dateTime))}";
//   }
//
//   // Widget for Start Live Lesson Card
//   Widget _buildStartLiveLessonCard() {
//     return GestureDetector(
//       onTap: () {
//         _showStartLiveLessonDialog();
//       },
//       child: Card(
//         color: Colors.blue.shade100,
//         elevation: 4,
//         child: Container(
//           height: 100, // Adjust height as needed
//           child: Center(
//             child: Text(
//               "Start Live Lesson",
//               style: TextStyle(
//                   fontSize: 18,
//                   fontWeight: FontWeight.bold,
//                   color: Colors.blue.shade800),
//             ),
//           ),
//         ),
//       ),
//     );
//   }
//
//   // Function to show Start Live Lesson Dialog
//   void _showStartLiveLessonDialog() {
//     final _formKey = GlobalKey<FormState>();
//     String studentName = '';
//     String subject = '';
//     DateTime? selectedDate;
//     TimeOfDay? selectedTime;
//     int duration = 60; // default duration in minutes
//
//     showDialog(
//       context: context,
//       builder: (context) {
//         return AlertDialog(
//           title: Text("Start Live Lesson"),
//           content: SingleChildScrollView(
//             child: Form(
//               key: _formKey,
//               child: Column(
//                 children: [
//                   // Student Name
//                   TextFormField(
//                     decoration: InputDecoration(labelText: "Student Name"),
//                     validator: (value) {
//                       if (value == null || value.isEmpty) {
//                         return 'Please enter student name';
//                       }
//                       return null;
//                     },
//                     onSaved: (value) {
//                       studentName = value!;
//                     },
//                   ),
//                   SizedBox(height: 10),
//                   // Subject
//                   TextFormField(
//                     decoration: InputDecoration(labelText: "Subject"),
//                     validator: (value) {
//                       if (value == null || value.isEmpty) {
//                         return 'Please enter subject';
//                       }
//                       return null;
//                     },
//                     onSaved: (value) {
//                       subject = value!;
//                     },
//                   ),
//                   SizedBox(height: 10),
//                   // Date Picker
//                   Row(
//                     children: [
//                       Expanded(
//                         child: Text(selectedDate == null
//                             ? 'Select Date'
//                             : '${selectedDate!.toLocal()}'.split(' ')[0]),
//                       ),
//                       IconButton(
//                         icon: Icon(Icons.calendar_today),
//                         onPressed: () async {
//                           DateTime? picked = await showDatePicker(
//                             context: context,
//                             initialDate: DateTime.now(),
//                             firstDate: DateTime.now(),
//                             lastDate: DateTime.now().add(Duration(days: 365)),
//                           );
//                           if (picked != null) {
//                             setState(() {
//                               selectedDate = picked;
//                             });
//                           }
//                         },
//                       ),
//                     ],
//                   ),
//                   SizedBox(height: 10),
//                   // Time Picker
//                   Row(
//                     children: [
//                       Expanded(
//                         child: Text(selectedTime == null
//                             ? 'Select Time'
//                             : selectedTime!.format(context)),
//                       ),
//                       IconButton(
//                         icon: Icon(Icons.access_time),
//                         onPressed: () async {
//                           TimeOfDay? picked = await showTimePicker(
//                             context: context,
//                             initialTime: TimeOfDay.now(),
//                           );
//                           if (picked != null) {
//                             setState(() {
//                               selectedTime = picked;
//                             });
//                           }
//                         },
//                       ),
//                     ],
//                   ),
//                   SizedBox(height: 10),
//                   // Duration
//                   TextFormField(
//                     decoration:
//                     InputDecoration(labelText: "Duration (minutes)"),
//                     keyboardType: TextInputType.number,
//                     initialValue: '60',
//                     validator: (value) {
//                       if (value == null || value.isEmpty) {
//                         return 'Please enter duration';
//                       }
//                       if (int.tryParse(value) == null) {
//                         return 'Please enter a valid number';
//                       }
//                       return null;
//                     },
//                     onSaved: (value) {
//                       duration = int.parse(value!);
//                     },
//                   ),
//                 ],
//               ),
//             ),
//           ),
//           actions: [
//             TextButton(
//               child: Text("Cancel"),
//               onPressed: () => Navigator.of(context).pop(),
//             ),
//             ElevatedButton(
//               child: Text("Start"),
//               onPressed: () {
//                 if (_formKey.currentState!.validate()) {
//                   if (selectedDate == null || selectedTime == null) {
//                     ScaffoldMessenger.of(context).showSnackBar(
//                       SnackBar(content: Text("Please select both date and time")),
//                     );
//                     return;
//                   }
//                   _formKey.currentState!.save();
//                   DateTime lessonDateTime = DateTime(
//                       selectedDate!.year,
//                       selectedDate!.month,
//                       selectedDate!.day,
//                       selectedTime!.hour,
//                       selectedTime!.minute);
//                   Lesson newLesson = Lesson(
//                       subject: subject,
//                       student: studentName,
//                       dateTime: lessonDateTime,
//                       durationMinutes: duration);
//                   _addLiveLesson(newLesson);
//                   Navigator.of(context).pop();
//                 }
//               },
//             ),
//           ],
//         );
//       },
//     );
//   }
//
//   // Widget for History Card
//   Widget _buildHistoryCard() {
//     return Card(
//       elevation: 4,
//       child: Padding(
//         padding: EdgeInsets.all(16.0),
//         child: Column(
//           crossAxisAlignment: CrossAxisAlignment.start,
//           children: [
//             Text("History",
//                 style: TextStyle(fontSize: 18, fontWeight: FontWeight.w600)),
//             SizedBox(height: 10),
//             lessonHistory.isEmpty
//                 ? Text(
//               "No history available.",
//               style: TextStyle(color: Colors.grey),
//             )
//                 : ListView.builder(
//               shrinkWrap: true,
//               physics: NeverScrollableScrollPhysics(),
//               itemCount: lessonHistory.length,
//               itemBuilder: (context, index) {
//                 var history = lessonHistory[index];
//                 return Card(
//                   child: ListTile(
//                     leading: Icon(Icons.history, color: Colors.blue),
//                     title: Text(history.subject),
//                     subtitle: Column(
//                       crossAxisAlignment: CrossAxisAlignment.start,
//                       children: [
//                         Text("Student: ${history.student}"),
//                         Text("Date: ${history.dateTime.toLocal()}".split(' ')[0]),
//                         Text("Time: ${_formatTimeOfDay(TimeOfDay.fromDateTime(history.dateTime))}"),
//                         SizedBox(height: 5),
//                         Text("Feedback: ${history.feedback}"),
//                       ],
//                     ),
//                   ),
//                 );
//               },
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }
//
// // Data model for time slots
// class TimeSlot {
//   final TimeOfDay start;
//   final TimeOfDay end;
//   final bool isBreak;
//
//   TimeSlot({required this.start, required this.end, this.isBreak = false});
//
//   bool get isValid => start.hour != 0 && end.hour != 0;
//
//   // Override equality and hashCode to use TimeSlot as a key in Map
//   @override
//   bool operator ==(Object other) =>
//       identical(this, other) ||
//           other is TimeSlot &&
//               runtimeType == other.runtimeType &&
//               start.hour == other.start.hour &&
//               start.minute == other.start.minute &&
//               end.hour == other.end.hour &&
//               end.minute == other.end.minute &&
//               isBreak == other.isBreak;
//
//   @override
//   int get hashCode =>
//       start.hour.hashCode ^
//       start.minute.hashCode ^
//       end.hour.hashCode ^
//       end.minute.hashCode ^
//       isBreak.hashCode;
// }
//
// // Data model for scheduled lessons
// class Lesson {
//   final String subject;
//   final String student;
//   final DateTime dateTime;
//   final int durationMinutes;
//
//   Lesson({
//     required this.subject,
//     required this.student,
//     required this.dateTime,
//     required this.durationMinutes,
//   });
//
//   DateTime get endTime => dateTime.add(Duration(minutes: durationMinutes));
// }
//
// // Data model for lesson history
// class LessonHistory {
//   final String subject;
//   final String student;
//   final DateTime dateTime;
//   final String feedback;
//   final int durationMinutes;
//
//   LessonHistory({
//     required this.subject,
//     required this.student,
//     required this.dateTime,
//     required this.feedback,
//     this.durationMinutes = 60, // Default duration
//   });
// }
//


// import 'package:flutter/material.dart';
// import 'dart:async';
//
// void main() {
//   runApp(MyApp());
// }
//
// /// The root widget of the application.
// class MyApp extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//         title: 'Dashboard Demo',
//         theme: ThemeData(
//           primarySwatch: Colors.blue,
//         ),
//         home: DashboardPageContent());
//   }
// }
//
// /// Data model for time slots
// class TimeSlot {
//   final TimeOfDay start;
//   final TimeOfDay end;
//   final bool isBreak;
//
//   TimeSlot({required this.start, required this.end, this.isBreak = false});
//
//   bool get isValid => start.hour != 0 && end.hour != 0;
//
//   // Override equality and hashCode to use TimeSlot as a key in Map
//   @override
//   bool operator ==(Object other) =>
//       identical(this, other) ||
//           other is TimeSlot &&
//               runtimeType == other.runtimeType &&
//               start.hour == other.start.hour &&
//               start.minute == other.start.minute &&
//               end.hour == other.end.hour &&
//               end.minute == other.end.minute &&
//               isBreak == other.isBreak;
//
//   @override
//   int get hashCode =>
//       start.hour.hashCode ^
//       start.minute.hashCode ^
//       end.hour.hashCode ^
//       end.minute.hashCode ^
//       isBreak.hashCode;
// }
//
// /// Data model for scheduled lessons
// class Lesson {
//   final String subject;
//   final String student;
//   final DateTime dateTime;
//   final int durationMinutes;
//
//   Lesson({
//     required this.subject,
//     required this.student,
//     required this.dateTime,
//     required this.durationMinutes,
//   });
//
//   DateTime get endTime => dateTime.add(Duration(minutes: durationMinutes));
// }
//
// /// Data model for lesson history
// class LessonHistory {
//   final String subject;
//   final String student;
//   final DateTime dateTime;
//   final String feedback;
//   final int durationMinutes;
//
//   LessonHistory({
//     required this.subject,
//     required this.student,
//     required this.dateTime,
//     required this.feedback,
//     this.durationMinutes = 60, // Default duration
//   });
// }
//
// /// Abstract service to manage lessons
// abstract class LessonService {
//   Future<List<TimeSlot>> fetchTimeSlots();
//   Future<List<Lesson>> fetchScheduledLessons();
//   Future<List<LessonHistory>> fetchLessonHistory();
//   Future<void> addLesson(Lesson lesson);
//   Future<void> removeLesson(Lesson lesson);
//   Future<int> getTotalUniqueStudents();
//   Future<double> getAverageLessonTime();
//   void dispose(); // To clean up any resources if needed
// }
//
// /// Dummy implementation of LessonService to simulate database actions
// class DummyLessonService implements LessonService {
//   List<TimeSlot> _allTimeSlots = [
//     TimeSlot(
//         start: TimeOfDay(hour: 9, minute: 0),
//         end: TimeOfDay(hour: 10, minute: 0)),
//     TimeSlot(
//         start: TimeOfDay(hour: 10, minute: 0),
//         end: TimeOfDay(hour: 11, minute: 0)),
//     TimeSlot(
//         start: TimeOfDay(hour: 11, minute: 0),
//         end: TimeOfDay(hour: 12, minute: 0)),
//     // 12 PM - 1 PM Break
//     TimeSlot(
//         start: TimeOfDay(hour: 12, minute: 0),
//         end: TimeOfDay(hour: 13, minute: 0),
//         isBreak: true),
//     TimeSlot(
//         start: TimeOfDay(hour: 13, minute: 0),
//         end: TimeOfDay(hour: 14, minute: 0)),
//     TimeSlot(
//         start: TimeOfDay(hour: 14, minute: 0),
//         end: TimeOfDay(hour: 15, minute: 0)),
//     TimeSlot(
//         start: TimeOfDay(hour: 15, minute: 0),
//         end: TimeOfDay(hour: 16, minute: 0)),
//     TimeSlot(
//         start: TimeOfDay(hour: 16, minute: 0),
//         end: TimeOfDay(hour: 17, minute: 0)),
//   ];
//
//   Map<TimeSlot, bool> _bookedTimeSlots = {};
//
//   List<Lesson> _scheduledLessons = [];
//
//   List<LessonHistory> _lessonHistory = [];
//
//   Timer? _timer;
//
//   DummyLessonService() {
//     _initializeData();
//     _startTimer();
//   }
//
//   void _initializeData() {
//     // Initialize all time slots as available or break
//     for (var slot in _allTimeSlots) {
//       _bookedTimeSlots[slot] = slot.isBreak ? true : false; // Break slots are booked
//     }
//
//     // Initialize with some scheduled lessons
//     _scheduledLessons = [
//       Lesson(
//           subject: "Mathematics",
//           student: "John Doe",
//           dateTime: DateTime.now().add(Duration(hours: 1)),
//           durationMinutes: 60),
//       Lesson(
//           subject: "Physics",
//           student: "Jane Smith",
//           dateTime: DateTime.now().add(Duration(hours: 3)),
//           durationMinutes: 60),
//       Lesson(
//           subject: "Chemistry",
//           student: "Alice Johnson",
//           dateTime: DateTime.now().add(Duration(hours: 5)),
//           durationMinutes: 60),
//     ];
//
//     // Mark the booked time slots
//     for (var lesson in _scheduledLessons) {
//       TimeSlot? slot = _allTimeSlots.firstWhere(
//               (ts) =>
//           ts.start.hour == lesson.dateTime.hour &&
//               ts.start.minute == lesson.dateTime.minute,
//           orElse: () => TimeSlot(
//               start: TimeOfDay(hour: 0, minute: 0),
//               end: TimeOfDay(hour: 0, minute: 0)));
//       if (slot.isValid) {
//         _bookedTimeSlots[slot] = true;
//       }
//     }
//   }
//
//   void _startTimer() {
//     // Timer to check for completed lessons every minute
//     _timer = Timer.periodic(Duration(minutes: 1), (timer) {
//       _checkCompletedLessons();
//     });
//   }
//
//   void _checkCompletedLessons() {
//     DateTime now = DateTime.now();
//     List<Lesson> completedLessons = _scheduledLessons
//         .where((lesson) => now.isAfter(lesson.endTime))
//         .toList();
//
//     if (completedLessons.isNotEmpty) {
//       for (var lesson in completedLessons) {
//         // Remove from scheduled lessons
//         _scheduledLessons.remove(lesson);
//
//         // Mark the time slot as available
//         TimeSlot slot = _allTimeSlots.firstWhere(
//                 (ts) =>
//             ts.start.hour == lesson.dateTime.hour &&
//                 ts.start.minute == lesson.dateTime.minute,
//             orElse: () => TimeSlot(
//                 start: TimeOfDay(hour: 0, minute: 0),
//                 end: TimeOfDay(hour: 0, minute: 0)));
//         if (slot.isValid && !slot.isBreak) {
//           _bookedTimeSlots[slot] = false;
//         }
//
//         // Add to history with dummy feedback
//         _lessonHistory.add(LessonHistory(
//             subject: lesson.subject,
//             student: lesson.student,
//             dateTime: lesson.dateTime,
//             feedback: "Great lesson!"));
//       }
//     }
//   }
//
//   @override
//   Future<List<TimeSlot>> fetchTimeSlots() async {
//     // Simulate network delay
//     await Future.delayed(Duration(milliseconds: 500));
//     return _allTimeSlots;
//   }
//
//   @override
//   Future<List<Lesson>> fetchScheduledLessons() async {
//     await Future.delayed(Duration(milliseconds: 500));
//     return List.from(_scheduledLessons);
//   }
//
//   @override
//   Future<List<LessonHistory>> fetchLessonHistory() async {
//     await Future.delayed(Duration(milliseconds: 500));
//     return List.from(_lessonHistory);
//   }
//
//   @override
//   Future<void> addLesson(Lesson lesson) async {
//     await Future.delayed(Duration(milliseconds: 500));
//     _scheduledLessons.add(lesson);
//
//     TimeSlot? slot = _allTimeSlots.firstWhere(
//             (ts) =>
//         ts.start.hour == lesson.dateTime.hour &&
//             ts.start.minute == lesson.dateTime.minute,
//         orElse: () => TimeSlot(
//             start: TimeOfDay(hour: 0, minute: 0),
//             end: TimeOfDay(hour: 0, minute: 0)));
//     if (slot.isValid && !slot.isBreak) {
//       _bookedTimeSlots[slot] = true;
//     }
//   }
//
//   @override
//   Future<void> removeLesson(Lesson lesson) async {
//     await Future.delayed(Duration(milliseconds: 500));
//     _scheduledLessons.remove(lesson);
//
//     TimeSlot slot = _allTimeSlots.firstWhere(
//             (ts) =>
//         ts.start.hour == lesson.dateTime.hour &&
//             ts.start.minute == lesson.dateTime.minute,
//         orElse: () => TimeSlot(
//             start: TimeOfDay(hour: 0, minute: 0),
//             end: TimeOfDay(hour: 0, minute: 0)));
//     if (slot.isValid && !slot.isBreak) {
//       _bookedTimeSlots[slot] = false;
//     }
//
//     _lessonHistory.add(LessonHistory(
//         subject: lesson.subject,
//         student: lesson.student,
//         dateTime: lesson.dateTime,
//         feedback: "Completed successfully."));
//   }
//
//   @override
//   Future<int> getTotalUniqueStudents() async {
//     await Future.delayed(Duration(milliseconds: 300));
//     Set<String> students = {};
//     for (var lesson in _lessonHistory) {
//       students.add(lesson.student);
//     }
//     for (var lesson in _scheduledLessons) {
//       students.add(lesson.student);
//     }
//     return students.length;
//   }
//
//   @override
//   Future<double> getAverageLessonTime() async {
//     await Future.delayed(Duration(milliseconds: 300));
//     if (_lessonHistory.isEmpty) return 0.0;
//     int totalMinutes = 0;
//     for (var lesson in _lessonHistory) {
//       totalMinutes += lesson.durationMinutes;
//     }
//     return totalMinutes / _lessonHistory.length;
//   }
//
//   @override
//   void dispose() {
//     _timer?.cancel();
//   }
// }
//
// /// The main dashboard widget displaying summaries, time slots, schedules, and history.
// class DashboardPageContent extends StatefulWidget {
//   @override
//   _DashboardPageContentState createState() => _DashboardPageContentState();
// }
//
// class _DashboardPageContentState extends State<DashboardPageContent> {
//   late LessonService _lessonService;
//
//   List<TimeSlot> allTimeSlots = [];
//   Map<TimeSlot, bool> bookedTimeSlots = {};
//   List<Lesson> scheduledLessons = [];
//   List<LessonHistory> lessonHistory = [];
//
//   Timer? _timer;
//
//   @override
//   void initState() {
//     super.initState();
//     // Initialize the lesson service
//     _lessonService = DummyLessonService();
//
//     // Fetch initial data
//     _loadData();
//
//     // Start timer to check for completed lessons
//     _timer = Timer.periodic(Duration(minutes: 1), (timer) {
//       _checkCompletedLessons();
//     });
//   }
//
//   @override
//   void dispose() {
//     _timer?.cancel();
//     _lessonService.dispose();
//     super.dispose();
//   }
//
//   Future<void> _loadData() async {
//     List<TimeSlot> slots = await _lessonService.fetchTimeSlots();
//     List<Lesson> lessons = await _lessonService.fetchScheduledLessons();
//     List<LessonHistory> history = await _lessonService.fetchLessonHistory();
//
//     setState(() {
//       allTimeSlots = slots;
//       scheduledLessons = lessons;
//       lessonHistory = history;
//
//       // Initialize bookedTimeSlots
//       bookedTimeSlots = {};
//       for (var slot in allTimeSlots) {
//         bookedTimeSlots[slot] = slot.isBreak
//             ? true
//             : scheduledLessons.any((lesson) =>
//         lesson.dateTime.hour == slot.start.hour &&
//             lesson.dateTime.minute == slot.start.minute);
//       }
//     });
//   }
//
//   // Function to check and handle completed lessons
//   Future<void> _checkCompletedLessons() async {
//     // In a real backend, you'd fetch updated data.
//     // Here, we'll just reload data from the dummy service.
//     await _loadData();
//   }
//
//   // Function to add a new live lesson
//   Future<void> _addLiveLesson(Lesson newLesson) async {
//     await _lessonService.addLesson(newLesson);
//     await _loadData();
//   }
//
//   // Function to calculate total unique students
//   Future<int> _totalUniqueStudents() async {
//     return await _lessonService.getTotalUniqueStudents();
//   }
//
//   // Function to calculate average lesson time
//   Future<double> _averageLessonTime() async {
//     return await _lessonService.getAverageLessonTime();
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text("Dashboard"),
//       ),
//       body: SingleChildScrollView(
//         padding: EdgeInsets.all(16.0),
//         child: Column(
//           crossAxisAlignment: CrossAxisAlignment.start,
//           children: [
//             // Summary Cards at the Top
//             _buildSummaryCards(),
//             SizedBox(height: 20),
//             // Available Time & Booked Time Table
//             _buildTimeSlotsCard(),
//             SizedBox(height: 20),
//             // Schedule Cards
//             _buildScheduleCards(),
//             SizedBox(height: 20),
//             // Start Live Lesson Card
//             _buildStartLiveLessonCard(),
//             SizedBox(height: 20),
//             // History Card
//             _buildHistoryCard(),
//           ],
//         ),
//       ),
//     );
//   }
//
//   // Widget for Summary Cards
//   Widget _buildSummaryCards() {
//     return FutureBuilder(
//       future: Future.wait([_totalUniqueStudents(), _averageLessonTime()]),
//       builder: (context, AsyncSnapshot<List<dynamic>> snapshot) {
//         if (snapshot.connectionState == ConnectionState.waiting) {
//           return Center(child: CircularProgressIndicator());
//         }
//         if (snapshot.hasError) {
//           return Text("Error loading summary data.");
//         }
//         int totalStudents = snapshot.data![0];
//         double avgLessonTime = snapshot.data![1];
//
//         return Row(
//           mainAxisAlignment: MainAxisAlignment.spaceBetween,
//           children: [
//             // Total Students Taught
//             Expanded(
//               child: Card(
//                 color: Colors.green.shade100,
//                 elevation: 4,
//                 child: Padding(
//                   padding: EdgeInsets.all(16.0),
//                   child: Column(
//                     children: [
//                       Icon(Icons.group,
//                           color: Colors.green.shade700, size: 40),
//                       SizedBox(height: 10),
//                       Text(
//                         "Total Students",
//                         style: TextStyle(
//                             fontSize: 16, fontWeight: FontWeight.w600),
//                       ),
//                       SizedBox(height: 5),
//                       Text(
//                         "$totalStudents",
//                         style: TextStyle(
//                             fontSize: 20,
//                             fontWeight: FontWeight.bold,
//                             color: Colors.green.shade700),
//                       ),
//                     ],
//                   ),
//                 ),
//               ),
//             ),
//             SizedBox(width: 10),
//             // Average Lesson Time
//             Expanded(
//               child: Card(
//                 color: Colors.orange.shade100,
//                 elevation: 4,
//                 child: Padding(
//                   padding: EdgeInsets.all(16.0),
//                   child: Column(
//                     children: [
//                       Icon(Icons.timer,
//                           color: Colors.orange.shade700, size: 40),
//                       SizedBox(height: 10),
//                       Text(
//                         "Avg Lesson Time",
//                         style: TextStyle(
//                             fontSize: 16, fontWeight: FontWeight.w600),
//                       ),
//                       SizedBox(height: 5),
//                       Text(
//                         "${avgLessonTime.toStringAsFixed(1)} mins",
//                         style: TextStyle(
//                             fontSize: 20,
//                             fontWeight: FontWeight.bold,
//                             color: Colors.orange.shade700),
//                       ),
//                     ],
//                   ),
//                 ),
//               ),
//             ),
//           ],
//         );
//       },
//     );
//   }
//
//   // Widget for Available Time & Booked Time Table
//   Widget _buildTimeSlotsCard() {
//     if (allTimeSlots.isEmpty) {
//       return Center(child: CircularProgressIndicator());
//     }
//
//     return Card(
//       elevation: 4,
//       child: Padding(
//         padding: EdgeInsets.all(16.0),
//         child: Column(
//           crossAxisAlignment: CrossAxisAlignment.start,
//           children: [
//             Text("Available Time Slots",
//                 style: TextStyle(fontSize: 18, fontWeight: FontWeight.w600)),
//             SizedBox(height: 10),
//             Table(
//               border: TableBorder.all(color: Colors.grey.shade300),
//               children: [
//                 TableRow(
//                   decoration: BoxDecoration(color: Colors.blue.shade50),
//                   children: [
//                     Padding(
//                       padding: EdgeInsets.all(8.0),
//                       child: Text("Time",
//                           style: TextStyle(fontWeight: FontWeight.bold)),
//                     ),
//                     Padding(
//                       padding: EdgeInsets.all(8.0),
//                       child: Text("Status",
//                           style: TextStyle(fontWeight: FontWeight.bold)),
//                     ),
//                   ],
//                 ),
//                 ...allTimeSlots.map((slot) {
//                   if (slot.isBreak) {
//                     // Display break slot
//                     return TableRow(
//                       decoration: BoxDecoration(color: Colors.grey.shade200),
//                       children: [
//                         Padding(
//                           padding: EdgeInsets.all(8.0),
//                           child: Text(
//                             "${_formatTimeRange(slot.start, slot.end)}",
//                             style: TextStyle(
//                                 fontSize: 16, fontWeight: FontWeight.bold),
//                           ),
//                         ),
//                         Padding(
//                           padding: EdgeInsets.all(8.0),
//                           child: Text(
//                             "Break",
//                             style: TextStyle(
//                                 color: Colors.grey,
//                                 fontWeight: FontWeight.bold),
//                           ),
//                         ),
//                       ],
//                     );
//                   } else {
//                     // Display available or booked slot
//                     bool isBooked = bookedTimeSlots[slot] ?? false;
//                     return TableRow(
//                       children: [
//                         Padding(
//                           padding: EdgeInsets.all(8.0),
//                           child: Text(
//                             "${_formatTimeRange(slot.start, slot.end)}",
//                             style: TextStyle(fontSize: 16),
//                           ),
//                         ),
//                         Padding(
//                           padding: EdgeInsets.all(8.0),
//                           child: Text(
//                             isBooked ? "Booked" : "Available",
//                             style: TextStyle(
//                                 color:
//                                 isBooked ? Colors.red : Colors.green,
//                                 fontWeight: FontWeight.bold),
//                           ),
//                         ),
//                       ],
//                     );
//                   }
//                 }).toList(),
//               ],
//             ),
//           ],
//         ),
//       ),
//     );
//   }
//
//   // Helper function to format time range
//   String _formatTimeRange(TimeOfDay start, TimeOfDay end) {
//     return "${_formatTimeOfDay(start)} - ${_formatTimeOfDay(end)}";
//   }
//
//   // Helper function to format TimeOfDay
//   String _formatTimeOfDay(TimeOfDay time) {
//     return MaterialLocalizations.of(context).formatTimeOfDay(time,
//         alwaysUse24HourFormat: false);
//   }
//
//   // Widget for Schedule Cards
//   Widget _buildScheduleCards() {
//     return Column(
//       crossAxisAlignment: CrossAxisAlignment.start,
//       children: [
//         Text(
//           "Today's Schedule",
//           style: TextStyle(fontSize: 18, fontWeight: FontWeight.w600),
//         ),
//         SizedBox(height: 10),
//         Container(
//           height: 150, // Adjust height as needed
//           child: scheduledLessons.isEmpty
//               ? Center(
//             child: Text(
//               "No scheduled lessons for today.",
//               style: TextStyle(color: Colors.grey),
//             ),
//           )
//               : ListView.builder(
//             scrollDirection: Axis.horizontal,
//             itemCount: scheduledLessons.length,
//             itemBuilder: (context, index) {
//               var lesson = scheduledLessons[index];
//               return Padding(
//                 padding: EdgeInsets.only(right: 16.0),
//                 child: Card(
//                   elevation: 4,
//                   child: Container(
//                     width: 200, // Adjust width as needed
//                     padding: EdgeInsets.all(16.0),
//                     child: Column(
//                       crossAxisAlignment: CrossAxisAlignment.start,
//                       children: [
//                         Text(
//                           lesson.subject,
//                           style: TextStyle(
//                               fontSize: 18,
//                               fontWeight: FontWeight.bold),
//                         ),
//                         SizedBox(height: 10),
//                         Text("Student: ${lesson.student}",
//                             style: TextStyle(fontSize: 16)),
//                         SizedBox(height: 10),
//                         Text("Time: ${_formatDateTime(lesson.dateTime)}",
//                             style: TextStyle(fontSize: 16)),
//                       ],
//                     ),
//                   ),
//                 ),
//               );
//             },
//           ),
//         ),
//       ],
//     );
//   }
//
//   // Helper function to format DateTime
//   String _formatDateTime(DateTime dateTime) {
//     return "${_formatTimeOfDay(TimeOfDay.fromDateTime(dateTime))}";
//   }
//
//   // Widget for Start Live Lesson Card
//   Widget _buildStartLiveLessonCard() {
//     return GestureDetector(
//       onTap: () {
//         _showStartLiveLessonDialog();
//       },
//       child: Card(
//         color: Colors.blue.shade100,
//         elevation: 4,
//         child: Container(
//           height: 100, // Adjust height as needed
//           child: Center(
//             child: Text(
//               "Start Live Lesson",
//               style: TextStyle(
//                   fontSize: 18,
//                   fontWeight: FontWeight.bold,
//                   color: Colors.blue.shade800),
//             ),
//           ),
//         ),
//       ),
//     );
//   }
//
//   // Function to show Start Live Lesson Dialog
//   void _showStartLiveLessonDialog() {
//     final _formKey = GlobalKey<FormState>();
//     String studentName = '';
//     String subject = '';
//     DateTime? selectedDate;
//     TimeOfDay? selectedTime;
//     int duration = 60; // default duration in minutes
//
//     showDialog(
//       context: context,
//       builder: (context) {
//         return AlertDialog(
//           title: Text("Start Live Lesson"),
//           content: StatefulBuilder(
//             builder: (context, setState) {
//               return SingleChildScrollView(
//                 child: Form(
//                   key: _formKey,
//                   child: Column(
//                     children: [
//                       // Student Name
//                       TextFormField(
//                         decoration: InputDecoration(labelText: "Student Name"),
//                         validator: (value) {
//                           if (value == null || value.isEmpty) {
//                             return 'Please enter student name';
//                           }
//                           return null;
//                         },
//                         onSaved: (value) {
//                           studentName = value!;
//                         },
//                       ),
//                       SizedBox(height: 10),
//                       // Subject
//                       TextFormField(
//                         decoration: InputDecoration(labelText: "Subject"),
//                         validator: (value) {
//                           if (value == null || value.isEmpty) {
//                             return 'Please enter subject';
//                           }
//                           return null;
//                         },
//                         onSaved: (value) {
//                           subject = value!;
//                         },
//                       ),
//                       SizedBox(height: 10),
//                       // Date Picker
//                       Row(
//                         children: [
//                           Expanded(
//                             child: Text(selectedDate == null
//                                 ? 'Select Date'
//                                 : '${selectedDate!.toLocal()}'.split(' ')[0]),
//                           ),
//                           IconButton(
//                             icon: Icon(Icons.calendar_today),
//                             onPressed: () async {
//                               DateTime? picked = await showDatePicker(
//                                 context: context,
//                                 initialDate: DateTime.now(),
//                                 firstDate: DateTime.now(),
//                                 lastDate: DateTime.now().add(Duration(days: 365)),
//                               );
//                               if (picked != null) {
//                                 setState(() {
//                                   selectedDate = picked;
//                                 });
//                               }
//                             },
//                           ),
//                         ],
//                       ),
//                       SizedBox(height: 10),
//                       // Time Picker
//                       Row(
//                         children: [
//                           Expanded(
//                             child: Text(selectedTime == null
//                                 ? 'Select Time'
//                                 : selectedTime!.format(context)),
//                           ),
//                           IconButton(
//                             icon: Icon(Icons.access_time),
//                             onPressed: () async {
//                               TimeOfDay? picked = await showTimePicker(
//                                 context: context,
//                                 initialTime: TimeOfDay.now(),
//                               );
//                               if (picked != null) {
//                                 setState(() {
//                                   selectedTime = picked;
//                                 });
//                               }
//                             },
//                           ),
//                         ],
//                       ),
//                       SizedBox(height: 10),
//                       // Duration
//                       TextFormField(
//                         decoration:
//                         InputDecoration(labelText: "Duration (minutes)"),
//                         keyboardType: TextInputType.number,
//                         initialValue: '60',
//                         validator: (value) {
//                           if (value == null || value.isEmpty) {
//                             return 'Please enter duration';
//                           }
//                           if (int.tryParse(value) == null) {
//                             return 'Please enter a valid number';
//                           }
//                           return null;
//                         },
//                         onSaved: (value) {
//                           duration = int.parse(value!);
//                         },
//                       ),
//                     ],
//                   ),
//                 ),
//               );
//             },
//           ),
//           actions: [
//             TextButton(
//               child: Text("Cancel"),
//               onPressed: () => Navigator.of(context).pop(),
//             ),
//             ElevatedButton(
//               child: Text("Start"),
//               onPressed: () async {
//                 if (_formKey.currentState!.validate()) {
//                   if (selectedDate == null || selectedTime == null) {
//                     ScaffoldMessenger.of(context).showSnackBar(
//                       SnackBar(
//                           content:
//                           Text("Please select both date and time")),
//                     );
//                     return;
//                   }
//                   _formKey.currentState!.save();
//                   DateTime lessonDateTime = DateTime(
//                       selectedDate!.year,
//                       selectedDate!.month,
//                       selectedDate!.day,
//                       selectedTime!.hour,
//                       selectedTime!.minute);
//                   Lesson newLesson = Lesson(
//                       subject: subject,
//                       student: studentName,
//                       dateTime: lessonDateTime,
//                       durationMinutes: duration);
//                   await _addLiveLesson(newLesson);
//                   Navigator.of(context).pop();
//                 }
//               },
//             ),
//           ],
//         );
//       },
//     );
//   }
//
//   // Widget for History Card
//   Widget _buildHistoryCard() {
//     return FutureBuilder<List<LessonHistory>>(
//       future: _lessonService.fetchLessonHistory(),
//       builder: (context, snapshot) {
//         if (snapshot.connectionState == ConnectionState.waiting) {
//           return Center(child: CircularProgressIndicator());
//         }
//         if (snapshot.hasError) {
//           return Text("Error loading history.");
//         }
//         List<LessonHistory> history = snapshot.data!;
//         return Card(
//           elevation: 4,
//           child: Padding(
//             padding: EdgeInsets.all(16.0),
//             child: Column(
//               crossAxisAlignment: CrossAxisAlignment.start,
//               children: [
//                 Text("History",
//                     style:
//                     TextStyle(fontSize: 18, fontWeight: FontWeight.w600)),
//                 SizedBox(height: 10),
//                 history.isEmpty
//                     ? Text(
//                   "No history available.",
//                   style: TextStyle(color: Colors.grey),
//                 )
//                     : ListView.builder(
//                   shrinkWrap: true,
//                   physics: NeverScrollableScrollPhysics(),
//                   itemCount: history.length,
//                   itemBuilder: (context, index) {
//                     var historyItem = history[index];
//                     return Card(
//                       child: ListTile(
//                         leading:
//                         Icon(Icons.history, color: Colors.blue),
//                         title: Text(historyItem.subject),
//                         subtitle: Column(
//                           crossAxisAlignment:
//                           CrossAxisAlignment.start,
//                           children: [
//                             Text("Student: ${historyItem.student}"),
//                             Text(
//                                 "Date: ${historyItem.dateTime.toLocal()}".split(' ')[0]),
//                             Text(
//                                 "Time: ${_formatTimeOfDay(TimeOfDay.fromDateTime(historyItem.dateTime))}"),
//                             SizedBox(height: 5),
//                             Text("Feedback: ${historyItem.feedback}"),
//                           ],
//                         ),
//                       ),
//                     );
//                   },
//                 ),
//               ],
//             ),
//           ),
//         );
//       },
//     );
//   }
// }

// lib/screens/dashboard_page_content.dart

// lib/screens/dashboard_page_content.dart
//
// import 'dart:async';
//
// import 'package:flutter/material.dart';
// import 'package:tutor_nest/models/lesson.dart';
// import 'package:tutor_nest/models/lesson_history.dart';
// import 'package:tutor_nest/models/time_slot.dart';
// import 'package:tutor_nest/services/lesson_service.dart';
// import 'package:tutor_nest/services/dummy_lesson_service.dart';
// import 'package:tutor_nest/widgets/summary_cards.dart';
// import 'package:tutor_nest/widgets/time_slots_table.dart';
// import 'package:tutor_nest/widgets/schedule_cards.dart';
// import 'package:tutor_nest/widgets/start_live_lesson_card.dart';
// import 'package:tutor_nest/widgets/history_card.dart';
// import 'history_details_page.dart';
//
// /// The main dashboard widget displaying summaries, time slots, schedules, and history.
// class DashboardPageContent extends StatefulWidget {
//   @override
//   _DashboardPageContentState createState() => _DashboardPageContentState();
// }
//
// class _DashboardPageContentState extends State<DashboardPageContent> {
//   late LessonService _lessonService;
//
//   List<TimeSlot> allTimeSlots = [];
//   Map<TimeSlot, bool> bookedTimeSlots = {};
//   List<Lesson> scheduledLessons = [];
//   List<LessonHistory> lessonHistory = [];
//
//   Timer? _timer;
//
//   @override
//   void initState() {
//     super.initState();
//     // Initialize the lesson service
//     _lessonService = DummyLessonService();
//
//     // Fetch initial data
//     _loadData();
//
//     // Start timer to check for completed lessons
//     _timer = Timer.periodic(Duration(minutes: 1), (timer) {
//       _checkCompletedLessons();
//     });
//   }
//
//   @override
//   void dispose() {
//     _timer?.cancel();
//     _lessonService.dispose();
//     super.dispose();
//   }
//
//   Future<void> _loadData() async {
//     List<TimeSlot> slots = await _lessonService.fetchTimeSlots();
//     List<Lesson> lessons = await _lessonService.fetchScheduledLessons();
//     List<LessonHistory> history = await _lessonService.fetchLessonHistory();
//
//     setState(() {
//       allTimeSlots = slots;
//       scheduledLessons = lessons;
//       lessonHistory = history;
//
//       // Initialize bookedTimeSlots
//       bookedTimeSlots = {};
//       for (var slot in allTimeSlots) {
//         bookedTimeSlots[slot] = slot.isBreak
//             ? true
//             : scheduledLessons.any((lesson) =>
//         lesson.dateTime.hour == slot.start.hour &&
//             lesson.dateTime.minute == slot.start.minute);
//       }
//     });
//   }
//
//   // Function to check and handle completed lessons
//   Future<void> _checkCompletedLessons() async {
//     // In a real backend, you'd fetch updated data.
//     // Here, we'll just reload data from the dummy service.
//     await _loadData();
//   }
//
//   // Function to add a new live lesson
//   Future<void> _addLiveLesson(Lesson newLesson) async {
//     await _lessonService.addLesson(newLesson);
//     await _loadData();
//   }
//
//   // Function to calculate total unique students
//   Future<int> _totalUniqueStudents() async {
//     return await _lessonService.getTotalUniqueStudents();
//   }
//
//   // Function to calculate average lesson time
//   Future<double> _averageLessonTime() async {
//     return await _lessonService.getAverageLessonTime();
//   }
//
//   // Function to show Start Live Lesson Dialog
//   void _showStartLiveLessonDialog() {
//     final _formKey = GlobalKey<FormState>();
//     String studentName = '';
//     String studentId = ''; // Student ID
//     String subject = '';
//     DateTime? selectedDate;
//     TimeOfDay? selectedTime;
//     int duration = 60; // default duration in minutes
//
//     showDialog(
//         context: context,
//         builder: (context) {
//           return AlertDialog(
//             title: Text("Start Live Lesson"),
//             content: StatefulBuilder(
//               builder: (context, setState) {
//                 return SingleChildScrollView(
//                   child: Form(
//                     key: _formKey,
//                     child: Column(
//                       children: [
//                         // Student Name
//                         TextFormField(
//                           decoration:
//                           InputDecoration(labelText: "Student Name"),
//                           validator: (value) {
//                             if (value == null || value.isEmpty) {
//                               return 'Please enter student name';
//                             }
//                             return null;
//                           },
//                           onSaved: (value) {
//                             studentName = value!;
//                           },
//                         ),
//                         SizedBox(height: 10),
//                         // Student ID
//                         TextFormField(
//                           decoration:
//                           InputDecoration(labelText: "Student ID"),
//                           validator: (value) {
//                             if (value == null || value.isEmpty) {
//                               return 'Please enter student ID';
//                             }
//                             return null;
//                           },
//                           onSaved: (value) {
//                             studentId = value!;
//                           },
//                         ),
//                         SizedBox(height: 10),
//                         // Subject
//                         TextFormField(
//                           decoration: InputDecoration(labelText: "Subject"),
//                           validator: (value) {
//                             if (value == null || value.isEmpty) {
//                               return 'Please enter subject';
//                             }
//                             return null;
//                           },
//                           onSaved: (value) {
//                             subject = value!;
//                           },
//                         ),
//                         SizedBox(height: 10),
//                         // Date Picker
//                         Row(
//                           children: [
//                             Expanded(
//                               child: Text(selectedDate == null
//                                   ? 'Select Date'
//                                   : '${selectedDate!.toLocal()}'.split(' ')[0]),
//                             ),
//                             IconButton(
//                               icon: Icon(Icons.calendar_today),
//                               onPressed: () async {
//                                 DateTime? picked = await showDatePicker(
//                                   context: context,
//                                   initialDate: DateTime.now(),
//                                   firstDate: DateTime.now(),
//                                   lastDate:
//                                   DateTime.now().add(Duration(days: 365)),
//                                 );
//                                 if (picked != null) {
//                                   setState(() {
//                                     selectedDate = picked;
//                                   });
//                                 }
//                               },
//                             ),
//                           ],
//                         ),
//                         SizedBox(height: 10),
//                         // Time Picker
//                         Row(
//                           children: [
//                             Expanded(
//                               child: Text(selectedTime == null
//                                   ? 'Select Time'
//                                   : selectedTime!.format(context)),
//                             ),
//                             IconButton(
//                               icon: Icon(Icons.access_time),
//                               onPressed: () async {
//                                 TimeOfDay? picked = await showTimePicker(
//                                   context: context,
//                                   initialTime: TimeOfDay.now(),
//                                 );
//                                 if (picked != null) {
//                                   setState(() {
//                                     selectedTime = picked;
//                                   });
//                                 }
//                               },
//                             ),
//                           ],
//                         ),
//                         SizedBox(height: 10),
//                         // Duration
//                         TextFormField(
//                           decoration:
//                           InputDecoration(labelText: "Duration (minutes)"),
//                           keyboardType: TextInputType.number,
//                           initialValue: '60',
//                           validator: (value) {
//                             if (value == null || value.isEmpty) {
//                               return 'Please enter duration';
//                             }
//                             if (int.tryParse(value) == null) {
//                               return 'Please enter a valid number';
//                             }
//                             return null;
//                           },
//                           onSaved: (value) {
//                             duration = int.parse(value!);
//                           },
//                         ),
//                       ],
//                     ),
//                   ),
//                 );
//               },
//             ),
//             actions: [
//               TextButton(
//                 child: Text("Cancel"),
//                 onPressed: () => Navigator.of(context).pop(),
//               ),
//               ElevatedButton(
//                 child: Text("Start"),
//                 onPressed: () async {
//                   if (_formKey.currentState!.validate()) {
//                     if (selectedDate == null || selectedTime == null) {
//                       ScaffoldMessenger.of(context).showSnackBar(
//                         SnackBar(
//                             content:
//                             Text("Please select both date and time")),
//                       );
//                       return;
//                     }
//                     _formKey.currentState!.save();
//                     DateTime lessonDateTime = DateTime(
//                         selectedDate!.year,
//                         selectedDate!.month,
//                         selectedDate!.day,
//                         selectedTime!.hour,
//                         selectedTime!.minute);
//                     Lesson newLesson = Lesson(
//                         subject: subject,
//                         student: studentName,
//                         studentId: studentId, // Pass Student ID
//                         dateTime: lessonDateTime,
//                         durationMinutes: duration);
//                     await _addLiveLesson(newLesson);
//                     Navigator.of(context).pop();
//                   }
//                 },
//               ),
//             ],
//           );
//         });
//   }
//
//   /// Function to navigate to History Details Screen
//   void _navigateToHistoryDetails() {
//     Navigator.push(
//       context,
//       MaterialPageRoute(
//           builder: (context) => HistoryDetailsPage(history: lessonHistory)),
//     );
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text("Dashboard"),
//       ),
//       body: SingleChildScrollView(
//         padding: EdgeInsets.all(16.0),
//         child: Column(
//           crossAxisAlignment: CrossAxisAlignment.start,
//           children: [
//             // Summary Cards at the Top
//             FutureBuilder(
//               future:
//               Future.wait([_totalUniqueStudents(), _averageLessonTime()]),
//               builder:
//                   (context, AsyncSnapshot<List<dynamic>> snapshot) {
//                 if (snapshot.connectionState == ConnectionState.waiting) {
//                   return Center(child: CircularProgressIndicator());
//                 }
//                 if (snapshot.hasError) {
//                   return Text("Error loading summary data.");
//                 }
//                 int totalStudents = snapshot.data![0];
//                 double avgLessonTime = snapshot.data![1];
//
//                 return SummaryCards(
//                   totalStudents: totalStudents,
//                   avgLessonTime: avgLessonTime,
//                 );
//               },
//             ),
//             SizedBox(height: 20),
//             // Available Time & Booked Time Table
//             TimeSlotsTable(
//               allTimeSlots: allTimeSlots,
//               bookedTimeSlots: bookedTimeSlots,
//             ),
//             SizedBox(height: 20),
//             // Schedule Cards
//             ScheduleCards(
//               scheduledLessons: scheduledLessons,
//             ),
//             SizedBox(height: 20),
//             // Start Live Lesson Card
//             StartLiveLessonCard(
//               onTap: _showStartLiveLessonDialog,
//             ),
//             SizedBox(height: 20),
//             // History Card
//             HistoryCard(
//               recordCount: lessonHistory.length,
//               onTap: _navigateToHistoryDetails,
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }

// lib/screens/dashboard_page_content.dart
//
// import 'dart:async';
//
// import 'package:flutter/material.dart';
// import 'package:tutor_nest/models/lesson.dart';
// import 'package:tutor_nest/models/lesson_history.dart';
// import 'package:tutor_nest/models/time_slot.dart';
// import 'package:tutor_nest/services/lesson_service.dart';
// import 'package:tutor_nest/services/dummy_lesson_service.dart';
// import 'package:tutor_nest/widgets/summary_cards.dart';
// import 'package:tutor_nest/widgets/time_slots_table.dart';
// import 'package:tutor_nest/widgets/schedule_cards.dart';
// import 'package:tutor_nest/widgets/start_live_lesson_card.dart';
// import 'package:tutor_nest/widgets/history_card.dart';
// import 'history_details_page.dart';
//
// /// The main dashboard widget displaying summaries, time slots, schedules, and history.
// class DashboardPageContent extends StatefulWidget {
//   @override
//   _DashboardPageContentState createState() => _DashboardPageContentState();
// }
//
// class _DashboardPageContentState extends State<DashboardPageContent> {
//   late LessonService _lessonService;
//
//   List<TimeSlot> allTimeSlots = [];
//   Map<TimeSlot, bool> bookedTimeSlots = {};
//   List<Lesson> scheduledLessons = [];
//   List<LessonHistory> lessonHistory = [];
//
//   Timer? _timer;
//
//   @override
//   void initState() {
//     super.initState();
//     // Initialize the lesson service
//     _lessonService = DummyLessonService();
//
//     // Fetch initial data
//     _loadData();
//
//     // Start timer to check for completed lessons
//     _timer = Timer.periodic(Duration(minutes: 1), (timer) {
//       _checkCompletedLessons();
//     });
//   }
//
//   @override
//   void dispose() {
//     _timer?.cancel();
//     _lessonService.dispose();
//     super.dispose();
//   }
//
//   Future<void> _loadData() async {
//     List<TimeSlot> slots = await _lessonService.fetchTimeSlots();
//     List<Lesson> lessons = await _lessonService.fetchScheduledLessons();
//     List<LessonHistory> history = await _lessonService.fetchLessonHistory();
//
//     setState(() {
//       allTimeSlots = slots;
//       scheduledLessons = lessons;
//       lessonHistory = history;
//
//       // Initialize bookedTimeSlots
//       bookedTimeSlots = {};
//       for (var slot in allTimeSlots) {
//         bookedTimeSlots[slot] = slot.isBreak
//             ? true
//             : scheduledLessons.any((lesson) =>
//         lesson.dateTime.hour == slot.start.hour &&
//             lesson.dateTime.minute == slot.start.minute);
//       }
//     });
//   }
//
//   // Function to check and handle completed lessons
//   Future<void> _checkCompletedLessons() async {
//     // In a real backend, you'd fetch updated data.
//     // Here, we'll just reload data from the dummy service.
//     await _loadData();
//   }
//
//   // Function to add a new live lesson
//   Future<void> _addLiveLesson(Lesson newLesson) async {
//     await _lessonService.addLesson(newLesson);
//     await _loadData();
//   }
//
//   // Function to calculate total unique students
//   Future<int> _totalUniqueStudents() async {
//     return await _lessonService.getTotalUniqueStudents();
//   }
//
//   // Function to calculate average lesson time
//   Future<double> _averageLessonTime() async {
//     return await _lessonService.getAverageLessonTime();
//   }
//
//   // Function to show Start Live Lesson Dialog
//   void _showStartLiveLessonDialog() {
//     final _formKey = GlobalKey<FormState>();
//     String studentName = '';
//     String studentId = ''; // Student ID
//     String subject = '';
//     DateTime? selectedDate;
//     TimeOfDay? selectedTime;
//     int duration = 60; // default duration in minutes
//
//     showDialog(
//         context: context,
//         builder: (context) {
//           return AlertDialog(
//             title: Text("Start Live Lesson"),
//             content: StatefulBuilder(
//               builder: (context, setState) {
//                 return SingleChildScrollView(
//                   child: Form(
//                     key: _formKey,
//                     child: Column(
//                       children: [
//                         // Student Name
//                         TextFormField(
//                           decoration:
//                           InputDecoration(labelText: "Student Name"),
//                           validator: (value) {
//                             if (value == null || value.isEmpty) {
//                               return 'Please enter student name';
//                             }
//                             return null;
//                           },
//                           onSaved: (value) {
//                             studentName = value!;
//                           },
//                         ),
//                         SizedBox(height: 10),
//                         // Student ID
//                         TextFormField(
//                           decoration:
//                           InputDecoration(labelText: "Student ID"),
//                           validator: (value) {
//                             if (value == null || value.isEmpty) {
//                               return 'Please enter student ID';
//                             }
//                             return null;
//                           },
//                           onSaved: (value) {
//                             studentId = value!;
//                           },
//                         ),
//                         SizedBox(height: 10),
//                         // Subject
//                         TextFormField(
//                           decoration: InputDecoration(labelText: "Subject"),
//                           validator: (value) {
//                             if (value == null || value.isEmpty) {
//                               return 'Please enter subject';
//                             }
//                             return null;
//                           },
//                           onSaved: (value) {
//                             subject = value!;
//                           },
//                         ),
//                         SizedBox(height: 10),
//                         // Date Picker
//                         Row(
//                           children: [
//                             Expanded(
//                               child: Text(selectedDate == null
//                                   ? 'Select Date'
//                                   : '${selectedDate!.toLocal()}'.split(' ')[0]),
//                             ),
//                             IconButton(
//                               icon: Icon(Icons.calendar_today),
//                               onPressed: () async {
//                                 DateTime? picked = await showDatePicker(
//                                   context: context,
//                                   initialDate: DateTime.now(),
//                                   firstDate: DateTime.now(),
//                                   lastDate:
//                                   DateTime.now().add(Duration(days: 365)),
//                                 );
//                                 if (picked != null) {
//                                   setState(() {
//                                     selectedDate = picked;
//                                   });
//                                 }
//                               },
//                             ),
//                           ],
//                         ),
//                         SizedBox(height: 10),
//                         // Time Picker
//                         Row(
//                           children: [
//                             Expanded(
//                               child: Text(selectedTime == null
//                                   ? 'Select Time'
//                                   : selectedTime!.format(context)),
//                             ),
//                             IconButton(
//                               icon: Icon(Icons.access_time),
//                               onPressed: () async {
//                                 TimeOfDay? picked = await showTimePicker(
//                                   context: context,
//                                   initialTime: TimeOfDay.now(),
//                                 );
//                                 if (picked != null) {
//                                   setState(() {
//                                     selectedTime = picked;
//                                   });
//                                 }
//                               },
//                             ),
//                           ],
//                         ),
//                         SizedBox(height: 10),
//                         // Duration
//                         TextFormField(
//                           decoration:
//                           InputDecoration(labelText: "Duration (minutes)"),
//                           keyboardType: TextInputType.number,
//                           initialValue: '60',
//                           validator: (value) {
//                             if (value == null || value.isEmpty) {
//                               return 'Please enter duration';
//                             }
//                             if (int.tryParse(value) == null) {
//                               return 'Please enter a valid number';
//                             }
//                             return null;
//                           },
//                           onSaved: (value) {
//                             duration = int.parse(value!);
//                           },
//                         ),
//                       ],
//                     ),
//                   ),
//                 );
//               },
//             ),
//             actions: [
//               TextButton(
//                 child: Text("Cancel"),
//                 onPressed: () => Navigator.of(context).pop(),
//               ),
//               ElevatedButton(
//                 child: Text("Start"),
//                 onPressed: () async {
//                   if (_formKey.currentState!.validate()) {
//                     if (selectedDate == null || selectedTime == null) {
//                       ScaffoldMessenger.of(context).showSnackBar(
//                         SnackBar(
//                             content:
//                             Text("Please select both date and time")),
//                       );
//                       return;
//                     }
//                     _formKey.currentState!.save();
//                     DateTime lessonDateTime = DateTime(
//                         selectedDate!.year,
//                         selectedDate!.month,
//                         selectedDate!.day,
//                         selectedTime!.hour,
//                         selectedTime!.minute);
//                     Lesson newLesson = Lesson(
//                         subject: subject,
//                         student: studentName,
//                         studentId: studentId, // Pass Student ID
//                         dateTime: lessonDateTime,
//                         durationMinutes: duration);
//                     await _addLiveLesson(newLesson);
//                     Navigator.of(context).pop();
//                   }
//                 },
//               ),
//             ],
//           );
//         });
//   }
//
//   /// Function to navigate to History Details Screen
//   void _navigateToHistoryDetails() {
//     Navigator.push(
//       context,
//       MaterialPageRoute(
//           builder: (context) => HistoryDetailsPage(history: lessonHistory)),
//     );
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text("Dashboard"),
//       ),
//       body: SingleChildScrollView(
//         padding: EdgeInsets.all(16.0),
//         child: Column(
//           crossAxisAlignment: CrossAxisAlignment.start,
//           children: [
//             // Summary Cards at the Top
//             FutureBuilder(
//               future:
//               Future.wait([_totalUniqueStudents(), _averageLessonTime()]),
//               builder:
//                   (context, AsyncSnapshot<List<dynamic>> snapshot) {
//                 if (snapshot.connectionState == ConnectionState.waiting) {
//                   return Center(child: CircularProgressIndicator());
//                 }
//                 if (snapshot.hasError) {
//                   return Text("Error loading summary data.");
//                 }
//                 int totalStudents = snapshot.data![0];
//                 double avgLessonTime = snapshot.data![1];
//
//                 return SummaryCards(
//                   totalStudents: totalStudents,
//                   avgLessonTime: avgLessonTime,
//                 );
//               },
//             ),
//             SizedBox(height: 20),
//             // Available Time & Booked Time Table
//             TimeSlotsTable(
//               allTimeSlots: allTimeSlots,
//               bookedTimeSlots: bookedTimeSlots,
//             ),
//             SizedBox(height: 20),
//             // Schedule Cards
//             ScheduleCards(
//               scheduledLessons: scheduledLessons,
//             ),
//             SizedBox(height: 20),
//             // Start Live Lesson Card
//             StartLiveLessonCard(
//               onTap: _showStartLiveLessonDialog,
//             ),
//             SizedBox(height: 20),
//             // History Card
//             HistoryCard(
//               recordCount: lessonHistory.length,
//               onTap: _navigateToHistoryDetails,
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }

// dashboard_page_content.dart

import 'dart:async';

// import 'package:flutter/material.dart';
// import 'package:tutor_nest/models/lesson.dart';
// import 'package:tutor_nest/models/lesson_history.dart';
// import 'package:tutor_nest/models/time_slot.dart';
// import 'package:tutor_nest/services/lesson_service.dart';
// import 'package:tutor_nest/services/dummy_lesson_service.dart';
// import 'package:tutor_nest/widgets/summary_cards.dart';
// import 'package:tutor_nest/widgets/time_slots_table.dart';
// import 'package:tutor_nest/widgets/schedule_cards.dart';
// import 'package:tutor_nest/widgets/history_card.dart';
// import 'package:tutor_nest/pages/tutor/history_details_page.dart';
// import 'package:tutor_nest/pages/tutor/lesson_details_page.dart'; // Import the new page
//
// /// The main dashboard widget displaying summaries, time slots, schedules, and history.
// class DashboardPageContent extends StatefulWidget {
//   @override
//   _DashboardPageContentState createState() => _DashboardPageContentState();
// }
//
// class _DashboardPageContentState extends State<DashboardPageContent> {
//   late LessonService _lessonService;
//
//   List<TimeSlot> allTimeSlots = [];
//   Map<TimeSlot, bool> bookedTimeSlots = {};
//   List<Lesson> scheduledLessons = [];
//   List<LessonHistory> lessonHistory = [];
//
//   Timer? _timer;
//
//   @override
//   void initState() {
//     super.initState();
//     // Initialize the lesson service
//     _lessonService = DummyLessonService();
//
//     // Fetch initial data
//     _loadData();
//
//     // Start timer to check for completed lessons
//     _timer = Timer.periodic(Duration(minutes: 1), (timer) {
//       _checkCompletedLessons();
//     });
//   }
//
//   @override
//   void dispose() {
//     _timer?.cancel();
//     _lessonService.dispose();
//     super.dispose();
//   }
//
//   Future<void> _loadData() async {
//     List<TimeSlot> slots = await _lessonService.fetchTimeSlots();
//     List<Lesson> lessons = await _lessonService.fetchScheduledLessons();
//     List<LessonHistory> history = await _lessonService.fetchLessonHistory();
//
//     setState(() {
//       allTimeSlots = slots;
//       scheduledLessons = lessons;
//       lessonHistory = history;
//
//       // Initialize bookedTimeSlots
//       bookedTimeSlots = {};
//       for (var slot in allTimeSlots) {
//         bookedTimeSlots[slot] = slot.isBreak
//             ? true
//             : scheduledLessons.any((lesson) =>
//         lesson.dateTime.hour == slot.start.hour &&
//             lesson.dateTime.minute == slot.start.minute);
//       }
//     });
//   }
//
//   // Function to check and handle completed lessons
//   Future<void> _checkCompletedLessons() async {
//     // In a real backend, you'd fetch updated data.
//     // Here, we'll just reload data from the dummy service.
//     await _loadData();
//   }
//
//   // Function to add a new live lesson
//   Future<void> _addLiveLesson(Lesson newLesson) async {
//     await _lessonService.addLesson(newLesson);
//     await _loadData();
//   }
//
//   // Function to calculate total unique students
//   Future<int> _totalUniqueStudents() async {
//     return await _lessonService.getTotalUniqueStudents();
//   }
//
//   // Function to calculate average lesson time
//   Future<double> _averageLessonTime() async {
//     return await _lessonService.getAverageLessonTime();
//   }
//
//   /// Function to navigate to History Details Screen
//   void _navigateToHistoryDetails() {
//     Navigator.push(
//       context,
//       MaterialPageRoute(
//           builder: (context) => HistoryDetailsPage(history: lessonHistory)),
//     );
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text("Dashboard"),
//       ),
//       body: SingleChildScrollView(
//         padding: EdgeInsets.all(16.0),
//         child: Column(
//           crossAxisAlignment: CrossAxisAlignment.start,
//           children: [
//             // Summary Cards at the Top
//             FutureBuilder(
//               future:
//               Future.wait([_totalUniqueStudents(), _averageLessonTime()]),
//               builder:
//                   (context, AsyncSnapshot<List<dynamic>> snapshot) {
//                 if (snapshot.connectionState == ConnectionState.waiting) {
//                   return Center(child: CircularProgressIndicator());
//                 }
//                 if (snapshot.hasError) {
//                   return Text("Error loading summary data.");
//                 }
//                 int totalStudents = snapshot.data![0];
//                 double avgLessonTime = snapshot.data![1];
//
//                 return SummaryCards(
//                   totalStudents: totalStudents,
//                   avgLessonTime: avgLessonTime,
//                 );
//               },
//             ),
//             SizedBox(height: 20),
//             // Available Time & Booked Time Table
//             TimeSlotsTable(
//               allTimeSlots: allTimeSlots,
//               bookedTimeSlots: bookedTimeSlots,
//             ),
//             SizedBox(height: 20),
//             // Schedule Cards
//             ScheduleCards(
//               scheduledLessons: scheduledLessons,
//             ),
//             SizedBox(height: 20),
//             // History Card
//             HistoryCard(
//               recordCount: lessonHistory.length,
//               onTap: _navigateToHistoryDetails,
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }

// lib/dashboard_page_content.dart
// lib/pages/tutor/dashboard_page_content.dart

import 'dart:async';

import 'package:flutter/material.dart';
import 'package:tutor_nest/models/lesson.dart';
import 'package:tutor_nest/models/lesson_history.dart';
import 'package:tutor_nest/models/time_slot.dart';
import 'package:tutor_nest/services/lesson_service.dart';
import 'package:tutor_nest/services/dummy_lesson_service.dart';
import 'package:tutor_nest/widgets/summary_cards.dart';
import 'package:tutor_nest/widgets/time_slots_table.dart';
import 'package:tutor_nest/widgets/schedule_cards.dart';
import 'package:tutor_nest/widgets/history_card.dart';
import 'package:tutor_nest/pages/tutor/history_details_page.dart';
import 'package:tutor_nest/pages/tutor/lesson_details_page.dart'; // Import the new page

/// The main dashboard widget displaying summaries, time slots, schedules, and history.
class DashboardPageContent extends StatefulWidget {
  @override
  _DashboardPageContentState createState() => _DashboardPageContentState();
}

class _DashboardPageContentState extends State<DashboardPageContent> {
  late LessonService _lessonService;

  List<TimeSlot> allTimeSlots = [];
  Map<TimeSlot, bool> bookedTimeSlots = {};
  List<Lesson> scheduledLessons = [];
  List<LessonHistory> lessonHistory = [];

  Timer? _timer;

  @override
  void initState() {
    super.initState();
    // Initialize the lesson service
    _lessonService = DummyLessonService();

    // Fetch initial data
    _loadData();

    // Start timer to check for completed lessons
    _timer = Timer.periodic(Duration(minutes: 1), (timer) {
      _checkCompletedLessons();
    });
  }

  @override
  void dispose() {
    _timer?.cancel();
    _lessonService.dispose();
    super.dispose();
  }

  Future<void> _loadData() async {
    List<TimeSlot> slots = await _lessonService.fetchTimeSlots();
    List<Lesson> lessons = await _lessonService.fetchScheduledLessons();
    List<LessonHistory> history = await _lessonService.fetchLessonHistory();

    setState(() {
      allTimeSlots = slots;
      scheduledLessons = lessons;
      lessonHistory = history;

      // Initialize bookedTimeSlots
      bookedTimeSlots = {};
      for (var slot in allTimeSlots) {
        bookedTimeSlots[slot] = slot.isBreak
            ? true
            : scheduledLessons.any((lesson) =>
        lesson.dateTime.hour == slot.start.hour &&
            lesson.dateTime.minute == slot.start.minute);
      }
    });
  }

  // Function to check and handle completed lessons
  Future<void> _checkCompletedLessons() async {
    // In a real backend, you'd fetch updated data.
    // Here, we'll just reload data from the dummy service.
    await _loadData();
  }

  // Function to add a new live lesson
  Future<void> _addLiveLesson(Lesson newLesson) async {
    await _lessonService.addLesson(newLesson);
    await _loadData();
  }

  // Function to calculate total unique students
  Future<int> _totalUniqueStudents() async {
    return await _lessonService.getTotalUniqueStudents();
  }

  // Function to calculate average lesson time
  Future<double> _averageLessonTime() async {
    return await _lessonService.getAverageLessonTime();
  }

  /// Function to navigate to History Details Screen
  void _navigateToHistoryDetails() {
    Navigator.push(
      context,
      MaterialPageRoute(
          builder: (context) => HistoryDetailsPage(history: lessonHistory)),
    );
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      padding: EdgeInsets.all(16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Summary Cards at the Top
          FutureBuilder(
            future: Future.wait([_totalUniqueStudents(), _averageLessonTime()]),
            builder: (context, AsyncSnapshot<List<dynamic>> snapshot) {
              if (snapshot.connectionState == ConnectionState.waiting) {
                return Center(child: CircularProgressIndicator());
              }
              if (snapshot.hasError) {
                return Text("Error loading summary data.");
              }
              int totalStudents = snapshot.data![0];
              double avgLessonTime = snapshot.data![1];

              return SummaryCards(
                totalStudents: totalStudents,
                avgLessonTime: avgLessonTime,
              );
            },
          ),
          SizedBox(height: 20),
          // Available Time & Booked Time Table
          TimeSlotsTable(
            allTimeSlots: allTimeSlots,
            bookedTimeSlots: bookedTimeSlots,
          ),
          SizedBox(height: 20),
          // Schedule Cards
          ScheduleCards(
            scheduledLessons: scheduledLessons,
          ),
          SizedBox(height: 20),
          // History Card
          HistoryCard(
            recordCount: lessonHistory.length,
            onTap: _navigateToHistoryDetails,
          ),
        ],
      ),
    );
  }
}

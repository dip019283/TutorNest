import 'package:flutter/material.dart';

class TutorLessonReportPage extends StatefulWidget {
  final bool isTutor; // Flag to differentiate between Tutor and Student

  const TutorLessonReportPage({Key? key, required this.isTutor}) : super(key: key);

  @override
  _TutorLessonReportPageState createState() => _TutorLessonReportPageState();
}

class _TutorLessonReportPageState extends State<TutorLessonReportPage> {
  late Map<String, Map<String, int>> monthlyData;
  late Map<String, List<Map<String, String>>> lessonsData;

  @override
  void initState() {
    super.initState();

    // Use different data for Tutor and Student
    if (widget.isTutor) {
      monthlyData = {
        "Current Month": {
          "Completed": 10,
          "Student Absent": 3,
          "Tutor Absent": 1,
        },
        "Last Month": {
          "Completed": 8,
          "Student Absent": 2,
          "Tutor Absent": 1,
        },
      };
      lessonsData = {
        "Current Month": [
          {
            "Date": "2024-12-01",
            "Time": "10:00 AM",
            "Subject": "Math",
            "Status": "Completed",
            "Remarks": "Good performance by students"
          },
          {
            "Date": "2024-12-03",
            "Time": "11:00 AM",
            "Subject": "Science",
            "Status": "Student Absent",
            "Remarks": "Student was unavailable"
          },
        ],
        "Last Month": [
          {
            "Date": "2024-11-15",
            "Time": "10:00 AM",
            "Subject": "History",
            "Status": "Completed",
            "Remarks": "Excellent class"
          },
        ],
      };
    } else {
      monthlyData = {
        "Current Month": {
          "Attended": 8,
          "Missed": 2,
          "Cancelled": 1,
        },
        "Last Month": {
          "Attended": 7,
          "Missed": 3,
          "Cancelled": 0,
        },
      };
      lessonsData = {
        "Current Month": [
          {
            "Date": "2024-12-01",
            "Time": "10:00 AM",
            "Subject": "Math",
            "Status": "Attended",
            "Remarks": "Very engaging"
          },
          {
            "Date": "2024-12-02",
            "Time": "11:00 AM",
            "Subject": "Science",
            "Status": "Missed",
            "Remarks": "Absent"
          },
        ],
        "Last Month": [
          {
            "Date": "2024-11-15",
            "Time": "10:00 AM",
            "Subject": "History",
            "Status": "Attended",
            "Remarks": "Interesting lecture"
          },
        ],
      };
    }
  }

  String selectedMonth = "Current Month";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          widget.isTutor ? "Tutor Lesson Report" : "Student Lesson Report",
          style: const TextStyle(color: Colors.blue),
        ),
        backgroundColor: Colors.white,
        elevation: 0,
        iconTheme: const IconThemeData(color: Colors.blue),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 10.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Header Section
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  CircleAvatar(
                    radius: 30,
                    backgroundColor: Colors.blue,
                    child: Icon(
                      widget.isTutor ? Icons.school : Icons.person,
                      color: Colors.white,
                      size: 30,
                    ),
                  ),
                  const SizedBox(width: 10),
                  Expanded(
                    child: Text(
                      widget.isTutor
                          ? "Review your lessons and monitor student progress."
                          : "Track your attended, missed, and cancelled lessons.",
                      style: const TextStyle(fontSize: 14, color: Colors.grey),
                      maxLines: 3,
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 20),

              // Status Cards Section
              SizedBox(
                height: 120,
                child: ListView(
                  scrollDirection: Axis.horizontal,
                  children: [
                    ...monthlyData[selectedMonth]!.entries.map((entry) {
                      return buildStatusCard(entry.key, entry.value.toString());
                    }).toList(),
                  ],
                ),
              ),
              const SizedBox(height: 20),

              // Total Lessons and Month Toggle
              Center(
                child: Column(
                  children: [
                    Text(
                      "Total lessons: ${monthlyData[selectedMonth]!.values.reduce((a, b) => a + b)}",
                      style: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                    ),
                    const SizedBox(height: 10),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        // Last Month Button
                        ElevatedButton(
                          onPressed: () {
                            setState(() {
                              selectedMonth = "Last Month";
                            });
                          },
                          style: ElevatedButton.styleFrom(
                            foregroundColor: selectedMonth == "Last Month"
                                ? Colors.white
                                : Colors.black,
                            backgroundColor: selectedMonth == "Last Month"
                                ? Colors.blue
                                : Colors.grey[300],
                          ),
                          child: const Text("Last Month"),
                        ),
                        const SizedBox(width: 10),
                        // Current Month Button
                        ElevatedButton(
                          onPressed: () {
                            setState(() {
                              selectedMonth = "Current Month";
                            });
                          },
                          style: ElevatedButton.styleFrom(
                            foregroundColor: selectedMonth == "Current Month"
                                ? Colors.white
                                : Colors.black,
                            backgroundColor: selectedMonth == "Current Month"
                                ? Colors.blue
                                : Colors.grey[300],
                          ),
                          child: const Text("Current Month"),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 20),

              // Lesson Details Table
              const Text(
                "Lesson Details",
                style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 10),
              SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: DataTable(
                  columns: const [
                    DataColumn(label: Text("Date", style: TextStyle(fontWeight: FontWeight.bold))),
                    DataColumn(label: Text("Time", style: TextStyle(fontWeight: FontWeight.bold))),
                    DataColumn(label: Text("Subject", style: TextStyle(fontWeight: FontWeight.bold))),
                    DataColumn(label: Text("Status", style: TextStyle(fontWeight: FontWeight.bold))),
                    DataColumn(label: Text("Remarks", style: TextStyle(fontWeight: FontWeight.bold))),
                  ],
                  rows: lessonsData[selectedMonth]!.map((lesson) {
                    return DataRow(cells: [
                      DataCell(Text(lesson["Date"]!)),
                      DataCell(Text(lesson["Time"]!)),
                      DataCell(Text(lesson["Subject"]!)),
                      DataCell(Text(lesson["Status"]!)),
                      DataCell(Text(lesson["Remarks"]!)),
                    ]);
                  }).toList(),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  // Method to Build Status Card
  Widget buildStatusCard(String title, String value) {
    return Container(
      width: 150,
      margin: const EdgeInsets.only(right: 16),
      decoration: BoxDecoration(
        color: Colors.blueAccent,
        borderRadius: BorderRadius.circular(8),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.3),
            blurRadius: 5,
            offset: const Offset(0, 3),
          ),
        ],
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            title,
            style: const TextStyle(color: Colors.white, fontWeight: FontWeight.bold, fontSize: 16),
          ),
          const SizedBox(height: 10),
          Text(
            value,
            style: const TextStyle(color: Colors.white, fontWeight: FontWeight.bold, fontSize: 28),
          ),
        ],
      ),
    );
  }
}

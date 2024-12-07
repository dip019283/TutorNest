// import 'package:flutter/material.dart';
//
// class TutorRequestsPage extends StatelessWidget {
//   // Dummy list of tutor requests
//   final List<Map<String, String>> tutorRequests = [
//     {
//       'id': '1',
//       'name': 'John Doe',
//       'subject': 'Mathematics',
//       'email': 'johndoe@example.com',
//     },
//     {
//       'id': '2',
//       'name': 'Jane Smith',
//       'subject': 'Physics',
//       'email': 'janesmith@example.com',
//     },
//     {
//       'id': '3',
//       'name': 'Alice Johnson',
//       'subject': 'Chemistry',
//       'email': 'alicejohnson@example.com',
//     },
//     // Add more dummy requests as needed
//   ];
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text('Tutor Requests'),
//         backgroundColor: Colors.deepOrange, // Match the Tutor Requests color
//       ),
//       body: tutorRequests.isEmpty
//           ? Center(child: Text('No tutor requests found.'))
//           : ListView.builder(
//         itemCount: tutorRequests.length,
//         itemBuilder: (context, index) {
//           final request = tutorRequests[index];
//           return Card(
//             margin: EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
//             elevation: 3.0,
//             shape: RoundedRectangleBorder(
//               borderRadius: BorderRadius.circular(12.0),
//             ),
//             child: ListTile(
//               leading: Icon(Icons.person_outline, color: Colors.deepOrange),
//               title: Text(request['name'] ?? 'No Name'),
//               subtitle: Text(request['subject'] ?? 'No Subject'),
//               trailing: Row(
//                 mainAxisSize: MainAxisSize.min,
//                 children: [
//                   IconButton(
//                     icon: Icon(Icons.check, color: Colors.green),
//                     onPressed: () {
//                       // Handle approve action (dummy functionality)
//                       ScaffoldMessenger.of(context).showSnackBar(
//                         SnackBar(content: Text('${request['name']} approved.')),
//                       );
//                     },
//                     tooltip: 'Approve',
//                   ),
//                   IconButton(
//                     icon: Icon(Icons.close, color: Colors.red),
//                     onPressed: () {
//                       // Handle reject action (dummy functionality)
//                       ScaffoldMessenger.of(context).showSnackBar(
//                         SnackBar(content: Text('${request['name']} rejected.')),
//                       );
//                     },
//                     tooltip: 'Reject',
//                   ),
//                 ],
//               ),
//             ),
//           );
//         },
//       ),
//     );
//   }
// }

import 'package:flutter/material.dart';
import 'package:tutor_nest/pages/Admin/tutor_request_detail_page.dart';
// import 'tutor_request_detail_page.dart'; // Import the detail page

class TutorRequestsPage extends StatefulWidget {
  @override
  _TutorRequestsPageState createState() => _TutorRequestsPageState();
}

class _TutorRequestsPageState extends State<TutorRequestsPage> {
  // Dummy list of tutor requests
  final List<Map<String, String>> tutorRequests = [
    {
      'id': '1',
      'name': 'John Doe',
      'subject': 'Mathematics',
    },
    {
      'id': '2',
      'name': 'Jane Smith',
      'subject': 'Physics',
    },
    {
      'id': '3',
      'name': 'Alice Johnson',
      'subject': 'Chemistry',
    },
    // Add more dummy requests as needed
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Tutor Requests'),
        backgroundColor: Colors.deepOrange, // Customize as needed
      ),
      body: tutorRequests.isEmpty
          ? Center(child: Text('No tutor requests found.'))
          : ListView.builder(
        itemCount: tutorRequests.length,
        itemBuilder: (context, index) {
          final request = tutorRequests[index];
          return GestureDetector(
            onTap: () {

              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => VerifyTutorPage()


                ),
              );
            },
            child: Card(
              margin:
              EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
              elevation: 3.0,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(12.0),
              ),
              child: ListTile(
                leading: CircleAvatar(
                  backgroundColor: Colors.deepOrangeAccent,
                  child: Icon(Icons.person, color: Colors.white),
                ),
                title: Text(
                  request['name'] ?? 'No Name',
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                subtitle: Text(
                  request['subject'] ?? 'No Subject',
                  style: TextStyle(
                    fontSize: 16,
                    color: Colors.grey[700],
                  ),
                ),
                trailing: Icon(
                  Icons.arrow_forward_ios,
                  color: Colors.grey,
                  size: 16.0,
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}

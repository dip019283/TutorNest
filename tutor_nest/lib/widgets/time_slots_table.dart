// // lib/widgets/time_slots_table.dart
//
// import 'package:flutter/material.dart';
// import '../models/time_slot.dart';
//
// /// Widget for displaying time slots table
// class TimeSlotsTable extends StatelessWidget {
//   final List<TimeSlot> allTimeSlots;
//   final Map<TimeSlot, bool> bookedTimeSlots;
//
//   TimeSlotsTable({required this.allTimeSlots, required this.bookedTimeSlots});
//
//   // Helper function to format time range
//   String _formatTimeRange(BuildContext context, TimeOfDay start, TimeOfDay end) {
//     return "${_formatTimeOfDay(context, start)} - ${_formatTimeOfDay(context, end)}";
//   }
//
//   // Helper function to format TimeOfDay
//   String _formatTimeOfDay(BuildContext context, TimeOfDay time) {
//     return MaterialLocalizations.of(context).formatTimeOfDay(time,
//         alwaysUse24HourFormat: false);
//   }
//
//   @override
//   Widget build(BuildContext context) {
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
//                             "${_formatTimeRange(context, slot.start, slot.end)}",
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
//                             "${_formatTimeRange(context, slot.start, slot.end)}",
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
// }

// lib/widgets/time_slots_table.dart

import 'package:flutter/material.dart';
import '../models/time_slot.dart';

/// Widget for displaying time slots table
class TimeSlotsTable extends StatelessWidget {
  final List<TimeSlot> allTimeSlots;
  final Map<TimeSlot, bool> bookedTimeSlots;

  TimeSlotsTable({required this.allTimeSlots, required this.bookedTimeSlots});

  // Helper function to format time range
  String _formatTimeRange(BuildContext context, TimeOfDay start, TimeOfDay end) {
    return "${_formatTimeOfDay(context, start)} - ${_formatTimeOfDay(context, end)}";
  }

  // Helper function to format TimeOfDay
  String _formatTimeOfDay(BuildContext context, TimeOfDay time) {
    return MaterialLocalizations.of(context).formatTimeOfDay(time,
        alwaysUse24HourFormat: false);
  }

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 4,
      child: Padding(
        padding: EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text("Available Time Slots",
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.w600)),
            SizedBox(height: 10),
            Table(
              border: TableBorder.all(color: Colors.grey.shade300),
              children: [
                TableRow(
                  decoration: BoxDecoration(color: Colors.blue.shade50),
                  children: [
                    Padding(
                      padding: EdgeInsets.all(8.0),
                      child: Text("Time",
                          style: TextStyle(fontWeight: FontWeight.bold)),
                    ),
                    Padding(
                      padding: EdgeInsets.all(8.0),
                      child: Text("Status",
                          style: TextStyle(fontWeight: FontWeight.bold)),
                    ),
                  ],
                ),
                ...allTimeSlots.map((slot) {
                  if (slot.isBreak) {
                    // Display break slot
                    return TableRow(
                      decoration: BoxDecoration(color: Colors.grey.shade200),
                      children: [
                        Padding(
                          padding: EdgeInsets.all(8.0),
                          child: Text(
                            "${_formatTimeRange(context, slot.start, slot.end)}",
                            style: TextStyle(
                                fontSize: 16, fontWeight: FontWeight.bold),
                          ),
                        ),
                        Padding(
                          padding: EdgeInsets.all(8.0),
                          child: Text(
                            "Break",
                            style: TextStyle(
                                color: Colors.grey,
                                fontWeight: FontWeight.bold),
                          ),
                        ),
                      ],
                    );
                  } else {
                    // Display available or booked slot
                    bool isBooked = bookedTimeSlots[slot] ?? false;
                    return TableRow(
                      children: [
                        Padding(
                          padding: EdgeInsets.all(8.0),
                          child: Text(
                            "${_formatTimeRange(context, slot.start, slot.end)}",
                            style: TextStyle(fontSize: 16),
                          ),
                        ),
                        Padding(
                          padding: EdgeInsets.all(8.0),
                          child: Text(
                            isBooked ? "Booked" : "Available",
                            style: TextStyle(
                                color:
                                isBooked ? Colors.red : Colors.green,
                                fontWeight: FontWeight.bold),
                          ),
                        ),
                      ],
                    );
                  }
                }).toList(),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

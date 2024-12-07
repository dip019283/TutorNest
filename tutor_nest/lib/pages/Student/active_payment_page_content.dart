// import 'dart:async';
// import 'package:flutter/material.dart';
//
// class ActiveSubscriptionPage extends StatefulWidget {
//   final String subscriptionType; // "Monthly" or "Yearly"
//   final DateTime purchaseDate;
//
//   ActiveSubscriptionPage({
//     required this.subscriptionType,
//     required this.purchaseDate,
//   });
//
//   @override
//   _ActiveSubscriptionPageState createState() => _ActiveSubscriptionPageState();
// }
//
// class _ActiveSubscriptionPageState extends State<ActiveSubscriptionPage> {
//   late DateTime expiryDate;
//   Duration remainingTime = Duration.zero;
//   Timer? timer;
//
//   @override
//   void initState() {
//     super.initState();
//
//     // Set expiry date based on the subscription type
//     expiryDate = widget.subscriptionType == "Monthly"
//         ? widget.purchaseDate.add(Duration(days: 30))
//         : widget.purchaseDate.add(Duration(days: 365));
//
//     // Initialize the timer to update the remaining time
//     timer = Timer.periodic(Duration(seconds: 1), (_) => updateRemainingTime());
//   }
//
//   @override
//   void dispose() {
//     timer?.cancel(); // Cancel the timer when the widget is disposed
//     super.dispose();
//   }
//
//   void updateRemainingTime() {
//     setState(() {
//       final now = DateTime.now();
//       remainingTime = expiryDate.difference(now);
//       if (remainingTime.isNegative) {
//         remainingTime = Duration.zero; // If time is up, show 0
//         timer?.cancel(); // Stop updating the timer
//       }
//     });
//   }
//
//   String formatDuration(Duration duration) {
//     int days = duration.inDays;
//     int hours = duration.inHours % 24;
//     int minutes = duration.inMinutes % 60;
//     int seconds = duration.inSeconds % 60;
//
//     if (widget.subscriptionType == "Monthly") {
//       return '$days days $hours hours $minutes minutes $seconds seconds';
//     } else {
//       int months = days ~/ 30;
//       days %= 30; // Remaining days after full months
//       return '$months months $days days $hours hours $minutes minutes $seconds seconds';
//     }
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text('Active Subscription'),
//         centerTitle: true,
//         backgroundColor: Colors.blue,
//       ),
//       body: Padding(
//         padding: const EdgeInsets.all(16.0),
//         child: Center(
//           child: Column(
//             mainAxisAlignment: MainAxisAlignment.center,
//             children: [
//               Text(
//                 'Your Subscription:',
//                 style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
//               ),
//               SizedBox(height: 10),
//               Text(
//                 widget.subscriptionType == "Monthly"
//                     ? "1-Month Plan"
//                     : "1-Year Plan",
//                 style: TextStyle(fontSize: 18),
//               ),
//               SizedBox(height: 20),
//               Text(
//                 'Time Remaining:',
//                 style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
//               ),
//               SizedBox(height: 10),
//               Text(
//                 formatDuration(remainingTime),
//                 style: TextStyle(fontSize: 16, color: Colors.green),
//                 textAlign: TextAlign.center,
//               ),
//               SizedBox(height: 30),
//               ElevatedButton(
//                 onPressed: () {
//                   Navigator.pop(context); // Go back to the previous page
//                 },
//                 child: Text('Back'),
//               ),
//             ],
//           ),
//         ),
//       ),
//     );
//   }
// }

// import 'dart:async';
// import 'package:flutter/material.dart';
//
// class ActiveSubscriptionPage extends StatefulWidget {
//   final String subscriptionType; // "Monthly" or "Yearly"
//   final DateTime purchaseDate;
//
//   const ActiveSubscriptionPage({
//     Key? key,
//     required this.subscriptionType,
//     required this.purchaseDate,
//   }) : super(key: key);
//
//   @override
//   _ActiveSubscriptionPageState createState() => _ActiveSubscriptionPageState();
// }
//
// class _ActiveSubscriptionPageState extends State<ActiveSubscriptionPage> {
//   late final DateTime expiryDate;
//   late Duration remainingTime;
//   Timer? timer;
//
//   @override
//   void initState() {
//     super.initState();
//     // Set expiry date based on the subscription type
//     expiryDate = widget.subscriptionType == "Monthly"
//         ? widget.purchaseDate.add(const Duration(days: 30))
//         : widget.purchaseDate.add(const Duration(days: 365));
//
//     // Initialize the remaining time
//     remainingTime = expiryDate.difference(DateTime.now());
//
//     // Initialize the timer to update the remaining time
//     timer = Timer.periodic(const Duration(seconds: 1), (_) => updateRemainingTime());
//   }
//
//   @override
//   void dispose() {
//     timer?.cancel(); // Cancel the timer when the widget is disposed
//     super.dispose();
//   }
//
//   void updateRemainingTime() {
//     setState(() {
//       remainingTime = expiryDate.difference(DateTime.now());
//       if (remainingTime.isNegative) {
//         remainingTime = Duration.zero; // If time is up, show 0
//         timer?.cancel(); // Stop updating the timer
//       }
//     });
//   }
//
//   String formatDuration(Duration duration) {
//     final int days = duration.inDays;
//     final int hours = duration.inHours % 24;
//     final int minutes = duration.inMinutes % 60;
//     final int seconds = duration.inSeconds % 60;
//
//     if (widget.subscriptionType == "Monthly") {
//       return '$days days $hours hours $minutes minutes $seconds seconds';
//     } else {
//       final int months = days ~/ 30;
//       final int remainingDays = days % 30; // Remaining days after full months
//       return '$months months $remainingDays days $hours hours $minutes minutes $seconds seconds';
//     }
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         leading: IconButton(
//           icon: const Icon(Icons.arrow_back),
//           onPressed: () {
//             Navigator.pop(context); // Navigate back
//           },
//         ),
//         title: const Text(
//           'Active Subscription',
//           style: TextStyle(fontWeight: FontWeight.bold, color: Colors.blue,),
//         ),
//         centerTitle: true,
//         backgroundColor: Colors.white,
//         elevation: 0,
//         iconTheme: const IconThemeData(color: Colors.blue), // Change back button color
//       ),
//       body: Padding(
//         padding: const EdgeInsets.all(16.0),
//         child: Center(
//           child: Column(
//             mainAxisAlignment: MainAxisAlignment.center,
//             children: [
//               Container(
//                 padding: const EdgeInsets.all(16),
//                 decoration: BoxDecoration(
//                   color: Colors.blue.withOpacity(0.1),
//                   borderRadius: BorderRadius.circular(10),
//                 ),
//                 child: Column(
//                   children: [
//                     const Text(
//                       'Your Subscription',
//                       style: TextStyle(
//                         fontSize: 24,
//                         fontWeight: FontWeight.bold,
//                         color: Colors.blue,
//                       ),
//                     ),
//                     const SizedBox(height: 10),
//                     Text(
//                       widget.subscriptionType == "Monthly"
//                           ? "1-Month Plan"
//                           : "1-Year Plan",
//                       style: const TextStyle(
//                         fontSize: 20,
//                         color: Colors.black,
//                       ),
//                     ),
//                   ],
//                 ),
//               ),
//               const SizedBox(height: 30),
//               Container(
//                 padding: const EdgeInsets.all(16),
//                 decoration: BoxDecoration(
//                   color: Colors.green.withOpacity(0.1),
//                   borderRadius: BorderRadius.circular(10),
//                 ),
//                 child: Column(
//                   children: [
//                     const Text(
//                       'Time Remaining',
//                       style: TextStyle(
//                         fontSize: 24,
//                         fontWeight: FontWeight.bold,
//                         color: Colors.green,
//                       ),
//                     ),
//                     const SizedBox(height: 10),
//                     Text(
//                       formatDuration(remainingTime),
//                       style: const TextStyle(
//                         fontSize: 20,
//                         color: Colors.black87,
//                       ),
//                       textAlign: TextAlign.center,
//                     ),
//                   ],
//                 ),
//               ),
//               const SizedBox(height: 30),
//               ElevatedButton(
//                 style: ElevatedButton.styleFrom(
//                   backgroundColor: Colors.blue, // Background color
//                   padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 15),
//                   textStyle: const TextStyle(fontSize: 18),
//                 ),
//                 onPressed: () {
//                   Navigator.pop(context); // Go back to the previous page
//                 },
//                 child: const Text('Back'),
//               ),
//             ],
//           ),
//         ),
//       ),
//     );
//   }
// }


import 'dart:async';
import 'package:flutter/material.dart';

class ActiveSubscriptionPage extends StatefulWidget {
  final String subscriptionType; // "Monthly" or "Yearly"
  final DateTime purchaseDate;

  const ActiveSubscriptionPage({
    Key? key,
    required this.subscriptionType,
    required this.purchaseDate,
  }) : super(key: key);

  @override
  _ActiveSubscriptionPageState createState() => _ActiveSubscriptionPageState();
}

class _ActiveSubscriptionPageState extends State<ActiveSubscriptionPage> {
  late final DateTime expiryDate;
  late Duration remainingTime;
  Timer? timer;

  @override
  void initState() {
    super.initState();
    // Set expiry date based on the subscription type
    expiryDate = widget.subscriptionType == "Monthly"
        ? widget.purchaseDate.add(const Duration(days: 30))
        : widget.purchaseDate.add(const Duration(days: 365));

    // Initialize the remaining time
    remainingTime = expiryDate.difference(DateTime.now());

    // Initialize the timer to update the remaining time
    timer = Timer.periodic(const Duration(seconds: 1), (_) => updateRemainingTime());
  }

  @override
  void dispose() {
    timer?.cancel(); // Cancel the timer when the widget is disposed
    super.dispose();
  }

  void updateRemainingTime() {
    setState(() {
      remainingTime = expiryDate.difference(DateTime.now());
      if (remainingTime.isNegative) {
        remainingTime = Duration.zero; // If time is up, show 0
        timer?.cancel(); // Stop updating the timer
      }
    });
  }

  String formatDuration(Duration duration) {
    final int days = duration.inDays;
    final int hours = duration.inHours % 24;
    final int minutes = duration.inMinutes % 60;
    final int seconds = duration.inSeconds % 60;

    if (widget.subscriptionType == "Monthly") {
      return '$days days $hours hours $minutes minutes $seconds seconds';
    } else {
      final int months = days ~/ 30;
      final int remainingDays = days % 30; // Remaining days after full months
      return '$months months $remainingDays days $hours hours $minutes minutes $seconds seconds';
    }
  }

  // Getter to determine if cancellation is allowed
  bool get canCancelSubscription {
    final Duration sincePurchase = DateTime.now().difference(widget.purchaseDate);
    return sincePurchase.inDays < 7;
  }

  // Method to show the cancellation confirmation dialog
  void _showCancellationDialog() {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text('Cancel Subscription'),
          content: const Text('Are you sure you want to cancel your subscription?'),
          actions: [
            TextButton(
              child: const Text('No'),
              onPressed: () {
                Navigator.of(context).pop(); // Close the dialog
              },
            ),
            TextButton(
              child: const Text('Yes'),
              onPressed: () {
                Navigator.of(context).pop(); // Close the dialog
                _cancelSubscription();
              },
            ),
          ],
        );
      },
    );
  }

  // Method to handle the cancellation logic
  void _cancelSubscription() {
    // Implement your cancellation logic here.
    // This could involve calling an API, updating the backend, etc.
    // For demonstration, we'll show a snackbar.

    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(
        content: Text('Subscription canceled successfully.'),
      ),
    );

    // Optionally, navigate back or update the UI accordingly.
    Navigator.pop(context); // Navigate back after cancellation
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.pop(context); // Navigate back
          },
        ),
        title: const Text(
          'Active Subscription',
          style: TextStyle(
            fontWeight: FontWeight.bold,
            color: Colors.blue,
          ),
        ),
        centerTitle: true,
        backgroundColor: Colors.white,
        elevation: 0,
        iconTheme: const IconThemeData(color: Colors.blue), // Change back button color
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              // Subscription Details Container
              Container(
                padding: const EdgeInsets.all(16),
                decoration: BoxDecoration(
                  color: Colors.blue.withOpacity(0.1),
                  borderRadius: BorderRadius.circular(10),
                ),
                child: Column(
                  children: [
                    const Text(
                      'Your Subscription',
                      style: TextStyle(
                        fontSize: 24,
                        fontWeight: FontWeight.bold,
                        color: Colors.blue,
                      ),
                    ),
                    const SizedBox(height: 10),
                    Text(
                      widget.subscriptionType == "Monthly"
                          ? "1-Month Plan"
                          : "1-Year Plan",
                      style: const TextStyle(
                        fontSize: 20,
                        color: Colors.black,
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 30),
              // Time Remaining Container
              Container(
                padding: const EdgeInsets.all(16),
                decoration: BoxDecoration(
                  color: Colors.green.withOpacity(0.1),
                  borderRadius: BorderRadius.circular(10),
                ),
                child: Column(
                  children: [
                    const Text(
                      'Time Remaining',
                      style: TextStyle(
                        fontSize: 24,
                        fontWeight: FontWeight.bold,
                        color: Colors.green,
                      ),
                    ),
                    const SizedBox(height: 10),
                    Text(
                      formatDuration(remainingTime),
                      style: const TextStyle(
                        fontSize: 20,
                        color: Colors.black87,
                      ),
                      textAlign: TextAlign.center,
                    ),
                  ],
                ),
              ),
              // Conditionally display the Cancel Subscription button
              if (canCancelSubscription) ...[
                const SizedBox(height: 30),
                ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.red, // Red color to indicate a destructive action
                    padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 15),
                    textStyle: const TextStyle(fontSize: 18),
                  ),
                  onPressed: () {
                    _showCancellationDialog();
                  },
                  child: const Text('Cancel Subscription'),
                ),
              ],
              // Add Back button at the end
              const SizedBox(height: 30),
              ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.blue, // Background color
                  padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 15),
                  textStyle: const TextStyle(fontSize: 18),
                ),
                onPressed: () {
                  Navigator.pop(context); // Go back to the previous page
                },
                child: const Text('Back'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

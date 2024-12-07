// import 'package:flutter/material.dart';
//
// class MonthlyPaymentPage extends StatefulWidget {
//   @override
//   _MonthlyPaymentPageState createState() => _MonthlyPaymentPageState();
// }
//
// class _MonthlyPaymentPageState extends State<MonthlyPaymentPage> {
//   // Add state variables if needed
//   String selectedPlan = '';
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text('Monthly Payment'),
//       ),
//       body: Padding(
//         padding: const EdgeInsets.all(16.0),
//         child: Column(
//           crossAxisAlignment: CrossAxisAlignment.start,
//           children: [
//             Text(
//               'Choose your monthly plan',
//               style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
//             ),
//             SizedBox(height: 20),
//             PaymentOption(
//               title: 'Basic Plan',
//               description: 'Access to basic features',
//               price: 'Rs. 1200/month',
//               onTap: () {
//                 setState(() {
//                   selectedPlan = 'Basic Plan';
//                 });
//                 Navigator.push(
//                   context,
//                   MaterialPageRoute(
//                     builder: (context) => PaymentConfirmationPage(
//                       plan: 'Basic Plan',
//                       price: 'Rs. 1200',
//                     ),
//                   ),
//                 );
//               },
//             ),
//             PaymentOption(
//               title: 'Pro Plan',
//               description: 'Access to all premium features',
//               price: 'रु 2400/month',
//               onTap: () {
//                 setState(() {
//                   selectedPlan = 'Pro Plan';
//                 });
//                 Navigator.push(
//                   context,
//                   MaterialPageRoute(
//                     builder: (context) => PaymentConfirmationPage(
//                       plan: 'Pro Plan',
//                       price: 'रु 2400',
//                     ),
//                   ),
//                 );
//               },
//             ),
//             if (selectedPlan.isNotEmpty) ...[
//               SizedBox(height: 20),
//               Text(
//                 'You selected: $selectedPlan',
//                 style: TextStyle(fontSize: 16, color: Colors.blue),
//               ),
//             ],
//           ],
//         ),
//       ),
//     );
//   }
// }
//
// class PaymentOption extends StatelessWidget {
//   final String title;
//   final String description;
//   final String price;
//   final VoidCallback onTap;
//
//   PaymentOption({
//     required this.title,
//     required this.description,
//     required this.price,
//     required this.onTap,
//   });
//
//   @override
//   Widget build(BuildContext context) {
//     return Card(
//       child: ListTile(
//         title: Text(title, style: TextStyle(fontSize: 18)),
//         subtitle: Text(description),
//         trailing: Text(price, style: TextStyle(fontSize: 16, color: Colors.green)),
//         onTap: onTap,
//       ),
//     );
//   }
// }
//
// class PaymentConfirmationPage extends StatelessWidget {
//   final String plan;
//   final String price;
//
//   PaymentConfirmationPage({required this.plan, required this.price});
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text('Payment Confirmation'),
//       ),
//       body: Padding(
//         padding: const EdgeInsets.all(16.0),
//         child: Column(
//           crossAxisAlignment: CrossAxisAlignment.center,
//           children: [
//             SizedBox(height: 50),
//             Text(
//               'You selected:',
//               style: TextStyle(fontSize: 18),
//             ),
//             SizedBox(height: 10),
//             Text(
//               plan,
//               style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
//             ),
//             SizedBox(height: 5),
//             Text(
//               'Price: $price',
//               style: TextStyle(fontSize: 18),
//             ),
//             SizedBox(height: 50),
//             ElevatedButton(
//               onPressed: () {
//                 // Add payment processing logic here
//                 showDialog(
//                   context: context,
//                   builder: (context) => AlertDialog(
//                     title: Text('Payment Successful'),
//                     content: Text('Thank you for your payment!'),
//                     actions: [
//                       TextButton(
//                         onPressed: () {
//                           Navigator.pop(context); // Close dialog
//                           Navigator.pop(context); // Go back to the main page
//                         },
//                         child: Text('OK'),
//                       ),
//                     ],
//                   ),
//                 );
//               },
//               child: Text('Confirm Payment'),
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }

// import 'package:flutter/material.dart';
//
// class PaymentPage extends StatefulWidget {
//   @override
//   _PaymentPageState createState() => _PaymentPageState();
// }
//
// class _PaymentPageState extends State<PaymentPage> {
//   String selectedPlan = '';
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text('Payment Options'),
//       ),
//       body: Padding(
//         padding: const EdgeInsets.all(16.0),
//         child: Column(
//           crossAxisAlignment: CrossAxisAlignment.start,
//           children: [
//             Text(
//               'Choose your plan',
//               style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
//             ),
//             SizedBox(height: 20),
//             PaymentOption(
//               title: 'Monthly Plan',
//               description: 'Access for one month',
//               price: 'Rs. 5000',
//               onTap: () {
//                 setState(() {
//                   selectedPlan = 'Monthly Plan';
//                 });
//                 Navigator.push(
//                   context,
//                   MaterialPageRoute(
//                     builder: (context) => PaymentConfirmationPage(
//                       plan: 'Monthly Plan',
//                       price: 'Rs. 5000',
//                     ),
//                   ),
//                 );
//               },
//             ),
//             PaymentOption(
//               title: 'Yearly Plan',
//               description: 'Access for one year',
//               price: 'Rs. 30,000',
//               onTap: () {
//                 setState(() {
//                   selectedPlan = 'Yearly Plan';
//                 });
//                 Navigator.push(
//                   context,
//                   MaterialPageRoute(
//                     builder: (context) => PaymentConfirmationPage(
//                       plan: 'Yearly Plan',
//                       price: 'Rs. 30,000',
//                     ),
//                   ),
//                 );
//               },
//             ),
//             if (selectedPlan.isNotEmpty) ...[
//               SizedBox(height: 20),
//               Text(
//                 'You selected: $selectedPlan',
//                 style: TextStyle(fontSize: 16, color: Colors.blue),
//               ),
//             ],
//           ],
//         ),
//       ),
//     );
//   }
// }
//
// class PaymentOption extends StatelessWidget {
//   final String title;
//   final String description;
//   final String price;
//   final VoidCallback onTap;
//
//   PaymentOption({
//     required this.title,
//     required this.description,
//     required this.price,
//     required this.onTap,
//   });
//
//   @override
//   Widget build(BuildContext context) {
//     return Card(
//       child: ListTile(
//         title: Text(title, style: TextStyle(fontSize: 18)),
//         subtitle: Text(description),
//         trailing: Text(price, style: TextStyle(fontSize: 16, color: Colors.green)),
//         onTap: onTap,
//       ),
//     );
//   }
// }
//
// class PaymentConfirmationPage extends StatelessWidget {
//   final String plan;
//   final String price;
//
//   PaymentConfirmationPage({required this.plan, required this.price});
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text('Payment Confirmation'),
//       ),
//       body: Padding(
//         padding: const EdgeInsets.all(16.0),
//         child: Column(
//           crossAxisAlignment: CrossAxisAlignment.center,
//           children: [
//             SizedBox(height: 50),
//             Text(
//               'You selected:',
//               style: TextStyle(fontSize: 18),
//             ),
//             SizedBox(height: 10),
//             Text(
//               plan,
//               style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
//             ),
//             SizedBox(height: 5),
//             Text(
//               'Price: $price',
//               style: TextStyle(fontSize: 18),
//             ),
//             SizedBox(height: 50),
//             ElevatedButton(
//               onPressed: () {
//                 // Add payment processing logic here
//                 showDialog(
//                   context: context,
//                   builder: (context) => AlertDialog(
//                     title: Text('Payment Successful'),
//                     content: Text('Thank you for your payment!'),
//                     actions: [
//                       TextButton(
//                         onPressed: () {
//                           Navigator.pop(context); // Close dialog
//                           Navigator.pop(context); // Go back to the main page
//                         },
//                         child: Text('OK'),
//                       ),
//                     ],
//                   ),
//                 );
//               },
//               child: Text('Confirm Payment'),
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }

import 'package:flutter/material.dart';

class PaymentPage extends StatefulWidget {
  @override
  _PaymentPageState createState() => _PaymentPageState();
}

class _PaymentPageState extends State<PaymentPage> {
  String selectedPlan = '';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: Icon(Icons.arrow_back, color: Colors.blue),
          onPressed: () {
            Navigator.pop(context); // Navigate back
          },
        ),
        title: Text(
          'Payment',
          style: TextStyle(color: Colors.blue),
        ),
        centerTitle: true,
        backgroundColor: Colors.white,
        elevation: 0,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Choose your plan',
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 20),
            PaymentOption(
              title: 'Monthly Plan',
              description: 'Access for one month',
              price: 'Rs. 5000',
              onTap: () {
                setState(() {
                  selectedPlan = 'Monthly Plan';
                });
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => PaymentConfirmationPage(
                      plan: 'Monthly Plan',
                      price: 'Rs. 5000',
                    ),
                  ),
                );
              },
            ),
            PaymentOption(
              title: 'Yearly Plan',
              description: 'Access for one year',
              price: 'Rs. 30,000',
              onTap: () {
                setState(() {
                  selectedPlan = 'Yearly Plan';
                });
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => PaymentConfirmationPage(
                      plan: 'Yearly Plan',
                      price: 'Rs. 30,000',
                    ),
                  ),
                );
              },
            ),
            if (selectedPlan.isNotEmpty) ...[
              SizedBox(height: 20),
              Text(
                'You selected: $selectedPlan',
                style: TextStyle(fontSize: 16, color: Colors.blue),
              ),
            ],
          ],
        ),
      ),
    );
  }
}

class PaymentOption extends StatelessWidget {
  final String title;
  final String description;
  final String price;
  final VoidCallback onTap;

  PaymentOption({
    required this.title,
    required this.description,
    required this.price,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      child: ListTile(
        title: Text(title, style: TextStyle(fontSize: 18)),
        subtitle: Text(description),
        trailing: Text(price, style: TextStyle(fontSize: 16, color: Colors.green)),
        onTap: onTap,
      ),
    );
  }
}

class PaymentConfirmationPage extends StatelessWidget {
  final String plan;
  final String price;

  PaymentConfirmationPage({required this.plan, required this.price});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: Icon(Icons.arrow_back, color: Colors.blue),
          onPressed: () {
            Navigator.pop(context); // Navigate back
          },
        ),
        title: Text(
          'Payment',
          style: TextStyle(color: Colors.blue),
        ),
        centerTitle: true,
        backgroundColor: Colors.white,
        elevation: 0,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            SizedBox(height: 50),
            Text(
              'You selected:',
              style: TextStyle(fontSize: 18),
            ),
            SizedBox(height: 10),
            Text(
              plan,
              style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 5),
            Text(
              'Price: $price',
              style: TextStyle(fontSize: 18),
            ),
            SizedBox(height: 50),
            ElevatedButton(
              onPressed: () {
                // Add payment processing logic here
                showDialog(
                  context: context,
                  builder: (context) => AlertDialog(
                    title: Text('Payment Successful'),
                    content: Text('Thank you for your payment!'),
                    actions: [
                      TextButton(
                        onPressed: () {
                          Navigator.pop(context); // Close dialog
                          Navigator.pop(context); // Go back to the main page
                        },
                        child: Text('OK'),
                      ),
                    ],
                  ),
                );
              },
              child: Text('Confirm Payment'),
            ),
          ],
        ),
      ),
    );
  }
}

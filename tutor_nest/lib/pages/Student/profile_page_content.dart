// import 'package:flutter/material.dart';
//
// class ProfilePageContent extends StatefulWidget {
//   @override
//   _ProfilePageContentState createState() => _ProfilePageContentState();
// }
//
// class _ProfilePageContentState extends State<ProfilePageContent> {
//   // Simulated states for frontend
//   final TextEditingController _nameController = TextEditingController(text: "John Doe");
//   final TextEditingController _countryController = TextEditingController(text: "USA");
//   final TextEditingController _preferencesController = TextEditingController(text: "Dark Mode, Notifications");
//   final TextEditingController _genderController = TextEditingController(text: "Male");
//   final String _email = "johndoe@example.com";
//   final String _phoneNumber = "+1234567890";
//   bool _isPhoneVerified = false;
//
//   void _verifyPhoneNumber() {
//     // Simulate phone verification popup
//     showDialog(
//       context: context,
//       builder: (context) => AlertDialog(
//         title: Text('Verify Phone Number'),
//         content: Column(
//           mainAxisSize: MainAxisSize.min,
//           children: [
//             Text('An OTP has been sent to $_phoneNumber'),
//             TextFormField(
//               decoration: InputDecoration(hintText: "Enter OTP"),
//             ),
//           ],
//         ),
//         actions: [
//           TextButton(
//             onPressed: () {
//               Navigator.of(context).pop();
//               setState(() {
//                 _isPhoneVerified = true;
//               });
//             },
//             child: Text('Verify'),
//           ),
//         ],
//       ),
//     );
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text('Profile'),
//         backgroundColor: Colors.white,
//         elevation: 0,
//         leading: IconButton(
//           icon: Icon(Icons.arrow_back, color: Colors.blue),
//           onPressed: () {
//             Navigator.pop(context);
//           },
//         ),
//       ),
//       body: SingleChildScrollView(
//         padding: const EdgeInsets.all(16.0),
//         child: Column(
//           crossAxisAlignment: CrossAxisAlignment.start,
//           children: [
//             // Profile Image Placeholder
//             Center(
//               child: CircleAvatar(
//                 radius: 50,
//                 backgroundColor: Colors.grey.shade200,
//                 child: Icon(Icons.person, size: 50, color: Colors.grey),
//               ),
//             ),
//             SizedBox(height: 16),
//             // Account ID
//             Text(
//               "Account ID: 12345",
//               style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
//             ),
//             SizedBox(height: 8),
//             // Change Password
//             GestureDetector(
//               onTap: () {},
//               child: Text(
//                 "Change Password",
//                 style: TextStyle(fontSize: 16, color: Colors.blue, decoration: TextDecoration.underline),
//               ),
//             ),
//             SizedBox(height: 16),
//             // Account Section
//             Text(
//               "Account:",
//               style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
//             ),
//             SizedBox(height: 8),
//             // Name Field
//             TextFormField(
//               controller: _nameController,
//               decoration: InputDecoration(labelText: "Name"),
//             ),
//             // Email (Read-only)
//             TextFormField(
//               initialValue: _email,
//               decoration: InputDecoration(labelText: "Email"),
//               readOnly: true,
//             ),
//             // Country Field
//             TextFormField(
//               controller: _countryController,
//               decoration: InputDecoration(labelText: "Country"),
//             ),
//             // Phone Number with Verification
//             Row(
//               children: [
//                 Expanded(
//                   child: TextFormField(
//                     initialValue: _phoneNumber,
//                     decoration: InputDecoration(labelText: "Phone Number"),
//                     readOnly: true,
//                   ),
//                 ),
//                 if (!_isPhoneVerified)
//                   ElevatedButton(
//                     onPressed: _verifyPhoneNumber,
//                     style: ElevatedButton.styleFrom(backgroundColor: Colors.green),
//                     child: Text("Verify"),
//                   ),
//                 if (_isPhoneVerified)
//                   Text(
//                     "Verified",
//                     style: TextStyle(color: Colors.green, fontWeight: FontWeight.bold),
//                   ),
//               ],
//             ),
//             // Preferences Field
//             TextFormField(
//               controller: _preferencesController,
//               decoration: InputDecoration(labelText: "Preferences"),
//             ),
//             // Gender Field
//             TextFormField(
//               controller: _genderController,
//               decoration: InputDecoration(labelText: "Gender"),
//             ),
//             SizedBox(height: 24),
//             // Save Changes Button
//             Center(
//               child: ElevatedButton(
//                 onPressed: () {
//                   // This will handle saving the form, integrate backend later
//                   ScaffoldMessenger.of(context).showSnackBar(SnackBar(
//                     content: Text('Changes saved (simulated).'),
//                   ));
//                 },
//                 style: ElevatedButton.styleFrom(backgroundColor: Colors.blue),
//                 child: Text("Save Changes"),
//               ),
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }

// import 'package:flutter/material.dart';
//
// class ProfilePageContent extends StatefulWidget {
//   @override
//   _ProfilePageContentState createState() => _ProfilePageContentState();
// }
//
// class _ProfilePageContentState extends State<ProfilePageContent> {
//   // Controllers for editable fields
//   final TextEditingController _nameController =
//   TextEditingController(text: "John Doe");
//   final TextEditingController _countryController =
//   TextEditingController(text: "USA");
//   final TextEditingController _preferencesController =
//   TextEditingController(text: "Dark Mode, Notifications");
//   // Removed _genderController as we are using a separate state variable
//
//   // Static fields
//   final String _email = "johndoe@example.com";
//   final String _phoneNumber = "+1234567890";
//   bool _isPhoneVerified = false;
//
//   // Gender selection state
//   String _selectedGender = "Male";
//
//   void _verifyPhoneNumber() {
//     // Simulate phone verification popup
//     showDialog(
//       context: context,
//       builder: (context) => AlertDialog(
//         title: Text('Verify Phone Number'),
//         content: Column(
//           mainAxisSize: MainAxisSize.min,
//           children: [
//             Text('An OTP has been sent to $_phoneNumber'),
//             SizedBox(height: 10),
//             TextFormField(
//               decoration: InputDecoration(
//                 hintText: "Enter OTP",
//                 border: OutlineInputBorder(),
//               ),
//               keyboardType: TextInputType.number,
//             ),
//           ],
//         ),
//         actions: [
//           TextButton(
//             onPressed: () {
//               Navigator.of(context).pop();
//               setState(() {
//                 _isPhoneVerified = true;
//               });
//             },
//             child: Text(
//               'Verify',
//               style: TextStyle(color: Colors.green),
//             ),
//           ),
//         ],
//       ),
//     );
//   }
//
//   Widget _buildProfileImage() {
//     return Center(
//       child: CircleAvatar(
//         radius: 50,
//         backgroundColor: Colors.grey.shade200,
//         child: Icon(Icons.person, size: 50, color: Colors.grey),
//       ),
//     );
//   }
//
//   Widget _buildAccountInfo() {
//     return Column(
//       crossAxisAlignment: CrossAxisAlignment.start,
//       children: [
//         // Account ID
//         Text(
//           "Account ID: 12345",
//           style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
//         ),
//         SizedBox(height: 8),
//         // Change Password
//         GestureDetector(
//           onTap: () {
//             // Handle change password action
//           },
//           child: Text(
//             "Change Password",
//             style: TextStyle(
//                 fontSize: 16,
//                 color: Colors.blue,
//                 decoration: TextDecoration.underline),
//           ),
//         ),
//       ],
//     );
//   }
//
//   Widget _buildEditableField(
//       {required TextEditingController controller,
//         required String label,
//         bool readOnly = false}) {
//     return Padding(
//       padding: const EdgeInsets.symmetric(vertical: 8.0),
//       child: TextFormField(
//         controller: controller,
//         decoration: InputDecoration(
//           labelText: label,
//           border: OutlineInputBorder(),
//         ),
//         readOnly: readOnly,
//       ),
//     );
//   }
//
//   Widget _buildPhoneNumberField() {
//     return Padding(
//       padding: const EdgeInsets.symmetric(vertical: 8.0),
//       child: Row(
//         children: [
//           Expanded(
//             child: TextFormField(
//               initialValue: _phoneNumber,
//               decoration: InputDecoration(
//                 labelText: "Phone Number",
//                 border: OutlineInputBorder(),
//               ),
//               readOnly: true,
//             ),
//           ),
//           SizedBox(width: 10),
//           !_isPhoneVerified
//               ? ElevatedButton(
//             onPressed: _verifyPhoneNumber,
//             style: ElevatedButton.styleFrom(
//               backgroundColor: Colors.green,
//             ),
//             child: Text("Verify"),
//           )
//               : Text(
//             "Verified",
//             style: TextStyle(
//                 color: Colors.green, fontWeight: FontWeight.bold),
//           ),
//         ],
//       ),
//     );
//   }
//
//   Widget _buildGenderSelection() {
//     return Padding(
//       padding: const EdgeInsets.symmetric(vertical: 8.0),
//       child: Column(
//         crossAxisAlignment: CrossAxisAlignment.start,
//         children: [
//           Text(
//             "Gender",
//             style: TextStyle(
//                 fontSize: 16, fontWeight: FontWeight.w500, color: Colors.grey[700]),
//           ),
//           Row(
//             children: [
//               Expanded(
//                 child: RadioListTile<String>(
//                   title: Text("Male"),
//                   value: "Male",
//                   groupValue: _selectedGender,
//                   onChanged: (value) {
//                     setState(() {
//                       _selectedGender = value!;
//                     });
//                   },
//                 ),
//               ),
//               Expanded(
//                 child: RadioListTile<String>(
//                   title: Text("Female"),
//                   value: "Female",
//                   groupValue: _selectedGender,
//                   onChanged: (value) {
//                     setState(() {
//                       _selectedGender = value!;
//                     });
//                   },
//                 ),
//               ),
//             ],
//           ),
//         ],
//       ),
//     );
//   }
//
//   Widget _buildSaveButton() {
//     return Center(
//       child: ElevatedButton(
//         onPressed: () {
//           // Handle save action, integrate backend logic here
//           ScaffoldMessenger.of(context).showSnackBar(SnackBar(
//             content: Text('Changes saved (simulated).'),
//           ));
//         },
//         style: ElevatedButton.styleFrom(
//           backgroundColor: Colors.blue,
//           padding: EdgeInsets.symmetric(horizontal: 40, vertical: 15),
//           shape:
//           RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
//         ),
//         child: Text(
//           "Save Changes",
//           style: TextStyle(fontSize: 16),
//         ),
//       ),
//     );
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text('Profile'),
//         backgroundColor: Colors.white,
//         elevation: 1,
//         centerTitle: true,
//         leading: IconButton(
//           icon: Icon(Icons.arrow_back, color: Colors.blue),
//           onPressed: () {
//             Navigator.pop(context);
//           },
//         ),
//         iconTheme: IconThemeData(color: Colors.blue),
//         titleTextStyle: TextStyle(
//             color: Colors.black, fontSize: 20, fontWeight: FontWeight.bold),
//       ),
//       body: SingleChildScrollView(
//         padding: const EdgeInsets.all(16.0),
//         child: Column(
//           crossAxisAlignment: CrossAxisAlignment.start,
//           children: [
//             _buildProfileImage(),
//             SizedBox(height: 16),
//             _buildAccountInfo(),
//             SizedBox(height: 24),
//             Text(
//               "Account Information",
//               style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
//             ),
//             Divider(thickness: 1),
//             _buildEditableField(
//                 controller: _nameController, label: "Name"),
//             _buildEditableField(
//                 controller: TextEditingController(text: _email),
//                 label: "Email",
//                 readOnly: true),
//             _buildEditableField(
//                 controller: _countryController, label: "Country"),
//             _buildPhoneNumberField(),
//             _buildEditableField(
//                 controller: _preferencesController, label: "Preferences"),
//             _buildGenderSelection(),
//             SizedBox(height: 24),
//             _buildSaveButton(),
//           ],
//         ),
//       ),
//     );
//   }
// }

// import 'package:flutter/material.dart';
//
// class ProfilePageContent extends StatefulWidget {
//   @override
//   _ProfilePageContentState createState() => _ProfilePageContentState();
// }
//
// class _ProfilePageContentState extends State<ProfilePageContent> {
//   // Controllers for editable fields
//   final TextEditingController _nameController =
//   TextEditingController(text: "John Doe");
//   // Removed _countryController as we'll use a dropdown
//   final TextEditingController _preferencesController =
//   TextEditingController(text: "Dark Mode, Notifications");
//   // Removed _genderController as we are using a separate state variable
//
//   // Static fields
//   final String _email = "johndoe@example.com";
//   final String _phoneNumber = "+1234567890";
//   bool _isPhoneVerified = false;
//
//   // Gender selection state
//   String _selectedGender = "Male";
//
//   // Country selection state
//   String? _selectedCountry;
//
//   // List of countries (sample list)
//   final List<String> _countries = [
//     "USA",
//     "Canada",
//     "United Kingdom",
//     "Australia",
//     "Germany",
//     "France",
//     "India",
//     "China",
//     "Japan",
//     "Brazil",
//     // Add more countries as needed
//   ];
//
//   void _verifyPhoneNumber() {
//     // Simulate phone verification popup
//     showDialog(
//       context: context,
//       builder: (context) => AlertDialog(
//         title: Text('Verify Phone Number'),
//         content: Column(
//           mainAxisSize: MainAxisSize.min,
//           children: [
//             Text('An OTP has been sent to $_phoneNumber'),
//             SizedBox(height: 10),
//             TextFormField(
//               decoration: InputDecoration(
//                 hintText: "Enter OTP",
//                 border: OutlineInputBorder(),
//               ),
//               keyboardType: TextInputType.number,
//             ),
//           ],
//         ),
//         actions: [
//           TextButton(
//             onPressed: () {
//               Navigator.of(context).pop();
//               setState(() {
//                 _isPhoneVerified = true;
//               });
//             },
//             child: Text(
//               'Verify',
//               style: TextStyle(color: Colors.green),
//             ),
//           ),
//         ],
//       ),
//     );
//   }
//
//   Widget _buildProfileImage() {
//     return Center(
//       child: CircleAvatar(
//         radius: 50,
//         backgroundColor: Colors.grey.shade200,
//         child: Icon(Icons.person, size: 50, color: Colors.grey),
//       ),
//     );
//   }
//
//   Widget _buildAccountInfo() {
//     return Column(
//       crossAxisAlignment: CrossAxisAlignment.start,
//       children: [
//         // Account ID
//         Text(
//           "Account ID: 12345",
//           style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
//         ),
//         SizedBox(height: 8),
//         // Change Password
//         GestureDetector(
//           onTap: () {
//             // Handle change password action
//           },
//           child: Text(
//             "Change Password",
//             style: TextStyle(
//                 fontSize: 16,
//                 color: Colors.blue,
//                 decoration: TextDecoration.underline),
//           ),
//         ),
//       ],
//     );
//   }
//
//   Widget _buildEditableField({
//     required TextEditingController controller,
//     required String label,
//     bool readOnly = false,
//   }) {
//     return Padding(
//       padding: const EdgeInsets.symmetric(vertical: 8.0),
//       child: TextFormField(
//         controller: controller,
//         decoration: InputDecoration(
//           labelText: label,
//           border: OutlineInputBorder(
//             borderRadius: BorderRadius.circular(30.0),
//           ),
//         ),
//         readOnly: readOnly,
//       ),
//     );
//   }
//
//   // New method to build the Country Dropdown
//   Widget _buildCountryDropdown() {
//     return Padding(
//       padding: const EdgeInsets.symmetric(vertical: 8.0),
//       child: DropdownButtonFormField<String>(
//         value: _selectedCountry,
//         decoration: InputDecoration(
//           labelText: "Country",
//           border: OutlineInputBorder(
//             borderRadius: BorderRadius.circular(30.0),
//           ),
//         ),
//         items: _countries
//             .map(
//               (country) => DropdownMenuItem<String>(
//             value: country,
//             child: Text(country),
//           ),
//         )
//             .toList(),
//         onChanged: (value) {
//           setState(() {
//             _selectedCountry = value;
//           });
//         },
//         validator: (value) {
//           if (value == null || value.isEmpty) {
//             return 'Please select your country';
//           }
//           return null;
//         },
//       ),
//     );
//   }
//
//   Widget _buildPhoneNumberField() {
//     return Padding(
//       padding: const EdgeInsets.symmetric(vertical: 8.0),
//       child: Row(
//         children: [
//           Expanded(
//             child: TextFormField(
//               initialValue: _phoneNumber,
//               decoration: InputDecoration(
//                 labelText: "Phone Number",
//                 border: OutlineInputBorder(
//                   borderRadius: BorderRadius.circular(30.0),
//                 ),
//               ),
//               readOnly: true,
//             ),
//           ),
//           SizedBox(width: 10),
//           !_isPhoneVerified
//               ? ElevatedButton(
//             onPressed: _verifyPhoneNumber,
//             style: ElevatedButton.styleFrom(
//               backgroundColor: Colors.green,
//             ),
//             child: Text("Verify"),
//           )
//               : Text(
//             "Verified",
//             style: TextStyle(
//                 color: Colors.green, fontWeight: FontWeight.bold),
//           ),
//         ],
//       ),
//     );
//   }
//
//   Widget _buildGenderSelection() {
//     return Padding(
//       padding: const EdgeInsets.symmetric(vertical: 8.0),
//       child: Column(
//         crossAxisAlignment: CrossAxisAlignment.start,
//         children: [
//           Text(
//             "Gender",
//             style: TextStyle(
//                 fontSize: 16,
//                 fontWeight: FontWeight.w500,
//                 color: Colors.grey[700]),
//           ),
//           Row(
//             children: [
//               Expanded(
//                 child: RadioListTile<String>(
//                   title: Text("Male"),
//                   value: "Male",
//                   groupValue: _selectedGender,
//                   onChanged: (value) {
//                     setState(() {
//                       _selectedGender = value!;
//                     });
//                   },
//                 ),
//               ),
//               Expanded(
//                 child: RadioListTile<String>(
//                   title: Text("Female"),
//                   value: "Female",
//                   groupValue: _selectedGender,
//                   onChanged: (value) {
//                     setState(() {
//                       _selectedGender = value!;
//                     });
//                   },
//                 ),
//               ),
//             ],
//           ),
//         ],
//       ),
//     );
//   }
//
//   Widget _buildSaveButton() {
//     return Center(
//       child: ElevatedButton(
//         onPressed: () {
//           // Handle save action, integrate backend logic here
//           ScaffoldMessenger.of(context).showSnackBar(SnackBar(
//             content: Text('Changes saved (simulated).'),
//           ));
//         },
//         style: ElevatedButton.styleFrom(
//           backgroundColor: Colors.blue,
//           padding: EdgeInsets.symmetric(horizontal: 40, vertical: 15),
//           shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
//         ),
//         child: Text(
//           "Save Changes",
//           style: TextStyle(fontSize: 16),
//         ),
//       ),
//     );
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text('Profile'),
//         backgroundColor: Colors.white,
//         elevation: 1,
//         centerTitle: true,
//         leading: IconButton(
//           icon: Icon(Icons.arrow_back, color: Colors.blue),
//           onPressed: () {
//             Navigator.pop(context);
//           },
//         ),
//         iconTheme: IconThemeData(color: Colors.blue),
//         titleTextStyle: TextStyle(
//             color: Colors.black, fontSize: 20, fontWeight: FontWeight.bold),
//       ),
//       body: SingleChildScrollView(
//         padding: const EdgeInsets.all(16.0),
//         child: Column(
//           crossAxisAlignment: CrossAxisAlignment.start,
//           children: [
//             _buildProfileImage(),
//             SizedBox(height: 16),
//             _buildAccountInfo(),
//             SizedBox(height: 24),
//             Text(
//               "Account Information",
//               style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
//             ),
//             Divider(thickness: 1),
//             _buildEditableField(controller: _nameController, label: "Name"),
//             _buildEditableField(
//                 controller: TextEditingController(text: _email),
//                 label: "Email",
//                 readOnly: true),
//             // Replace the TextFormField with Dropdown for Country
//             _buildCountryDropdown(),
//             _buildPhoneNumberField(),
//             _buildEditableField(
//                 controller: _preferencesController, label: "Preferences"),
//             _buildGenderSelection(),
//             SizedBox(height: 24),
//             _buildSaveButton(),
//           ],
//         ),
//       ),
//     );
//   }
// }

// import 'package:flutter/material.dart';
//
// class ProfilePageContent extends StatefulWidget {
//   @override
//   _ProfilePageContentState createState() => _ProfilePageContentState();
// }
//
// class _ProfilePageContentState extends State<ProfilePageContent> {
//   // Controllers for editable fields
//   final TextEditingController _nameController =
//   TextEditingController(text: "John Doe");
//   final TextEditingController _preferencesController =
//   TextEditingController(text: "Dark Mode, Notifications");
//
//   // Static fields
//   final String _email = "johndoe@example.com";
//   final String _phoneNumber = "+1234567890";
//   bool _isPhoneVerified = false;
//
//   // Gender selection state
//   String _selectedGender = "Male";
//
//   // Country selection state
//   String? _selectedCountry;
//
//   // List of countries (sample list)
//   final List<String> _countries = [
//     "USA",
//     "Canada",
//     "United Kingdom",
//     "Australia",
//     "Germany",
//     "France",
//     "India",
//     "China",
//     "Japan",
//     "Brazil",
//     // Add more countries as needed
//   ];
//
//   // Controllers for Change Password dialog
//   final TextEditingController _oldPasswordController =
//   TextEditingController();
//   final TextEditingController _newPasswordController =
//   TextEditingController();
//   final TextEditingController _retypeNewPasswordController =
//   TextEditingController();
//
//   void _verifyPhoneNumber() {
//     // Simulate phone verification popup
//     showDialog(
//       context: context,
//       builder: (context) => AlertDialog(
//         title: Text('Verify Phone Number'),
//         content: Column(
//           mainAxisSize: MainAxisSize.min,
//           children: [
//             Text('An OTP has been sent to $_phoneNumber'),
//             SizedBox(height: 10),
//             TextFormField(
//               decoration: InputDecoration(
//                 hintText: "Enter OTP",
//                 border: OutlineInputBorder(),
//               ),
//               keyboardType: TextInputType.number,
//             ),
//           ],
//         ),
//         actions: [
//           TextButton(
//             onPressed: () {
//               Navigator.of(context).pop();
//               setState(() {
//                 _isPhoneVerified = true;
//               });
//             },
//             child: Text(
//               'Verify',
//               style: TextStyle(color: Colors.green),
//             ),
//           ),
//         ],
//       ),
//     );
//   }
//
//   void _showChangePasswordDialog() {
//     // Clear previous inputs
//     _oldPasswordController.clear();
//     _newPasswordController.clear();
//     _retypeNewPasswordController.clear();
//
//     showDialog(
//       context: context,
//       builder: (context) {
//         return AlertDialog(
//           title: Text('Change Password'),
//           content: SingleChildScrollView(
//             child: Column(
//               mainAxisSize: MainAxisSize.min,
//               children: [
//                 // Old Password
//                 TextFormField(
//                   controller: _oldPasswordController,
//                   decoration: InputDecoration(
//                     labelText: "Old Password",
//                     border: OutlineInputBorder(),
//                   ),
//                   obscureText: true,
//                 ),
//                 SizedBox(height: 10),
//                 // New Password
//                 TextFormField(
//                   controller: _newPasswordController,
//                   decoration: InputDecoration(
//                     labelText: "New Password",
//                     border: OutlineInputBorder(),
//                   ),
//                   obscureText: true,
//                 ),
//                 SizedBox(height: 10),
//                 // Retype New Password
//                 TextFormField(
//                   controller: _retypeNewPasswordController,
//                   decoration: InputDecoration(
//                     labelText: "Retype New Password",
//                     border: OutlineInputBorder(),
//                   ),
//                   obscureText: true,
//                 ),
//               ],
//             ),
//           ),
//           actions: [
//             TextButton(
//               onPressed: () {
//                 // Close the dialog
//                 Navigator.of(context).pop();
//               },
//               child: Text(
//                 'Cancel',
//                 style: TextStyle(color: Colors.grey),
//               ),
//             ),
//             ElevatedButton(
//               onPressed: () {
//                 // Handle password change logic here
//                 String oldPassword = _oldPasswordController.text.trim();
//                 String newPassword = _newPasswordController.text.trim();
//                 String retypeNewPassword =
//                 _retypeNewPasswordController.text.trim();
//
//                 if (oldPassword.isEmpty ||
//                     newPassword.isEmpty ||
//                     retypeNewPassword.isEmpty) {
//                   ScaffoldMessenger.of(context).showSnackBar(SnackBar(
//                     content: Text('Please fill in all fields.'),
//                   ));
//                   return;
//                 }
//
//                 if (newPassword != retypeNewPassword) {
//                   ScaffoldMessenger.of(context).showSnackBar(SnackBar(
//                     content: Text('New passwords do not match.'),
//                   ));
//                   return;
//                 }
//
//                 // Simulate password change success
//                 Navigator.of(context).pop();
//                 ScaffoldMessenger.of(context).showSnackBar(SnackBar(
//                   content: Text('Password changed successfully.'),
//                 ));
//               },
//               style: ElevatedButton.styleFrom(
//                 backgroundColor: Colors.blue,
//               ),
//               child: Text('Accept'),
//             ),
//           ],
//         );
//       },
//     );
//   }
//
//   Widget _buildProfileImage() {
//     return Center(
//       child: CircleAvatar(
//         radius: 50,
//         backgroundColor: Colors.grey.shade200,
//         child: Icon(Icons.person, size: 50, color: Colors.grey),
//       ),
//     );
//   }
//
//   Widget _buildAccountInfo() {
//     return Column(
//       crossAxisAlignment: CrossAxisAlignment.start,
//       children: [
//         // Account ID
//         Text(
//           "Account ID: 12345",
//           style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
//         ),
//         SizedBox(height: 8),
//         // Change Password
//         GestureDetector(
//           onTap: _showChangePasswordDialog, // Updated onTap
//           child: Text(
//             "Change Password",
//             style: TextStyle(
//                 fontSize: 16,
//                 color: Colors.blue,
//                 decoration: TextDecoration.underline),
//           ),
//         ),
//       ],
//     );
//   }
//
//   Widget _buildEditableField({
//     required TextEditingController controller,
//     required String label,
//     bool readOnly = false,
//   }) {
//     return Padding(
//       padding: const EdgeInsets.symmetric(vertical: 8.0),
//       child: TextFormField(
//         controller: controller,
//         decoration: InputDecoration(
//           labelText: label,
//           border: OutlineInputBorder(
//             borderRadius: BorderRadius.circular(30.0),
//           ),
//         ),
//         readOnly: readOnly,
//       ),
//     );
//   }
//
//   // New method to build the Country Dropdown
//   Widget _buildCountryDropdown() {
//     return Padding(
//       padding: const EdgeInsets.symmetric(vertical: 8.0),
//       child: DropdownButtonFormField<String>(
//         value: _selectedCountry,
//         decoration: InputDecoration(
//           labelText: "Country",
//           border: OutlineInputBorder(
//             borderRadius: BorderRadius.circular(30.0),
//           ),
//         ),
//         items: _countries
//             .map(
//               (country) => DropdownMenuItem<String>(
//             value: country,
//             child: Text(country),
//           ),
//         )
//             .toList(),
//         onChanged: (value) {
//           setState(() {
//             _selectedCountry = value;
//           });
//         },
//         validator: (value) {
//           if (value == null || value.isEmpty) {
//             return 'Please select your country';
//           }
//           return null;
//         },
//       ),
//     );
//   }
//
//   Widget _buildPhoneNumberField() {
//     return Padding(
//       padding: const EdgeInsets.symmetric(vertical: 8.0),
//       child: Row(
//         children: [
//           Expanded(
//             child: TextFormField(
//               initialValue: _phoneNumber,
//               decoration: InputDecoration(
//                 labelText: "Phone Number",
//                 border: OutlineInputBorder(
//                   borderRadius: BorderRadius.circular(30.0),
//                 ),
//               ),
//               readOnly: true,
//             ),
//           ),
//           SizedBox(width: 10),
//           !_isPhoneVerified
//               ? ElevatedButton(
//             onPressed: _verifyPhoneNumber,
//             style: ElevatedButton.styleFrom(
//               backgroundColor: Colors.green,
//             ),
//             child: Text("Verify"),
//           )
//               : Text(
//             "Verified",
//             style: TextStyle(
//                 color: Colors.green, fontWeight: FontWeight.bold),
//           ),
//         ],
//       ),
//     );
//   }
//
//   Widget _buildGenderSelection() {
//     return Padding(
//       padding: const EdgeInsets.symmetric(vertical: 8.0),
//       child: Column(
//         crossAxisAlignment: CrossAxisAlignment.start,
//         children: [
//           Text(
//             "Gender",
//             style: TextStyle(
//                 fontSize: 16,
//                 fontWeight: FontWeight.w500,
//                 color: Colors.grey[700]),
//           ),
//           Row(
//             children: [
//               Expanded(
//                 child: RadioListTile<String>(
//                   title: Text("Male"),
//                   value: "Male",
//                   groupValue: _selectedGender,
//                   onChanged: (value) {
//                     setState(() {
//                       _selectedGender = value!;
//                     });
//                   },
//                 ),
//               ),
//               Expanded(
//                 child: RadioListTile<String>(
//                   title: Text("Female"),
//                   value: "Female",
//                   groupValue: _selectedGender,
//                   onChanged: (value) {
//                     setState(() {
//                       _selectedGender = value!;
//                     });
//                   },
//                 ),
//               ),
//             ],
//           ),
//         ],
//       ),
//     );
//   }
//
//   Widget _buildSaveButton() {
//     return Center(
//       child: ElevatedButton(
//         onPressed: () {
//           // Handle save action, integrate backend logic here
//           ScaffoldMessenger.of(context).showSnackBar(SnackBar(
//             content: Text('Changes saved (simulated).'),
//           ));
//         },
//         style: ElevatedButton.styleFrom(
//           backgroundColor: Colors.blue,
//           padding: EdgeInsets.symmetric(horizontal: 40, vertical: 15),
//           shape:
//           RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
//         ),
//         child: Text(
//           "Save Changes",
//           style: TextStyle(fontSize: 16),
//         ),
//       ),
//     );
//   }
//
//   @override
//   void dispose() {
//     // Dispose controllers to free resources
//     _nameController.dispose();
//     _preferencesController.dispose();
//     _oldPasswordController.dispose();
//     _newPasswordController.dispose();
//     _retypeNewPasswordController.dispose();
//     super.dispose();
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text('Profile'),
//         backgroundColor: Colors.white,
//         elevation: 1,
//         centerTitle: true,
//         leading: IconButton(
//           icon: Icon(Icons.arrow_back, color: Colors.blue),
//           onPressed: () {
//             Navigator.pop(context);
//           },
//         ),
//         iconTheme: IconThemeData(color: Colors.blue),
//         titleTextStyle: TextStyle(
//             color: Colors.black, fontSize: 20, fontWeight: FontWeight.bold),
//       ),
//       body: SingleChildScrollView(
//         padding: const EdgeInsets.all(16.0),
//         child: Column(
//           crossAxisAlignment: CrossAxisAlignment.start,
//           children: [
//             _buildProfileImage(),
//             SizedBox(height: 16),
//             _buildAccountInfo(),
//             SizedBox(height: 24),
//             Text(
//               "Account Information",
//               style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
//             ),
//             Divider(thickness: 1),
//             _buildEditableField(controller: _nameController, label: "Name"),
//             _buildEditableField(
//                 controller: TextEditingController(text: _email),
//                 label: "Email",
//                 readOnly: true),
//             // Replace the TextFormField with Dropdown for Country
//             _buildCountryDropdown(),
//             _buildPhoneNumberField(),
//             _buildEditableField(
//                 controller: _preferencesController, label: "Preferences"),
//             _buildGenderSelection(),
//             SizedBox(height: 24),
//             _buildSaveButton(),
//           ],
//         ),
//       ),
//     );
//   }
// }

// import 'package:flutter/material.dart';
//
// class ProfilePageContent extends StatefulWidget {
//   @override
//   _ProfilePageContentState createState() => _ProfilePageContentState();
// }
//
// class _ProfilePageContentState extends State<ProfilePageContent> {
//   // Controllers for editable fields
//   final TextEditingController _nameController = TextEditingController(text: "John Doe");
//   final TextEditingController _addressController = TextEditingController(text: "123 Main Street, Springfield");
//   final TextEditingController _phoneController = TextEditingController(text: "+1234567890");
//
//   // Static fields
//   final String _email = "johndoe@example.com";
//   bool _isPhoneVerified = false;
//
//   // Gender selection state
//   String _selectedGender = "Male";
//
//   // Country selection state
//   String? _selectedCountry;
//
//   // List of countries (sample list)
//   final List<String> _countries = [
//     "USA",
//     "Canada",
//     "United Kingdom",
//     "Australia",
//     "Germany",
//     "France",
//     "India",
//     "China",
//     "Japan",
//     "Brazil",
//     // Add more countries as needed
//   ];
//
//   // Controllers for Change Password dialog
//   final TextEditingController _oldPasswordController = TextEditingController();
//   final TextEditingController _newPasswordController = TextEditingController();
//   final TextEditingController _retypeNewPasswordController = TextEditingController();
//
//   void _verifyPhoneNumber() {
//     // Simulate phone verification popup
//     showDialog(
//       context: context,
//       builder: (context) => AlertDialog(
//         title: Text('Verify Phone Number'),
//         content: Column(
//           mainAxisSize: MainAxisSize.min,
//           children: [
//             Text('An OTP has been sent to ${_phoneController.text}'),
//             SizedBox(height: 10),
//             TextFormField(
//               decoration: InputDecoration(
//                 hintText: "Enter OTP",
//                 border: OutlineInputBorder(),
//               ),
//               keyboardType: TextInputType.number,
//             ),
//           ],
//         ),
//         actions: [
//           TextButton(
//             onPressed: () {
//               Navigator.of(context).pop();
//               setState(() {
//                 _isPhoneVerified = true;
//               });
//             },
//             child: Text(
//               'Verify',
//               style: TextStyle(color: Colors.green),
//             ),
//           ),
//         ],
//       ),
//     );
//   }
//
//   void _showChangePasswordDialog() {
//     // Clear previous inputs
//     _oldPasswordController.clear();
//     _newPasswordController.clear();
//     _retypeNewPasswordController.clear();
//
//     showDialog(
//       context: context,
//       builder: (context) {
//         return AlertDialog(
//           title: Text('Change Password'),
//           content: SingleChildScrollView(
//             child: Column(
//               mainAxisSize: MainAxisSize.min,
//               children: [
//                 // Old Password
//                 TextFormField(
//                   controller: _oldPasswordController,
//                   decoration: InputDecoration(
//                     labelText: "Old Password",
//                     border: OutlineInputBorder(),
//                   ),
//                   obscureText: true,
//                 ),
//                 SizedBox(height: 10),
//                 // New Password
//                 TextFormField(
//                   controller: _newPasswordController,
//                   decoration: InputDecoration(
//                     labelText: "New Password",
//                     border: OutlineInputBorder(),
//                   ),
//                   obscureText: true,
//                 ),
//                 SizedBox(height: 10),
//                 // Retype New Password
//                 TextFormField(
//                   controller: _retypeNewPasswordController,
//                   decoration: InputDecoration(
//                     labelText: "Retype New Password",
//                     border: OutlineInputBorder(),
//                   ),
//                   obscureText: true,
//                 ),
//               ],
//             ),
//           ),
//           actions: [
//             TextButton(
//               onPressed: () {
//                 // Close the dialog
//                 Navigator.of(context).pop();
//               },
//               child: Text(
//                 'Cancel',
//                 style: TextStyle(color: Colors.grey),
//               ),
//             ),
//             ElevatedButton(
//               onPressed: () {
//                 // Handle password change logic here
//                 String oldPassword = _oldPasswordController.text.trim();
//                 String newPassword = _newPasswordController.text.trim();
//                 String retypeNewPassword = _retypeNewPasswordController.text.trim();
//
//                 if (oldPassword.isEmpty ||
//                     newPassword.isEmpty ||
//                     retypeNewPassword.isEmpty) {
//                   ScaffoldMessenger.of(context).showSnackBar(SnackBar(
//                     content: Text('Please fill in all fields.'),
//                   ));
//                   return;
//                 }
//
//                 if (newPassword != retypeNewPassword) {
//                   ScaffoldMessenger.of(context).showSnackBar(SnackBar(
//                     content: Text('New passwords do not match.'),
//                   ));
//                   return;
//                 }
//
//                 // Simulate password change success
//                 Navigator.of(context).pop();
//                 ScaffoldMessenger.of(context).showSnackBar(SnackBar(
//                   content: Text('Password changed successfully.'),
//                 ));
//               },
//               style: ElevatedButton.styleFrom(
//                 backgroundColor: Colors.blue,
//               ),
//               child: Text('Accept'),
//             ),
//           ],
//         );
//       },
//     );
//   }
//
//   Widget _buildProfileImage() {
//     return Center(
//       child: CircleAvatar(
//         radius: 50,
//         backgroundColor: Colors.grey.shade200,
//         child: Icon(Icons.person, size: 50, color: Colors.grey),
//       ),
//     );
//   }
//
//   Widget _buildAccountInfo() {
//     return Column(
//       crossAxisAlignment: CrossAxisAlignment.start,
//       children: [
//         // Account ID
//         Text(
//           "Account ID: 12345",
//           style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
//         ),
//         SizedBox(height: 8),
//         // Change Password
//         GestureDetector(
//           onTap: _showChangePasswordDialog, // Updated onTap
//           child: Text(
//             "Change Password",
//             style: TextStyle(
//                 fontSize: 16,
//                 color: Colors.blue,
//                 decoration: TextDecoration.underline),
//           ),
//         ),
//       ],
//     );
//   }
//
//   Widget _buildEditableField({
//     required TextEditingController controller,
//     required String label,
//     bool readOnly = false,
//   }) {
//     return Padding(
//       padding: const EdgeInsets.symmetric(vertical: 8.0),
//       child: TextFormField(
//         controller: controller,
//         decoration: InputDecoration(
//           labelText: label,
//           border: OutlineInputBorder(
//             borderRadius: BorderRadius.circular(30.0),
//           ),
//         ),
//         readOnly: readOnly,
//       ),
//     );
//   }
//
//   // New method to build the Country Dropdown
//   Widget _buildCountryDropdown() {
//     return Padding(
//       padding: const EdgeInsets.symmetric(vertical: 8.0),
//       child: DropdownButtonFormField<String>(
//         value: _selectedCountry,
//         decoration: InputDecoration(
//           labelText: "Country",
//           border: OutlineInputBorder(
//             borderRadius: BorderRadius.circular(30.0),
//           ),
//         ),
//         items: _countries
//             .map(
//               (country) => DropdownMenuItem<String>(
//             value: country,
//             child: Text(country),
//           ),
//         )
//             .toList(),
//         onChanged: (value) {
//           setState(() {
//             _selectedCountry = value;
//           });
//         },
//         validator: (value) {
//           if (value == null || value.isEmpty) {
//             return 'Please select your country';
//           }
//           return null;
//         },
//       ),
//     );
//   }
//
//   Widget _buildPhoneNumberField() {
//     return Padding(
//       padding: const EdgeInsets.symmetric(vertical: 8.0),
//       child: Row(
//         children: [
//           Expanded(
//             child: TextFormField(
//               controller: _phoneController,
//               decoration: InputDecoration(
//                 labelText: "Phone Number",
//                 border: OutlineInputBorder(
//                   borderRadius: BorderRadius.circular(30.0),
//                 ),
//               ),
//               keyboardType: TextInputType.phone,
//             ),
//           ),
//           SizedBox(width: 10),
//           !_isPhoneVerified
//               ? ElevatedButton(
//             onPressed: _verifyPhoneNumber,
//             style: ElevatedButton.styleFrom(
//               backgroundColor: Colors.green,
//             ),
//             child: Text("Verify"),
//           )
//               : Text(
//             "Verified",
//             style: TextStyle(
//                 color: Colors.green, fontWeight: FontWeight.bold),
//           ),
//         ],
//       ),
//     );
//   }
//
//   Widget _buildGenderSelection() {
//     return Padding(
//       padding: const EdgeInsets.symmetric(vertical: 8.0),
//       child: Column(
//         crossAxisAlignment: CrossAxisAlignment.start,
//         children: [
//           Text(
//             "Gender",
//             style: TextStyle(
//                 fontSize: 16,
//                 fontWeight: FontWeight.w500,
//                 color: Colors.grey[700]),
//           ),
//           Row(
//             children: [
//               Expanded(
//                 child: RadioListTile<String>(
//                   title: Text("Male"),
//                   value: "Male",
//                   groupValue: _selectedGender,
//                   onChanged: (value) {
//                     setState(() {
//                       _selectedGender = value!;
//                     });
//                   },
//                 ),
//               ),
//               Expanded(
//                 child: RadioListTile<String>(
//                   title: Text("Female"),
//                   value: "Female",
//                   groupValue: _selectedGender,
//                   onChanged: (value) {
//                     setState(() {
//                       _selectedGender = value!;
//                     });
//                   },
//                 ),
//               ),
//             ],
//           ),
//         ],
//       ),
//     );
//   }
//
//   Widget _buildSaveButton() {
//     return Center(
//       child: ElevatedButton(
//         onPressed: () {
//           // Handle save action, integrate backend logic here
//           ScaffoldMessenger.of(context).showSnackBar(SnackBar(
//             content: Text('Changes saved (simulated).'),
//           ));
//         },
//         style: ElevatedButton.styleFrom(
//           backgroundColor: Colors.blue,
//           padding: EdgeInsets.symmetric(horizontal: 40, vertical: 15),
//           shape:
//           RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
//         ),
//         child: Text(
//           "Save Changes",
//           style: TextStyle(fontSize: 16),
//         ),
//       ),
//     );
//   }
//
//   // New method to build the Address Field
//   Widget _buildAddressField() {
//     return Padding(
//       padding: const EdgeInsets.symmetric(vertical: 8.0),
//       child: TextFormField(
//         controller: _addressController,
//         decoration: InputDecoration(
//           labelText: "Address",
//           border: OutlineInputBorder(
//             borderRadius: BorderRadius.circular(30.0),
//           ),
//         ),
//         keyboardType: TextInputType.streetAddress,
//       ),
//     );
//   }
//
//   @override
//   void dispose() {
//     // Dispose controllers to free resources
//     _nameController.dispose();
//     _addressController.dispose();
//     _phoneController.dispose();
//     _oldPasswordController.dispose();
//     _newPasswordController.dispose();
//     _retypeNewPasswordController.dispose();
//     super.dispose();
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text('Profile'),
//         backgroundColor: Colors.white,
//         elevation: 1,
//         centerTitle: true,
//         leading: IconButton(
//           icon: Icon(Icons.arrow_back, color: Colors.blue),
//           onPressed: () {
//             Navigator.pop(context);
//           },
//         ),
//         iconTheme: IconThemeData(color: Colors.blue),
//         titleTextStyle: TextStyle(
//             color: Colors.black, fontSize: 20, fontWeight: FontWeight.bold),
//       ),
//       body: SingleChildScrollView(
//         padding: const EdgeInsets.all(16.0),
//         child: Column(
//           crossAxisAlignment: CrossAxisAlignment.start,
//           children: [
//             _buildProfileImage(),
//             SizedBox(height: 16),
//             _buildAccountInfo(),
//             SizedBox(height: 24),
//             Text(
//               "Account Information",
//               style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
//             ),
//             Divider(thickness: 1),
//             _buildEditableField(controller: _nameController, label: "Name"),
//             _buildEditableField(
//                 controller: TextEditingController(text: _email),
//                 label: "Email",
//                 readOnly: true),
//             _buildAddressField(), // Added Address Field
//             _buildCountryDropdown(),
//             _buildPhoneNumberField(),
//             _buildGenderSelection(),
//             SizedBox(height: 24),
//             _buildSaveButton(),
//           ],
//         ),
//       ),
//     );
//   }
// }

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'dart:io';

class ProfilePageContent extends StatefulWidget {
  @override
  _ProfilePageContentState createState() => _ProfilePageContentState();
}

class _ProfilePageContentState extends State<ProfilePageContent> {
  // Controllers for editable fields
  final TextEditingController _nameController = TextEditingController(text: "John Doe");
  final TextEditingController _addressController = TextEditingController(text: "123 Main Street, Springfield");
  final TextEditingController _phoneController = TextEditingController(text: "+1234567890");

  // Static fields
  final String _email = "johndoe@example.com";
  bool _isPhoneVerified = false;

  // Gender selection state
  String _selectedGender = "Male";

  // Country selection state
  String? _selectedCountry;

  // List of countries (sample list)
  final List<String> _countries = [
    "USA",
    "Canada",
    "United Kingdom",
    "Australia",
    "Germany",
    "France",
    "India",
    "China",
    "Japan",
    "Brazil",
    // Add more countries as needed
  ];

  // Controllers for Change Password dialog
  final TextEditingController _oldPasswordController = TextEditingController();
  final TextEditingController _newPasswordController = TextEditingController();
  final TextEditingController _retypeNewPasswordController = TextEditingController();

  // New state variable for profile image
  File? _profileImage;

  // Image picker method
  Future<void> _pickImage() async {
    final ImagePicker _picker = ImagePicker();
    try {
      final XFile? image = await _picker.pickImage(source: ImageSource.gallery);
      if (image != null) {
        setState(() {
          _profileImage = File(image.path);
        });
      }
    } catch (e) {
      // Handle any errors here
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Failed to pick image: $e')),
      );
    }
  }

  void _verifyPhoneNumber() {
    // Simulate phone verification popup
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: Text('Verify Phone Number'),
        content: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Text('An OTP has been sent to ${_phoneController.text}'),
            SizedBox(height: 10),
            TextFormField(
              decoration: InputDecoration(
                hintText: "Enter OTP",
                border: OutlineInputBorder(),
              ),
              keyboardType: TextInputType.number,
            ),
          ],
        ),
        actions: [
          TextButton(
            onPressed: () {
              Navigator.of(context).pop();
              setState(() {
                _isPhoneVerified = true;
              });
            },
            child: Text(
              'Verify',
              style: TextStyle(color: Colors.green),
            ),
          ),
        ],
      ),
    );
  }

  void _showChangePasswordDialog() {
    // Clear previous inputs
    _oldPasswordController.clear();
    _newPasswordController.clear();
    _retypeNewPasswordController.clear();

    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: Text('Change Password'),
          content: SingleChildScrollView(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                // Old Password
                TextFormField(
                  controller: _oldPasswordController,
                  decoration: InputDecoration(
                    labelText: "Old Password",
                    border: OutlineInputBorder(),
                  ),
                  obscureText: true,
                ),
                SizedBox(height: 10),
                // New Password
                TextFormField(
                  controller: _newPasswordController,
                  decoration: InputDecoration(
                    labelText: "New Password",
                    border: OutlineInputBorder(),
                  ),
                  obscureText: true,
                ),
                SizedBox(height: 10),
                // Retype New Password
                TextFormField(
                  controller: _retypeNewPasswordController,
                  decoration: InputDecoration(
                    labelText: "Retype New Password",
                    border: OutlineInputBorder(),
                  ),
                  obscureText: true,
                ),
              ],
            ),
          ),
          actions: [
            TextButton(
              onPressed: () {
                // Close the dialog
                Navigator.of(context).pop();
              },
              child: Text(
                'Cancel',
                style: TextStyle(color: Colors.grey),
              ),
            ),
            ElevatedButton(
              onPressed: () {
                // Handle password change logic here
                String oldPassword = _oldPasswordController.text.trim();
                String newPassword = _newPasswordController.text.trim();
                String retypeNewPassword = _retypeNewPasswordController.text.trim();

                if (oldPassword.isEmpty ||
                    newPassword.isEmpty ||
                    retypeNewPassword.isEmpty) {
                  ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                    content: Text('Please fill in all fields.'),
                  ));
                  return;
                }

                if (newPassword != retypeNewPassword) {
                  ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                    content: Text('New passwords do not match.'),
                  ));
                  return;
                }

                // Simulate password change success
                Navigator.of(context).pop();
                ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                  content: Text('Password changed successfully.'),
                ));
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.blue,
              ),
              child: Text('Accept'),
            ),
          ],
        );
      },
    );
  }

  Widget _buildProfileImage() {
    return Center(
      child: GestureDetector(
        onTap: _pickImage, // Handle tap to pick image
        child: CircleAvatar(
          radius: 50,
          backgroundColor: Colors.grey.shade200,
          backgroundImage: _profileImage != null ? FileImage(_profileImage!) : null,
          child: _profileImage == null
              ? Icon(Icons.person, size: 50, color: Colors.grey)
              : null,
        ),
      ),
    );
  }

  Widget _buildAccountInfo() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        // Account ID
        Text(
          "Account ID: 12345",
          style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
        ),
        SizedBox(height: 8),
        // Change Password
        GestureDetector(
          onTap: _showChangePasswordDialog, // Updated onTap
          child: Text(
            "Change Password",
            style: TextStyle(
                fontSize: 16,
                color: Colors.blue,
                decoration: TextDecoration.underline),
          ),
        ),
      ],
    );
  }

  Widget _buildEditableField({
    required TextEditingController controller,
    required String label,
    bool readOnly = false,
  }) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: TextFormField(
        controller: controller,
        decoration: InputDecoration(
          labelText: label,
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(30.0),
          ),
        ),
        readOnly: readOnly,
      ),
    );
  }

  // New method to build the Country Dropdown
  Widget _buildCountryDropdown() {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: DropdownButtonFormField<String>(
        value: _selectedCountry,
        decoration: InputDecoration(
          labelText: "Country",
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(30.0),
          ),
        ),
        items: _countries
            .map(
              (country) => DropdownMenuItem<String>(
            value: country,
            child: Text(country),
          ),
        )
            .toList(),
        onChanged: (value) {
          setState(() {
            _selectedCountry = value;
          });
        },
        validator: (value) {
          if (value == null || value.isEmpty) {
            return 'Please select your country';
          }
          return null;
        },
      ),
    );
  }

  Widget _buildPhoneNumberField() {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: Row(
        children: [
          Expanded(
            child: TextFormField(
              controller: _phoneController,
              decoration: InputDecoration(
                labelText: "Phone Number",
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(30.0),
                ),
              ),
              keyboardType: TextInputType.phone,
            ),
          ),
          SizedBox(width: 10),
          !_isPhoneVerified
              ? ElevatedButton(
            onPressed: _verifyPhoneNumber,
            style: ElevatedButton.styleFrom(
              backgroundColor: Colors.green,
            ),
            child: Text("Verify"),
          )
              : Text(
            "Verified",
            style: TextStyle(
                color: Colors.green, fontWeight: FontWeight.bold),
          ),
        ],
      ),
    );
  }

  Widget _buildGenderSelection() {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            "Gender",
            style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.w500,
                color: Colors.grey[700]),
          ),
          Row(
            children: [
              Expanded(
                child: RadioListTile<String>(
                  title: Text("Male"),
                  value: "Male",
                  groupValue: _selectedGender,
                  onChanged: (value) {
                    setState(() {
                      _selectedGender = value!;
                    });
                  },
                ),
              ),
              Expanded(
                child: RadioListTile<String>(
                  title: Text("Female"),
                  value: "Female",
                  groupValue: _selectedGender,
                  onChanged: (value) {
                    setState(() {
                      _selectedGender = value!;
                    });
                  },
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildSaveButton() {
    return Center(
      child: ElevatedButton(
        onPressed: () {
          // Handle save action, integrate backend logic here
          ScaffoldMessenger.of(context).showSnackBar(SnackBar(
            content: Text('Changes saved (simulated).'),
          ));
        },
        style: ElevatedButton.styleFrom(
          backgroundColor: Colors.blue,
          padding: EdgeInsets.symmetric(horizontal: 40, vertical: 15),
          shape:
          RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
        ),
        child: Text(
          "Save Changes",
          style: TextStyle(fontSize: 16),
        ),
      ),
    );
  }

  // New method to build the Address Field
  Widget _buildAddressField() {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: TextFormField(
        controller: _addressController,
        decoration: InputDecoration(
          labelText: "Address",
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(30.0),
          ),
        ),
        keyboardType: TextInputType.streetAddress,
      ),
    );
  }

  @override
  void dispose() {
    // Dispose controllers to free resources
    _nameController.dispose();
    _addressController.dispose();
    _phoneController.dispose();
    _oldPasswordController.dispose();
    _newPasswordController.dispose();
    _retypeNewPasswordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Profile'),
        backgroundColor: Colors.white,
        elevation: 1,
        centerTitle: true,
        leading: IconButton(
          icon: Icon(Icons.arrow_back, color: Colors.blue),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        iconTheme: IconThemeData(color: Colors.blue),
        titleTextStyle: TextStyle(
            color: Colors.black, fontSize: 20, fontWeight: FontWeight.bold),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _buildProfileImage(),
            SizedBox(height: 16),
            _buildAccountInfo(),
            SizedBox(height: 24),
            Text(
              "Account Information",
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            Divider(thickness: 1),
            _buildEditableField(controller: _nameController, label: "Name"),
            _buildEditableField(
                controller: TextEditingController(text: _email),
                label: "Email",
                readOnly: true),
            _buildAddressField(), // Added Address Field
            _buildCountryDropdown(),
            _buildPhoneNumberField(),
            _buildGenderSelection(),
            SizedBox(height: 24),
            _buildSaveButton(),
          ],
        ),
      ),
    );
  }
}

// import 'package:flutter/material.dart';
// import 'package:agora_rtc_engine/agora_rtc_engine.dart';
// import 'package:permission_handler/permission_handler.dart';
// import 'package:flutter/services.dart';
// import 'package:flutter/foundation.dart';
// import 'package:share_plus/share_plus.dart'; // For sharing the link
//
// class MeetingPage extends StatefulWidget {
//   final String channelName;
//   final String appId;
//   final String token;
//
//   MeetingPage({
//     required this.channelName,
//     required this.appId,
//     required this.token,
//   });
//
//   @override
//   _MeetingPageState createState() => _MeetingPageState();
// }
//
// class _MeetingPageState extends State<MeetingPage> {
//   late final RtcEngine _engine;
//   bool isJoined = false;
//   bool isMuted = false;
//   bool isVideoOff = false;
//   bool isFrontCamera = true;
//   int? localUid;
//   String meetingLink = '';
//
//   @override
//   void initState() {
//     super.initState();
//     _initAgora();
//     meetingLink = "https://zoom_clone.meet/${widget.channelName}";
//   }
//
//   Future<void> _initAgora() async {
//     // Request permissions
//     await [Permission.camera, Permission.microphone].request();
//
//     // Create the engine
//     _engine = createAgoraRtcEngine();
//     await _engine.initialize(RtcEngineContext(
//       appId: widget.appId,
//       channelProfile: ChannelProfileType.channelProfileLiveBroadcasting,
//     ));
//
//     // Set event handlers
//     _engine.registerEventHandler(RtcEngineEventHandler(
//       onJoinChannelSuccess: (connection, elapsed) {
//         setState(() {
//           isJoined = true;
//           localUid = connection.localUid;
//         });
//         print('Joined channel: ${connection.channelId} with UID: ${connection.localUid}');
//       },
//       onUserJoined: (connection, remoteUid, elapsed) {
//         print('User joined: $remoteUid');
//       },
//       onUserOffline: (connection, remoteUid, reason) {
//         print('User offline: $remoteUid');
//       },
//     ));
//
//     // Enable video
//     await _engine.enableVideo();
//
//     // Set client role
//     await _engine.setClientRole(role: ClientRoleType.clientRoleBroadcaster);
//
//     // Join the channel
//     await _engine.joinChannel(
//       token: widget.token,
//       channelId: widget.channelName,
//       uid: 0,
//       options: ChannelMediaOptions(),
//     );
//   }
//
//   @override
//   void dispose() {
//     super.dispose();
//     _engine.leaveChannel();
//     _engine.release();
//   }
//
//   // Toggle mute
//   void _toggleMute() {
//     setState(() {
//       isMuted = !isMuted;
//     });
//     _engine.muteLocalAudioStream(isMuted);
//   }
//
//   // Toggle video
//   void _toggleVideo() {
//     setState(() {
//       isVideoOff = !isVideoOff;
//     });
//     _engine.muteLocalVideoStream(isVideoOff);
//   }
//
//   // Switch camera
//   void _switchCamera() {
//     _engine.switchCamera();
//     setState(() {
//       isFrontCamera = !isFrontCamera;
//     });
//   }
//
//   // Share link
//   void _shareLink() {
//     Share.share(meetingLink, subject: 'Join my meeting');
//   }
//
//   // End meeting
//   void _endMeeting() {
//     Navigator.pop(context);
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       // Prevents screen from rotating
//       body: OrientationBuilder(
//         builder: (context, orientation) {
//           return Stack(
//             children: [
//               _renderVideo(),
//               _toolbar(),
//             ],
//           );
//         },
//       ),
//     );
//   }
//
//   Widget _renderVideo() {
//     return Stack(
//       children: [
//         // Remote video
//         AgoraVideoView(
//           controller: VideoViewController.remote(
//             rtcEngine: _engine,
//             canvas: VideoCanvas(uid: 0),
//             connection: RtcConnection(channelId: widget.channelName),
//           ),
//         ),
//         // Local video in small window
//         Positioned(
//           top: 20,
//           right: 20,
//           width: 120,
//           height: 160,
//           child: Container(
//             decoration: BoxDecoration(
//               border: Border.all(color: Colors.white),
//             ),
//             child: AgoraVideoView(
//               controller: VideoViewController.local(
//                 rtcEngine: _engine,
//                 canvas: VideoCanvas(uid: localUid),
//               ),
//             ),
//           ),
//         ),
//       ],
//     );
//   }
//
//   Widget _toolbar() {
//     return Align(
//       alignment: Alignment.bottomCenter,
//       child: Padding(
//         padding: const EdgeInsets.symmetric(vertical: 48.0),
//         child: Row(
//           mainAxisAlignment: MainAxisAlignment.center,
//           children: [
//             // Mute/Unmute button
//             RawMaterialButton(
//               onPressed: _toggleMute,
//               child: Icon(
//                 isMuted ? Icons.mic_off : Icons.mic,
//                 color: isMuted ? Colors.white : Colors.blue,
//                 size: 20.0,
//               ),
//               shape: CircleBorder(),
//               elevation: 2.0,
//               fillColor: isMuted ? Colors.blue : Colors.white,
//               padding: const EdgeInsets.all(12.0),
//             ),
//             // End Meeting button
//             RawMaterialButton(
//               onPressed: _endMeeting,
//               child: Icon(
//                 Icons.call_end,
//                 color: Colors.white,
//                 size: 35.0,
//               ),
//               shape: CircleBorder(),
//               elevation: 2.0,
//               fillColor: Colors.redAccent,
//               padding: const EdgeInsets.all(15.0),
//             ),
//             // Video On/Off button
//             RawMaterialButton(
//               onPressed: _toggleVideo,
//               child: Icon(
//                 isVideoOff ? Icons.videocam_off : Icons.videocam,
//                 color: isVideoOff ? Colors.white : Colors.blue,
//                 size: 20.0,
//               ),
//               shape: CircleBorder(),
//               elevation: 2.0,
//               fillColor: isVideoOff ? Colors.blue : Colors.white,
//               padding: const EdgeInsets.all(12.0),
//             ),
//             // Switch Camera button
//             RawMaterialButton(
//               onPressed: _switchCamera,
//               child: Icon(
//                 Icons.switch_camera,
//                 color: Colors.blue,
//                 size: 20.0,
//               ),
//               shape: CircleBorder(),
//               elevation: 2.0,
//               fillColor: Colors.white,
//               padding: const EdgeInsets.all(12.0),
//             ),
//             // Share Link button
//             RawMaterialButton(
//               onPressed: _shareLink,
//               child: Icon(
//                 Icons.link,
//                 color: Colors.blue,
//                 size: 20.0,
//               ),
//               shape: CircleBorder(),
//               elevation: 2.0,
//               fillColor: Colors.white,
//               padding: const EdgeInsets.all(12.0),
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }

// lib/student_live_stream_page.dart
//
// import 'package:flutter/material.dart';
// import 'package:agora_rtc_engine/agora_rtc_engine.dart';
// import 'package:permission_handler/permission_handler.dart';
// import 'package:share_plus/share_plus.dart'; // For sharing the link
//
// class MeetingPage extends StatefulWidget {
//   final String channelName;
//   final String appId;
//   final String token;
//
//   const MeetingPage({
//     Key? key,
//     required this.channelName,
//     required this.appId,
//     required this.token,
//   }) : super(key: key);
//
//   @override
//   _MeetingPageState createState() => _MeetingPageState();
// }
//
// class _MeetingPageState extends State<MeetingPage> {
//   late final RtcEngine _engine;
//   bool isJoined = false;
//   bool isMuted = false;
//   bool isVideoOff = false;
//   bool isFrontCamera = true;
//   int? localUid;
//   int? remoteUid;
//   String meetingLink = '';
//
//   @override
//   void initState() {
//     super.initState();
//     _initAgora();
//     meetingLink = "https://zoom_clone.meet/${widget.channelName}";
//   }
//
//   Future<void> _initAgora() async {
//     // Request permissions
//     await [Permission.camera, Permission.microphone].request();
//
//     // Create the engine
//     _engine = createAgoraRtcEngine();
//     await _engine.initialize(RtcEngineContext(
//       appId: widget.appId,
//       channelProfile: ChannelProfileType.channelProfileCommunication,
//     ));
//
//     // Set event handlers
//     _engine.registerEventHandler(RtcEngineEventHandler(
//       onJoinChannelSuccess: (connection, elapsed) {
//         setState(() {
//           isJoined = true;
//           localUid = connection.localUid;
//         });
//         print('Joined channel: ${connection.channelId} with UID: ${connection.localUid}');
//       },
//       onUserJoined: (connection, remoteUidParam, elapsed) {
//         print('User joined: $remoteUidParam');
//         setState(() {
//           remoteUid = remoteUidParam;
//         });
//       },
//       onUserOffline: (connection, remoteUidParam, reason) {
//         print('User offline: $remoteUidParam');
//         setState(() {
//           remoteUid = null;
//         });
//       },
//     ));
//
//     // Enable video
//     await _engine.enableVideo();
//
//     // Set client role
//     await _engine.setClientRole(role: ClientRoleType.clientRoleBroadcaster);
//
//     // Join the channel
//     await _engine.joinChannel(
//       token: widget.token,
//       channelId: widget.channelName,
//       uid: 0, // Let Agora assign a UID
//       options: const ChannelMediaOptions(),
//     );
//   }
//
//   @override
//   void dispose() {
//     _engine.leaveChannel();
//     _engine.release();
//     super.dispose();
//   }
//
//   // Toggle mute
//   void _toggleMute() {
//     setState(() {
//       isMuted = !isMuted;
//     });
//     _engine.muteLocalAudioStream(isMuted);
//   }
//
//   // Toggle video
//   void _toggleVideo() {
//     setState(() {
//       isVideoOff = !isVideoOff;
//     });
//     _engine.muteLocalVideoStream(isVideoOff);
//   }
//
//   // Switch camera
//   void _switchCamera() {
//     _engine.switchCamera();
//     setState(() {
//       isFrontCamera = !isFrontCamera;
//     });
//   }
//
//   // Share link
//   void _shareLink() {
//     Share.share(meetingLink, subject: 'Join my meeting');
//   }
//
//   // End meeting
//   void _endMeeting() {
//     Navigator.pop(context);
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       // Prevents screen from rotating
//       body: OrientationBuilder(
//         builder: (context, orientation) {
//           return Stack(
//             children: [
//               _renderVideo(),
//               _toolbar(),
//             ],
//           );
//         },
//       ),
//     );
//   }
//
//   Widget _renderVideo() {
//     return Stack(
//       children: [
//         // Remote video
//         if (remoteUid != null)
//           AgoraVideoView(
//             controller: VideoViewController.remote(
//               rtcEngine: _engine,
//               canvas: VideoCanvas(uid: remoteUid),
//               connection: RtcConnection(channelId: widget.channelName),
//             ),
//           )
//         else
//           Center(
//             child: Text(
//               'Waiting for other participants...',
//               style: TextStyle(color: Colors.white, fontSize: 18),
//             ),
//           ),
//         // Local video in small window
//         if (localUid != null)
//           Positioned(
//             top: 20,
//             right: 20,
//             width: 120,
//             height: 160,
//             child: Container(
//               decoration: BoxDecoration(
//                 border: Border.all(color: Colors.white),
//               ),
//               child: AgoraVideoView(
//                 controller: VideoViewController(
//                   rtcEngine: _engine,
//                   canvas: VideoCanvas(uid: localUid),
//                 ),
//               ),
//             ),
//           ),
//       ],
//     );
//   }
//
//   Widget _toolbar() {
//     return Align(
//       alignment: Alignment.bottomCenter,
//       child: Padding(
//         padding: const EdgeInsets.symmetric(vertical: 48.0),
//         child: Row(
//           mainAxisAlignment: MainAxisAlignment.center,
//           children: [
//             // Mute/Unmute button
//             RawMaterialButton(
//               onPressed: _toggleMute,
//               child: Icon(
//                 isMuted ? Icons.mic_off : Icons.mic,
//                 color: isMuted ? Colors.white : Colors.blue,
//                 size: 20.0,
//               ),
//               shape: const CircleBorder(),
//               elevation: 2.0,
//               fillColor: isMuted ? Colors.blue : Colors.white,
//               padding: const EdgeInsets.all(12.0),
//             ),
//             // End Meeting button
//             RawMaterialButton(
//               onPressed: _endMeeting,
//               child: const Icon(
//                 Icons.call_end,
//                 color: Colors.white,
//                 size: 35.0,
//               ),
//               shape: const CircleBorder(),
//               elevation: 2.0,
//               fillColor: Colors.redAccent,
//               padding: const EdgeInsets.all(15.0),
//             ),
//             // Video On/Off button
//             RawMaterialButton(
//               onPressed: _toggleVideo,
//               child: Icon(
//                 isVideoOff ? Icons.videocam_off : Icons.videocam,
//                 color: isVideoOff ? Colors.white : Colors.blue,
//                 size: 20.0,
//               ),
//               shape: const CircleBorder(),
//               elevation: 2.0,
//               fillColor: isVideoOff ? Colors.blue : Colors.white,
//               padding: const EdgeInsets.all(12.0),
//             ),
//             // Switch Camera button
//             RawMaterialButton(
//               onPressed: _switchCamera,
//               child: const Icon(
//                 Icons.switch_camera,
//                 color: Colors.blue,
//                 size: 20.0,
//               ),
//               shape: const CircleBorder(),
//               elevation: 2.0,
//               fillColor: Colors.white,
//               padding: const EdgeInsets.all(12.0),
//             ),
//             // Share Link button
//             RawMaterialButton(
//               onPressed: _shareLink,
//               child: const Icon(
//                 Icons.link,
//                 color: Colors.blue,
//                 size: 20.0,
//               ),
//               shape: const CircleBorder(),
//               elevation: 2.0,
//               fillColor: Colors.white,
//               padding: const EdgeInsets.all(12.0),
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }
// lib/pages/student_live_stream_page.dart

// import 'package:flutter/material.dart';
// import 'package:agora_rtc_engine/agora_rtc_engine.dart';
// import 'package:permission_handler/permission_handler.dart';
// import 'package:share_plus/share_plus.dart'; // For sharing the link
//
// class MeetingPage extends StatefulWidget {
//   final String channelName;
//   final String appId;
//   final String token;
//
//   const MeetingPage({
//     Key? key,
//     required this.channelName,
//     required this.appId,
//     required this.token,
//   }) : super(key: key);
//
//   @override
//   _MeetingPageState createState() => _MeetingPageState();
// }
//
// class _MeetingPageState extends State<MeetingPage> {
//   late final RtcEngine _engine;
//   bool isJoined = false;
//   bool isMuted = false;
//   bool isVideoOff = false;
//   bool isFrontCamera = true;
//   int? localUid;
//   int? remoteUid;
//   String meetingLink = '';
//
//   @override
//   void initState() {
//     super.initState();
//     _initAgora();
//     meetingLink = "https://zoom_clone.meet/${widget.channelName}";
//   }
//
//   Future<void> _initAgora() async {
//     // Request permissions
//     await [Permission.camera, Permission.microphone].request();
//
//     // Create the engine
//     _engine = createAgoraRtcEngine();
//     await _engine.initialize(RtcEngineContext(
//       appId: widget.appId,
//       channelProfile: ChannelProfileType.channelProfileCommunication,
//     ));
//
//     // Set event handlers
//     _engine.registerEventHandler(RtcEngineEventHandler(
//       onJoinChannelSuccess: (connection, elapsed) {
//         setState(() {
//           isJoined = true;
//           localUid = connection.localUid;
//         });
//         print('Joined channel: ${connection.channelId} with UID: ${connection.localUid}');
//       },
//       onUserJoined: (connection, remoteUidParam, elapsed) {
//         print('User joined: $remoteUidParam');
//         setState(() {
//           remoteUid = remoteUidParam;
//         });
//       },
//       onUserOffline: (connection, remoteUidParam, reason) {
//         print('User offline: $remoteUidParam');
//         setState(() {
//           remoteUid = null;
//         });
//       },
//     ));
//
//     // Enable video
//     await _engine.enableVideo();
//
//     // Set client role
//     await _engine.setClientRole(role: ClientRoleType.clientRoleBroadcaster);
//
//     // Join the channel
//     await _engine.joinChannel(
//       token: widget.token,
//       channelId: widget.channelName,
//       uid: 0, // Let Agora assign a UID
//       options: const ChannelMediaOptions(),
//     );
//   }
//
//   @override
//   void dispose() {
//     _engine.leaveChannel();
//     _engine.release();
//     super.dispose();
//   }
//
//   // Toggle mute
//   void _toggleMute() {
//     setState(() {
//       isMuted = !isMuted;
//     });
//     _engine.muteLocalAudioStream(isMuted);
//   }
//
//   // Toggle video
//   void _toggleVideo() {
//     setState(() {
//       isVideoOff = !isVideoOff;
//     });
//     _engine.muteLocalVideoStream(isVideoOff);
//   }
//
//   // Switch camera
//   void _switchCamera() {
//     _engine.switchCamera();
//     setState(() {
//       isFrontCamera = !isFrontCamera;
//     });
//   }
//
//   // Share link
//   void _shareLink() {
//     Share.share(meetingLink, subject: 'Join my meeting');
//   }
//
//   // End meeting
//   void _endMeeting() {
//     Navigator.pop(context);
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       // Prevents screen from rotating
//       body: OrientationBuilder(
//         builder: (context, orientation) {
//           return Stack(
//             children: [
//               _renderVideo(),
//               _toolbar(),
//             ],
//           );
//         },
//       ),
//     );
//   }
//
//   Widget _renderVideo() {
//     return Stack(
//       children: [
//         // Remote video
//         if (remoteUid != null)
//           AgoraVideoView(
//             controller: VideoViewController.remote(
//               rtcEngine: _engine,
//               canvas: VideoCanvas(uid: remoteUid),
//               connection: RtcConnection(channelId: widget.channelName),
//             ),
//           )
//         else
//           Center(
//             child: Text(
//               'Waiting for other participants...',
//               style: TextStyle(color: Colors.white, fontSize: 18),
//             ),
//           ),
//         // Local video in small window
//         if (localUid != null)
//           Positioned(
//             top: 20,
//             right: 20,
//             width: 120,
//             height: 160,
//             child: Container(
//               decoration: BoxDecoration(
//                 border: Border.all(color: Colors.white),
//               ),
//               child: AgoraVideoView(
//                 controller: VideoViewController(
//                   rtcEngine: _engine,
//                   canvas: VideoCanvas(uid: localUid),
//                 ),
//               ),
//             ),
//           ),
//       ],
//     );
//   }
//
//   Widget _toolbar() {
//     return Align(
//       alignment: Alignment.bottomCenter,
//       child: Padding(
//         padding: const EdgeInsets.symmetric(vertical: 48.0),
//         child: Row(
//           mainAxisAlignment: MainAxisAlignment.center,
//           children: [
//             // Mute/Unmute button
//             RawMaterialButton(
//               onPressed: _toggleMute,
//               child: Icon(
//                 isMuted ? Icons.mic_off : Icons.mic,
//                 color: isMuted ? Colors.white : Colors.blue,
//                 size: 20.0,
//               ),
//               shape: const CircleBorder(),
//               elevation: 2.0,
//               fillColor: isMuted ? Colors.blue : Colors.white,
//               padding: const EdgeInsets.all(12.0),
//             ),
//             // End Meeting button
//             RawMaterialButton(
//               onPressed: _endMeeting,
//               child: const Icon(
//                 Icons.call_end,
//                 color: Colors.white,
//                 size: 35.0,
//               ),
//               shape: const CircleBorder(),
//               elevation: 2.0,
//               fillColor: Colors.redAccent,
//               padding: const EdgeInsets.all(15.0),
//             ),
//             // Video On/Off button
//             RawMaterialButton(
//               onPressed: _toggleVideo,
//               child: Icon(
//                 isVideoOff ? Icons.videocam_off : Icons.videocam,
//                 color: isVideoOff ? Colors.white : Colors.blue,
//                 size: 20.0,
//               ),
//               shape: const CircleBorder(),
//               elevation: 2.0,
//               fillColor: isVideoOff ? Colors.blue : Colors.white,
//               padding: const EdgeInsets.all(12.0),
//             ),
//             // Switch Camera button
//             RawMaterialButton(
//               onPressed: _switchCamera,
//               child: const Icon(
//                 Icons.switch_camera,
//                 color: Colors.blue,
//                 size: 20.0,
//               ),
//               shape: const CircleBorder(),
//               elevation: 2.0,
//               fillColor: Colors.white,
//               padding: const EdgeInsets.all(12.0),
//             ),
//             // Share Link button
//             RawMaterialButton(
//               onPressed: _shareLink,
//               child: const Icon(
//                 Icons.link,
//                 color: Colors.blue,
//                 size: 20.0,
//               ),
//               shape: const CircleBorder(),
//               elevation: 2.0,
//               fillColor: Colors.white,
//               padding: const EdgeInsets.all(12.0),
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }

// lib/pages/student_live_stream_page.dart

// import 'package:flutter/material.dart';
// import 'package:agora_rtc_engine/agora_rtc_engine.dart';
// import 'package:permission_handler/permission_handler.dart';
// import 'package:share_plus/share_plus.dart'; // For sharing the link
//
// class MeetingPage extends StatefulWidget {
//   final String channelName;
//   final String appId;
//   final String token;
//
//   const MeetingPage({
//     Key? key,
//     required this.channelName,
//     required this.appId,
//     required this.token,
//   }) : super(key: key);
//
//   @override
//   _MeetingPageState createState() => _MeetingPageState();
// }
//
// class _MeetingPageState extends State<MeetingPage> {
//   late final RtcEngine _engine;
//   bool isJoined = false;
//   bool isMuted = false;
//   bool isVideoOff = false;
//   bool isFrontCamera = true;
//   int? localUid;
//   int? remoteUid;
//   String meetingLink = '';
//   String errorMessage = '';
//
//   @override
//   void initState() {
//     super.initState();
//     _initAgora();
//     meetingLink = "https://zoom_clone.meet/${widget.channelName}";
//   }
//
//   Future<void> _initAgora() async {
//     try {
//       // Request permissions
//       await [Permission.camera, Permission.microphone].request();
//
//       // Create the engine
//       _engine = createAgoraRtcEngine();
//       await _engine.initialize(RtcEngineContext(
//         appId: widget.appId,
//         channelProfile: ChannelProfileType.channelProfileCommunication,
//       ));
//
//       // Set event handlers
//       _engine.registerEventHandler(RtcEngineEventHandler(
//         onJoinChannelSuccess: (connection, elapsed) {
//           setState(() {
//             isJoined = true;
//             localUid = connection.localUid;
//           });
//           print('Joined channel: ${connection.channelId} with UID: ${connection.localUid}');
//         },
//         onUserJoined: (connection, remoteUidParam, elapsed) {
//           print('User joined: $remoteUidParam');
//           setState(() {
//             remoteUid = remoteUidParam;
//           });
//         },
//         onUserOffline: (connection, remoteUidParam, reason) {
//           print('User offline: $remoteUidParam');
//           setState(() {
//             remoteUid = null;
//           });
//         },
//         onError: (errorCode, description) { // Updated to accept two parameters
//           setState(() {
//             errorMessage = 'Agora SDK Error: $errorCode, Description: $description';
//           });
//           print('Agora SDK Error: $errorCode, Description: $description');
//         },
//       ));
//
//       // Enable video
//       await _engine.enableVideo();
//
//       // Set client role
//       await _engine.setClientRole(role: ClientRoleType.clientRoleBroadcaster);
//
//       // Join the channel
//       await _engine.joinChannel(
//         token: widget.token,
//         channelId: widget.channelName,
//         uid: 0, // Let Agora assign a UID
//         options: const ChannelMediaOptions(),
//       );
//     } catch (e) {
//       setState(() {
//         errorMessage = 'Failed to initialize Agora SDK: $e';
//       });
//       print('Failed to initialize Agora SDK: $e');
//     }
//   }
//
//   @override
//   void dispose() {
//     _engine.leaveChannel();
//     _engine.release();
//     super.dispose();
//   }
//
//   // Toggle mute
//   void _toggleMute() {
//     setState(() {
//       isMuted = !isMuted;
//     });
//     _engine.muteLocalAudioStream(isMuted);
//   }
//
//   // Toggle video
//   void _toggleVideo() {
//     setState(() {
//       isVideoOff = !isVideoOff;
//     });
//     _engine.muteLocalVideoStream(isVideoOff);
//   }
//
//   // Switch camera
//   void _switchCamera() {
//     _engine.switchCamera();
//     setState(() {
//       isFrontCamera = !isFrontCamera;
//     });
//   }
//
//   // Share link
//   void _shareLink() {
//     Share.share(meetingLink, subject: 'Join my meeting');
//   }
//
//   // End meeting
//   void _endMeeting() {
//     Navigator.pop(context);
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       // Prevents screen from rotating
//       body: OrientationBuilder(
//         builder: (context, orientation) {
//           return Stack(
//             children: [
//               _renderVideo(),
//               if (errorMessage.isNotEmpty)
//                 Positioned(
//                   top: 50,
//                   left: 20,
//                   right: 20,
//                   child: Container(
//                     padding: const EdgeInsets.all(10),
//                     color: Colors.redAccent,
//                     child: Text(
//                       errorMessage,
//                       style: const TextStyle(color: Colors.white),
//                       textAlign: TextAlign.center,
//                     ),
//                   ),
//                 ),
//               _toolbar(),
//             ],
//           );
//         },
//       ),
//     );
//   }
//
//   Widget _renderVideo() {
//     return Stack(
//       children: [
//         // Remote video
//         if (remoteUid != null)
//           AgoraVideoView(
//             controller: VideoViewController.remote(
//               rtcEngine: _engine,
//               canvas: VideoCanvas(uid: remoteUid),
//               connection: RtcConnection(channelId: widget.channelName),
//             ),
//           )
//         else
//           Container(
//             color: Colors.black,
//             child: const Center(
//               child: Text(
//                 'Waiting for other participants...',
//                 style: TextStyle(color: Colors.white, fontSize: 18),
//               ),
//             ),
//           ),
//         // Local video in small window
//         if (localUid != null)
//           Positioned(
//             top: 20,
//             right: 20,
//             width: 120,
//             height: 160,
//             child: Container(
//               decoration: BoxDecoration(
//                 border: Border.all(color: Colors.white),
//               ),
//               child: AgoraVideoView(
//                 controller: VideoViewController(
//                   rtcEngine: _engine,
//                   canvas: VideoCanvas(uid: localUid),
//                 ),
//               ),
//             ),
//           ),
//       ],
//     );
//   }
//
//   Widget _toolbar() {
//     return Align(
//       alignment: Alignment.bottomCenter,
//       child: Padding(
//         padding: const EdgeInsets.symmetric(vertical: 48.0),
//         child: Row(
//           mainAxisAlignment: MainAxisAlignment.center,
//           children: [
//             // Mute/Unmute button
//             RawMaterialButton(
//               onPressed: _toggleMute,
//               child: Icon(
//                 isMuted ? Icons.mic_off : Icons.mic,
//                 color: isMuted ? Colors.white : Colors.blue,
//                 size: 20.0,
//               ),
//               shape: const CircleBorder(),
//               elevation: 2.0,
//               fillColor: isMuted ? Colors.blue : Colors.white,
//               padding: const EdgeInsets.all(12.0),
//             ),
//             // End Meeting button
//             RawMaterialButton(
//               onPressed: _endMeeting,
//               child: const Icon(
//                 Icons.call_end,
//                 color: Colors.white,
//                 size: 35.0,
//               ),
//               shape: const CircleBorder(),
//               elevation: 2.0,
//               fillColor: Colors.redAccent,
//               padding: const EdgeInsets.all(15.0),
//             ),
//             // Video On/Off button
//             RawMaterialButton(
//               onPressed: _toggleVideo,
//               child: Icon(
//                 isVideoOff ? Icons.videocam_off : Icons.videocam,
//                 color: isVideoOff ? Colors.white : Colors.blue,
//                 size: 20.0,
//               ),
//               shape: const CircleBorder(),
//               elevation: 2.0,
//               fillColor: isVideoOff ? Colors.blue : Colors.white,
//               padding: const EdgeInsets.all(12.0),
//             ),
//             // Switch Camera button
//             RawMaterialButton(
//               onPressed: _switchCamera,
//               child: const Icon(
//                 Icons.switch_camera,
//                 color: Colors.blue,
//                 size: 20.0,
//               ),
//               shape: const CircleBorder(),
//               elevation: 2.0,
//               fillColor: Colors.white,
//               padding: const EdgeInsets.all(12.0),
//             ),
//             // Share Link button
//             RawMaterialButton(
//               onPressed: _shareLink,
//               child: const Icon(
//                 Icons.link,
//                 color: Colors.blue,
//                 size: 20.0,
//               ),
//               shape: const CircleBorder(),
//               elevation: 2.0,
//               fillColor: Colors.white,
//               padding: const EdgeInsets.all(12.0),
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }

// lib/pages/student_live_stream_page.dart

// import 'package:flutter/material.dart';
// import 'package:agora_rtc_engine/agora_rtc_engine.dart';
// import 'package:permission_handler/permission_handler.dart';
// import 'package:share_plus/share_plus.dart'; // For sharing the link
//
// class MeetingPage extends StatefulWidget {
//   final String channelName;
//   final String appId;
//   final String token;
//
//   const MeetingPage({
//     Key? key,
//     required this.channelName,
//     required this.appId,
//     required this.token,
//   }) : super(key: key);
//
//   @override
//   _MeetingPageState createState() => _MeetingPageState();
// }
//
// class _MeetingPageState extends State<MeetingPage> {
//   late final RtcEngine _engine;
//   bool isJoined = false;
//   bool isMuted = false;
//   bool isVideoOff = false;
//   bool isFrontCamera = true;
//   int? localUid;
//   int? remoteUid;
//   String meetingLink = '';
//   String errorMessage = '';
//
//   @override
//   void initState() {
//     super.initState();
//     _initAgora();
//     meetingLink = "https://zoom_clone.meet/${widget.channelName}";
//   }
//
//   Future<void> _initAgora() async {
//     try {
//       // Request camera and microphone permissions
//       await [Permission.camera, Permission.microphone].request();
//
//       // Create the Agora engine
//       _engine = createAgoraRtcEngine();
//       await _engine.initialize(RtcEngineContext(
//         appId: widget.appId,
//         channelProfile: ChannelProfileType.channelProfileCommunication,
//       ));
//
//       // Register event handlers
//       _engine.registerEventHandler(RtcEngineEventHandler(
//         onJoinChannelSuccess: (connection, elapsed) {
//           setState(() {
//             isJoined = true;
//             localUid = connection.localUid;
//           });
//           print('Joined channel: ${connection.channelId} with UID: ${connection.localUid}');
//         },
//         onUserJoined: (connection, remoteUidParam, elapsed) {
//           print('User joined: $remoteUidParam');
//           setState(() {
//             remoteUid = remoteUidParam;
//           });
//         },
//         onUserOffline: (connection, remoteUidParam, reason) {
//           print('User offline: $remoteUidParam');
//           setState(() {
//             remoteUid = null;
//           });
//         },
//         onError: (errorCode, description) {
//           setState(() {
//             errorMessage = 'Agora SDK Error: $errorCode, Description: $description';
//           });
//           print('Agora SDK Error: $errorCode, Description: $description');
//         },
//       ));
//
//       // Enable video
//       await _engine.enableVideo();
//
//       // Set client role to broadcaster
//       await _engine.setClientRole(role: ClientRoleType.clientRoleBroadcaster);
//
//       // Join the channel with dummy token
//       await _engine.joinChannel(
//         token: widget.token, // Dummy Token
//         channelId: widget.channelName, // Dummy Channel Name
//         uid: 0, // Let Agora assign a UID
//         options: const ChannelMediaOptions(),
//       );
//     } catch (e) {
//       setState(() {
//         errorMessage = 'Failed to initialize Agora SDK: $e';
//       });
//       print('Failed to initialize Agora SDK: $e');
//     }
//   }
//
//   @override
//   void dispose() {
//     _engine.leaveChannel();
//     _engine.release();
//     super.dispose();
//   }
//
//   // Toggle mute
//   void _toggleMute() {
//     setState(() {
//       isMuted = !isMuted;
//     });
//     _engine.muteLocalAudioStream(isMuted);
//   }
//
//   // Toggle video
//   void _toggleVideo() {
//     setState(() {
//       isVideoOff = !isVideoOff;
//     });
//     _engine.muteLocalVideoStream(isVideoOff);
//   }
//
//   // Switch camera
//   void _switchCamera() {
//     _engine.switchCamera();
//     setState(() {
//       isFrontCamera = !isFrontCamera;
//     });
//   }
//
//   // Share link
//   void _shareLink() {
//     Share.share(meetingLink, subject: 'Join my meeting');
//   }
//
//   // End meeting
//   void _endMeeting() {
//     Navigator.pop(context);
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       // Prevents screen from rotating
//       body: OrientationBuilder(
//         builder: (context, orientation) {
//           return Stack(
//             children: [
//               _renderRemoteVideo(),
//               if (errorMessage.isNotEmpty)
//                 Positioned(
//                   top: 50,
//                   left: 20,
//                   right: 20,
//                   child: Container(
//                     padding: const EdgeInsets.all(10),
//                     color: Colors.redAccent,
//                     child: Text(
//                       errorMessage,
//                       style: const TextStyle(color: Colors.white),
//                       textAlign: TextAlign.center,
//                     ),
//                   ),
//                 ),
//               _renderLocalVideo(),
//               _toolbar(),
//             ],
//           );
//         },
//       ),
//     );
//   }
//
//   // Render Remote Video
//   Widget _renderRemoteVideo() {
//     if (remoteUid != null) {
//       return AgoraVideoView(
//         controller: VideoViewController.remote(
//           rtcEngine: _engine,
//           canvas: VideoCanvas(uid: remoteUid),
//           connection: RtcConnection(channelId: widget.channelName),
//         ),
//       );
//     } else {
//       return Container(
//         color: Colors.black,
//         child: const Center(
//           child: Text(
//             'Waiting for other participants...',
//             style: TextStyle(color: Colors.white, fontSize: 18),
//           ),
//         ),
//       );
//     }
//   }
//
//   // Render Local Video or Profile Photo
//   Widget _renderLocalVideo() {
//     return Positioned(
//       top: 40, // Distance from the top; adjust as needed
//       right: 20, // Distance from the right; adjust as needed
//       width: 120, // Width of the local video window
//       height: 160, // Height of the local video window
//       child: Container(
//         decoration: BoxDecoration(
//           border: Border.all(color: Colors.white),
//           borderRadius: BorderRadius.circular(8),
//         ),
//         child: isVideoOff
//             ? ClipRRect(
//           borderRadius: BorderRadius.circular(8),
//           child: Image.asset(
//             'assets/images/profile_placeholder.png',
//             fit: BoxFit.cover,
//           ),
//         )
//             : localUid != null
//             ? AgoraVideoView(
//           controller: VideoViewController(
//             rtcEngine: _engine,
//             canvas: VideoCanvas(uid: 0), // uid: 0 indicates local video
//           ),
//         )
//             : const Center(
//           child: CircularProgressIndicator(),
//         ),
//       ),
//     );
//   }
//
//   // Render Toolbar
//   // Widget _toolbar() {
//   //   return Align(
//   //     alignment: Alignment.bottomCenter,
//   //     child: Padding(
//   //       padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 20.0),
//   //       child: Container(
//   //         padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 10.0),
//   //         decoration: BoxDecoration(
//   //           color: Colors.black54,
//   //           borderRadius: BorderRadius.circular(30.0),
//   //         ),
//   //         child: Row(
//   //           mainAxisAlignment: MainAxisAlignment.spaceEvenly,
//   //           children: [
//   //             // Mute/Unmute button
//   //             _buildToolbarButton(
//   //               icon: isMuted ? Icons.mic_off : Icons.mic,
//   //               color: isMuted ? Colors.white : Colors.blue,
//   //               backgroundColor: isMuted ? Colors.blue : Colors.white,
//   //               onPressed: _toggleMute,
//   //             ),
//   //             // End Meeting button
//   //             _buildToolbarButton(
//   //               icon: Icons.call_end,
//   //               color: Colors.white,
//   //               backgroundColor: Colors.redAccent,
//   //               onPressed: _endMeeting,
//   //               size: 35.0,
//   //             ),
//   //             // Video On/Off button
//   //             _buildToolbarButton(
//   //               icon: isVideoOff ? Icons.videocam_off : Icons.videocam,
//   //               color: isVideoOff ? Colors.white : Colors.blue,
//   //               backgroundColor: isVideoOff ? Colors.blue : Colors.white,
//   //               onPressed: _toggleVideo,
//   //             ),
//   //             // Switch Camera button
//   //             _buildToolbarButton(
//   //               icon: Icons.switch_camera,
//   //               color: Colors.blue,
//   //               backgroundColor: Colors.white,
//   //               onPressed: _switchCamera,
//   //             ),
//   //             // Share Link button
//   //             _buildToolbarButton(
//   //               icon: Icons.link,
//   //               color: Colors.blue,
//   //               backgroundColor: Colors.white,
//   //               onPressed: _shareLink,
//   //             ),
//   //           ],
//   //         ),
//   //       ),
//   //     ),
//   //   );
//   // }
//
//   Widget _toolbar() {
//     return Align(
//       alignment: Alignment.bottomCenter,
//       child: Padding(
//         padding: const EdgeInsets.symmetric(horizontal: 10.0, vertical: 20.0),
//         child: Container(
//           padding: const EdgeInsets.symmetric(horizontal: 10.0, vertical: 10.0),
//           decoration: BoxDecoration(
//             color: Colors.black54,
//             borderRadius: BorderRadius.circular(30.0),
//           ),
//           child: Row(
//             mainAxisAlignment: MainAxisAlignment.spaceAround, // Even spacing
//             children: [
//               // Mute/Unmute button
//               _buildToolbarButton(
//                 icon: isMuted ? Icons.mic_off : Icons.mic,
//                 color: isMuted ? Colors.white : Colors.blue,
//                 backgroundColor: isMuted ? Colors.blue : Colors.white,
//                 onPressed: _toggleMute,
//               ),
//               // End Meeting button
//               _buildToolbarButton(
//                 icon: Icons.call_end,
//                 color: Colors.white,
//                 backgroundColor: Colors.redAccent,
//                 onPressed: _endMeeting,
//                 size: 30.0, // Slightly larger for emphasis
//               ),
//               // Video On/Off button
//               _buildToolbarButton(
//                 icon: isVideoOff ? Icons.videocam_off : Icons.videocam,
//                 color: isVideoOff ? Colors.white : Colors.blue,
//                 backgroundColor: isVideoOff ? Colors.blue : Colors.white,
//                 onPressed: _toggleVideo,
//               ),
//               // Switch Camera button
//               _buildToolbarButton(
//                 icon: Icons.switch_camera,
//                 color: Colors.blue,
//                 backgroundColor: Colors.white,
//                 onPressed: _switchCamera,
//               ),
//               // Share Link button
//               _buildToolbarButton(
//                 icon: Icons.link,
//                 color: Colors.blue,
//                 backgroundColor: Colors.white,
//                 onPressed: _shareLink,
//               ),
//             ],
//           ),
//         ),
//       ),
//     );
//   }
//
//
//   // Helper method to build toolbar buttons
//   Widget _buildToolbarButton({
//     required IconData icon,
//     required Color color,
//     required Color backgroundColor,
//     VoidCallback? onPressed,
//     double size = 20.0,
//   }) {
//     return RawMaterialButton(
//       onPressed: onPressed,
//       child: Icon(
//         icon,
//         color: color,
//         size: size,
//       ),
//       shape: const CircleBorder(),
//       elevation: 2.0,
//       fillColor: backgroundColor,
//       padding: const EdgeInsets.all(12.0),
//     );
//   }
// }

// import 'package:flutter/material.dart';
// import 'package:agora_rtc_engine/agora_rtc_engine.dart';
// import 'package:permission_handler/permission_handler.dart';
// import 'package:share_plus/share_plus.dart'; // For sharing the link
//
// class MeetingPage extends StatefulWidget {
//   final String channelName;
//   final String appId;
//   final String token;
//
//   const MeetingPage({
//     Key? key,
//     required this.channelName,
//     required this.appId,
//     required this.token,
//   }) : super(key: key);
//
//   @override
//   _MeetingPageState createState() => _MeetingPageState();
// }
//
// class _MeetingPageState extends State<MeetingPage> {
//   late final RtcEngine _engine;
//   bool isJoined = false;
//   bool isMuted = false;
//   bool isVideoOff = false;
//   bool isFrontCamera = true;
//   int? localUid;
//   int? remoteUid;
//   String meetingLink = '';
//   String errorMessage = '';
//
//   @override
//   void initState() {
//     super.initState();
//     _initAgora();
//     meetingLink = "https://zoom_clone.meet/${widget.channelName}";
//   }
//
//   Future<void> _initAgora() async {
//     try {
//       // Request camera and microphone permissions
//       await [Permission.camera, Permission.microphone].request();
//
//       // Create the Agora engine
//       _engine = createAgoraRtcEngine();
//       await _engine.initialize(RtcEngineContext(
//         appId: widget.appId,
//         channelProfile: ChannelProfileType.channelProfileCommunication,
//       ));
//
//       // Register event handlers
//       _engine.registerEventHandler(RtcEngineEventHandler(
//         onJoinChannelSuccess: (connection, elapsed) {
//           setState(() {
//             isJoined = true;
//             localUid = connection.localUid;
//           });
//           print('Joined channel: ${connection.channelId} with UID: ${connection.localUid}');
//         },
//         onUserJoined: (connection, remoteUidParam, elapsed) {
//           print('User joined: $remoteUidParam');
//           setState(() {
//             remoteUid = remoteUidParam;
//           });
//         },
//         onUserOffline: (connection, remoteUidParam, reason) {
//           print('User offline: $remoteUidParam');
//           setState(() {
//             remoteUid = null;
//           });
//         },
//         onError: (errorCode, description) {
//           setState(() {
//             errorMessage = 'Agora SDK Error: $errorCode, Description: $description';
//           });
//           print('Agora SDK Error: $errorCode, Description: $description');
//         },
//       ));
//
//       // Enable video
//       await _engine.enableVideo();
//
//       // Set client role to broadcaster
//       await _engine.setClientRole(role: ClientRoleType.clientRoleBroadcaster);
//
//       // Join the channel with dummy token
//       await _engine.joinChannel(
//         token: widget.token, // Dummy Token
//         channelId: widget.channelName, // Dummy Channel Name
//         uid: 0, // Let Agora assign a UID
//         options: const ChannelMediaOptions(),
//       );
//     } catch (e) {
//       setState(() {
//         errorMessage = 'Failed to initialize Agora SDK: $e';
//       });
//       print('Failed to initialize Agora SDK: $e');
//     }
//   }
//
//   @override
//   void dispose() {
//     _engine.leaveChannel();
//     _engine.release();
//     super.dispose();
//   }
//
//   // Toggle mute
//   void _toggleMute() {
//     setState(() {
//       isMuted = !isMuted;
//     });
//     _engine.muteLocalAudioStream(isMuted);
//   }
//
//   // Toggle video
//   void _toggleVideo() {
//     setState(() {
//       isVideoOff = !isVideoOff;
//     });
//     _engine.muteLocalVideoStream(isVideoOff);
//   }
//
//   // Switch camera
//   void _switchCamera() {
//     _engine.switchCamera();
//     setState(() {
//       isFrontCamera = !isFrontCamera;
//     });
//   }
//
//   // Share link
//   void _shareLink() {
//     Share.share(meetingLink, subject: 'Join my meeting');
//   }
//
//   // End meeting
//   void _endMeeting() {
//     Navigator.pop(context);
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       // Prevents screen from rotating
//       body: OrientationBuilder(
//         builder: (context, orientation) {
//           return Stack(
//             children: [
//               _renderRemoteVideo(),
//               if (errorMessage.isNotEmpty)
//                 Positioned(
//                   top: 50,
//                   left: 20,
//                   right: 20,
//                   child: Container(
//                     padding: const EdgeInsets.all(10),
//                     color: Colors.redAccent,
//                     child: Text(
//                       errorMessage,
//                       style: const TextStyle(color: Colors.white),
//                       textAlign: TextAlign.center,
//                     ),
//                   ),
//                 ),
//               _renderLocalVideo(),
//               _toolbar(),
//             ],
//           );
//         },
//       ),
//     );
//   }
//
//   // Render Remote Video
//   Widget _renderRemoteVideo() {
//     if (remoteUid != null) {
//       return AgoraVideoView(
//         controller: VideoViewController.remote(
//           rtcEngine: _engine,
//           canvas: VideoCanvas(uid: remoteUid),
//           connection: RtcConnection(channelId: widget.channelName),
//         ),
//       );
//     } else {
//       return Container(
//         color: Colors.black,
//         child: const Center(
//           child: Text(
//             'Waiting for other participants...',
//             style: TextStyle(color: Colors.white, fontSize: 18),
//           ),
//         ),
//       );
//     }
//   }
//
//   // Render Local Video or Profile Photo
//   Widget _renderLocalVideo() {
//     return Positioned(
//       top: 40, // Distance from the top; adjust as needed
//       right: 20, // Distance from the right; adjust as needed
//       width: 120, // Width of the local video window
//       height: 160, // Height of the local video window
//       child: Container(
//         decoration: BoxDecoration(
//           border: Border.all(color: Colors.white),
//           borderRadius: BorderRadius.circular(8),
//         ),
//         child: isVideoOff
//             ? ClipRRect(
//           borderRadius: BorderRadius.circular(8),
//           child: Image.asset(
//             'assets/images/profile_placeholder.png',
//             fit: BoxFit.cover,
//           ),
//         )
//             : localUid != null
//             ? AgoraVideoView(
//           controller: VideoViewController(
//             rtcEngine: _engine,
//             canvas: VideoCanvas(uid: 0), // uid: 0 indicates local video
//           ),
//         )
//             : const Center(
//           child: CircularProgressIndicator(),
//         ),
//       ),
//     );
//   }
//
//   // Render Toolbar
//   Widget _toolbar() {
//     return Align(
//       alignment: Alignment.bottomLeft,
//       child: Padding(
//         padding: const EdgeInsets.fromLTRB(10.0, 0.0, 10.0, 20.0),
//         child: Container(
//           padding: const EdgeInsets.symmetric(horizontal: 10.0, vertical: 10.0),
//           decoration: BoxDecoration(
//             color: Colors.black54,
//             borderRadius: BorderRadius.circular(30.0),
//           ),
//           child: SingleChildScrollView(
//             scrollDirection: Axis.horizontal,
//             child: Row(
//               mainAxisSize: MainAxisSize.min,
//               children: [
//                 _buildToolbarButton(
//                   icon: isMuted ? Icons.mic_off : Icons.mic,
//                   color: isMuted ? Colors.white : Colors.blue,
//                   backgroundColor: isMuted ? Colors.blue : Colors.white,
//                   onPressed: _toggleMute,
//                 ),
//                 const SizedBox(width: 10),
//                 _buildToolbarButton(
//                   icon: Icons.call_end,
//                   color: Colors.white,
//                   backgroundColor: Colors.redAccent,
//                   onPressed: _endMeeting,
//                   size: 30.0,
//                 ),
//                 const SizedBox(width: 10),
//                 _buildToolbarButton(
//                   icon: isVideoOff ? Icons.videocam_off : Icons.videocam,
//                   color: isVideoOff ? Colors.white : Colors.blue,
//                   backgroundColor: isVideoOff ? Colors.blue : Colors.white,
//                   onPressed: _toggleVideo,
//                 ),
//                 const SizedBox(width: 10),
//                 _buildToolbarButton(
//                   icon: Icons.switch_camera,
//                   color: Colors.blue,
//                   backgroundColor: Colors.white,
//                   onPressed: _switchCamera,
//                 ),
//                 const SizedBox(width: 10),
//                 _buildToolbarButton(
//                   icon: Icons.link,
//                   color: Colors.blue,
//                   backgroundColor: Colors.white,
//                   onPressed: _shareLink,
//                 ),
//               ],
//             ),
//           ),
//         ),
//       ),
//     );
//   }
//
//
//   // Helper method to build toolbar buttons
//   Widget _buildToolbarButton({
//     required IconData icon,
//     required Color color,
//     required Color backgroundColor,
//     VoidCallback? onPressed,
//     double size = 20.0,
//   }) {
//     return RawMaterialButton(
//       onPressed: onPressed,
//       child: Icon(
//         icon,
//         color: color,
//         size: size,
//       ),
//       shape: const CircleBorder(),
//       elevation: 2.0,
//       fillColor: backgroundColor,
//       padding: const EdgeInsets.all(12.0),
//     );
//   }
// }

// import 'package:flutter/material.dart';
// import 'package:agora_rtc_engine/agora_rtc_engine.dart';
// import 'package:permission_handler/permission_handler.dart';
// import 'package:share_plus/share_plus.dart'; // For sharing the link
//
// class MeetingPage extends StatefulWidget {
//   final String channelName;
//   final String appId;
//   final String token;
//
//   const MeetingPage({
//     Key? key,
//     required this.channelName,
//     required this.appId,
//     required this.token,
//   }) : super(key: key);
//
//   @override
//   _MeetingPageState createState() => _MeetingPageState();
// }
//
// class _MeetingPageState extends State<MeetingPage> {
//   late final RtcEngine _engine;
//   bool isJoined = false;
//   bool isMuted = false;
//   bool isVideoOff = false;
//   bool isFrontCamera = true;
//   int? localUid;
//   int? remoteUid;
//   String meetingLink = '';
//   String errorMessage = '';
//
//   @override
//   void initState() {
//     super.initState();
//     _initAgora();
//     meetingLink = "https://zoom_clone.meet/${widget.channelName}";
//   }
//
//   Future<void> _initAgora() async {
//     try {
//       // Request camera and microphone permissions
//       await [Permission.camera, Permission.microphone].request();
//
//       // Create the Agora engine
//       _engine = createAgoraRtcEngine();
//       await _engine.initialize(RtcEngineContext(
//         appId: widget.appId,
//         channelProfile: ChannelProfileType.channelProfileCommunication,
//       ));
//
//       // Register event handlers
//       _engine.registerEventHandler(RtcEngineEventHandler(
//         onJoinChannelSuccess: (connection, elapsed) {
//           setState(() {
//             isJoined = true;
//             localUid = connection.localUid;
//           });
//           print('Joined channel: ${connection.channelId} with UID: ${connection.localUid}');
//         },
//         onUserJoined: (connection, remoteUidParam, elapsed) {
//           print('User joined: $remoteUidParam');
//           setState(() {
//             remoteUid = remoteUidParam;
//           });
//         },
//         onUserOffline: (connection, remoteUidParam, reason) {
//           print('User offline: $remoteUidParam');
//           setState(() {
//             remoteUid = null;
//           });
//         },
//         onError: (errorCode, description) {
//           setState(() {
//             errorMessage = 'Agora SDK Error: $errorCode, Description: $description';
//           });
//           print('Agora SDK Error: $errorCode, Description: $description');
//         },
//       ));
//
//       // Enable video
//       await _engine.enableVideo();
//
//       // Set client role to broadcaster
//       await _engine.setClientRole(role: ClientRoleType.clientRoleBroadcaster);
//
//       // Join the channel with dummy token
//       await _engine.joinChannel(
//         token: widget.token, // Dummy Token
//         channelId: widget.channelName, // Dummy Channel Name
//         uid: 0, // Let Agora assign a UID
//         options: const ChannelMediaOptions(),
//       );
//     } catch (e) {
//       setState(() {
//         errorMessage = 'Failed to initialize Agora SDK: $e';
//       });
//       print('Failed to initialize Agora SDK: $e');
//     }
//   }
//
//   @override
//   void dispose() {
//     _engine.leaveChannel();
//     _engine.release();
//     super.dispose();
//   }
//
//   // Toggle mute
//   void _toggleMute() {
//     setState(() {
//       isMuted = !isMuted;
//     });
//     _engine.muteLocalAudioStream(isMuted);
//   }
//
//   // Toggle video
//   void _toggleVideo() {
//     setState(() {
//       isVideoOff = !isVideoOff;
//     });
//     _engine.muteLocalVideoStream(isVideoOff);
//   }
//
//   // Switch camera
//   void _switchCamera() {
//     _engine.switchCamera();
//     setState(() {
//       isFrontCamera = !isFrontCamera;
//     });
//   }
//
//   // Share link
//   void _shareLink() {
//     Share.share(meetingLink, subject: 'Join my meeting');
//   }
//
//   // End meeting with confirmation and feedback
//   void _endMeeting() {
//     showDialog(
//       context: context,
//       builder: (BuildContext context) {
//         return AlertDialog(
//           title: const Text('End Meeting'),
//           content: const Text('Are you sure you want to end the meeting?'),
//           actions: [
//             TextButton(
//               onPressed: () {
//                 Navigator.of(context).pop(); // Close the confirmation dialog
//               },
//               child: const Text('No'),
//             ),
//             TextButton(
//               onPressed: () {
//                 Navigator.of(context).pop(); // Close the confirmation dialog
//                 _showFeedbackDialog(); // Show feedback dialog
//               },
//               child: const Text('Yes'),
//             ),
//           ],
//         );
//       },
//     );
//   }
//
//   // Show feedback dialog
//   void _showFeedbackDialog() {
//     TextEditingController _feedbackController = TextEditingController();
//
//     showDialog(
//       context: context,
//       barrierDismissible: false, // Prevent closing by tapping outside
//       builder: (BuildContext context) {
//         return AlertDialog(
//           title: const Text('Your Feedback'),
//           content: TextField(
//             controller: _feedbackController,
//             maxLines: 3,
//             decoration: const InputDecoration(
//               hintText: 'Enter your feedback here',
//               border: OutlineInputBorder(),
//             ),
//           ),
//           actions: [
//             TextButton(
//               onPressed: () {
//                 // Optionally handle feedback cancellation
//                 Navigator.of(context).pop(); // Close the feedback dialog
//                 _quitMeeting();
//               },
//               child: const Text('Cancel'),
//             ),
//             TextButton(
//               onPressed: () {
//                 String feedback = _feedbackController.text.trim();
//                 // TODO: Handle the feedback (e.g., send to server)
//                 print('User Feedback: $feedback');
//                 Navigator.of(context).pop(); // Close the feedback dialog
//                 _quitMeeting();
//               },
//               child: const Text('Send'),
//             ),
//           ],
//         );
//       },
//     );
//   }
//
//   // Quit meeting after confirmation and feedback
//   void _quitMeeting() {
//     // Optionally perform any cleanup or send feedback to backend here
//     Navigator.of(context).pop(); // Close the MeetingPage
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       // Prevents screen from rotating
//       body: OrientationBuilder(
//         builder: (context, orientation) {
//           return Stack(
//             children: [
//               _renderRemoteVideo(),
//               if (errorMessage.isNotEmpty)
//                 Positioned(
//                   top: 50,
//                   left: 20,
//                   right: 20,
//                   child: Container(
//                     padding: const EdgeInsets.all(10),
//                     color: Colors.redAccent,
//                     child: Text(
//                       errorMessage,
//                       style: const TextStyle(color: Colors.white),
//                       textAlign: TextAlign.center,
//                     ),
//                   ),
//                 ),
//               _renderLocalVideo(),
//               _toolbar(),
//             ],
//           );
//         },
//       ),
//     );
//   }
//
//   // Render Remote Video
//   Widget _renderRemoteVideo() {
//     if (remoteUid != null) {
//       return AgoraVideoView(
//         controller: VideoViewController.remote(
//           rtcEngine: _engine,
//           canvas: VideoCanvas(uid: remoteUid),
//           connection: RtcConnection(channelId: widget.channelName),
//         ),
//       );
//     } else {
//       return Container(
//         color: Colors.black,
//         child: const Center(
//           child: Text(
//             'Waiting for other participants...',
//             style: TextStyle(color: Colors.white, fontSize: 18),
//           ),
//         ),
//       );
//     }
//   }
//
//   // Render Local Video or Profile Photo
//   Widget _renderLocalVideo() {
//     return Positioned(
//       top: 40, // Distance from the top; adjust as needed
//       right: 20, // Distance from the right; adjust as needed
//       width: 120, // Width of the local video window
//       height: 160, // Height of the local video window
//       child: Container(
//         decoration: BoxDecoration(
//           border: Border.all(color: Colors.white),
//           borderRadius: BorderRadius.circular(8),
//         ),
//         child: isVideoOff
//             ? ClipRRect(
//           borderRadius: BorderRadius.circular(8),
//           child: Image.asset(
//             'assets/images/profile_placeholder.png',
//             fit: BoxFit.cover,
//           ),
//         )
//             : localUid != null
//             ? AgoraVideoView(
//           controller: VideoViewController(
//             rtcEngine: _engine,
//             canvas: VideoCanvas(uid: 0), // uid: 0 indicates local video
//           ),
//         )
//             : const Center(
//           child: CircularProgressIndicator(),
//         ),
//       ),
//     );
//   }
//
//   // Render Toolbar
//   Widget _toolbar() {
//     return Align(
//       alignment: Alignment.bottomLeft,
//       child: Padding(
//         padding: const EdgeInsets.fromLTRB(10.0, 0.0, 10.0, 20.0),
//         child: Container(
//           padding: const EdgeInsets.symmetric(horizontal: 10.0, vertical: 10.0),
//           decoration: BoxDecoration(
//             color: Colors.black54,
//             borderRadius: BorderRadius.circular(30.0),
//           ),
//           child: SingleChildScrollView(
//             scrollDirection: Axis.horizontal,
//             child: Row(
//               mainAxisSize: MainAxisSize.min,
//               children: [
//                 _buildToolbarButton(
//                   icon: isMuted ? Icons.mic_off : Icons.mic,
//                   color: isMuted ? Colors.white : Colors.blue,
//                   backgroundColor: isMuted ? Colors.blue : Colors.white,
//                   onPressed: _toggleMute,
//                 ),
//                 const SizedBox(width: 10),
//                 _buildToolbarButton(
//                   icon: Icons.call_end,
//                   color: Colors.white,
//                   backgroundColor: Colors.redAccent,
//                   onPressed: _endMeeting, // Updated to use the new _endMeeting method
//                   size: 30.0,
//                 ),
//                 const SizedBox(width: 10),
//                 _buildToolbarButton(
//                   icon: isVideoOff ? Icons.videocam_off : Icons.videocam,
//                   color: isVideoOff ? Colors.white : Colors.blue,
//                   backgroundColor: isVideoOff ? Colors.blue : Colors.white,
//                   onPressed: _toggleVideo,
//                 ),
//                 const SizedBox(width: 10),
//                 _buildToolbarButton(
//                   icon: Icons.switch_camera,
//                   color: Colors.blue,
//                   backgroundColor: Colors.white,
//                   onPressed: _switchCamera,
//                 ),
//                 const SizedBox(width: 10),
//                 _buildToolbarButton(
//                   icon: Icons.link,
//                   color: Colors.blue,
//                   backgroundColor: Colors.white,
//                   onPressed: _shareLink,
//                 ),
//               ],
//             ),
//           ),
//         ),
//       ),
//     );
//   }
//
//   // Helper method to build toolbar buttons
//   Widget _buildToolbarButton({
//     required IconData icon,
//     required Color color,
//     required Color backgroundColor,
//     VoidCallback? onPressed,
//     double size = 20.0,
//   }) {
//     return RawMaterialButton(
//       onPressed: onPressed,
//       child: Icon(
//         icon,
//         color: color,
//         size: size,
//       ),
//       shape: const CircleBorder(),
//       elevation: 2.0,
//       fillColor: backgroundColor,
//       padding: const EdgeInsets.all(12.0),
//     );
//   }
// }
//
// import 'package:flutter/material.dart';
// import 'package:agora_rtc_engine/agora_rtc_engine.dart';
// import 'package:permission_handler/permission_handler.dart';
// import 'package:share_plus/share_plus.dart'; // For sharing the link
//
// class MeetingPage extends StatefulWidget {
//   final String channelName;
//   final String appId;
//   final String token;
//
//   const MeetingPage({
//     Key? key,
//     required this.channelName,
//     required this.appId,
//     required this.token,
//   }) : super(key: key);
//
//   @override
//   _MeetingPageState createState() => _MeetingPageState();
// }
//
// class _MeetingPageState extends State<MeetingPage> {
//   late final RtcEngine _engine;
//   bool isJoined = false;
//   bool isMuted = false;
//   bool isVideoOff = false;
//   bool isFrontCamera = true;
//   int? localUid;
//   int? remoteUid;
//   String meetingLink = '';
//   String errorMessage = '';
//
//   @override
//   void initState() {
//     super.initState();
//     _initAgora();
//     meetingLink = "https://zoom_clone.meet/${widget.channelName}";
//   }
//
//   Future<void> _initAgora() async {
//     try {
//       // Request camera and microphone permissions
//       await [Permission.camera, Permission.microphone].request();
//
//       // Create the Agora engine
//       _engine = createAgoraRtcEngine();
//       await _engine.initialize(RtcEngineContext(
//         appId: widget.appId,
//         channelProfile: ChannelProfileType.channelProfileCommunication,
//       ));
//
//       // Register event handlers
//       _engine.registerEventHandler(RtcEngineEventHandler(
//         onJoinChannelSuccess: (connection, elapsed) {
//           setState(() {
//             isJoined = true;
//             localUid = connection.localUid;
//           });
//           print('Joined channel: ${connection.channelId} with UID: ${connection.localUid}');
//         },
//         onUserJoined: (connection, remoteUidParam, elapsed) {
//           print('User joined: $remoteUidParam');
//           setState(() {
//             remoteUid = remoteUidParam;
//           });
//         },
//         onUserOffline: (connection, remoteUidParam, reason) {
//           print('User offline: $remoteUidParam');
//           setState(() {
//             remoteUid = null;
//           });
//         },
//         onError: (errorCode, description) {
//           setState(() {
//             errorMessage = 'Agora SDK Error: $errorCode, Description: $description';
//           });
//           print('Agora SDK Error: $errorCode, Description: $description');
//         },
//       ));
//
//       // Enable video
//       await _engine.enableVideo();
//
//       // Set client role to broadcaster
//       await _engine.setClientRole(role: ClientRoleType.clientRoleBroadcaster);
//
//       // Join the channel with token
//       await _engine.joinChannel(
//         token: widget.token, // Token for authentication
//         channelId: widget.channelName, // Channel name
//         uid: 0, // Let Agora assign a UID
//         options: const ChannelMediaOptions(),
//       );
//     } catch (e) {
//       setState(() {
//         errorMessage = 'Failed to initialize Agora SDK: $e';
//       });
//       print('Failed to initialize Agora SDK: $e');
//     }
//   }
//
//   @override
//   void dispose() {
//     _engine.leaveChannel();
//     _engine.release();
//     super.dispose();
//   }
//
//   // Toggle mute
//   void _toggleMute() {
//     setState(() {
//       isMuted = !isMuted;
//     });
//     _engine.muteLocalAudioStream(isMuted);
//   }
//
//   // Toggle video
//   void _toggleVideo() {
//     setState(() {
//       isVideoOff = !isVideoOff;
//     });
//     _engine.muteLocalVideoStream(isVideoOff);
//   }
//
//   // Switch camera
//   void _switchCamera() {
//     _engine.switchCamera();
//     setState(() {
//       isFrontCamera = !isFrontCamera;
//     });
//   }
//
//   // Share link
//   void _shareLink() {
//     Share.share(meetingLink, subject: 'Join my meeting');
//   }
//
//   // End meeting with confirmation and feedback
//   void _endMeeting() {
//     showDialog(
//       context: context,
//       builder: (BuildContext context) {
//         return AlertDialog(
//           title: const Text('End Meeting'),
//           content: const Text('Are you sure you want to end the meeting?'),
//           actions: [
//             TextButton(
//               onPressed: () {
//                 Navigator.of(context).pop(); // Close the confirmation dialog
//               },
//               child: const Text('No'),
//             ),
//             TextButton(
//               onPressed: () {
//                 Navigator.of(context).pop(); // Close the confirmation dialog
//                 _showFeedbackDialog(); // Show feedback dialog
//               },
//               child: const Text('Yes'),
//             ),
//           ],
//         );
//       },
//     );
//   }
//
//   // Show feedback dialog
//   void _showFeedbackDialog() {
//     TextEditingController _feedbackController = TextEditingController();
//
//     showDialog(
//       context: context,
//       barrierDismissible: false, // Prevent closing by tapping outside
//       builder: (BuildContext context) {
//         return AlertDialog(
//           title: const Text('Your Feedback'),
//           content: TextField(
//             controller: _feedbackController,
//             maxLines: 3,
//             decoration: const InputDecoration(
//               hintText: 'Enter your feedback here',
//               border: OutlineInputBorder(),
//             ),
//           ),
//           actions: [
//             TextButton(
//               onPressed: () {
//                 // Optionally handle feedback cancellation
//                 Navigator.of(context).pop(); // Close the feedback dialog
//                 _quitMeeting();
//               },
//               child: const Text('Cancel'),
//             ),
//             TextButton(
//               onPressed: () {
//                 String feedback = _feedbackController.text.trim();
//                 // TODO: Handle the feedback (e.g., send to server)
//                 print('User Feedback: $feedback');
//                 Navigator.of(context).pop(); // Close the feedback dialog
//                 _quitMeeting();
//               },
//               child: const Text('Send'),
//             ),
//           ],
//         );
//       },
//     );
//   }
//
//   // Quit meeting after confirmation and feedback
//   void _quitMeeting() {
//     // Optionally perform any cleanup or send feedback to backend here
//     Navigator.of(context).pop(); // Close the MeetingPage
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       // Prevents screen from rotating
//       body: OrientationBuilder(
//         builder: (context, orientation) {
//           return Stack(
//             children: [
//               _renderRemoteVideo(),
//               if (errorMessage.isNotEmpty)
//                 Positioned(
//                   top: 50,
//                   left: 20,
//                   right: 20,
//                   child: Container(
//                     padding: const EdgeInsets.all(10),
//                     color: Colors.redAccent,
//                     child: Text(
//                       errorMessage,
//                       style: const TextStyle(color: Colors.white),
//                       textAlign: TextAlign.center,
//                     ),
//                   ),
//                 ),
//               _renderLocalVideo(),
//               _toolbar(),
//             ],
//           );
//         },
//       ),
//     );
//   }
//
//   // Render Remote Video
//   Widget _renderRemoteVideo() {
//     if (remoteUid != null) {
//       return AgoraVideoView(
//         controller: VideoViewController.remote(
//           rtcEngine: _engine,
//           canvas: VideoCanvas(uid: remoteUid),
//           connection: RtcConnection(channelId: widget.channelName),
//         ),
//       );
//     } else {
//       return Container(
//         color: Colors.black,
//         child: const Center(
//           child: Text(
//             'Waiting for other participants...',
//             style: TextStyle(color: Colors.white, fontSize: 18),
//           ),
//         ),
//       );
//     }
//   }
//
//   // Render Local Video (conditionally)
//   Widget _renderLocalVideo() {
//     if (isVideoOff) {
//       // If video is off, do not render the local video widget
//       return SizedBox.shrink();
//     }
//
//     return Positioned(
//       top: 40, // Distance from the top; adjust as needed
//       right: 20, // Distance from the right; adjust as needed
//       width: 120, // Width of the local video window
//       height: 160, // Height of the local video window
//       child: Container(
//         decoration: BoxDecoration(
//           border: Border.all(color: Colors.white),
//           borderRadius: BorderRadius.circular(8),
//         ),
//         child: localUid != null
//             ? AgoraVideoView(
//           controller: VideoViewController(
//             rtcEngine: _engine,
//             canvas: VideoCanvas(uid: 0), // uid: 0 indicates local video
//           ),
//         )
//             : const Center(
//           child: CircularProgressIndicator(),
//         ),
//       ),
//     );
//   }
//
//   // Render Toolbar
//   Widget _toolbar() {
//     return Align(
//       alignment: Alignment.bottomLeft,
//       child: Padding(
//         padding: const EdgeInsets.fromLTRB(10.0, 0.0, 10.0, 20.0),
//         child: Container(
//           padding: const EdgeInsets.symmetric(horizontal: 10.0, vertical: 10.0),
//           decoration: BoxDecoration(
//             color: Colors.black54,
//             borderRadius: BorderRadius.circular(30.0),
//           ),
//           child: SingleChildScrollView(
//             scrollDirection: Axis.horizontal,
//             child: Row(
//               mainAxisSize: MainAxisSize.min,
//               children: [
//                 _buildToolbarButton(
//                   icon: isMuted ? Icons.mic_off : Icons.mic,
//                   color: isMuted ? Colors.white : Colors.blue,
//                   backgroundColor: isMuted ? Colors.blue : Colors.white,
//                   onPressed: _toggleMute,
//                 ),
//                 const SizedBox(width: 10),
//                 _buildToolbarButton(
//                   icon: Icons.call_end,
//                   color: Colors.white,
//                   backgroundColor: Colors.redAccent,
//                   onPressed: _endMeeting, // Updated to use the new _endMeeting method
//                   size: 30.0,
//                 ),
//                 const SizedBox(width: 10),
//                 _buildToolbarButton(
//                   icon: isVideoOff ? Icons.videocam_off : Icons.videocam,
//                   color: isVideoOff ? Colors.white : Colors.blue,
//                   backgroundColor: isVideoOff ? Colors.blue : Colors.white,
//                   onPressed: _toggleVideo,
//                 ),
//                 const SizedBox(width: 10),
//                 _buildToolbarButton(
//                   icon: Icons.switch_camera,
//                   color: Colors.blue,
//                   backgroundColor: Colors.white,
//                   onPressed: _switchCamera,
//                 ),
//                 const SizedBox(width: 10),
//                 _buildToolbarButton(
//                   icon: Icons.link,
//                   color: Colors.blue,
//                   backgroundColor: Colors.white,
//                   onPressed: _shareLink,
//                 ),
//               ],
//             ),
//           ),
//         ),
//       ),
//     );
//   }
//
//   // Helper method to build toolbar buttons
//   Widget _buildToolbarButton({
//     required IconData icon,
//     required Color color,
//     required Color backgroundColor,
//     VoidCallback? onPressed,
//     double size = 20.0,
//   }) {
//     return RawMaterialButton(
//       onPressed: onPressed,
//       child: Icon(
//         icon,
//         color: color,
//         size: size,
//       ),
//       shape: const CircleBorder(),
//       elevation: 2.0,
//       fillColor: backgroundColor,
//       padding: const EdgeInsets.all(12.0),
//     );
//   }
// }

// import 'package:flutter/material.dart';
// import 'package:agora_rtc_engine/agora_rtc_engine.dart';
// import 'package:permission_handler/permission_handler.dart';
// import 'package:share_plus/share_plus.dart'; // For sharing the link
//
// class MeetingPage extends StatefulWidget {
//   final String channelName;
//   final String appId;
//   final String token;
//
//   const MeetingPage({
//     Key? key,
//     required this.channelName,
//     required this.appId,
//     required this.token,
//   }) : super(key: key);
//
//   @override
//   _MeetingPageState createState() => _MeetingPageState();
// }
//
// class _MeetingPageState extends State<MeetingPage> {
//   late final RtcEngine _engine;
//   bool isJoined = false;
//   bool isMuted = false;
//   bool isVideoOff = false;
//   bool isFrontCamera = true;
//   int? localUid;
//   int? remoteUid;
//   String meetingLink = '';
//   String errorMessage = '';
//
//   @override
//   void initState() {
//     super.initState();
//     _initAgora();
//     meetingLink = "https://yourapp.meet/${widget.channelName}"; // Update with your domain
//   }
//
//   Future<void> _initAgora() async {
//     try {
//       // Request camera and microphone permissions
//       var status = await [Permission.camera, Permission.microphone].request();
//       if (status[Permission.camera] != PermissionStatus.granted ||
//           status[Permission.microphone] != PermissionStatus.granted) {
//         setState(() {
//           errorMessage = 'Camera and Microphone permissions are required.';
//         });
//         return;
//       }
//
//       // Initialize the Agora engine
//       _engine = createAgoraRtcEngine();
//       await _engine.initialize(RtcEngineContext(
//         appId: widget.appId,
//         channelProfile: ChannelProfileType.channelProfileLiveBroadcasting,
//       ));
//
//       // Register event handlers
//       _engine.registerEventHandler(RtcEngineEventHandler(
//         onJoinChannelSuccess: (connection, elapsed) {
//           setState(() {
//             isJoined = true;
//             localUid = connection.localUid;
//           });
//           print('Joined channel: ${connection.channelId} with UID: ${connection.localUid}');
//         },
//         onUserJoined: (connection, remoteUidParam, elapsed) {
//           print('User joined: $remoteUidParam');
//           setState(() {
//             remoteUid = remoteUidParam;
//           });
//         },
//         onUserOffline: (connection, remoteUidParam, reason) {
//           print('User offline: $remoteUidParam');
//           setState(() {
//             remoteUid = null;
//           });
//         },
//         onError: (errorCode, description) {
//           setState(() {
//             errorMessage = 'Agora SDK Error: $errorCode, Description: $description';
//           });
//           print('Agora SDK Error: $errorCode, Description: $description');
//         },
//       ));
//
//       // Enable video and set the client role to broadcaster
//       await _engine.enableVideo();
//       await _engine.setClientRole(role: ClientRoleType.clientRoleBroadcaster);
//
//       // Join the channel with the provided token
//       await _engine.joinChannel(
//         token: widget.token,
//         channelId: widget.channelName,
//         uid: 0, // 0 lets Agora assign a UID automatically
//         options: const ChannelMediaOptions(
//           clientRoleType: ClientRoleType.clientRoleBroadcaster,
//         ),
//       );
//     } catch (e) {
//       setState(() {
//         errorMessage = 'Failed to initialize Agora SDK: $e';
//       });
//       print('Failed to initialize Agora SDK: $e');
//     }
//   }
//
//   @override
//   void dispose() {
//     _engine.leaveChannel();
//     _engine.release();
//     super.dispose();
//   }
//
//   // Toggle mute/unmute
//   void _toggleMute() {
//     setState(() {
//       isMuted = !isMuted;
//     });
//     _engine.muteLocalAudioStream(isMuted);
//   }
//
//   // Toggle video on/off
//   void _toggleVideo() {
//     setState(() {
//       isVideoOff = !isVideoOff;
//     });
//     _engine.muteLocalVideoStream(isVideoOff);
//   }
//
//   // Switch between front and rear cameras
//   void _switchCamera() {
//     _engine.switchCamera();
//     setState(() {
//       isFrontCamera = !isFrontCamera;
//     });
//   }
//
//   // Share the meeting link
//   void _shareLink() {
//     Share.share(meetingLink, subject: 'Join my meeting');
//   }
//
//   // End the meeting with confirmation and feedback
//   void _endMeeting() {
//     showDialog(
//       context: context,
//       builder: (BuildContext context) {
//         return AlertDialog(
//           title: const Text('End Meeting'),
//           content: const Text('Are you sure you want to end the meeting?'),
//           actions: [
//             TextButton(
//               onPressed: () {
//                 Navigator.of(context).pop(); // Close the confirmation dialog
//               },
//               child: const Text('No'),
//             ),
//             TextButton(
//               onPressed: () {
//                 Navigator.of(context).pop(); // Close the confirmation dialog
//                 _showFeedbackDialog(); // Show feedback dialog
//               },
//               child: const Text('Yes'),
//             ),
//           ],
//         );
//       },
//     );
//   }
//
//   // Show feedback dialog
//   void _showFeedbackDialog() {
//     TextEditingController _feedbackController = TextEditingController();
//
//     showDialog(
//       context: context,
//       barrierDismissible: false, // Prevent closing by tapping outside
//       builder: (BuildContext context) {
//         return AlertDialog(
//           title: const Text('Your Feedback'),
//           content: TextField(
//             controller: _feedbackController,
//             maxLines: 3,
//             decoration: const InputDecoration(
//               hintText: 'Enter your feedback here',
//               border: OutlineInputBorder(),
//             ),
//           ),
//           actions: [
//             TextButton(
//               onPressed: () {
//                 // Optionally handle feedback cancellation
//                 Navigator.of(context).pop(); // Close the feedback dialog
//                 _quitMeeting();
//               },
//               child: const Text('Cancel'),
//             ),
//             TextButton(
//               onPressed: () {
//                 String feedback = _feedbackController.text.trim();
//                 // TODO: Handle the feedback (e.g., send to server)
//                 print('User Feedback: $feedback');
//                 Navigator.of(context).pop(); // Close the feedback dialog
//                 _quitMeeting();
//               },
//               child: const Text('Send'),
//             ),
//           ],
//         );
//       },
//     );
//   }
//
//   // Quit meeting after confirmation and feedback
//   void _quitMeeting() {
//     // Optionally perform any cleanup or send feedback to backend here
//     Navigator.of(context).pop(); // Close the MeetingPage
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       // Prevents screen from rotating
//       body: OrientationBuilder(
//         builder: (context, orientation) {
//           return Stack(
//             children: [
//               _renderRemoteVideo(),
//               if (errorMessage.isNotEmpty)
//                 Positioned(
//                   top: 50,
//                   left: 20,
//                   right: 20,
//                   child: Container(
//                     padding: const EdgeInsets.all(10),
//                     color: Colors.redAccent,
//                     child: Text(
//                       errorMessage,
//                       style: const TextStyle(color: Colors.white),
//                       textAlign: TextAlign.center,
//                     ),
//                   ),
//                 ),
//               _renderLocalVideo(),
//               _toolbar(),
//             ],
//           );
//         },
//       ),
//     );
//   }
//
//   // Render Remote Video
//   Widget _renderRemoteVideo() {
//     if (remoteUid != null) {
//       return AgoraVideoView(
//         controller: VideoViewController.remote(
//           rtcEngine: _engine,
//           canvas: VideoCanvas(uid: remoteUid),
//           connection: RtcConnection(channelId: widget.channelName),
//         ),
//       );
//     } else {
//       return Container(
//         color: Colors.black,
//         child: const Center(
//           child: Text(
//             'Waiting for other participants...',
//             style: TextStyle(color: Colors.white, fontSize: 18),
//           ),
//         ),
//       );
//     }
//   }
//
//   // Render Local Video (conditionally)
//   Widget _renderLocalVideo() {
//     if (isVideoOff) {
//       // If video is off, do not render the local video widget
//       return SizedBox.shrink();
//     }
//
//     return Positioned(
//       top: 40, // Distance from the top; adjust as needed
//       right: 20, // Distance from the right; adjust as needed
//       width: 120, // Width of the local video window
//       height: 160, // Height of the local video window
//       child: Container(
//         decoration: BoxDecoration(
//           border: Border.all(color: Colors.white),
//           borderRadius: BorderRadius.circular(8),
//         ),
//         child: localUid != null
//             ? AgoraVideoView(
//           controller: VideoViewController(
//             rtcEngine: _engine,
//             canvas: VideoCanvas(uid: 0), // uid: 0 indicates local video
//           ),
//         )
//             : const Center(
//           child: CircularProgressIndicator(),
//         ),
//       ),
//     );
//   }
//
//   // Render Toolbar
//   Widget _toolbar() {
//     return Align(
//       alignment: Alignment.bottomLeft,
//       child: Padding(
//         padding: const EdgeInsets.fromLTRB(10.0, 0.0, 10.0, 20.0),
//         child: Container(
//           padding: const EdgeInsets.symmetric(horizontal: 10.0, vertical: 10.0),
//           decoration: BoxDecoration(
//             color: Colors.black54,
//             borderRadius: BorderRadius.circular(30.0),
//           ),
//           child: SingleChildScrollView(
//             scrollDirection: Axis.horizontal,
//             child: Row(
//               mainAxisSize: MainAxisSize.min,
//               children: [
//                 _buildToolbarButton(
//                   icon: isMuted ? Icons.mic_off : Icons.mic,
//                   color: isMuted ? Colors.white : Colors.blue,
//                   backgroundColor: isMuted ? Colors.blue : Colors.white,
//                   onPressed: _toggleMute,
//                 ),
//                 const SizedBox(width: 10),
//                 _buildToolbarButton(
//                   icon: Icons.call_end,
//                   color: Colors.white,
//                   backgroundColor: Colors.redAccent,
//                   onPressed: _endMeeting,
//                   size: 30.0,
//                 ),
//                 const SizedBox(width: 10),
//                 _buildToolbarButton(
//                   icon: isVideoOff ? Icons.videocam_off : Icons.videocam,
//                   color: isVideoOff ? Colors.white : Colors.blue,
//                   backgroundColor: isVideoOff ? Colors.blue : Colors.white,
//                   onPressed: _toggleVideo,
//                 ),
//                 const SizedBox(width: 10),
//                 _buildToolbarButton(
//                   icon: Icons.switch_camera,
//                   color: Colors.blue,
//                   backgroundColor: Colors.white,
//                   onPressed: _switchCamera,
//                 ),
//                 const SizedBox(width: 10),
//                 _buildToolbarButton(
//                   icon: Icons.link,
//                   color: Colors.blue,
//                   backgroundColor: Colors.white,
//                   onPressed: _shareLink,
//                 ),
//               ],
//             ),
//           ),
//         ),
//       ),
//     );
//   }
//
//   // Helper method to build toolbar buttons
//   Widget _buildToolbarButton({
//     required IconData icon,
//     required Color color,
//     required Color backgroundColor,
//     VoidCallback? onPressed,
//     double size = 20.0,
//   }) {
//     return RawMaterialButton(
//       onPressed: onPressed,
//       child: Icon(
//         icon,
//         color: color,
//         size: size,
//       ),
//       shape: const CircleBorder(),
//       elevation: 2.0,
//       fillColor: backgroundColor,
//       padding: const EdgeInsets.all(12.0),
//     );
//   }
// }

// import 'package:flutter/material.dart';
// import 'package:agora_rtc_engine/agora_rtc_engine.dart';
// import 'package:permission_handler/permission_handler.dart';
// import 'package:share_plus/share_plus.dart';
//
// class MeetingPage extends StatefulWidget {
//   final String channelName;
//   final String appId;
//   final String token;
//
//   const MeetingPage({
//     Key? key,
//     required this.channelName,
//     required this.appId,
//     required this.token,
//   }) : super(key: key);
//
//   @override
//   _MeetingPageState createState() => _MeetingPageState();
// }
//
// class _MeetingPageState extends State<MeetingPage> {
//   late final RtcEngine _engine;
//   bool isJoined = false;
//   bool isMuted = false;
//   bool isVideoOff = false;
//   bool isFrontCamera = true;
//   int? localUid;
//   int? remoteUid;
//   String meetingLink = '';
//   String errorMessage = '';
//   final String rtmpUrl = 'rtmp://a.rtmp.youtube.com/live2/YOUR_STREAM_KEY'; // Replace with your RTMP URL
//
//   @override
//   void initState() {
//     super.initState();
//     _initAgora();
//     meetingLink = "https://yourapp.meet/${widget.channelName}";
//   }
//
//   Future<void> _initAgora() async {
//     try {
//       // Request camera and microphone permissions
//       var status = await [Permission.camera, Permission.microphone].request();
//       if (status[Permission.camera] != PermissionStatus.granted ||
//           status[Permission.microphone] != PermissionStatus.granted) {
//         setState(() {
//           errorMessage = 'Camera and Microphone permissions are required.';
//         });
//         return;
//       }
//
//       // Initialize the Agora engine
//       _engine = createAgoraRtcEngine();
//       await _engine.initialize(RtcEngineContext(
//         appId: widget.appId,
//         channelProfile: ChannelProfileType.channelProfileLiveBroadcasting,
//       ));
//
//       // Register event handlers
//       _engine.registerEventHandler(RtcEngineEventHandler(
//         onJoinChannelSuccess: (connection, elapsed) {
//           setState(() {
//             isJoined = true;
//             localUid = connection.localUid;
//           });
//           print('Joined channel: ${connection.channelId} with UID: ${connection.localUid}');
//           _startRtmpStream(); // Start RTMP streaming
//         },
//         onUserJoined: (connection, remoteUidParam, elapsed) {
//           setState(() {
//             remoteUid = remoteUidParam;
//           });
//           print('User joined: $remoteUidParam');
//         },
//         onUserOffline: (connection, remoteUidParam, reason) {
//           setState(() {
//             remoteUid = null;
//           });
//           print('User offline: $remoteUidParam');
//         },
//         onError: (errorCode, description) {
//           setState(() {
//             errorMessage = 'Agora SDK Error: $errorCode, Description: $description';
//           });
//           print('Agora SDK Error: $errorCode, Description: $description');
//         },
//       ));
//
//       // Enable video and set the client role to broadcaster
//       await _engine.enableVideo();
//       await _engine.setClientRole(role: ClientRoleType.clientRoleBroadcaster);
//
//       // Join the channel with the provided token
//       await _engine.joinChannel(
//         token: widget.token,
//         channelId: widget.channelName,
//         uid: 0, // 0 lets Agora assign a UID automatically
//         options: const ChannelMediaOptions(
//           clientRoleType: ClientRoleType.clientRoleBroadcaster,
//         ),
//       );
//     } catch (e) {
//       setState(() {
//         errorMessage = 'Failed to initialize Agora SDK: $e';
//       });
//       print('Failed to initialize Agora SDK: $e');
//     }
//   }
//
//   // Start RTMP stream
//   Future<void> _startRtmpStream() async {
//     try {
//       // Set live transcoding configuration
//       await _engine.setLiveTranscoding(LiveTranscoding(
//         width: 1280,
//         height: 720,
//         videoBitrate: 4000,
//         videoFramerate: 30,
//         audioSampleRate: AudioSampleRateType.audioSampleRate48000,
//         audioBitrate: 128,
//         audioChannels: 2,
//         videoGop: 30,
//         videoCodecProfile: VideoCodecProfileType.videoCodecProfileHigh,
//       ));
//
//       // Add RTMP URL
//       await _engine.addPublishStreamUrl(rtmpUrl, true);
//       print('RTMP stream started: $rtmpUrl');
//     } catch (e) {
//       setState(() {
//         errorMessage = 'Failed to start RTMP stream: $e';
//       });
//       print('Failed to start RTMP stream: $e');
//     }
//   }
//
//   // Stop RTMP stream
//   Future<void> _stopRtmpStream() async {
//     try {
//       await _engine.removePublishStreamUrl(rtmpUrl);
//       print('RTMP stream stopped');
//     } catch (e) {
//       setState(() {
//         errorMessage = 'Failed to stop RTMP stream: $e';
//       });
//       print('Failed to stop RTMP stream: $e');
//     }
//   }
//
//   @override
//   void dispose() {
//     _stopRtmpStream(); // Stop RTMP stream when leaving
//     _engine.leaveChannel();
//     _engine.release();
//     super.dispose();
//   }
//
//   // Toggle mute/unmute
//   void _toggleMute() {
//     setState(() {
//       isMuted = !isMuted;
//     });
//     _engine.muteLocalAudioStream(isMuted);
//   }
//
//   // Toggle video on/off
//   void _toggleVideo() {
//     setState(() {
//       isVideoOff = !isVideoOff;
//     });
//     _engine.muteLocalVideoStream(isVideoOff);
//   }
//
//   // Switch between front and rear cameras
//   void _switchCamera() {
//     _engine.switchCamera();
//     setState(() {
//       isFrontCamera = !isFrontCamera;
//     });
//   }
//
//   // Share the meeting link
//   void _shareLink() {
//     Share.share(meetingLink, subject: 'Join my meeting');
//   }
//
//   // End the meeting with confirmation
//   void _endMeeting() {
//     showDialog(
//       context: context,
//       builder: (BuildContext context) {
//         return AlertDialog(
//           title: const Text('End Meeting'),
//           content: const Text('Are you sure you want to end the meeting? This will also end the live stream if it is ongoing.'),
//           actions: [
//             TextButton(
//               onPressed: () {
//                 Navigator.of(context).pop(); // Close the confirmation dialog
//               },
//               child: const Text('No'),
//             ),
//             TextButton(
//               onPressed: () {
//                 Navigator.of(context).pop(); // Close the confirmation dialog
//                 _quitMeeting(); // Quit meeting after confirmation
//               },
//               child: const Text('Yes'),
//             ),
//           ],
//         );
//       },
//     );
//   }
//
//   // Quit meeting
//   void _quitMeeting() async {
//     try {
//       await _stopRtmpStream(); // Stop RTMP stream before quitting
//     } catch (e) {
//       setState(() {
//         errorMessage = 'Failed to stop RTMP stream: $e';
//       });
//       print('Failed to stop RTMP stream: $e');
//     }
//     await _engine.leaveChannel();
//     Navigator.of(context).pop(); // Close the MeetingPage
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: OrientationBuilder(
//         builder: (context, orientation) {
//           return Stack(
//             children: [
//               _renderRemoteVideo(),
//               if (errorMessage.isNotEmpty)
//                 Positioned(
//                   top: 50,
//                   left: 20,
//                   right: 20,
//                   child: Container(
//                     padding: const EdgeInsets.all(10),
//                     color: Colors.redAccent,
//                     child: Text(
//                       errorMessage,
//                       style: const TextStyle(color: Colors.white),
//                       textAlign: TextAlign.center,
//                     ),
//                   ),
//                 ),
//               _renderLocalVideo(),
//               _toolbar(),
//             ],
//           );
//         },
//       ),
//     );
//   }
//
//   // Render Remote Video
//   Widget _renderRemoteVideo() {
//     if (remoteUid != null) {
//       return AgoraVideoView(
//         controller: VideoViewController.remote(
//           rtcEngine: _engine,
//           canvas: VideoCanvas(uid: remoteUid),
//           connection: RtcConnection(channelId: widget.channelName),
//         ),
//       );
//     } else {
//       return Container(
//         color: Colors.black,
//         child: const Center(
//           child: Text(
//             'Waiting for other participants...',
//             style: TextStyle(color: Colors.white, fontSize: 18),
//           ),
//         ),
//       );
//     }
//   }
//
//   // Render Local Video
//   Widget _renderLocalVideo() {
//     if (isVideoOff) {
//       return SizedBox.shrink();
//     }
//
//     return Positioned(
//       top: 40,
//       right: 20,
//       width: 120,
//       height: 160,
//       child: Container(
//         decoration: BoxDecoration(
//           border: Border.all(color: Colors.white),
//           borderRadius: BorderRadius.circular(8),
//         ),
//         child: localUid != null
//             ? AgoraVideoView(
//           controller: VideoViewController(
//             rtcEngine: _engine,
//             canvas: VideoCanvas(uid: 0),
//           ),
//         )
//             : const Center(
//           child: CircularProgressIndicator(),
//         ),
//       ),
//     );
//   }
//
//   // Render Toolbar
//   Widget _toolbar() {
//     return Align(
//       alignment: Alignment.bottomLeft,
//       child: Padding(
//         padding: const EdgeInsets.fromLTRB(10.0, 0.0, 10.0, 20.0),
//         child: Container(
//           padding: const EdgeInsets.symmetric(horizontal: 10.0, vertical: 10.0),
//           decoration: BoxDecoration(
//             color: Colors.black54,
//             borderRadius: BorderRadius.circular(30.0),
//           ),
//           child: SingleChildScrollView(
//             scrollDirection: Axis.horizontal,
//             child: Row(
//               mainAxisSize: MainAxisSize.min,
//               children: [
//                 _buildToolbarButton(
//                   icon: isMuted ? Icons.mic_off : Icons.mic,
//                   color: isMuted ? Colors.white : Colors.blue,
//                   backgroundColor: isMuted ? Colors.blue : Colors.white,
//                   onPressed: _toggleMute,
//                 ),
//                 const SizedBox(width: 10),
//                 _buildToolbarButton(
//                   icon: Icons.call_end,
//                   color: Colors.white,
//                   backgroundColor: Colors.redAccent,
//                   onPressed: _endMeeting,
//                   size: 30.0,
//                 ),
//                 const SizedBox(width: 10),
//                 _buildToolbarButton(
//                   icon: isVideoOff ? Icons.videocam_off : Icons.videocam,
//                   color: isVideoOff ? Colors.white : Colors.blue,
//                   backgroundColor: isVideoOff ? Colors.blue : Colors.white,
//                   onPressed: _toggleVideo,
//                 ),
//                 const SizedBox(width: 10),
//                 _buildToolbarButton(
//                   icon: Icons.switch_camera,
//                   color: Colors.blue,
//                   backgroundColor: Colors.white,
//                   onPressed: _switchCamera,
//                 ),
//                 const SizedBox(width: 10),
//                 _buildToolbarButton(
//                   icon: Icons.link,
//                   color: Colors.blue,
//                   backgroundColor: Colors.white,
//                   onPressed: _shareLink,
//                 ),
//               ],
//             ),
//           ),
//         ),
//       ),
//     );
//   }
//
//   // Helper method for Toolbar Buttons
//   Widget _buildToolbarButton({
//     required IconData icon,
//     required Color color,
//     required Color backgroundColor,
//     VoidCallback? onPressed,
//     double size = 20.0,
//   }) {
//     return RawMaterialButton(
//       onPressed: onPressed,
//       child: Icon(
//         icon,
//         color: color,
//         size: size,
//       ),
//       shape: const CircleBorder(),
//       elevation: 2.0,
//       fillColor: backgroundColor,
//       padding: const EdgeInsets.all(12.0),
//     );
//   }
// }

// 2

// import 'package:flutter/material.dart';
// import 'package:agora_rtc_engine/agora_rtc_engine.dart';
// import 'package:permission_handler/permission_handler.dart';
// import 'package:share_plus/share_plus.dart';
//
// class MeetingPage extends StatefulWidget {
//   final String channelName;
//   final String appId;
//   final String token;
//
//   const MeetingPage({
//     Key? key,
//     required this.channelName,
//     required this.appId,
//     required this.token,
//   }) : super(key: key);
//
//   @override
//   _MeetingPageState createState() => _MeetingPageState();
// }
//
// class _MeetingPageState extends State<MeetingPage> {
//   late final RtcEngine _engine;
//   bool isJoined = false;
//   bool isMuted = false;
//   bool isVideoOff = false;
//   bool isFrontCamera = true;
//   int? localUid;
//   int? remoteUid;
//   String meetingLink = '';
//   String errorMessage = '';
//   final String rtmpUrl = 'rtmp://a.rtmp.youtube.com/live2/YOUR_STREAM_KEY'; // Replace with your RTMP URL
//
//   @override
//   void initState() {
//     super.initState();
//     _initAgora();
//     meetingLink = "https://yourapp.meet/${widget.channelName}";
//   }
//
//   Future<void> _initAgora() async {
//     try {
//       // Request camera and microphone permissions
//       var status = await [Permission.camera, Permission.microphone].request();
//       if (status[Permission.camera] != PermissionStatus.granted ||
//           status[Permission.microphone] != PermissionStatus.granted) {
//         setState(() {
//           errorMessage = 'Camera and Microphone permissions are required.';
//         });
//         return;
//       }
//
//       // Initialize the Agora engine
//       _engine = createAgoraRtcEngine();
//       await _engine.initialize(RtcEngineContext(
//         appId: widget.appId,
//         channelProfile: ChannelProfileType.channelProfileLiveBroadcasting,
//       ));
//
//       // Register event handlers
//       _engine.registerEventHandler(RtcEngineEventHandler(
//         onJoinChannelSuccess: (connection, elapsed) {
//           setState(() {
//             isJoined = true;
//             localUid = connection.localUid;
//           });
//           print('Joined channel: ${connection.channelId} with UID: ${connection.localUid}');
//           _startRtmpStream(); // Start RTMP streaming
//         },
//         onUserJoined: (connection, remoteUidParam, elapsed) {
//           setState(() {
//             remoteUid = remoteUidParam;
//           });
//           print('User joined: $remoteUidParam');
//         },
//         onUserOffline: (connection, remoteUidParam, reason) {
//           setState(() {
//             remoteUid = null;
//           });
//           print('User offline: $remoteUidParam');
//         },
//         onError: (errorCode, description) {
//           setState(() {
//             errorMessage = 'Agora SDK Error: $errorCode, Description: $description';
//           });
//           print('Agora SDK Error: $errorCode, Description: $description');
//         },
//       ));
//
//       // Enable video and set the client role to broadcaster
//       await _engine.enableVideo();
//       await _engine.setClientRole(role: ClientRoleType.clientRoleBroadcaster);
//
//       // Join the channel with the provided token
//       await _engine.joinChannel(
//         token: widget.token,
//         channelId: widget.channelName,
//         uid: 0, // 0 lets Agora assign a UID automatically
//         options: const ChannelMediaOptions(
//           clientRoleType: ClientRoleType.clientRoleBroadcaster,
//         ),
//       );
//     } catch (e) {
//       setState(() {
//         errorMessage = 'Failed to initialize Agora SDK: $e';
//       });
//       print('Failed to initialize Agora SDK: $e');
//     }
//   }

// import 'package:flutter/material.dart';
// import 'package:agora_rtc_engine/agora_rtc_engine.dart';
// import 'package:permission_handler/permission_handler.dart';
// import 'package:share_plus/share_plus.dart';
//
// class MeetingPage extends StatefulWidget {
//   final String channelName;
//   final String appId;
//   final String token;
//
//   const MeetingPage({
//     Key? key,
//     required this.channelName,
//     required this.appId,
//     required this.token,
//   }) : super(key: key);
//
//   @override
//   _MeetingPageState createState() => _MeetingPageState();
// }
//
// class _MeetingPageState extends State<MeetingPage> {
//   late final RtcEngine _engine;
//   bool isJoined = false;
//   bool isMuted = false;
//   bool isVideoOff = false;
//   bool isFrontCamera = true;
//   int? localUid;
//   int? remoteUid;
//   String meetingLink = '';
//   String errorMessage = '';
//   final String rtmpUrl = 'rtmp://a.rtmp.youtube.com/live2/YOUR_STREAM_KEY'; // Replace with your RTMP URL
//
//   @override
//   void initState() {
//     super.initState();
//     _initAgora();
//     meetingLink = "https://yourapp.com/join?channelName=${widget.channelName}";
//   }
//
//   Future<void> _initAgora() async {
//     try {
//       // Request camera and microphone permissions
//       var status = await [Permission.camera, Permission.microphone].request();
//       if (status[Permission.camera] != PermissionStatus.granted ||
//           status[Permission.microphone] != PermissionStatus.granted) {
//         setState(() {
//           errorMessage = 'Camera and Microphone permissions are required.';
//         });
//         return;
//       }
//
//       // Initialize the Agora engine
//       _engine = createAgoraRtcEngine();
//       await _engine.initialize(RtcEngineContext(
//         appId: widget.appId,
//         channelProfile: ChannelProfileType.channelProfileLiveBroadcasting,
//       ));
//
//       // Register event handlers
//       _engine.registerEventHandler(RtcEngineEventHandler(
//         onJoinChannelSuccess: (connection, elapsed) {
//           setState(() {
//             isJoined = true;
//             localUid = connection.localUid;
//           });
//           print('Joined channel: ${connection.channelId} with UID: ${connection.localUid}');
//           _startRtmpStream(); // Start RTMP streaming
//         },
//         onUserJoined: (connection, remoteUidParam, elapsed) {
//           setState(() {
//             remoteUid = remoteUidParam;
//           });
//           print('User joined: $remoteUidParam');
//         },
//         onUserOffline: (connection, remoteUidParam, reason) {
//           setState(() {
//             remoteUid = null;
//           });
//           print('User offline: $remoteUidParam');
//         },
//         onError: (errorCode, description) {
//           setState(() {
//             errorMessage = 'Agora SDK Error: $errorCode, Description: $description';
//           });
//           print('Agora SDK Error: $errorCode, Description: $description');
//         },
//       ));
//
//       // Enable video and set the client role to broadcaster
//       await _engine.enableVideo();
//       await _engine.setClientRole(role: ClientRoleType.clientRoleBroadcaster);
//
//       // Join the channel with the provided token
//       await _engine.joinChannel(
//         token: widget.token,
//         channelId: widget.channelName,
//         uid: 0, // 0 lets Agora assign a UID automatically
//         options: const ChannelMediaOptions(
//           clientRoleType: ClientRoleType.clientRoleBroadcaster,
//         ),
//       );
//     } catch (e) {
//       setState(() {
//         errorMessage = 'Failed to initialize Agora SDK: $e';
//       });
//       print('Failed to initialize Agora SDK: $e');
//     }
//   }
//
//   // Share the meeting link
//   void _shareLink() {
//     Share.share(meetingLink, subject: 'Join my meeting');
//   }
//
//   Future<void> _startRtmpStream() async {
//     try {
//       // Set live transcoding configuration and start RTMP stream
//       await _engine.startRtmpStreamWithTranscoding(
//         url: rtmpUrl, // Corrected to use a named parameter for the URL
//         transcoding: LiveTranscoding(
//           width: 1280,
//           height: 720,
//           videoBitrate: 4000,
//           videoFramerate: 30,
//           audioSampleRate: AudioSampleRateType.audioSampleRate48000,
//           audioBitrate: 128,
//           audioChannels: 2,
//           videoGop: 30,
//           videoCodecProfile: VideoCodecProfileType.videoCodecProfileHigh,
//         ),
//       );
//       print('RTMP stream started: $rtmpUrl');
//     } catch (e) {
//       setState(() {
//         errorMessage = 'Failed to start RTMP stream: $e';
//       });
//       print('Failed to start RTMP stream: $e');
//     }
//   }
//
//
//   // Stop RTMP stream
//   Future<void> _stopRtmpStream() async {
//     try {
//       await _engine.stopRtmpStream(rtmpUrl);
//       print('RTMP stream stopped');
//     } catch (e) {
//       setState(() {
//         errorMessage = 'Failed to stop RTMP stream: $e';
//       });
//       print('Failed to stop RTMP stream: $e');
//     }
//   }
//
//   @override
//   void dispose() {
//     _stopRtmpStream(); // Stop RTMP stream when leaving
//     _engine.leaveChannel();
//     _engine.release();
//     super.dispose();
//   }
//
//   // Toggle mute/unmute
//   void _toggleMute() {
//     setState(() {
//       isMuted = !isMuted;
//     });
//     _engine.muteLocalAudioStream(isMuted);
//   }
//
//   // Toggle video on/off
//   void _toggleVideo() {
//     setState(() {
//       isVideoOff = !isVideoOff;
//     });
//     _engine.muteLocalVideoStream(isVideoOff);
//   }
//
//   // Switch between front and rear cameras
//   void _switchCamera() {
//     _engine.switchCamera();
//     setState(() {
//       isFrontCamera = !isFrontCamera;
//     });
//   }
//
//
//
//   // End the meeting with confirmation
//   void _endMeeting() {
//     showDialog(
//       context: context,
//       builder: (BuildContext context) {
//         return AlertDialog(
//           title: const Text('End Meeting'),
//           content: const Text('Are you sure you want to end the meeting? This will also end the live stream if it is ongoing.'),
//           actions: [
//             TextButton(
//               onPressed: () {
//                 Navigator.of(context).pop(); // Close the confirmation dialog
//               },
//               child: const Text('No'),
//             ),
//             TextButton(
//               onPressed: () {
//                 Navigator.of(context).pop(); // Close the confirmation dialog
//                 _quitMeeting(); // Quit meeting after confirmation
//               },
//               child: const Text('Yes'),
//             ),
//           ],
//         );
//       },
//     );
//   }
//
//   // Quit meeting
//   void _quitMeeting() async {
//     try {
//       await _stopRtmpStream(); // Stop RTMP stream before quitting
//     } catch (e) {
//       setState(() {
//         errorMessage = 'Failed to stop RTMP stream: $e';
//       });
//       print('Failed to stop RTMP stream: $e');
//     }
//     await _engine.leaveChannel();
//     Navigator.of(context).pop(); // Close the MeetingPage
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: OrientationBuilder(
//         builder: (context, orientation) {
//           return Stack(
//             children: [
//               _renderRemoteVideo(),
//               if (errorMessage.isNotEmpty)
//                 Positioned(
//                   top: 50,
//                   left: 20,
//                   right: 20,
//                   child: Container(
//                     padding: const EdgeInsets.all(10),
//                     color: Colors.redAccent,
//                     child: Text(
//                       errorMessage,
//                       style: const TextStyle(color: Colors.white),
//                       textAlign: TextAlign.center,
//                     ),
//                   ),
//                 ),
//               _renderLocalVideo(),
//               _toolbar(),
//             ],
//           );
//         },
//       ),
//     );
//   }

// import 'package:flutter/material.dart';
// import 'package:agora_rtc_engine/agora_rtc_engine.dart';
// import 'package:permission_handler/permission_handler.dart';
// import 'package:share_plus/share_plus.dart';
//
// class MeetingPage extends StatefulWidget {
//   final String channelName;
//   final String appId;
//   final String token;
//   final bool isHost; // Flag to determine if this user is the host
//
//   const MeetingPage({
//     Key? key,
//     required this.channelName,
//     required this.appId,
//     required this.token,
//     required this.isHost,
//   }) : super(key: key);
//
//   @override
//   _MeetingPageState createState() => _MeetingPageState();
// }
//
// class _MeetingPageState extends State<MeetingPage> {
//   late final RtcEngine _engine;
//   bool isJoined = false;
//   bool isMuted = false;
//   bool isVideoOff = false;
//   bool isFrontCamera = true;
//   int? localUid;
//   int? remoteUid;
//   String meetingLink = '';
//   String errorMessage = '';
//   final String rtmpUrl = 'rtmp://a.rtmp.youtube.com/live2/YOUR_STREAM_KEY'; // Replace with your RTMP URL
//
//   @override
//   void initState() {
//     super.initState();
//     _initAgora();
//     meetingLink = "https://yourapp.com/join?channelName=${widget.channelName}";
//   }
//
//   Future<void> _initAgora() async {
//     try {
//       // Request camera and microphone permissions
//       var status = await [Permission.camera, Permission.microphone].request();
//       if (status[Permission.camera] != PermissionStatus.granted ||
//           status[Permission.microphone] != PermissionStatus.granted) {
//         setState(() {
//           errorMessage = 'Camera and Microphone permissions are required.';
//         });
//         return;
//       }
//
//       // Initialize the Agora engine
//       _engine = createAgoraRtcEngine();
//       await _engine.initialize(RtcEngineContext(
//         appId: widget.appId,
//         channelProfile: ChannelProfileType.channelProfileLiveBroadcasting,
//       ));
//
//       // Register event handlers
//       _engine.registerEventHandler(RtcEngineEventHandler(
//         onJoinChannelSuccess: (connection, elapsed) {
//           setState(() {
//             isJoined = true;
//             localUid = connection.localUid;
//           });
//           print('Joined channel: ${connection.channelId} with UID: ${connection.localUid}');
//           if (widget.isHost) {
//             _startRtmpStream(); // Start RTMP streaming for the host
//           }
//         },
//         onUserJoined: (connection, remoteUidParam, elapsed) {
//           setState(() {
//             remoteUid = remoteUidParam;
//           });
//           print('User joined: $remoteUidParam');
//         },
//         onUserOffline: (connection, remoteUidParam, reason) {
//           setState(() {
//             remoteUid = null;
//           });
//           print('User offline: $remoteUidParam');
//         },
//         onError: (errorCode, description) {
//           setState(() {
//             errorMessage = 'Agora SDK Error: $errorCode, Description: $description';
//           });
//           print('Agora SDK Error: $errorCode, Description: $description');
//         },
//       ));
//
//       // Enable video and set the client role based on whether this user is a host or audience
//       await _engine.enableVideo();
//       if (widget.isHost) {
//         await _engine.setClientRole(role: ClientRoleType.clientRoleBroadcaster);
//       } else {
//         await _engine.setClientRole(role: ClientRoleType.clientRoleAudience);
//       }
//
//       // Join the channel with the provided token
//       await _engine.joinChannel(
//         token: widget.token,
//         channelId: widget.channelName,
//         uid: 0, // 0 lets Agora assign a UID automatically
//         options: ChannelMediaOptions(
//           clientRoleType: widget.isHost
//               ? ClientRoleType.clientRoleBroadcaster
//               : ClientRoleType.clientRoleAudience,
//         ),
//       );
//     } catch (e) {
//       setState(() {
//         errorMessage = 'Failed to initialize Agora SDK: $e';
//       });
//       print('Failed to initialize Agora SDK: $e');
//     }
//   }
//
//   // Share the meeting link
//   void _shareLink() {
//     Share.share(meetingLink, subject: 'Join my meeting');
//   }
//
//   Future<void> _startRtmpStream() async {
//     try {
//       // Set live transcoding configuration and start RTMP stream
//       await _engine.startRtmpStreamWithTranscoding(
//         url: rtmpUrl,
//         transcoding: LiveTranscoding(
//           width: 1280,
//           height: 720,
//           videoBitrate: 4000,
//           videoFramerate: 30,
//           audioSampleRate: AudioSampleRateType.audioSampleRate48000,
//           audioBitrate: 128,
//           audioChannels: 2,
//           videoGop: 30,
//           videoCodecProfile: VideoCodecProfileType.videoCodecProfileHigh,
//         ),
//       );
//       print('RTMP stream started: $rtmpUrl');
//     } catch (e) {
//       setState(() {
//         errorMessage = 'Failed to start RTMP stream: $e';
//       });
//       print('Failed to start RTMP stream: $e');
//     }
//   }
//
//   // Stop RTMP stream
//   Future<void> _stopRtmpStream() async {
//     try {
//       await _engine.stopRtmpStream(rtmpUrl);
//       print('RTMP stream stopped');
//     } catch (e) {
//       setState(() {
//         errorMessage = 'Failed to stop RTMP stream: $e';
//       });
//       print('Failed to stop RTMP stream: $e');
//     }
//   }
//
//   @override
//   void dispose() {
//     if (widget.isHost) {
//       _stopRtmpStream(); // Stop RTMP stream when leaving if the user is the host
//     }
//     _engine.leaveChannel();
//     _engine.release();
//     super.dispose();
//   }
//
//   // Toggle mute/unmute
//   void _toggleMute() {
//     setState(() {
//       isMuted = !isMuted;
//     });
//     _engine.muteLocalAudioStream(isMuted);
//   }
//
//   // Toggle video on/off
//   void _toggleVideo() {
//     setState(() {
//       isVideoOff = !isVideoOff;
//     });
//     _engine.muteLocalVideoStream(isVideoOff);
//   }
//
//   // Switch between front and rear cameras
//   void _switchCamera() {
//     _engine.switchCamera();
//     setState(() {
//       isFrontCamera = !isFrontCamera;
//     });
//   }
//
//   // End the meeting with confirmation
//   void _endMeeting() {
//     showDialog(
//       context: context,
//       builder: (BuildContext context) {
//         return AlertDialog(
//           title: const Text('End Meeting'),
//           content: const Text('Are you sure you want to end the meeting? This will also end the live stream if it is ongoing.'),
//           actions: [
//             TextButton(
//               onPressed: () {
//                 Navigator.of(context).pop(); // Close the confirmation dialog
//               },
//               child: const Text('No'),
//             ),
//             TextButton(
//               onPressed: () {
//                 Navigator.of(context).pop(); // Close the confirmation dialog
//                 _quitMeeting(); // Quit meeting after confirmation
//               },
//               child: const Text('Yes'),
//             ),
//           ],
//         );
//       },
//     );
//   }
//
//   // Quit meeting
//   void _quitMeeting() async {
//     if (widget.isHost) {
//       await _stopRtmpStream(); // Stop RTMP stream before quitting if the user is the host
//     }
//     await _engine.leaveChannel();
//     Navigator.of(context).pop(); // Close the MeetingPage
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: OrientationBuilder(
//         builder: (context, orientation) {
//           return Stack(
//             children: [
//               _renderRemoteVideo(),
//               if (errorMessage.isNotEmpty)
//                 Positioned(
//                   top: 50,
//                   left: 20,
//                   right: 20,
//                   child: Container(
//                     padding: const EdgeInsets.all(10),
//                     color: Colors.redAccent,
//                     child: Text(
//                       errorMessage,
//                       style: const TextStyle(color: Colors.white),
//                       textAlign: TextAlign.center,
//                     ),
//                   ),
//                 ),
//               _renderLocalVideo(),
//               _toolbar(),
//             ],
//           );
//         },
//       ),
//     );
//   }
//
//   // The rest of the code remains unchanged
//
//
//   // Render Remote Video
//   Widget _renderRemoteVideo() {
//     if (remoteUid != null) {
//       return AgoraVideoView(
//         controller: VideoViewController.remote(
//           rtcEngine: _engine,
//           canvas: VideoCanvas(uid: remoteUid),
//           connection: RtcConnection(channelId: widget.channelName),
//         ),
//       );
//     } else {
//       return Container(
//         color: Colors.black,
//         child: const Center(
//           child: Text(
//             'Waiting for other participants...',
//             style: TextStyle(color: Colors.white, fontSize: 18),
//           ),
//         ),
//       );
//     }
//   }
//
//   // Render Local Video
//   Widget _renderLocalVideo() {
//     if (isVideoOff) {
//       return SizedBox.shrink();
//     }
//
//     return Positioned(
//       top: 40,
//       right: 20,
//       width: 120,
//       height: 160,
//       child: Container(
//         decoration: BoxDecoration(
//           border: Border.all(color: Colors.white),
//           borderRadius: BorderRadius.circular(8),
//         ),
//         child: localUid != null
//             ? AgoraVideoView(
//           controller: VideoViewController(
//             rtcEngine: _engine,
//             canvas: VideoCanvas(uid: 0),
//           ),
//         )
//             : const Center(
//           child: CircularProgressIndicator(),
//         ),
//       ),
//     );
//   }
//
//   // Render Toolbar
//   Widget _toolbar() {
//     return Align(
//       alignment: Alignment.bottomLeft,
//       child: Padding(
//         padding: const EdgeInsets.fromLTRB(10.0, 0.0, 10.0, 20.0),
//         child: Container(
//           padding: const EdgeInsets.symmetric(horizontal: 10.0, vertical: 10.0),
//           decoration: BoxDecoration(
//             color: Colors.black54,
//             borderRadius: BorderRadius.circular(30.0),
//           ),
//           child: SingleChildScrollView(
//             scrollDirection: Axis.horizontal,
//             child: Row(
//               mainAxisSize: MainAxisSize.min,
//               children: [
//                 _buildToolbarButton(
//                   icon: isMuted ? Icons.mic_off : Icons.mic,
//                   color: isMuted ? Colors.white : Colors.blue,
//                   backgroundColor: isMuted ? Colors.blue : Colors.white,
//                   onPressed: _toggleMute,
//                 ),
//                 const SizedBox(width: 10),
//                 _buildToolbarButton(
//                   icon: Icons.call_end,
//                   color: Colors.white,
//                   backgroundColor: Colors.redAccent,
//                   onPressed: _endMeeting,
//                   size: 30.0,
//                 ),
//                 const SizedBox(width: 10),
//                 _buildToolbarButton(
//                   icon: isVideoOff ? Icons.videocam_off : Icons.videocam,
//                   color: isVideoOff ? Colors.white : Colors.blue,
//                   backgroundColor: isVideoOff ? Colors.blue : Colors.white,
//                   onPressed: _toggleVideo,
//                 ),
//                 const SizedBox(width: 10),
//                 _buildToolbarButton(
//                   icon: Icons.switch_camera,
//                   color: Colors.blue,
//                   backgroundColor: Colors.white,
//                   onPressed: _switchCamera,
//                 ),
//                 const SizedBox(width: 10),
//                 _buildToolbarButton(
//                   icon: Icons.link,
//                   color: Colors.blue,
//                   backgroundColor: Colors.white,
//                   onPressed: _shareLink,
//                 ),
//               ],
//             ),
//           ),
//         ),
//       ),
//     );
//   }
//
//   // Helper method for Toolbar Buttons
//   Widget _buildToolbarButton({
//     required IconData icon,
//     required Color color,
//     required Color backgroundColor,
//     VoidCallback? onPressed,
//     double size = 20.0,
//   }) {
//     return RawMaterialButton(
//       onPressed: onPressed,
//       child: Icon(
//         icon,
//         color: color,
//         size: size,
//       ),
//       shape: const CircleBorder(),
//       elevation: 2.0,
//       fillColor: backgroundColor,
//       padding: const EdgeInsets.all(12.0),
//     );
//   }
// }
//
import 'package:flutter/material.dart';
import 'package:agora_rtc_engine/agora_rtc_engine.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:share_plus/share_plus.dart';

class StudentLiveStreamPage extends StatefulWidget {
  final String channelName;
  final String appId;
  final String token;

  const StudentLiveStreamPage({
    Key? key,
    required this.channelName,
    required this.appId,
    required this.token,
  }) : super(key: key);

  @override
  _StudentLiveStreamPageState createState() => _StudentLiveStreamPageState();
}

class _StudentLiveStreamPageState extends State<StudentLiveStreamPage> {
  late final RtcEngine _engine;
  bool isJoined = false;
  bool isMuted = false;
  bool isVideoOff = false;
  bool isFrontCamera = true;
  int? localUid;
  int? remoteUid;
  String meetingLink = '';
  String errorMessage = '';
  final String rtmpUrl = 'rtmp://a.rtmp.youtube.com/live2/YOUR_STREAM_KEY'; // Replace with your RTMP URL

  @override
  void initState() {
    super.initState();
    _initAgora();
    meetingLink = "https://yourapp.meet/${widget.channelName}";
  }

  Future<void> _initAgora() async {
    try {
      // Request camera and microphone permissions
      var status = await [Permission.camera, Permission.microphone].request();
      if (status[Permission.camera] != PermissionStatus.granted ||
          status[Permission.microphone] != PermissionStatus.granted) {
        setState(() {
          errorMessage = 'Camera and Microphone permissions are required.';
        });
        return;
      }

      // Initialize the Agora engine
      _engine = createAgoraRtcEngine();
      await _engine.initialize(RtcEngineContext(
        appId: widget.appId,
        channelProfile: ChannelProfileType.channelProfileLiveBroadcasting,
      ));

      // Register event handlers
      _engine.registerEventHandler(RtcEngineEventHandler(
        onJoinChannelSuccess: (connection, elapsed) {
          setState(() {
            isJoined = true;
            localUid = connection.localUid;
          });
          print('Joined channel: ${connection.channelId} with UID: ${connection.localUid}');
          _startRtmpStream(); // Start RTMP streaming
        },
        onUserJoined: (connection, remoteUidParam, elapsed) {
          setState(() {
            remoteUid = remoteUidParam;
          });
          print('User joined: $remoteUidParam');
        },
        onUserOffline: (connection, remoteUidParam, reason) {
          setState(() {
            remoteUid = null;
          });
          print('User offline: $remoteUidParam');
        },
        onError: (errorCode, description) {
          setState(() {
            errorMessage = 'Agora SDK Error: $errorCode, Description: $description';
          });
          print('Agora SDK Error: $errorCode, Description: $description');
        },
      ));

      // Enable video and set the client role to broadcaster
      await _engine.enableVideo();
      await _engine.setClientRole(role: ClientRoleType.clientRoleBroadcaster);

      // Join the channel with the provided token
      await _engine.joinChannel(
        token: widget.token,
        channelId: widget.channelName,
        uid: 0, // 0 lets Agora assign a UID automatically
        options: const ChannelMediaOptions(
          clientRoleType: ClientRoleType.clientRoleBroadcaster,
        ),
      );
    } catch (e) {
      setState(() {
        errorMessage = 'Failed to initialize Agora SDK: $e';
      });
      print('Failed to initialize Agora SDK: $e');
    }
  }

  // Start RTMP stream
  // Start RTMP stream
  Future<void> _startRtmpStream() async {
    try {
      // Create the transcoding configuration
      LiveTranscoding transcoding = LiveTranscoding(
        width: 1280,
        height: 720,
        videoBitrate: 4000,
        videoFramerate: 30,
        audioSampleRate: AudioSampleRateType.audioSampleRate48000,
        audioBitrate: 128,
        audioChannels: 2,
        videoGop: 30,
        videoCodecProfile: VideoCodecProfileType.videoCodecProfileHigh,
      );

      // Start RTMP stream with the URL and transcoding configuration
      await _engine.startRtmpStreamWithTranscoding(
        url: rtmpUrl,
        transcoding: transcoding,
      );

      print('RTMP stream started: $rtmpUrl');
    } catch (e) {
      setState(() {
        errorMessage = 'Failed to start RTMP stream: $e';
      });
      print('Failed to start RTMP stream: $e');
    }
  }
  // Stop RTMP stream
  Future<void> _stopRtmpStream() async {
    try {
      await _engine.stopRtmpStream(rtmpUrl);
      print('RTMP stream stopped');
    } catch (e) {
      setState(() {
        errorMessage = 'Failed to stop RTMP stream: $e';
      });
      print('Failed to stop RTMP stream: $e');
    }
  }

  @override
  void dispose() {
    _stopRtmpStream(); // Stop RTMP stream when leaving
    _engine.leaveChannel();
    _engine.release();
    super.dispose();
  }

  // Toggle mute/unmute
  void _toggleMute() {
    setState(() {
      isMuted = !isMuted;
    });
    _engine.muteLocalAudioStream(isMuted);
  }

  // Toggle video on/off
  void _toggleVideo() {
    setState(() {
      isVideoOff = !isVideoOff;
    });
    _engine.muteLocalVideoStream(isVideoOff);
  }

  // Switch between front and rear cameras
  void _switchCamera() {
    _engine.switchCamera();
    setState(() {
      isFrontCamera = !isFrontCamera;
    });
  }

  // Share the meeting link
  void _shareLink() {
    Share.share(meetingLink, subject: 'Join my meeting');
  }

  // End the meeting with confirmation
  void _endMeeting() {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text('End Meeting'),
          content: const Text('Are you sure you want to end the meeting? This will also end the live stream if it is ongoing.'),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.of(context).pop(); // Close the confirmation dialog
              },
              child: const Text('No'),
            ),
            TextButton(
              onPressed: () {
                Navigator.of(context).pop(); // Close the confirmation dialog
                _quitMeeting(); // Quit meeting after confirmation
              },
              child: const Text('Yes'),
            ),
          ],
        );
      },
    );
  }

  // Quit meeting
  void _quitMeeting() async {
    try {
      await _stopRtmpStream(); // Stop RTMP stream before quitting
    } catch (e) {
      setState(() {
        errorMessage = 'Failed to stop RTMP stream: $e';
      });
      print('Failed to stop RTMP stream: $e');
    }
    await _engine.leaveChannel();
    Navigator.of(context).pop(); // Close the MeetingPage
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: OrientationBuilder(
        builder: (context, orientation) {
          return Stack(
            children: [
              _renderRemoteVideo(),
              if (errorMessage.isNotEmpty)
                Positioned(
                  top: 50,
                  left: 20,
                  right: 20,
                  child: Container(
                    padding: const EdgeInsets.all(10),
                    color: Colors.redAccent,
                    child: Text(
                      errorMessage,
                      style: const TextStyle(color: Colors.white),
                      textAlign: TextAlign.center,
                    ),
                  ),
                ),
              _renderLocalVideo(),
              _toolbar(),
            ],
          );
        },
      ),
    );
  }

  // Render Remote Video
  Widget _renderRemoteVideo() {
    if (remoteUid != null) {
      return AgoraVideoView(
        controller: VideoViewController.remote(
          rtcEngine: _engine,
          canvas: VideoCanvas(uid: remoteUid),
          connection: RtcConnection(channelId: widget.channelName),
        ),
      );
    } else {
      return Container(
        color: Colors.black,
        child: const Center(
          child: Text(
            'Waiting for other participants...',
            style: TextStyle(color: Colors.white, fontSize: 18),
          ),
        ),
      );
    }
  }

  // Render Local Video
  Widget _renderLocalVideo() {
    if (isVideoOff) {
      return SizedBox.shrink();
    }

    return Positioned(
      top: 40,
      right: 20,
      width: 120,
      height: 160,
      child: Container(
        decoration: BoxDecoration(
          border: Border.all(color: Colors.white),
          borderRadius: BorderRadius.circular(8),
        ),
        child: localUid != null
            ? AgoraVideoView(
          controller: VideoViewController(
            rtcEngine: _engine,
            canvas: VideoCanvas(uid: 0),
          ),
        )
            : const Center(
          child: CircularProgressIndicator(),
        ),
      ),
    );
  }

  // Render Toolbar
  Widget _toolbar() {
    return Align(
      alignment: Alignment.bottomLeft,
      child: Padding(
        padding: const EdgeInsets.fromLTRB(10.0, 0.0, 10.0, 20.0),
        child: Container(
          padding: const EdgeInsets.symmetric(horizontal: 10.0, vertical: 10.0),
          decoration: BoxDecoration(
            color: Colors.black54,
            borderRadius: BorderRadius.circular(30.0),
          ),
          child: SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                _buildToolbarButton(
                  icon: isMuted ? Icons.mic_off : Icons.mic,
                  color: isMuted ? Colors.white : Colors.blue,
                  backgroundColor: isMuted ? Colors.blue : Colors.white,
                  onPressed: _toggleMute,
                ),
                const SizedBox(width: 10),
                _buildToolbarButton(
                  icon: Icons.call_end,
                  color: Colors.white,
                  backgroundColor: Colors.redAccent,
                  onPressed: _endMeeting,
                  size: 30.0,
                ),
                const SizedBox(width: 10),
                _buildToolbarButton(
                  icon: isVideoOff ? Icons.videocam_off : Icons.videocam,
                  color: isVideoOff ? Colors.white : Colors.blue,
                  backgroundColor: isVideoOff ? Colors.blue : Colors.white,
                  onPressed: _toggleVideo,
                ),
                const SizedBox(width: 10),
                _buildToolbarButton(
                  icon: Icons.switch_camera,
                  color: Colors.blue,
                  backgroundColor: Colors.white,
                  onPressed: _switchCamera,
                ),
                const SizedBox(width: 10),
                _buildToolbarButton(
                  icon: Icons.link,
                  color: Colors.blue,
                  backgroundColor: Colors.white,
                  onPressed: _shareLink,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  // Helper method for Toolbar Buttons
  Widget _buildToolbarButton({
    required IconData icon,
    required Color color,
    required Color backgroundColor,
    VoidCallback? onPressed,
    double size = 20.0,
  }) {
    return RawMaterialButton(
      onPressed: onPressed,
      child: Icon(
        icon,
        color: color,
        size: size,
      ),
      shape: const CircleBorder(),
      elevation: 2.0,
      fillColor: backgroundColor,
      padding: const EdgeInsets.all(12.0),
    );
  }
}

// lib/pages/student/student_live_stream_page.dart

// import 'package:flutter/material.dart';
// import 'package:agora_rtc_engine/agora_rtc_engine.dart';
// import 'package:permission_handler/permission_handler.dart';
//
// class StudentLiveStreamPage extends StatefulWidget {
//   final String channelName;
//   final String appId;
//   final String token;
//
//   const StudentLiveStreamPage({
//     Key? key,
//     required this.channelName,
//     required this.appId,
//     required this.token,
//   }) : super(key: key);
//
//   @override
//   _StudentLiveStreamPageState createState() => _StudentLiveStreamPageState();
// }
//
// class _StudentLiveStreamPageState extends State<StudentLiveStreamPage> {
//   late final RtcEngine _engine;
//   bool isJoined = false;
//   int? remoteUid;
//   String errorMessage = '';
//
//   @override
//   void initState() {
//     super.initState();
//     _initAgora();
//   }
//
//   Future<void> _initAgora() async {
//     try {
//       // Request camera and microphone permissions (optional for audience)
//       var status = await [Permission.microphone].request();
//       if (status[Permission.microphone] != PermissionStatus.granted) {
//         setState(() {
//           errorMessage = 'Microphone permission is required.';
//         });
//         return;
//       }
//
//       // Initialize the Agora engine
//       _engine = createAgoraRtcEngine();
//       await _engine.initialize(RtcEngineContext(
//         appId: widget.appId,
//         channelProfile: ChannelProfileType.channelProfileLiveBroadcasting,
//       ));
//
//       // Register event handlers
//       _engine.registerEventHandler(RtcEngineEventHandler(
//         onJoinChannelSuccess: (connection, elapsed) {
//           setState(() {
//             isJoined = true;
//           });
//           print(
//               'Joined channel: ${connection.channelId} with UID: ${connection.localUid}');
//         },
//         onUserJoined: (connection, remoteUidParam, elapsed) {
//           setState(() {
//             remoteUid = remoteUidParam;
//           });
//           print('User joined: $remoteUidParam');
//         },
//         onUserOffline: (connection, remoteUidParam, reason) {
//           setState(() {
//             remoteUid = null;
//           });
//           print('User offline: $remoteUidParam');
//         },
//         onError: (errorCode, description) {
//           setState(() {
//             errorMessage =
//             'Agora SDK Error: $errorCode, Description: $description';
//           });
//           print('Agora SDK Error: $errorCode, Description: $description');
//         },
//       ));
//
//       // Enable audio only, since audience doesn't need to send video
//       await _engine.enableAudio();
//
//       // Set client role to audience
//       await _engine.setClientRole(role: ClientRoleType.clientRoleAudience);
//
//       // Join the channel
//       await _engine.joinChannel(
//         token: widget.token,
//         channelId: widget.channelName,
//         uid: 0, // 0 lets Agora assign a UID automatically
//         options: const ChannelMediaOptions(
//           clientRoleType: ClientRoleType.clientRoleAudience,
//         ),
//       );
//     } catch (e) {
//       setState(() {
//         errorMessage = 'Failed to initialize Agora SDK: $e';
//       });
//       print('Failed to initialize Agora SDK: $e');
//     }
//   }
//
//   @override
//   void dispose() {
//     _engine.leaveChannel();
//     _engine.release();
//     super.dispose();
//   }
//
//   // Toggle mute/unmute (audience can mute their microphone)
//   void _toggleMute() {
//     _engine.muteLocalAudioStream(!isJoined);
//     setState(() {
//       // Toggle state based on mute action
//     });
//   }
//
//   // End the meeting with confirmation
//   void _endMeeting() {
//     showDialog(
//       context: context,
//       builder: (BuildContext context) {
//         return AlertDialog(
//           title: const Text('Leave Meeting'),
//           content: const Text(
//               'Are you sure you want to leave the meeting?'),
//           actions: [
//             TextButton(
//               onPressed: () {
//                 Navigator.of(context).pop(); // Close the confirmation dialog
//               },
//               child: const Text('No'),
//             ),
//             TextButton(
//               onPressed: () {
//                 Navigator.of(context).pop(); // Close the confirmation dialog
//                 _quitMeeting(); // Quit meeting after confirmation
//               },
//               child: const Text('Yes'),
//             ),
//           ],
//         );
//       },
//     );
//   }
//
//   // Quit meeting
//   void _quitMeeting() {
//     _engine.leaveChannel();
//     Navigator.of(context).pop(); // Exit the live stream page
//   }
//
//   // Share the meeting link (removed as per requirement)
//   // void _shareLink() {
//   //   Share.share(meetingLink, subject: 'Join my meeting');
//   // }
//
//   // Render Remote Video (the broadcaster's video)
//   Widget _renderRemoteVideo() {
//     if (remoteUid != null) {
//       return AgoraVideoView(
//         controller: VideoViewController.remote(
//           rtcEngine: _engine,
//           canvas: VideoCanvas(uid: remoteUid),
//           connection: RtcConnection(channelId: widget.channelName),
//         ),
//       );
//     } else {
//       return Container(
//         color: Colors.black,
//         child: const Center(
//           child: Text(
//             'Waiting for the tutor to join...',
//             style: TextStyle(color: Colors.white, fontSize: 18),
//           ),
//         ),
//       );
//     }
//   }
//
//   // Render Toolbar (without share button)
//   Widget _toolbar() {
//     return Align(
//       alignment: Alignment.bottomLeft,
//       child: Padding(
//         padding: const EdgeInsets.fromLTRB(10.0, 0.0, 10.0, 20.0),
//         child: Container(
//           padding:
//           const EdgeInsets.symmetric(horizontal: 10.0, vertical: 10.0),
//           decoration: BoxDecoration(
//             color: Colors.black54,
//             borderRadius: BorderRadius.circular(30.0),
//           ),
//           child: Row(
//             mainAxisSize: MainAxisSize.min,
//             children: [
//               _buildToolbarButton(
//                 icon: Icons.mic_off,
//                 color: Colors.white,
//                 backgroundColor: Colors.blue,
//                 onPressed: _toggleMute,
//               ),
//               const SizedBox(width: 10),
//               _buildToolbarButton(
//                 icon: Icons.call_end,
//                 color: Colors.white,
//                 backgroundColor: Colors.redAccent,
//                 onPressed: _endMeeting,
//               ),
//             ],
//           ),
//         ),
//       ),
//     );
//   }
//
//   // Helper method for Toolbar Buttons
//   Widget _buildToolbarButton({
//     required IconData icon,
//     required Color color,
//     required Color backgroundColor,
//     VoidCallback? onPressed,
//     double size = 20.0,
//   }) {
//     return RawMaterialButton(
//       onPressed: onPressed,
//       child: Icon(
//         icon,
//         color: color,
//         size: size,
//       ),
//       shape: const CircleBorder(),
//       elevation: 2.0,
//       fillColor: backgroundColor,
//       padding: const EdgeInsets.all(12.0),
//     );
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: const Text('Live Stream'),
//         backgroundColor: Colors.blue,
//       ),
//       body: Stack(
//         children: [
//           _renderRemoteVideo(),
//           if (errorMessage.isNotEmpty)
//             Positioned(
//               top: 50,
//               left: 20,
//               right: 20,
//               child: Container(
//                 padding: const EdgeInsets.all(10),
//                 color: Colors.redAccent,
//                 child: Text(
//                   errorMessage,
//                   style: const TextStyle(color: Colors.white),
//                   textAlign: TextAlign.center,
//                 ),
//               ),
//             ),
//           _toolbar(),
//         ],
//       ),
//     );
//   }
// }

// lib/pages/student/student_live_stream_page.dart

// import 'package:flutter/material.dart';
// import 'package:agora_rtc_engine/agora_rtc_engine.dart';
// import 'package:permission_handler/permission_handler.dart';
//
// class StudentLiveStreamPage extends StatefulWidget {
//   final String channelName;
//   final String appId;
//   final String token;
//
//   const StudentLiveStreamPage({
//     Key? key,
//     required this.channelName,
//     required this.appId,
//     required this.token,
//   }) : super(key: key);
//
//   @override
//   _StudentLiveStreamPageState createState() => _StudentLiveStreamPageState();
// }
//
// class _StudentLiveStreamPageState extends State<StudentLiveStreamPage> {
//   late final RtcEngine _engine;
//   bool isJoined = false;
//   bool isMuted = false;
//   bool isVideoOff = false;
//   bool isFrontCamera = true;
//   int? localUid;
//   int? remoteUid;
//   String errorMessage = '';
//
//   @override
//   void initState() {
//     super.initState();
//     _initAgora();
//   }
//
//   Future<void> _initAgora() async {
//     try {
//       // Request camera and microphone permissions
//       var status = await [Permission.camera, Permission.microphone].request();
//       if (status[Permission.camera] != PermissionStatus.granted ||
//           status[Permission.microphone] != PermissionStatus.granted) {
//         setState(() {
//           errorMessage = 'Camera and Microphone permissions are required.';
//         });
//         return;
//       }
//
//       // Initialize the Agora engine
//       _engine = createAgoraRtcEngine();
//       await _engine.initialize(RtcEngineContext(
//         appId: widget.appId,
//         channelProfile: ChannelProfileType.channelProfileLiveBroadcasting,
//       ));
//
//       // Register event handlers
//       _engine.registerEventHandler(RtcEngineEventHandler(
//         onJoinChannelSuccess: (connection, elapsed) {
//           setState(() {
//             isJoined = true;
//             localUid = connection.localUid;
//           });
//           print(
//               'Joined channel: ${connection.channelId} with UID: ${connection.localUid}');
//         },
//         onUserJoined: (connection, remoteUidParam, elapsed) {
//           setState(() {
//             remoteUid = remoteUidParam;
//           });
//           print('User joined: $remoteUidParam');
//         },
//         onUserOffline: (connection, remoteUidParam, reason) {
//           setState(() {
//             remoteUid = null;
//           });
//           print('User offline: $remoteUidParam');
//         },
//         onError: (errorCode, description) {
//           setState(() {
//             errorMessage =
//             'Agora SDK Error: $errorCode, Description: $description';
//           });
//           print('Agora SDK Error: $errorCode, Description: $description');
//         },
//       ));
//
//       // Enable video and set the client role to broadcaster
//       await _engine.enableVideo();
//       await _engine.setClientRole(role: ClientRoleType.clientRoleBroadcaster);
//
//       // Join the channel with the provided token
//       await _engine.joinChannel(
//         token: widget.token,
//         channelId: widget.channelName,
//         uid: 0, // 0 lets Agora assign a UID automatically
//         options: const ChannelMediaOptions(
//           clientRoleType: ClientRoleType.clientRoleBroadcaster,
//         ),
//       );
//     } catch (e) {
//       setState(() {
//         errorMessage = 'Failed to initialize Agora SDK: $e';
//       });
//       print('Failed to initialize Agora SDK: $e');
//     }
//   }
//
//   @override
//   void dispose() {
//     _engine.leaveChannel();
//     _engine.release();
//     super.dispose();
//   }
//
//   // Toggle mute/unmute
//   void _toggleMute() {
//     setState(() {
//       isMuted = !isMuted;
//     });
//     _engine.muteLocalAudioStream(isMuted);
//   }
//
//   // Toggle video on/off
//   void _toggleVideo() {
//     setState(() {
//       isVideoOff = !isVideoOff;
//     });
//     _engine.muteLocalVideoStream(isVideoOff);
//   }
//
//   // Switch between front and rear cameras
//   void _switchCamera() {
//     _engine.switchCamera();
//     setState(() {
//       isFrontCamera = !isFrontCamera;
//     });
//   }
//
//   // End the meeting with confirmation
//   void _endMeeting() {
//     showDialog(
//       context: context,
//       builder: (BuildContext context) {
//         return AlertDialog(
//           title: const Text('End Meeting'),
//           content: const Text(
//               'Are you sure you want to end the meeting? This will also end the live stream if it is ongoing.'),
//           actions: [
//             TextButton(
//               child: const Text(
//                 'No',
//                 style: TextStyle(color: Colors.blue),
//               ),
//               onPressed: () {
//                 Navigator.of(context).pop(); // Close the dialog
//               },
//             ),
//             TextButton(
//               child: const Text(
//                 'Yes',
//                 style: TextStyle(color: Colors.red),
//               ),
//               onPressed: () {
//                 Navigator.of(context).pop(); // Close the dialog
//                 _quitMeeting(); // Quit meeting after confirmation
//               },
//             ),
//           ],
//         );
//       },
//     );
//   }
//
//   // Quit meeting
//   void _quitMeeting() async {
//     await _engine.leaveChannel();
//     Navigator.of(context).pop(); // Exit the live stream page
//   }
//
//   // Render Remote Video (Tutor's video)
//   Widget _renderRemoteVideo() {
//     if (remoteUid != null) {
//       return AgoraVideoView(
//         controller: VideoViewController.remote(
//           rtcEngine: _engine,
//           canvas: VideoCanvas(uid: remoteUid),
//           connection: RtcConnection(channelId: widget.channelName),
//         ),
//       );
//     } else {
//       return Container(
//         color: Colors.black,
//         child: const Center(
//           child: Text(
//             'Waiting for the tutor to join...',
//             style: TextStyle(color: Colors.white, fontSize: 18),
//           ),
//         ),
//       );
//     }
//   }
//
//   // Render Local Video (Student's video) as overlay
//   Widget _renderLocalVideo() {
//     if (isVideoOff) {
//       return SizedBox.shrink();
//     }
//
//     return Positioned(
//       top: 40,
//       right: 20,
//       width: 120,
//       height: 160,
//       child: Container(
//         decoration: BoxDecoration(
//           border: Border.all(color: Colors.white),
//           borderRadius: BorderRadius.circular(8),
//         ),
//         child: localUid != null
//             ? AgoraVideoView(
//           controller: VideoViewController(
//             rtcEngine: _engine,
//             canvas: VideoCanvas(uid: 0),
//           ),
//         )
//             : const Center(
//           child: CircularProgressIndicator(),
//         ),
//       ),
//     );
//   }
//
//   // Render Toolbar (without share button)
//   Widget _toolbar() {
//     return Align(
//       alignment: Alignment.bottomLeft,
//       child: Padding(
//         padding: const EdgeInsets.fromLTRB(10.0, 0.0, 10.0, 20.0),
//         child: Container(
//           padding:
//           const EdgeInsets.symmetric(horizontal: 10.0, vertical: 10.0),
//           decoration: BoxDecoration(
//             color: Colors.black54,
//             borderRadius: BorderRadius.circular(30.0),
//           ),
//           child: Row(
//             mainAxisSize: MainAxisSize.min,
//             children: [
//               _buildToolbarButton(
//                 icon: isMuted ? Icons.mic_off : Icons.mic,
//                 color: isMuted ? Colors.white : Colors.blue,
//                 backgroundColor: isMuted ? Colors.blue : Colors.white,
//                 onPressed: _toggleMute,
//               ),
//               const SizedBox(width: 10),
//               _buildToolbarButton(
//                 icon: Icons.call_end,
//                 color: Colors.white,
//                 backgroundColor: Colors.redAccent,
//                 onPressed: _endMeeting,
//                 size: 30.0,
//               ),
//               const SizedBox(width: 10),
//               _buildToolbarButton(
//                 icon: isVideoOff ? Icons.videocam_off : Icons.videocam,
//                 color: isVideoOff ? Colors.white : Colors.blue,
//                 backgroundColor: isVideoOff ? Colors.blue : Colors.white,
//                 onPressed: _toggleVideo,
//               ),
//               const SizedBox(width: 10),
//               _buildToolbarButton(
//                 icon: Icons.switch_camera,
//                 color: Colors.blue,
//                 backgroundColor: Colors.white,
//                 onPressed: _switchCamera,
//               ),
//             ],
//           ),
//         ),
//       ),
//     );
//   }
//
//   // Helper method for Toolbar Buttons
//   Widget _buildToolbarButton({
//     required IconData icon,
//     required Color color,
//     required Color backgroundColor,
//     VoidCallback? onPressed,
//     double size = 20.0,
//   }) {
//     return RawMaterialButton(
//       onPressed: onPressed,
//       child: Icon(
//         icon,
//         color: color,
//         size: size,
//       ),
//       shape: const CircleBorder(),
//       elevation: 2.0,
//       fillColor: backgroundColor,
//       padding: const EdgeInsets.all(12.0),
//     );
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: const Text('Live Stream'),
//         backgroundColor: Colors.blue,
//       ),
//       body: Stack(
//         children: [
//           // Full-screen Tutor Video
//           _renderRemoteVideo(),
//
//           // Student's Video Overlay
//           _renderLocalVideo(),
//
//           // Error Message Display
//           if (errorMessage.isNotEmpty)
//             Positioned(
//               top: 50,
//               left: 20,
//               right: 20,
//               child: Container(
//                 padding: const EdgeInsets.all(10),
//                 color: Colors.redAccent,
//                 child: Text(
//                   errorMessage,
//                   style: const TextStyle(color: Colors.white),
//                   textAlign: TextAlign.center,
//                 ),
//               ),
//             ),
//
//           // Toolbar
//           _toolbar(),
//         ],
//       ),
//     );
//   }
// }

// lib/pages/student/student_live_stream_page.dart
//
// import 'package:flutter/material.dart';
// import 'package:agora_rtc_engine/agora_rtc_engine.dart';
// import 'package:permission_handler/permission_handler.dart';
//
// class StudentLiveStreamPage extends StatefulWidget {
//   final String channelName;
//   final String appId;
//   final String token;
//
//   const StudentLiveStreamPage({
//     Key? key,
//     required this.channelName,
//     required this.appId,
//     required this.token,
//   }) : super(key: key);
//
//   @override
//   _StudentLiveStreamPageState createState() => _StudentLiveStreamPageState();
// }
//
// class _StudentLiveStreamPageState extends State<StudentLiveStreamPage> {
//   late final RtcEngine _engine;
//   bool isJoined = false;
//   bool isMuted = false;
//   bool isVideoOff = false;
//   bool isFrontCamera = true;
//   int? localUid;
//   int? remoteUid;
//   String errorMessage = '';
//
//   @override
//   void initState() {
//     super.initState();
//     _initAgora();
//   }
//
//   Future<void> _initAgora() async {
//     try {
//       // Request camera and microphone permissions
//       var status = await [Permission.camera, Permission.microphone].request();
//       if (status[Permission.camera] != PermissionStatus.granted ||
//           status[Permission.microphone] != PermissionStatus.granted) {
//         setState(() {
//           errorMessage = 'Camera and Microphone permissions are required.';
//         });
//         return;
//       }
//
//       // Initialize the Agora engine
//       _engine = createAgoraRtcEngine();
//       await _engine.initialize(RtcEngineContext(
//         appId: widget.appId,
//         channelProfile: ChannelProfileType.channelProfileLiveBroadcasting,
//       ));
//
//       // Register event handlers
//       _engine.registerEventHandler(RtcEngineEventHandler(
//         onJoinChannelSuccess: (connection, elapsed) {
//           setState(() {
//             isJoined = true;
//             localUid = connection.localUid;
//           });
//           print(
//               'Joined channel: ${connection.channelId} with UID: ${connection.localUid}');
//         },
//         onUserJoined: (connection, remoteUidParam, elapsed) {
//           setState(() {
//             remoteUid = remoteUidParam;
//           });
//           print('User joined: $remoteUidParam');
//         },
//         onUserOffline: (connection, remoteUidParam, reason) {
//           setState(() {
//             remoteUid = null;
//           });
//           print('User offline: $remoteUidParam');
//         },
//         onError: (errorCode, description) {
//           setState(() {
//             errorMessage =
//             'Agora SDK Error: $errorCode, Description: $description';
//           });
//           print('Agora SDK Error: $errorCode, Description: $description');
//         },
//       ));
//
//       // Enable video and set the client role to broadcaster
//       await _engine.enableVideo();
//       await _engine.setClientRole(role: ClientRoleType.clientRoleBroadcaster);
//
//       // Join the channel with the provided token
//       await _engine.joinChannel(
//         token: widget.token,
//         channelId: widget.channelName,
//         uid: 0, // 0 lets Agora assign a UID automatically
//         options: const ChannelMediaOptions(
//           clientRoleType: ClientRoleType.clientRoleBroadcaster,
//         ),
//       );
//     } catch (e) {
//       setState(() {
//         errorMessage = 'Failed to initialize Agora SDK: $e';
//       });
//       print('Failed to initialize Agora SDK: $e');
//     }
//   }
//
//   @override
//   void dispose() {
//     _engine.leaveChannel();
//     _engine.release();
//     super.dispose();
//   }
//
//   // Toggle mute/unmute
//   void _toggleMute() {
//     setState(() {
//       isMuted = !isMuted;
//     });
//     _engine.muteLocalAudioStream(isMuted);
//   }
//
//   // Toggle video on/off
//   void _toggleVideo() {
//     setState(() {
//       isVideoOff = !isVideoOff;
//     });
//     _engine.muteLocalVideoStream(isVideoOff);
//   }
//
//   // Switch between front and rear cameras
//   void _switchCamera() {
//     _engine.switchCamera();
//     setState(() {
//       isFrontCamera = !isFrontCamera;
//     });
//   }
//
//   // End the meeting with confirmation and feedback
//   void _endMeeting() {
//     showDialog(
//       context: context,
//       builder: (BuildContext context) {
//         return AlertDialog(
//           title: const Text('End Meeting'),
//           content: const Text(
//               'Are you sure you want to end the meeting? This will also end the live stream if it is ongoing.'),
//           actions: [
//             TextButton(
//               child: const Text(
//                 'No',
//                 style: TextStyle(color: Colors.blue),
//               ),
//               onPressed: () {
//                 Navigator.of(context).pop(); // Close the confirmation dialog
//               },
//             ),
//             TextButton(
//               child: const Text(
//                 'Yes',
//                 style: TextStyle(color: Colors.red),
//               ),
//               onPressed: () {
//                 Navigator.of(context).pop(); // Close the confirmation dialog
//                 _showFeedbackDialog(); // Show feedback dialog
//               },
//             ),
//           ],
//         );
//       },
//     );
//   }
//
//   // Show feedback dialog after ending the meeting
//   void _showFeedbackDialog() {
//     TextEditingController _feedbackController = TextEditingController();
//
//     showDialog(
//       context: context,
//       builder: (BuildContext context) {
//         return AlertDialog(
//           title: const Text('Feedback'),
//           content: TextField(
//             controller: _feedbackController,
//             decoration: const InputDecoration(
//               hintText: 'Enter your feedback here...',
//             ),
//             maxLines: 3,
//           ),
//           actions: [
//             TextButton(
//               child: const Text(
//                 'Cancel',
//                 style: TextStyle(color: Colors.blue),
//               ),
//               onPressed: () {
//                 Navigator.of(context).pop(); // Close the feedback dialog
//                 _quitMeeting(); // Proceed to quit meeting without feedback
//               },
//             ),
//             TextButton(
//               child: const Text(
//                 'Send',
//                 style: TextStyle(color: Colors.green),
//               ),
//               onPressed: () {
//                 String feedback = _feedbackController.text.trim();
//                 if (feedback.isNotEmpty) {
//                   // Simulate sending feedback to the database
//                   _sendFeedback(feedback);
//                   Navigator.of(context).pop(); // Close the feedback dialog
//                   _quitMeeting(); // Proceed to quit meeting after sending feedback
//                 } else {
//                   // Show a snackbar or alert if feedback is empty
//                   ScaffoldMessenger.of(context).showSnackBar(
//                     const SnackBar(
//                       content: Text('Please enter your feedback before sending.'),
//                     ),
//                   );
//                 }
//               },
//             ),
//           ],
//         );
//       },
//     );
//   }
//
//   // Simulate sending feedback to the database
//   void _sendFeedback(String feedback) {
//     // For simulation purposes, we'll just print the feedback
//     print('Feedback received: $feedback');
//
//     // Optionally, show a confirmation message
//     ScaffoldMessenger.of(context).showSnackBar(
//       const SnackBar(
//         content: Text('Thank you for your feedback!'),
//       ),
//     );
//   }
//
//   // Quit meeting
//   void _quitMeeting() async {
//     await _engine.leaveChannel();
//     Navigator.of(context).pop(); // Exit the live stream page
//   }
//
//   // Render Remote Video (Tutor's video)
//   Widget _renderRemoteVideo() {
//     if (remoteUid != null) {
//       return AgoraVideoView(
//         controller: VideoViewController.remote(
//           rtcEngine: _engine,
//           canvas: VideoCanvas(uid: remoteUid),
//           connection: RtcConnection(channelId: widget.channelName),
//         ),
//       );
//     } else {
//       return Container(
//         color: Colors.black,
//         child: const Center(
//           child: Text(
//             'Waiting for the tutor to join...',
//             style: TextStyle(color: Colors.white, fontSize: 18),
//           ),
//         ),
//       );
//     }
//   }
//
//   // Render Local Video (Student's video) as overlay
//   Widget _renderLocalVideo() {
//     if (isVideoOff) {
//       return SizedBox.shrink();
//     }
//
//     return Positioned(
//       top: 40,
//       right: 20,
//       width: 120,
//       height: 160,
//       child: Container(
//         decoration: BoxDecoration(
//           border: Border.all(color: Colors.white),
//           borderRadius: BorderRadius.circular(8),
//         ),
//         child: localUid != null
//             ? AgoraVideoView(
//           controller: VideoViewController(
//             rtcEngine: _engine,
//             canvas: VideoCanvas(uid: 0),
//           ),
//         )
//             : const Center(
//           child: CircularProgressIndicator(),
//         ),
//       ),
//     );
//   }
//
//   // Render Toolbar (without share button)
//   Widget _toolbar() {
//     return Align(
//       alignment: Alignment.bottomLeft,
//       child: Padding(
//         padding: const EdgeInsets.fromLTRB(10.0, 0.0, 10.0, 20.0),
//         child: Container(
//           padding:
//           const EdgeInsets.symmetric(horizontal: 10.0, vertical: 10.0),
//           decoration: BoxDecoration(
//             color: Colors.black54,
//             borderRadius: BorderRadius.circular(30.0),
//           ),
//           child: Row(
//             mainAxisSize: MainAxisSize.min,
//             children: [
//               _buildToolbarButton(
//                 icon: isMuted ? Icons.mic_off : Icons.mic,
//                 color: isMuted ? Colors.white : Colors.blue,
//                 backgroundColor: isMuted ? Colors.blue : Colors.white,
//                 onPressed: _toggleMute,
//               ),
//               const SizedBox(width: 10),
//               _buildToolbarButton(
//                 icon: Icons.call_end,
//                 color: Colors.white,
//                 backgroundColor: Colors.redAccent,
//                 onPressed: _endMeeting,
//                 size: 30.0,
//               ),
//               const SizedBox(width: 10),
//               _buildToolbarButton(
//                 icon: isVideoOff ? Icons.videocam_off : Icons.videocam,
//                 color: isVideoOff ? Colors.white : Colors.blue,
//                 backgroundColor: isVideoOff ? Colors.blue : Colors.white,
//                 onPressed: _toggleVideo,
//               ),
//               const SizedBox(width: 10),
//               _buildToolbarButton(
//                 icon: Icons.switch_camera,
//                 color: Colors.blue,
//                 backgroundColor: Colors.white,
//                 onPressed: _switchCamera,
//               ),
//             ],
//           ),
//         ),
//       ),
//     );
//   }
//
//   // Helper method for Toolbar Buttons
//   Widget _buildToolbarButton({
//     required IconData icon,
//     required Color color,
//     required Color backgroundColor,
//     VoidCallback? onPressed,
//     double size = 20.0,
//   }) {
//     return RawMaterialButton(
//       onPressed: onPressed,
//       child: Icon(
//         icon,
//         color: color,
//         size: size,
//       ),
//       shape: const CircleBorder(),
//       elevation: 2.0,
//       fillColor: backgroundColor,
//       padding: const EdgeInsets.all(12.0),
//     );
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: const Text('Live Stream'),
//         backgroundColor: Colors.blue,
//       ),
//       body: Stack(
//         children: [
//           // Full-screen Tutor Video
//           _renderRemoteVideo(),
//
//           // Student's Video Overlay
//           _renderLocalVideo(),
//
//           // Error Message Display
//           if (errorMessage.isNotEmpty)
//             Positioned(
//               top: 50,
//               left: 20,
//               right: 20,
//               child: Container(
//                 padding: const EdgeInsets.all(10),
//                 color: Colors.redAccent,
//                 child: Text(
//                   errorMessage,
//                   style: const TextStyle(color: Colors.white),
//                   textAlign: TextAlign.center,
//                 ),
//               ),
//             ),
//
//           // Toolbar
//           _toolbar(),
//         ],
//       ),
//     );
//   }
// }

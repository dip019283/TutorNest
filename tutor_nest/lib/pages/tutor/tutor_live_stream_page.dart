// lib/pages/tutor_live_stream_page.dart

// import 'package:flutter/material.dart';
// import 'package:tutor_nest/models/lesson.dart';
//
// /// A placeholder page for live streaming.
// class LiveStreamPage extends StatelessWidget {
//   final Lesson lesson;
//
//   LiveStreamPage({required this.lesson});
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text("Live Stream"),
//       ),
//       body: Center(
//         child: Text(
//           "Live Stream for ${lesson.subject} with ${lesson.student}",
//           style: TextStyle(fontSize: 20),
//         ),
//       ),
//     );
//   }
// }

// import 'package:flutter/material.dart';
// import 'package:agora_rtc_engine/agora_rtc_engine.dart';
// import 'package:permission_handler/permission_handler.dart';
//
// class TutorLiveStreamPage extends StatefulWidget {
//   final String channelName;
//   final String appId;
//   final String token;
//
//   const TutorLiveStreamPage({
//     Key? key,
//     required this.channelName,
//     required this.appId,
//     required this.token,
//   }) : super(key: key);
//
//   @override
//   _TutorLiveStreamPageState createState() => _TutorLiveStreamPageState();
// }
//
// class _TutorLiveStreamPageState extends State<TutorLiveStreamPage> {
//   late final RtcEngine _engine;
//   bool isJoined = false;
//   bool isMuted = false;
//   bool isVideoOff = false;
//   bool isFrontCamera = true;
//   int? localUid;
//   String errorMessage = '';
//   final String rtmpUrl = 'rtmp://a.rtmp.youtube.com/live2/YOUR_STREAM_KEY'; // Replace with your RTMP URL
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
//           print('Joined channel: ${connection.channelId} with UID: ${connection.localUid}');
//           _startRtmpStream(); // Start RTMP streaming
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
//       // Create the transcoding configuration
//       LiveTranscoding transcoding = LiveTranscoding(
//         width: 1280,
//         height: 720,
//         videoBitrate: 4000,
//         videoFramerate: 30,
//         audioSampleRate: AudioSampleRateType.audioSampleRate48000,
//         audioBitrate: 128,
//         audioChannels: 2,
//         videoGop: 30,
//         videoCodecProfile: VideoCodecProfileType.videoCodecProfileHigh,
//       );
//
//       // Start RTMP stream with the URL and transcoding configuration
//       await _engine.startRtmpStreamWithTranscoding(
//         url: rtmpUrl,
//         transcoding: transcoding,
//       );
//
//       print('RTMP stream started: $rtmpUrl');
//     } catch (e) {
//       setState(() {
//         errorMessage = 'Failed to start RTMP stream: $e';
//       });
//       print('Failed to start RTMP stream: $e');
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
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: const Text('Tutor Live Stream'),
//         backgroundColor: Colors.blue,
//       ),
//       body: OrientationBuilder(
//         builder: (context, orientation) {
//           return Stack(
//             children: [
//               _renderLocalVideo(),
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
//   // Render Local Video
//   Widget _renderLocalVideo() {
//     if (isVideoOff) {
//       return Container(color: Colors.black);
//     }
//     return Center(
//       child: AgoraVideoView(
//         controller: VideoViewController(
//           rtcEngine: _engine,
//           canvas: VideoCanvas(uid: 0),
//         ),
//       ),
//     );
//   }
//
//
// // Render Toolbar
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
//               const SizedBox(width: 10),
//               // Add End Call Button
//               _buildToolbarButton(
//                 icon: Icons.call_end,
//                 color: Colors.white,
//                 backgroundColor: Colors.red,
//                 onPressed: _endCall, // Method to handle end call
//               ),
//             ],
//           ),
//         ),
//       ),
//     );
//   }
//
// // Method to handle End Call
//   void _endCall() {
//     _engine.leaveChannel(); // Leave the Agora channel
//     _engine.release(); // Release Agora resources
//     Navigator.pop(context); // Exit the screen
//   }
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

// lib/pages/tutor/tutor_live_stream_page.dart
//
// import 'package:flutter/material.dart';
// import 'package:agora_rtc_engine/agora_rtc_engine.dart';
// import 'package:permission_handler/permission_handler.dart';
// import 'package:share_plus/share_plus.dart';
//
// class TutorLiveStreamPage extends StatefulWidget {
//   final String channelName;
//   final String appId;
//   final String token;
//
//   const TutorLiveStreamPage({
//     Key? key,
//     required this.channelName,
//     required this.appId,
//     required this.token,
//   }) : super(key: key);
//
//   @override
//   _TutorLiveStreamPageState createState() => _TutorLiveStreamPageState();
// }
//
// class _TutorLiveStreamPageState extends State<TutorLiveStreamPage> {
//   late final RtcEngine _engine;
//   bool isJoined = false;
//   bool isMuted = false;
//   bool isVideoOff = false;
//   bool isFrontCamera = true;
//   int? localUid;
//   String errorMessage = '';
//   String meetingLink = '';
//   final String rtmpUrl = 'rtmp://a.rtmp.youtube.com/live2/YOUR_STREAM_KEY'; // Replace with your RTMP URL
//
//   @override
//   void initState() {
//     super.initState();
//     _initAgora();
//     meetingLink = "https://yourapp.live/${widget.channelName}"; // Sample meeting link
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
//           _startRtmpStream(); // Start RTMP streaming
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
//       // Enable video and set client role to broadcaster
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
//       // Create the transcoding configuration
//       LiveTranscoding transcoding = LiveTranscoding(
//         width: 1280,
//         height: 720,
//         videoBitrate: 4000,
//         videoFramerate: 30,
//         audioSampleRate: AudioSampleRateType.audioSampleRate48000,
//         audioBitrate: 128,
//         audioChannels: 2,
//         videoGop: 30,
//         videoCodecProfile: VideoCodecProfileType.videoCodecProfileHigh,
//       );
//
//       // Start RTMP stream with the URL and transcoding configuration
//       await _engine.startRtmpStreamWithTranscoding(
//         url: rtmpUrl,
//         transcoding: transcoding,
//       );
//
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
//     Share.share(meetingLink, subject: 'Join my live stream');
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
//     await _stopRtmpStream(); // Stop RTMP stream before quitting
//     await _engine.leaveChannel();
//     Navigator.of(context).pop(); // Exit the live stream page
//   }
//
//   // Render Local Video
//   Widget _renderLocalVideo() {
//     if (isVideoOff) {
//       return Container(color: Colors.black);
//     }
//     return AgoraVideoView(
//       controller: VideoViewController(
//         rtcEngine: _engine,
//         canvas: VideoCanvas(uid: 0),
//       ),
//     );
//   }
//
//   // Render Toolbar (with share button)
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
//               const SizedBox(width: 10),
//               _buildToolbarButton(
//                 icon: Icons.share,
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
//         title: const Text('Tutor Live Stream'),
//         backgroundColor: Colors.blue,
//       ),
//       body: Stack(
//         children: [
//           _renderLocalVideo(),
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


// lib/pages/tutor/tutor_live_stream_page.dart

import 'package:flutter/material.dart';
import 'package:agora_rtc_engine/agora_rtc_engine.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:share_plus/share_plus.dart';

class TutorLiveStreamPage extends StatefulWidget {
  final String channelName;
  final String appId;
  final String token;

  const TutorLiveStreamPage({
    Key? key,
    required this.channelName,
    required this.appId,
    required this.token,
  }) : super(key: key);

  @override
  _TutorLiveStreamPageState createState() => _TutorLiveStreamPageState();
}

class _TutorLiveStreamPageState extends State<TutorLiveStreamPage> {
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
        // Add additional transcoding settings if needed
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
    Share.share(meetingLink, subject: 'Join my live stream');
  }

  // End the meeting with confirmation and feedback
  void _endMeeting() {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text('End Meeting'),
          content: const Text(
              'Are you sure you want to end the meeting? This will also end the live stream if it is ongoing.'),
          actions: [
            TextButton(
              child: const Text(
                'No',
                style: TextStyle(color: Colors.blue),
              ),
              onPressed: () {
                Navigator.of(context).pop(); // Close the confirmation dialog
              },
            ),
            TextButton(
              child: const Text(
                'Yes',
                style: TextStyle(color: Colors.red),
              ),
              onPressed: () {
                Navigator.of(context).pop(); // Close the confirmation dialog
                _showFeedbackDialog(); // Show feedback dialog
              },
            ),
          ],
        );
      },
    );
  }

  // Show feedback dialog after ending the meeting
  void _showFeedbackDialog() {
    TextEditingController _feedbackController = TextEditingController();

    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text('Feedback'),
          content: TextField(
            controller: _feedbackController,
            decoration: const InputDecoration(
              hintText: 'Enter your feedback here...',
            ),
            maxLines: 3,
          ),
          actions: [
            TextButton(
              child: const Text(
                'Cancel',
                style: TextStyle(color: Colors.blue),
              ),
              onPressed: () {
                Navigator.of(context).pop(); // Close the feedback dialog
                _quitMeeting(); // Proceed to quit meeting without feedback
              },
            ),
            TextButton(
              child: const Text(
                'Send',
                style: TextStyle(color: Colors.green),
              ),
              onPressed: () {
                String feedback = _feedbackController.text.trim();
                if (feedback.isNotEmpty) {
                  // Simulate sending feedback to the database
                  _sendFeedback(feedback);
                  Navigator.of(context).pop(); // Close the feedback dialog
                  _quitMeeting(); // Proceed to quit meeting after sending feedback
                } else {
                  // Show a snackbar or alert if feedback is empty
                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(
                      content: Text('Please enter your feedback before sending.'),
                    ),
                  );
                }
              },
            ),
          ],
        );
      },
    );
  }

  // Simulate sending feedback to the database
  void _sendFeedback(String feedback) {
    // For simulation purposes, we'll just print the feedback
    print('Feedback received: $feedback');

    // Optionally, show a confirmation message
    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(
        content: Text('Thank you for your feedback!'),
      ),
    );

    // TODO: Implement actual feedback saving logic here (e.g., API call)
  }

  // Quit meeting
  void _quitMeeting() async {
    await _engine.leaveChannel();
    Navigator.of(context).pop(); // Exit the live stream page
  }

  // Render Remote Video (Students' videos)
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
            'Waiting for students to join...',
            style: TextStyle(color: Colors.white, fontSize: 18),
          ),
        ),
      );
    }
  }

  // Render Local Video (Tutor's video) as overlay
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

  // Render Toolbar with Share Link
  Widget _toolbar() {
    return Align(
      alignment: Alignment.bottomLeft,
      child: Padding(
        padding: const EdgeInsets.fromLTRB(10.0, 0.0, 10.0, 20.0),
        child: Container(
          padding:
          const EdgeInsets.symmetric(horizontal: 10.0, vertical: 10.0),
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

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: OrientationBuilder(
        builder: (context, orientation) {
          return Stack(
            children: [
              // Full-screen Remote Videos (Students' videos)
              _renderRemoteVideo(),
              // Display multiple remote videos if needed
              // You can implement a grid or list view for multiple students

              // Error Message Display
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

              // Tutor's Video Overlay
              _renderLocalVideo(),

              // Toolbar
              _toolbar(),
            ],
          );
        },
      ),
    );
  }
}

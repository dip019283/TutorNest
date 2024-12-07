// import 'package:flutter/material.dart';
// import 'package:video_player/video_player.dart';
// import 'package:flutter/services.dart';
//
// class VideoPopup extends StatefulWidget {
//   final String videoUrl;
//
//   const VideoPopup({Key? key, required this.videoUrl}) : super(key: key);
//
//   @override
//   _VideoPopupState createState() => _VideoPopupState();
// }
//
// class _VideoPopupState extends State<VideoPopup> {
//   late VideoPlayerController _controller;
//   bool _isFullScreen = false;
//
//   @override
//   void initState() {
//     super.initState();
//     _controller = VideoPlayerController.network(widget.videoUrl)
//       ..initialize().then((_) {
//         setState(() {});
//         _controller.play();
//       });
//     _controller.addListener(_videoListener);
//   }
//
//   void _videoListener() {
//     // Add any video listener logic here if needed
//   }
//
//   @override
//   void dispose() {
//     _controller.removeListener(_videoListener);
//     _controller.dispose();
//     // Reset screen orientation and UI mode
//     if (_isFullScreen) {
//       SystemChrome.setEnabledSystemUIMode(SystemUiMode.edgeToEdge);
//       SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]);
//     }
//     super.dispose();
//   }
//
//   void _toggleFullScreen() {
//     setState(() {
//       _isFullScreen = !_isFullScreen;
//     });
//     if (_isFullScreen) {
//       // Enter full screen
//       SystemChrome.setEnabledSystemUIMode(SystemUiMode.immersiveSticky);
//       SystemChrome.setPreferredOrientations([
//         DeviceOrientation.landscapeLeft,
//         DeviceOrientation.landscapeRight,
//       ]);
//     } else {
//       // Exit full screen
//       SystemChrome.setEnabledSystemUIMode(SystemUiMode.edgeToEdge);
//       SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]);
//     }
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return WillPopScope(
//       onWillPop: () async => !_isFullScreen,
//       child: Dialog(
//         insetPadding: EdgeInsets.all(_isFullScreen ? 0 : 16),
//         child: AspectRatio(
//           aspectRatio: _controller.value.aspectRatio,
//           child: Stack(
//             children: [
//               Center(
//                 child: _controller.value.isInitialized
//                     ? VideoPlayer(_controller)
//                     : CircularProgressIndicator(),
//               ),
//               Positioned(
//                 top: 0,
//                 right: 0,
//                 child: IconButton(
//                   icon: Icon(
//                     _isFullScreen ? Icons.fullscreen_exit : Icons.fullscreen,
//                     color: Colors.white,
//                   ),
//                   onPressed: _toggleFullScreen,
//                 ),
//               ),
//               Positioned(
//                 bottom: 0,
//                 left: 0,
//                 right: 0,
//                 child: VideoProgressIndicator(_controller, allowScrubbing: true),
//               ),
//             ],
//           ),
//         ),
//       ),
//     );
//   }
// }

// lib/widgets/video_popup.dart
// import 'package:flutter/material.dart';
// import 'package:video_player/video_player.dart';
// import 'package:flutter/services.dart';
//
// class VideoPopup extends StatefulWidget {
//   final String videoUrl;
//
//   const VideoPopup({Key? key, required this.videoUrl}) : super(key: key);
//
//   @override
//   _VideoPopupState createState() => _VideoPopupState();
// }
//
// class _VideoPopupState extends State<VideoPopup> {
//   late VideoPlayerController _controller;
//   bool _isFullScreen = false;
//
//   @override
//   void initState() {
//     super.initState();
//     _controller = VideoPlayerController.network(widget.videoUrl)
//       ..initialize().then((_) {
//         setState(() {});
//         _controller.play();
//       });
//     _controller.addListener(_videoListener);
//   }
//
//   void _videoListener() {
//     // Add any video listener logic here if needed
//   }
//
//   @override
//   void dispose() {
//     _controller.removeListener(_videoListener);
//     _controller.dispose();
//     // Reset screen orientation and UI mode
//     if (_isFullScreen) {
//       SystemChrome.setEnabledSystemUIMode(SystemUiMode.edgeToEdge);
//       SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]);
//     }
//     super.dispose();
//   }
//
//   void _toggleFullScreen() {
//     setState(() {
//       _isFullScreen = !_isFullScreen;
//     });
//     if (_isFullScreen) {
//       // Enter full screen
//       SystemChrome.setEnabledSystemUIMode(SystemUiMode.immersiveSticky);
//       SystemChrome.setPreferredOrientations([
//         DeviceOrientation.landscapeLeft,
//         DeviceOrientation.landscapeRight,
//       ]);
//     } else {
//       // Exit full screen
//       SystemChrome.setEnabledSystemUIMode(SystemUiMode.edgeToEdge);
//       SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]);
//     }
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return WillPopScope(
//       onWillPop: () async => !_isFullScreen,
//       child: Dialog(
//         insetPadding: EdgeInsets.all(_isFullScreen ? 0 : 16),
//         child: AspectRatio(
//           aspectRatio: _controller.value.aspectRatio,
//           child: Stack(
//             children: [
//               Center(
//                 child: _controller.value.isInitialized
//                     ? VideoPlayer(_controller)
//                     : CircularProgressIndicator(),
//               ),
//               Positioned(
//                 top: 0,
//                 right: 0,
//                 child: IconButton(
//                   icon: Icon(
//                     _isFullScreen ? Icons.fullscreen_exit : Icons.fullscreen,
//                     color: Colors.white,
//                   ),
//                   onPressed: _toggleFullScreen,
//                 ),
//               ),
//               Positioned(
//                 bottom: 0,
//                 left: 0,
//                 right: 0,
//                 child: VideoProgressIndicator(_controller, allowScrubbing: true),
//               ),
//             ],
//           ),
//         ),
//       ),
//     );
//   }
// }

// // lib/widgets/video_popup.dart
// import 'package:flutter/material.dart';
// import 'package:video_player/video_player.dart';
// import 'package:flutter/services.dart';
//
// class VideoPopup extends StatefulWidget {
//   final String videoUrl;
//
//   const VideoPopup({Key? key, required this.videoUrl}) : super(key: key);
//
//   @override
//   _VideoPopupState createState() => _VideoPopupState();
// }
//
// class _VideoPopupState extends State<VideoPopup> {
//   late VideoPlayerController _controller;
//   bool _isFullScreen = false;
//   bool _isControlsVisible = true;
//
//   @override
//   void initState() {
//     super.initState();
//     _controller = VideoPlayerController.network(widget.videoUrl)
//       ..initialize().then((_) {
//         setState(() {});
//         _controller.play();
//       });
//     _controller.addListener(_videoListener);
//   }
//
//   void _videoListener() {
//     // Add any video listener logic here if needed
//   }
//
//   @override
//   void dispose() {
//     _controller.removeListener(_videoListener);
//     _controller.dispose();
//     // Reset screen orientation and UI mode
//     if (_isFullScreen) {
//       SystemChrome.setEnabledSystemUIMode(SystemUiMode.edgeToEdge);
//       SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]);
//     }
//     super.dispose();
//   }
//
//   void _toggleFullScreen() {
//     setState(() {
//       _isFullScreen = !_isFullScreen;
//     });
//     if (_isFullScreen) {
//       // Enter full screen
//       SystemChrome.setEnabledSystemUIMode(SystemUiMode.immersiveSticky);
//       SystemChrome.setPreferredOrientations([
//         DeviceOrientation.landscapeLeft,
//         DeviceOrientation.landscapeRight,
//       ]);
//     } else {
//       // Exit full screen
//       SystemChrome.setEnabledSystemUIMode(SystemUiMode.edgeToEdge);
//       SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]);
//     }
//   }
//
//   void _toggleControlsVisibility() {
//     setState(() {
//       _isControlsVisible = !_isControlsVisible;
//     });
//   }
//
//   void _playPauseVideo() {
//     setState(() {
//       if (_controller.value.isPlaying) {
//         _controller.pause();
//       } else {
//         _controller.play();
//       }
//     });
//   }
//
//   void _rewind10Seconds() {
//     final currentPosition = _controller.value.position;
//     final newPosition = currentPosition - Duration(seconds: 10);
//     _controller.seekTo(newPosition >= Duration.zero ? newPosition : Duration.zero);
//   }
//
//   void _forward10Seconds() {
//     final currentPosition = _controller.value.position;
//     final newPosition = currentPosition + Duration(seconds: 10);
//     _controller.seekTo(newPosition <= _controller.value.duration ? newPosition : _controller.value.duration);
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return WillPopScope(
//       onWillPop: () async => !_isFullScreen,
//       child: Dialog(
//         insetPadding: EdgeInsets.all(_isFullScreen ? 0 : 16),
//         backgroundColor: Colors.black, // Optional: Set background color to black for better video visibility
//         child: GestureDetector(
//           onTap: _toggleControlsVisibility,
//           child: Stack(
//             children: [
//               // Video Player
//               Center(
//                 child: _controller.value.isInitialized
//                     ? AspectRatio(
//                   aspectRatio: _controller.value.aspectRatio,
//                   child: VideoPlayer(_controller),
//                 )
//                     : CircularProgressIndicator(),
//               ),
//
//               // Play/Pause Overlay
//               if (_isControlsVisible)
//                 Positioned.fill(
//                   child: Container(
//                     color: Colors.black45, // Semi-transparent overlay
//                     child: Center(
//                       child: IconButton(
//                         icon: Icon(
//                           _controller.value.isPlaying
//                               ? Icons.pause_circle_filled
//                               : Icons.play_circle_filled,
//                           color: Colors.white,
//                           size: 60,
//                         ),
//                         onPressed: _playPauseVideo,
//                         tooltip: _controller.value.isPlaying ? 'Pause' : 'Play',
//                       ),
//                     ),
//                   ),
//                 ),
//
//               // Video Controls: Rewind, Play/Pause, Forward
//               if (_isControlsVisible)
//                 Positioned(
//                   bottom: 50, // Positioned above the progress bar
//                   left: 20,
//                   right: 20,
//                   child: Row(
//                     mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                     children: [
//                       // Rewind 10 Seconds
//                       IconButton(
//                         icon: Icon(Icons.replay_10, color: Colors.white, size: 30),
//                         onPressed: _rewind10Seconds,
//                         tooltip: 'Rewind 10 seconds',
//                       ),
//
//                       // Play/Pause Button
//                       IconButton(
//                         icon: Icon(
//                           _controller.value.isPlaying ? Icons.pause : Icons.play_arrow,
//                           color: Colors.white,
//                           size: 30,
//                         ),
//                         onPressed: _playPauseVideo,
//                         tooltip: _controller.value.isPlaying ? 'Pause' : 'Play',
//                       ),
//
//                       // Forward 10 Seconds
//                       IconButton(
//                         icon: Icon(Icons.forward_10, color: Colors.white, size: 30),
//                         onPressed: _forward10Seconds,
//                         tooltip: 'Forward 10 seconds',
//                       ),
//                     ],
//                   ),
//                 ),
//
//               // Fullscreen Toggle Button
//               if (_isControlsVisible)
//                 Positioned(
//                   top: 10,
//                   right: 10,
//                   child: IconButton(
//                     icon: Icon(
//                       _isFullScreen ? Icons.fullscreen_exit : Icons.fullscreen,
//                       color: Colors.white,
//                       size: 30,
//                     ),
//                     onPressed: _toggleFullScreen,
//                     tooltip: _isFullScreen ? 'Exit Fullscreen' : 'Enter Fullscreen',
//                   ),
//                 ),
//
//               // Video Progress Indicator
//               if (_isControlsVisible)
//                 Positioned(
//                   bottom: 10,
//                   left: 20,
//                   right: 20,
//                   child: VideoProgressIndicator(
//                     _controller,
//                     allowScrubbing: true,
//                     colors: VideoProgressColors(
//                       playedColor: Colors.blue,
//                       backgroundColor: Colors.grey,
//                       bufferedColor: Colors.lightBlue,
//                     ),
//                   ),
//                 ),
//             ],
//           ),
//         ),
//       ),
//     );
//   }
// }

// // lib/widgets/video_popup.dart
// import 'package:flutter/material.dart';
// import 'package:video_player/video_player.dart';
// import 'package:flutter/services.dart';
// import 'dart:async';
//
// class VideoPopup extends StatefulWidget {
//   final String videoUrl;
//
//   const VideoPopup({Key? key, required this.videoUrl}) : super(key: key);
//
//   @override
//   _VideoPopupState createState() => _VideoPopupState();
// }
//
// class _VideoPopupState extends State<VideoPopup> {
//   late VideoPlayerController _controller;
//   bool _isFullScreen = false;
//   bool _isControlsVisible = true;
//   Timer? _hideTimer;
//
//   @override
//   void initState() {
//     super.initState();
//     _controller = VideoPlayerController.network(widget.videoUrl)
//       ..initialize().then((_) {
//         setState(() {}); // Update UI after initialization
//         _controller.play(); // Start playing automatically
//         _startHideTimer(); // Start the auto-hide timer
//       });
//     _controller.addListener(_videoListener); // Add listener for state updates
//   }
//
//   void _videoListener() {
//     if (!mounted) return;
//     setState(() {}); // Trigger UI update on video state changes
//   }
//
//   @override
//   void dispose() {
//     _hideTimer?.cancel(); // Cancel any active timers
//     _controller.removeListener(_videoListener); // Remove the listener
//     _controller.dispose(); // Dispose the controller to free resources
//     // Reset screen orientation and UI mode if in fullscreen
//     if (_isFullScreen) {
//       SystemChrome.setEnabledSystemUIMode(SystemUiMode.edgeToEdge);
//       SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]);
//     }
//     super.dispose();
//   }
//
//   void _toggleFullScreen() {
//     setState(() {
//       _isFullScreen = !_isFullScreen;
//     });
//     if (_isFullScreen) {
//       // Enter fullscreen mode
//       SystemChrome.setEnabledSystemUIMode(SystemUiMode.immersiveSticky);
//       SystemChrome.setPreferredOrientations([
//         DeviceOrientation.landscapeLeft,
//         DeviceOrientation.landscapeRight,
//       ]);
//     } else {
//       // Exit fullscreen mode
//       SystemChrome.setEnabledSystemUIMode(SystemUiMode.edgeToEdge);
//       SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]);
//     }
//   }
//
//   void _toggleControlsVisibility() {
//     setState(() {
//       _isControlsVisible = !_isControlsVisible;
//     });
//     if (_isControlsVisible) {
//       _startHideTimer(); // Restart the auto-hide timer
//     } else {
//       _hideTimer?.cancel(); // Cancel the timer if controls are hidden
//     }
//   }
//
//   void _startHideTimer() {
//     _hideTimer?.cancel(); // Cancel any existing timer
//     _hideTimer = Timer(Duration(seconds: 3), () {
//       setState(() {
//         _isControlsVisible = false; // Hide controls after 3 seconds
//       });
//     });
//   }
//
//   void _playPauseVideo() {
//     setState(() {
//       if (_controller.value.isPlaying) {
//         _controller.pause(); // Pause the video
//       } else {
//         _controller.play(); // Play the video
//         _startHideTimer(); // Restart the auto-hide timer
//       }
//     });
//   }
//
//   void _rewind10Seconds() {
//     final currentPosition = _controller.value.position;
//     final newPosition = currentPosition - Duration(seconds: 10);
//     _controller.seekTo(newPosition >= Duration.zero ? newPosition : Duration.zero); // Ensure position isn't negative
//     _startHideTimer(); // Restart the auto-hide timer
//   }
//
//   void _forward10Seconds() {
//     final currentPosition = _controller.value.position;
//     final newPosition = currentPosition + Duration(seconds: 10);
//     _controller.seekTo(newPosition <= _controller.value.duration ? newPosition : _controller.value.duration); // Ensure position doesn't exceed duration
//     _startHideTimer(); // Restart the auto-hide timer
//   }
//
//   String _formatDuration(Duration duration) {
//     String twoDigits(int n) => n.toString().padLeft(2, '0');
//     final twoDigitMinutes = twoDigits(duration.inMinutes.remainder(60));
//     final twoDigitSeconds = twoDigits(duration.inSeconds.remainder(60));
//     return "${twoDigits(duration.inHours)}:$twoDigitMinutes:$twoDigitSeconds";
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return WillPopScope(
//       onWillPop: () async => !_isFullScreen, // Prevent back navigation in fullscreen
//       child: Dialog(
//         insetPadding: EdgeInsets.all(_isFullScreen ? 0 : 16), // Remove padding in fullscreen
//         backgroundColor: Colors.black, // Set background to black for better visibility
//         child: GestureDetector(
//           behavior: HitTestBehavior.translucent, // Allow child widgets to receive touch events
//           onTap: _toggleControlsVisibility, // Toggle controls on tap
//           child: Stack(
//             children: [
//               // Video Player
//               Center(
//                 child: _controller.value.isInitialized
//                     ? AspectRatio(
//                   aspectRatio: _controller.value.aspectRatio,
//                   child: VideoPlayer(_controller),
//                 )
//                     : CircularProgressIndicator(),
//               ),
//
//               // Play/Pause Overlay
//               if (_isControlsVisible)
//                 Positioned.fill(
//                   child: Container(
//                     color: Colors.black45, // Semi-transparent overlay
//                     child: Center(
//                       child: IconButton(
//                         icon: Icon(
//                           _controller.value.isPlaying
//                               ? Icons.pause_circle_filled
//                               : Icons.play_circle_filled,
//                           color: Colors.white,
//                           size: 60,
//                         ),
//                         onPressed: _playPauseVideo, // Play/Pause functionality
//                         tooltip: _controller.value.isPlaying ? 'Pause' : 'Play',
//                       ),
//                     ),
//                   ),
//                 ),
//
//               // Video Controls: Rewind, Play/Pause, Forward
//               if (_isControlsVisible)
//                 Positioned(
//                   bottom: 50, // Position above the progress bar
//                   left: 20,
//                   right: 20,
//                   child: Row(
//                     mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                     children: [
//                       // Rewind 10 Seconds
//                       IconButton(
//                         icon: Icon(Icons.replay_10, color: Colors.white, size: 30),
//                         onPressed: _rewind10Seconds, // Rewind functionality
//                         tooltip: 'Rewind 10 seconds',
//                       ),
//
//                       // Play/Pause Button
//                       IconButton(
//                         icon: Icon(
//                           _controller.value.isPlaying ? Icons.pause : Icons.play_arrow,
//                           color: Colors.white,
//                           size: 30,
//                         ),
//                         onPressed: _playPauseVideo, // Play/Pause functionality
//                         tooltip: _controller.value.isPlaying ? 'Pause' : 'Play',
//                       ),
//
//                       // Forward 10 Seconds
//                       IconButton(
//                         icon: Icon(Icons.forward_10, color: Colors.white, size: 30),
//                         onPressed: _forward10Seconds, // Forward functionality
//                         tooltip: 'Forward 10 seconds',
//                       ),
//                     ],
//                   ),
//                 ),
//
//               // Fullscreen Toggle Button
//               if (_isControlsVisible)
//                 Positioned(
//                   top: 10,
//                   right: 10,
//                   child: IconButton(
//                     icon: Icon(
//                       _isFullScreen ? Icons.fullscreen_exit : Icons.fullscreen,
//                       color: Colors.white,
//                       size: 30,
//                     ),
//                     onPressed: _toggleFullScreen, // Fullscreen toggle functionality
//                     tooltip: _isFullScreen ? 'Exit Fullscreen' : 'Enter Fullscreen',
//                   ),
//                 ),
//
//               // Video Progress Indicator with Time Labels
//               if (_isControlsVisible)
//                 Positioned(
//                   bottom: 10, // Position at the bottom
//                   left: 20,
//                   right: 20,
//                   child: Row(
//                     children: [
//                       // Current Position
//                       Text(
//                         _formatDuration(_controller.value.position),
//                         style: TextStyle(color: Colors.white),
//                       ),
//                       SizedBox(width: 8),
//                       // Progress Bar
//                       Expanded(
//                         child: VideoProgressIndicator(
//                           _controller,
//                           allowScrubbing: true, // Allow users to seek by dragging
//                           padding: EdgeInsets.symmetric(horizontal: 8.0),
//                           colors: VideoProgressColors(
//                             playedColor: Colors.blue,
//                             backgroundColor: Colors.grey,
//                             bufferedColor: Colors.lightBlue,
//                           ),
//                         ),
//                       ),
//                       SizedBox(width: 8),
//                       // Total Duration
//                       Text(
//                         _formatDuration(_controller.value.duration),
//                         style: TextStyle(color: Colors.white),
//                       ),
//                     ],
//                   ),
//                 ),
//
//               // Buffering Indicator
//               if (_controller.value.isBuffering && _isControlsVisible)
//                 Center(
//                   child: CircularProgressIndicator(),
//                 ),
//             ],
//           ),
//         ),
//       ),
//     );
//   }
// }

// lib/widgets/video_popup.dart
// import 'package:flutter/material.dart';
// import 'package:video_player/video_player.dart';
// import 'package:flutter/services.dart';
// import 'dart:async';
//
// class VideoPopup extends StatefulWidget {
//   final String videoUrl;
//
//   const VideoPopup({Key? key, required this.videoUrl}) : super(key: key);
//
//   @override
//   _VideoPopupState createState() => _VideoPopupState();
// }
//
// class _VideoPopupState extends State<VideoPopup> {
//   late VideoPlayerController _controller;
//   bool _isFullScreen = false;
//   bool _isControlsVisible = true;
//   Timer? _hideTimer;
//
//   @override
//   void initState() {
//     super.initState();
//     _controller = VideoPlayerController.network(widget.videoUrl)
//       ..initialize().then((_) async {
//         // Ensure the video is seeked to the start before playing
//         await _controller.seekTo(Duration.zero);
//         setState(() {}); // Update UI after initialization and seeking
//         _controller.play(); // Start playing automatically
//         _startHideTimer(); // Start the auto-hide timer
//       });
//     _controller.addListener(_videoListener); // Add listener for state updates
//   }
//
//   void _videoListener() {
//     if (!mounted) return;
//     setState(() {}); // Trigger UI update on video state changes
//   }
//
//   @override
//   void dispose() {
//     _hideTimer?.cancel(); // Cancel any active timers
//     _controller.removeListener(_videoListener); // Remove the listener
//     _controller.dispose(); // Dispose the controller to free resources
//     // Reset screen orientation and UI mode if in fullscreen
//     if (_isFullScreen) {
//       SystemChrome.setEnabledSystemUIMode(SystemUiMode.edgeToEdge);
//       SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]);
//     }
//     super.dispose();
//   }
//
//   void _toggleFullScreen() {
//     setState(() {
//       _isFullScreen = !_isFullScreen;
//     });
//     if (_isFullScreen) {
//       // Enter fullscreen mode
//       SystemChrome.setEnabledSystemUIMode(SystemUiMode.immersiveSticky);
//       SystemChrome.setPreferredOrientations([
//         DeviceOrientation.landscapeLeft,
//         DeviceOrientation.landscapeRight,
//       ]);
//     } else {
//       // Exit fullscreen mode
//       SystemChrome.setEnabledSystemUIMode(SystemUiMode.edgeToEdge);
//       SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]);
//     }
//   }
//
//   void _toggleControlsVisibility() {
//     setState(() {
//       _isControlsVisible = !_isControlsVisible;
//     });
//     if (_isControlsVisible) {
//       _startHideTimer(); // Restart the auto-hide timer
//     } else {
//       _hideTimer?.cancel(); // Cancel the timer if controls are hidden
//     }
//   }
//
//   void _startHideTimer() {
//     _hideTimer?.cancel(); // Cancel any existing timer
//     _hideTimer = Timer(Duration(seconds: 3), () {
//       setState(() {
//         _isControlsVisible = false; // Hide controls after 3 seconds
//       });
//     });
//   }
//
//   void _playPauseVideo() {
//     setState(() {
//       if (_controller.value.isPlaying) {
//         _controller.pause(); // Pause the video
//       } else {
//         _controller.play(); // Play the video
//         _startHideTimer(); // Restart the auto-hide timer
//       }
//     });
//   }
//
//   void _rewind10Seconds() {
//     final currentPosition = _controller.value.position;
//     final newPosition = currentPosition - Duration(seconds: 10);
//     _controller.seekTo(newPosition >= Duration.zero ? newPosition : Duration.zero); // Ensure position isn't negative
//     _startHideTimer(); // Restart the auto-hide timer
//   }
//
//   void _forward10Seconds() {
//     final currentPosition = _controller.value.position;
//     final newPosition = currentPosition + Duration(seconds: 10);
//     _controller.seekTo(newPosition <= _controller.value.duration ? newPosition : _controller.value.duration); // Ensure position doesn't exceed duration
//     _startHideTimer(); // Restart the auto-hide timer
//   }
//
//   String _formatDuration(Duration duration) {
//     String twoDigits(int n) => n.toString().padLeft(2, '0');
//     final twoDigitMinutes = twoDigits(duration.inMinutes.remainder(60));
//     final twoDigitSeconds = twoDigits(duration.inSeconds.remainder(60));
//     return "${twoDigits(duration.inHours)}:$twoDigitMinutes:$twoDigitSeconds";
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     // Add debugging logs
//     if (_controller.value.isInitialized) {
//       print("Video Duration: ${_controller.value.duration}");
//       print("Current Position: ${_controller.value.position}");
//     }
//
//     return WillPopScope(
//       onWillPop: () async => !_isFullScreen, // Prevent back navigation in fullscreen
//       child: Dialog(
//         insetPadding: EdgeInsets.all(_isFullScreen ? 0 : 16), // Remove padding in fullscreen
//         backgroundColor: Colors.black, // Set background to black for better visibility
//         child: GestureDetector(
//           behavior: HitTestBehavior.translucent, // Allow child widgets to receive touch events
//           onTap: _toggleControlsVisibility, // Toggle controls on tap
//           child: Stack(
//             children: [
//               // Video Player
//               Center(
//                 child: _controller.value.isInitialized
//                     ? AspectRatio(
//                   aspectRatio: _controller.value.aspectRatio,
//                   child: VideoPlayer(_controller),
//                 )
//                     : Container(
//                   width: 100,
//                   height: 100,
//                   child: CircularProgressIndicator(),
//                 ),
//               ),
//
//               // Play/Pause Overlay
//               if (_isControlsVisible)
//                 Positioned.fill(
//                   child: Container(
//                     color: Colors.black45, // Semi-transparent overlay
//                     child: Center(
//                       child: IconButton(
//                         icon: Icon(
//                           _controller.value.isPlaying
//                               ? Icons.pause_circle_filled
//                               : Icons.play_circle_filled,
//                           color: Colors.white,
//                           size: 60,
//                         ),
//                         onPressed: _playPauseVideo, // Play/Pause functionality
//                         tooltip: _controller.value.isPlaying ? 'Pause' : 'Play',
//                       ),
//                     ),
//                   ),
//                 ),
//
//               // Video Controls: Rewind, Play/Pause, Forward
//               if (_isControlsVisible)
//                 Positioned(
//                   bottom: 50, // Position above the progress bar
//                   left: 20,
//                   right: 20,
//                   child: Row(
//                     mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                     children: [
//                       // Rewind 10 Seconds
//                       IconButton(
//                         icon: Icon(Icons.replay_10, color: Colors.white, size: 30),
//                         onPressed: _rewind10Seconds, // Rewind functionality
//                         tooltip: 'Rewind 10 seconds',
//                       ),
//
//                       // Play/Pause Button
//                       IconButton(
//                         icon: Icon(
//                           _controller.value.isPlaying ? Icons.pause : Icons.play_arrow,
//                           color: Colors.white,
//                           size: 30,
//                         ),
//                         onPressed: _playPauseVideo, // Play/Pause functionality
//                         tooltip: _controller.value.isPlaying ? 'Pause' : 'Play',
//                       ),
//
//                       // Forward 10 Seconds
//                       IconButton(
//                         icon: Icon(Icons.forward_10, color: Colors.white, size: 30),
//                         onPressed: _forward10Seconds, // Forward functionality
//                         tooltip: 'Forward 10 seconds',
//                       ),
//                     ],
//                   ),
//                 ),
//
//               // Fullscreen Toggle Button
//               if (_isControlsVisible)
//                 Positioned(
//                   top: 10,
//                   right: 10,
//                   child: IconButton(
//                     icon: Icon(
//                       _isFullScreen ? Icons.fullscreen_exit : Icons.fullscreen,
//                       color: Colors.white,
//                       size: 30,
//                     ),
//                     onPressed: _toggleFullScreen, // Fullscreen toggle functionality
//                     tooltip: _isFullScreen ? 'Exit Fullscreen' : 'Enter Fullscreen',
//                   ),
//                 ),
//
//               // Video Progress Indicator with Time Labels
//               if (_isControlsVisible && _controller.value.duration.inSeconds > 0)
//                 Positioned(
//                   bottom: 10, // Position at the bottom
//                   left: 20,
//                   right: 20,
//                   child: Row(
//                     children: [
//                       // Current Position
//                       Text(
//                         _formatDuration(_controller.value.position),
//                         style: TextStyle(color: Colors.white),
//                       ),
//                       SizedBox(width: 8),
//                       // Progress Bar
//                       Expanded(
//                         child: VideoProgressIndicator(
//                           _controller,
//                           allowScrubbing: true, // Allow users to seek by dragging
//                           padding: EdgeInsets.symmetric(horizontal: 8.0),
//                           colors: VideoProgressColors(
//                             playedColor: Colors.blue,
//                             backgroundColor: Colors.grey,
//                             bufferedColor: Colors.lightBlue,
//                           ),
//                         ),
//                       ),
//                       SizedBox(width: 8),
//                       // Total Duration
//                       Text(
//                         _formatDuration(_controller.value.duration),
//                         style: TextStyle(color: Colors.white),
//                       ),
//                     ],
//                   ),
//                 ),
//
//               // Buffering Indicator
//               if (_controller.value.isBuffering && _isControlsVisible)
//                 Center(
//                   child: CircularProgressIndicator(),
//                 ),
//             ],
//           ),
//         ),
//       ),
//     );
//   }
// }
//
// // lib/widgets/video_popup.dart
// import 'package:flutter/material.dart';
// import 'package:video_player/video_player.dart';
// import 'package:flutter/services.dart';
// import 'dart:async';
//
// class VideoPopup extends StatefulWidget {
//   final String videoUrl;
//
//   const VideoPopup({Key? key, required this.videoUrl}) : super(key: key);
//
//   @override
//   _VideoPopupState createState() => _VideoPopupState();
// }
//
// class _VideoPopupState extends State<VideoPopup> {
//   late VideoPlayerController _controller;
//   bool _isFullScreen = false;
//   bool _isControlsVisible = true;
//   Timer? _hideTimer;
//
//   @override
//   void initState() {
//     super.initState();
//     _initializeVideo();
//   }
//
//   Future<void> _initializeVideo() async {
//     _controller = VideoPlayerController.network(widget.videoUrl);
//
//     try {
//       await _controller.initialize();
//       await _controller.seekTo(Duration.zero); // Ensure starting at the beginning
//       setState(() {}); // Update UI after initialization and seeking
//       _controller.play(); // Start playing automatically
//       _startHideTimer(); // Start the auto-hide timer
//     } catch (e) {
//       // Handle video initialization errors
//       print("Error initializing video: $e");
//       // Optionally, show an error message to the user
//       setState(() {});
//     }
//   }
//
//   @override
//   void dispose() {
//     _hideTimer?.cancel(); // Cancel any active timers
//     _controller.dispose(); // Dispose the controller to free resources
//     // Reset screen orientation and UI mode if in fullscreen
//     if (_isFullScreen) {
//       SystemChrome.setEnabledSystemUIMode(SystemUiMode.edgeToEdge);
//       SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]);
//     }
//     super.dispose();
//   }
//
//   void _toggleFullScreen() {
//     setState(() {
//       _isFullScreen = !_isFullScreen;
//     });
//     if (_isFullScreen) {
//       // Enter fullscreen mode
//       SystemChrome.setEnabledSystemUIMode(SystemUiMode.immersiveSticky);
//       SystemChrome.setPreferredOrientations([
//         DeviceOrientation.landscapeLeft,
//         DeviceOrientation.landscapeRight,
//       ]);
//     } else {
//       // Exit fullscreen mode
//       SystemChrome.setEnabledSystemUIMode(SystemUiMode.edgeToEdge);
//       SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]);
//     }
//   }
//
//   void _toggleControlsVisibility() {
//     setState(() {
//       _isControlsVisible = !_isControlsVisible;
//     });
//     if (_isControlsVisible) {
//       _startHideTimer(); // Restart the auto-hide timer
//     } else {
//       _hideTimer?.cancel(); // Cancel the timer if controls are hidden
//     }
//   }
//
//   void _startHideTimer() {
//     _hideTimer?.cancel(); // Cancel any existing timer
//     _hideTimer = Timer(Duration(seconds: 3), () {
//       setState(() {
//         _isControlsVisible = false; // Hide controls after 3 seconds
//       });
//     });
//   }
//
//   void _playPauseVideo() {
//     setState(() {
//       if (_controller.value.isPlaying) {
//         _controller.pause(); // Pause the video
//       } else {
//         _controller.play(); // Play the video
//         _startHideTimer(); // Restart the auto-hide timer
//       }
//     });
//   }
//
//   void _rewind10Seconds() {
//     final currentPosition = _controller.value.position;
//     final newPosition = currentPosition - Duration(seconds: 10);
//     _controller.seekTo(newPosition >= Duration.zero ? newPosition : Duration.zero); // Ensure position isn't negative
//     _startHideTimer(); // Restart the auto-hide timer
//   }
//
//   void _forward10Seconds() {
//     final currentPosition = _controller.value.position;
//     final newPosition = currentPosition + Duration(seconds: 10);
//     _controller.seekTo(newPosition <= _controller.value.duration ? newPosition : _controller.value.duration); // Ensure position doesn't exceed duration
//     _startHideTimer(); // Restart the auto-hide timer
//   }
//
//   String _formatDuration(Duration duration) {
//     String twoDigits(int n) => n.toString().padLeft(2, '0');
//     final twoDigitMinutes = twoDigits(duration.inMinutes.remainder(60));
//     final twoDigitSeconds = twoDigits(duration.inSeconds.remainder(60));
//     return "${twoDigits(duration.inHours)}:$twoDigitMinutes:$twoDigitSeconds";
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return WillPopScope(
//       onWillPop: () async => !_isFullScreen, // Prevent back navigation in fullscreen
//       child: Dialog(
//         insetPadding: EdgeInsets.all(_isFullScreen ? 0 : 16), // Remove padding in fullscreen
//         backgroundColor: Colors.black, // Set background to black for better visibility
//         child: GestureDetector(
//           behavior: HitTestBehavior.translucent, // Allow child widgets to receive touch events
//           onTap: _toggleControlsVisibility, // Toggle controls on tap
//           child: Stack(
//             children: [
//               // Video Player
//               Center(
//                 child: _controller.value.isInitialized
//                     ? AspectRatio(
//                   aspectRatio: _controller.value.aspectRatio,
//                   child: VideoPlayer(_controller),
//                 )
//                     : Container(
//                   width: 100,
//                   height: 100,
//                   child: CircularProgressIndicator(),
//                 ),
//               ),
//
//               // Play/Pause Overlay
//               if (_isControlsVisible && _controller.value.isInitialized)
//                 Positioned.fill(
//                   child: Container(
//                     color: Colors.black45, // Semi-transparent overlay
//                     child: Center(
//                       child: IconButton(
//                         icon: Icon(
//                           _controller.value.isPlaying
//                               ? Icons.pause_circle_filled
//                               : Icons.play_circle_filled,
//                           color: Colors.white,
//                           size: 60,
//                         ),
//                         onPressed: _playPauseVideo, // Play/Pause functionality
//                         tooltip: _controller.value.isPlaying ? 'Pause' : 'Play',
//                       ),
//                     ),
//                   ),
//                 ),
//
//               // Video Controls: Rewind, Play/Pause, Forward
//               if (_isControlsVisible && _controller.value.isInitialized)
//                 Positioned(
//                   bottom: 50, // Position above the progress bar
//                   left: 20,
//                   right: 20,
//                   child: Row(
//                     mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                     children: [
//                       // Rewind 10 Seconds
//                       IconButton(
//                         icon: Icon(Icons.replay_10, color: Colors.white, size: 30),
//                         onPressed: _rewind10Seconds, // Rewind functionality
//                         tooltip: 'Rewind 10 seconds',
//                       ),
//
//                       // Play/Pause Button
//                       IconButton(
//                         icon: Icon(
//                           _controller.value.isPlaying ? Icons.pause : Icons.play_arrow,
//                           color: Colors.white,
//                           size: 30,
//                         ),
//                         onPressed: _playPauseVideo, // Play/Pause functionality
//                         tooltip: _controller.value.isPlaying ? 'Pause' : 'Play',
//                       ),
//
//                       // Forward 10 Seconds
//                       IconButton(
//                         icon: Icon(Icons.forward_10, color: Colors.white, size: 30),
//                         onPressed: _forward10Seconds, // Forward functionality
//                         tooltip: 'Forward 10 seconds',
//                       ),
//                     ],
//                   ),
//                 ),
//
//               // Fullscreen Toggle Button
//               if (_isControlsVisible && _controller.value.isInitialized)
//                 Positioned(
//                   top: 10,
//                   right: 10,
//                   child: IconButton(
//                     icon: Icon(
//                       _isFullScreen ? Icons.fullscreen_exit : Icons.fullscreen,
//                       color: Colors.white,
//                       size: 30,
//                     ),
//                     onPressed: _toggleFullScreen, // Fullscreen toggle functionality
//                     tooltip: _isFullScreen ? 'Exit Fullscreen' : 'Enter Fullscreen',
//                   ),
//                 ),
//
//               // Video Progress Indicator with Time Labels
//               if (_isControlsVisible && _controller.value.isInitialized && _controller.value.duration.inSeconds > 0)
//                 Positioned(
//                   bottom: 10, // Position at the bottom
//                   left: 20,
//                   right: 20,
//                   child: Row(
//                     children: [
//                       // Current Position
//                       Text(
//                         _formatDuration(_controller.value.position),
//                         style: TextStyle(color: Colors.white),
//                       ),
//                       SizedBox(width: 8),
//                       // Progress Bar
//                       Expanded(
//                         child: VideoProgressIndicator(
//                           _controller,
//                           allowScrubbing: true, // Allow users to seek by dragging
//                           padding: EdgeInsets.symmetric(horizontal: 8.0),
//                           colors: VideoProgressColors(
//                             playedColor: Colors.blue,
//                             backgroundColor: Colors.grey,
//                             bufferedColor: Colors.lightBlue,
//                           ),
//                         ),
//                       ),
//                       SizedBox(width: 8),
//                       // Total Duration
//                       Text(
//                         _formatDuration(_controller.value.duration),
//                         style: TextStyle(color: Colors.white),
//                       ),
//                     ],
//                   ),
//                 ),
//
//               // Buffering Indicator
//               if (_controller.value.isBuffering && _isControlsVisible && _controller.value.isInitialized)
//                 Center(
//                   child: CircularProgressIndicator(),
//                 ),
//             ],
//           ),
//         ),
//       ),
//     );
//   }
// }

// lib/widgets/video_popup.dart
// import 'package:flutter/material.dart';
// import 'package:video_player/video_player.dart';
// import 'package:flutter/services.dart';
// import 'package:intl/intl.dart'; // Add this for formatting the duration
//
// class VideoPopup extends StatefulWidget {
//   final String videoUrl;
//
//   const VideoPopup({Key? key, required this.videoUrl}) : super(key: key);
//
//   @override
//   _VideoPopupState createState() => _VideoPopupState();
// }
//
// class _VideoPopupState extends State<VideoPopup> {
//   late VideoPlayerController _controller;
//   bool _isFullScreen = false;
//   bool _isPlaying = false;
//   bool _isBuffering = false;
//
//   @override
//   void initState() {
//     super.initState();
//     _controller = VideoPlayerController.network(widget.videoUrl)
//       ..initialize().then((_) {
//         setState(() {
//           _isPlaying = _controller.value.isPlaying;
//         });
//         _controller.play();
//       });
//     _controller.addListener(_videoListener);
//   }
//
//   void _videoListener() {
//     if (_controller.value.isBuffering != _isBuffering) {
//       setState(() {
//         _isBuffering = _controller.value.isBuffering;
//       });
//     }
//     // Update play/pause state
//     if (_controller.value.isPlaying != _isPlaying) {
//       setState(() {
//         _isPlaying = _controller.value.isPlaying;
//       });
//     }
//   }
//
//   @override
//   void dispose() {
//     _controller.removeListener(_videoListener);
//     _controller.dispose();
//     // Reset screen orientation and UI mode
//     if (_isFullScreen) {
//       SystemChrome.setEnabledSystemUIMode(SystemUiMode.edgeToEdge);
//       SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]);
//     }
//     super.dispose();
//   }
//
//   void _toggleFullScreen() {
//     setState(() {
//       _isFullScreen = !_isFullScreen;
//     });
//     if (_isFullScreen) {
//       // Enter full screen
//       SystemChrome.setEnabledSystemUIMode(SystemUiMode.immersiveSticky);
//       SystemChrome.setPreferredOrientations([
//         DeviceOrientation.landscapeLeft,
//         DeviceOrientation.landscapeRight,
//       ]);
//     } else {
//       // Exit full screen
//       SystemChrome.setEnabledSystemUIMode(SystemUiMode.edgeToEdge);
//       SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]);
//     }
//   }
//
//   void _togglePlayPause() {
//     setState(() {
//       if (_controller.value.isPlaying) {
//         _controller.pause();
//       } else {
//         if (_controller.value.position == _controller.value.duration) {
//           _controller.seekTo(Duration.zero);
//         }
//         _controller.play();
//       }
//     });
//   }
//
//   void _seekBackward() {
//     final currentPosition = _controller.value.position;
//     Duration newPosition = currentPosition - Duration(seconds: 10);
//     if (newPosition < Duration.zero) {
//       newPosition = Duration.zero;
//     }
//     _controller.seekTo(newPosition);
//   }
//
//   void _seekForward() {
//     final currentPosition = _controller.value.position;
//     final duration = _controller.value.duration;
//     Duration newPosition = currentPosition + Duration(seconds: 10);
//     if (newPosition > duration) {
//       newPosition = duration;
//     }
//     _controller.seekTo(newPosition);
//   }
//
//   String _formatDuration(Duration position) {
//     final minutes = position.inMinutes.remainder(60).toString().padLeft(2, '0');
//     final seconds = position.inSeconds.remainder(60).toString().padLeft(2, '0');
//     return '$minutes:$seconds';
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return WillPopScope(
//       onWillPop: () async => !_isFullScreen,
//       child: Dialog(
//         insetPadding: EdgeInsets.all(_isFullScreen ? 0 : 16),
//         backgroundColor: Colors.black, // Optional: set background color
//         child: _controller.value.isInitialized
//             ? AspectRatio(
//           aspectRatio: _controller.value.aspectRatio,
//           child: Stack(
//             children: [
//               // Video Player
//               VideoPlayer(_controller),
//
//               // Buffering Indicator
//               if (_isBuffering)
//                 Center(
//                   child: CircularProgressIndicator(),
//                 ),
//
//               // Top Right: Fullscreen Toggle Button
//               Positioned(
//                 top: 8,
//                 right: 8,
//                 child: IconButton(
//                   icon: Icon(
//                     _isFullScreen ? Icons.fullscreen_exit : Icons.fullscreen,
//                     color: Colors.white,
//                   ),
//                   onPressed: _toggleFullScreen,
//                 ),
//               ),
//
//               // Bottom Controls
//               Positioned(
//                 bottom: 0,
//                 left: 0,
//                 right: 0,
//                 child: Container(
//                   color: Colors.black54,
//                   padding: EdgeInsets.symmetric(horizontal: 8, vertical: 4),
//                   child: Column(
//                     mainAxisSize: MainAxisSize.min,
//                     children: [
//                       // Progress Bar
//                       VideoProgressIndicator(
//                         _controller,
//                         allowScrubbing: true,
//                         colors: VideoProgressColors(
//                           playedColor: Colors.blue,
//                           backgroundColor: Colors.grey,
//                           bufferedColor: Colors.white54,
//                         ),
//                       ),
//                       SizedBox(height: 8),
//                       // Controls Row
//                       Row(
//                         mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                         children: [
//                           // Current Time
//                           Text(
//                             _formatDuration(_controller.value.position),
//                             style: TextStyle(color: Colors.white),
//                           ),
//                           Row(
//                             children: [
//                               // Rewind 10 seconds
//                               IconButton(
//                                 icon: Icon(Icons.replay_10, color: Colors.white),
//                                 onPressed: _seekBackward,
//                               ),
//                               // Play/Pause
//                               IconButton(
//                                 icon: Icon(
//                                   _isPlaying ? Icons.pause : Icons.play_arrow,
//                                   color: Colors.white,
//                                 ),
//                                 onPressed: _togglePlayPause,
//                               ),
//                               // Forward 10 seconds
//                               IconButton(
//                                 icon: Icon(Icons.forward_10, color: Colors.white),
//                                 onPressed: _seekForward,
//                               ),
//                             ],
//                           ),
//                           // Total Duration
//                           Text(
//                             _formatDuration(_controller.value.duration),
//                             style: TextStyle(color: Colors.white),
//                           ),
//                         ],
//                       ),
//                     ],
//                   ),
//                 ),
//               ),
//             ],
//           ),
//         )
//             : Container(
//           height: 200,
//           child: Center(
//             child: CircularProgressIndicator(),
//           ),
//         ),
//       ),
//     );
//   }
// }
//
// import 'package:flutter/material.dart';
// import 'package:video_player/video_player.dart';
// import 'package:flutter/services.dart';
// import 'package:intl/intl.dart'; // Add this for formatting durations
//
// class VideoPopup extends StatefulWidget {
//   final String videoUrl;
//
//   const VideoPopup({Key? key, required this.videoUrl}) : super(key: key);
//
//   @override
//   _VideoPopupState createState() => _VideoPopupState();
// }
//
// class _VideoPopupState extends State<VideoPopup> {
//   late VideoPlayerController _controller;
//   bool _isFullScreen = false;
//   bool _isControlsVisible = true;
//   late Duration _currentPosition;
//   late Duration _videoDuration;
//
//   @override
//   void initState() {
//     super.initState();
//     _controller = VideoPlayerController.network(widget.videoUrl)
//       ..initialize().then((_) {
//         setState(() {
//           _videoDuration = _controller.value.duration;
//           _currentPosition = _controller.value.position;
//         });
//         _controller.play();
//       });
//     _controller.addListener(_videoListener);
//   }
//
//   void _videoListener() {
//     if (_controller.value.isInitialized) {
//       setState(() {
//         _currentPosition = _controller.value.position;
//         _videoDuration = _controller.value.duration;
//       });
//     }
//   }
//
//   @override
//   void dispose() {
//     _controller.removeListener(_videoListener);
//     _controller.dispose();
//     // Reset screen orientation and UI mode
//     if (_isFullScreen) {
//       SystemChrome.setEnabledSystemUIMode(SystemUiMode.edgeToEdge);
//       SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]);
//     }
//     super.dispose();
//   }
//
//   void _toggleFullScreen() {
//     setState(() {
//       _isFullScreen = !_isFullScreen;
//     });
//     if (_isFullScreen) {
//       // Enter full screen
//       SystemChrome.setEnabledSystemUIMode(SystemUiMode.immersiveSticky);
//       SystemChrome.setPreferredOrientations([
//         DeviceOrientation.landscapeLeft,
//         DeviceOrientation.landscapeRight,
//       ]);
//     } else {
//       // Exit full screen
//       SystemChrome.setEnabledSystemUIMode(SystemUiMode.edgeToEdge);
//       SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]);
//     }
//   }
//
//   String _formatDuration(Duration position) {
//     final ms = position.inMilliseconds;
//     final formatted = Duration(milliseconds: ms);
//     String twoDigits(int n) => n.toString().padLeft(2, '0');
//     final twoDigitMinutes = twoDigits(formatted.inMinutes.remainder(60));
//     final twoDigitSeconds = twoDigits(formatted.inSeconds.remainder(60));
//     return "${twoDigits(formatted.inHours)}:$twoDigitMinutes:$twoDigitSeconds";
//   }
//
//   void _seekBackward() {
//     final newPosition = _currentPosition - Duration(seconds: 10);
//     _controller.seekTo(newPosition >= Duration.zero ? newPosition : Duration.zero);
//   }
//
//   void _seekForward() {
//     final newPosition = _currentPosition + Duration(seconds: 10);
//     _controller.seekTo(newPosition <= _videoDuration ? newPosition : _videoDuration);
//   }
//
//   void _togglePlayPause() {
//     setState(() {
//       if (_controller.value.isPlaying) {
//         _controller.pause();
//       } else {
//         if (_currentPosition >= _videoDuration) {
//           _controller.seekTo(Duration.zero);
//         }
//         _controller.play();
//       }
//     });
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return WillPopScope(
//       onWillPop: () async => !_isFullScreen,
//       child: Dialog(
//         insetPadding: EdgeInsets.all(_isFullScreen ? 0 : 16),
//         backgroundColor: Colors.black,
//         child: _controller.value.isInitialized
//             ? GestureDetector(
//           onTap: () {
//             setState(() {
//               _isControlsVisible = !_isControlsVisible;
//             });
//           },
//           child: Stack(
//             children: [
//               AspectRatio(
//                 aspectRatio: _controller.value.aspectRatio,
//                 child: VideoPlayer(_controller),
//               ),
//               // Fullscreen toggle button
//               Positioned(
//                 top: 10,
//                 right: 10,
//                 child: IconButton(
//                   icon: Icon(
//                     _isFullScreen ? Icons.fullscreen_exit : Icons.fullscreen,
//                     color: Colors.white,
//                   ),
//                   onPressed: _toggleFullScreen,
//                 ),
//               ),
//               // Controls Overlay
//               _isControlsVisible
//                   ? Positioned(
//                 bottom: 0,
//                 left: 0,
//                 right: 0,
//                 child: Container(
//                   color: Colors.black54,
//                   padding: EdgeInsets.symmetric(horizontal: 10, vertical: 5),
//                   child: Column(
//                     mainAxisSize: MainAxisSize.min,
//                     children: [
//                       // Progress Bar
//                       VideoProgressIndicator(
//                         _controller,
//                         allowScrubbing: true,
//                         padding: EdgeInsets.symmetric(vertical: 5),
//                         colors: VideoProgressColors(
//                           playedColor: Colors.blue,
//                           backgroundColor: Colors.grey,
//                           bufferedColor: Colors.white54,
//                         ),
//                       ),
//                       Row(
//                         children: [
//                           // Remaining Time on the left
//                           Text(
//                             "-${_formatDuration(_videoDuration - _currentPosition)}",
//                             style: TextStyle(color: Colors.white),
//                           ),
//                           Spacer(),
//                           // Backward 10 seconds
//                           IconButton(
//                             icon: Icon(Icons.replay_10, color: Colors.white),
//                             onPressed: _seekBackward,
//                           ),
//                           // Play/Pause Button
//                           IconButton(
//                             icon: Icon(
//                               _controller.value.isPlaying ? Icons.pause : Icons.play_arrow,
//                               color: Colors.white,
//                             ),
//                             onPressed: _togglePlayPause,
//                           ),
//                           // Forward 10 seconds
//                           IconButton(
//                             icon: Icon(Icons.forward_10, color: Colors.white),
//                             onPressed: _seekForward,
//                           ),
//                           Spacer(),
//                           // Current Time on the right
//                           Text(
//                             _formatDuration(_currentPosition),
//                             style: TextStyle(color: Colors.white),
//                           ),
//                         ],
//                       ),
//                     ],
//                   ),
//                 ),
//               )
//                   : SizedBox.shrink(),
//             ],
//           ),
//         )
//             : Center(
//           child: CircularProgressIndicator(),
//         ),
//       ),
//     );
//   }
// }

import 'package:flutter/material.dart';
import 'package:video_player/video_player.dart';
import 'package:flutter/services.dart';
import 'package:intl/intl.dart'; // Add this for formatting durations

class VideoPopup extends StatefulWidget {
  final String videoUrl;

  const VideoPopup({Key? key, required this.videoUrl}) : super(key: key);

  @override
  _VideoPopupState createState() => _VideoPopupState();
}

class _VideoPopupState extends State<VideoPopup> {
  late VideoPlayerController _controller;
  bool _isFullScreen = false;
  bool _isControlsVisible = true;
  late Duration _currentPosition;
  late Duration _videoDuration;

  @override
  void initState() {
    super.initState();
    _controller = VideoPlayerController.network(widget.videoUrl)
      ..initialize().then((_) {
        setState(() {
          _videoDuration = _controller.value.duration;
          _currentPosition = _controller.value.position;
        });
        _controller.play();
      });
    _controller.addListener(_videoListener);
  }

  void _videoListener() {
    if (_controller.value.isInitialized) {
      setState(() {
        _currentPosition = _controller.value.position;
        _videoDuration = _controller.value.duration;
      });
    }
  }

  @override
  void dispose() {
    _controller.removeListener(_videoListener);
    _controller.dispose();
    // Reset screen orientation and UI mode
    if (_isFullScreen) {
      SystemChrome.setEnabledSystemUIMode(SystemUiMode.edgeToEdge);
      SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]);
    }
    super.dispose();
  }

  void _toggleFullScreen() {
    setState(() {
      _isFullScreen = !_isFullScreen;
    });
    if (_isFullScreen) {
      // Enter full screen
      SystemChrome.setEnabledSystemUIMode(SystemUiMode.immersiveSticky);
      SystemChrome.setPreferredOrientations([
        DeviceOrientation.landscapeLeft,
        DeviceOrientation.landscapeRight,
      ]);
    } else {
      // Exit full screen
      SystemChrome.setEnabledSystemUIMode(SystemUiMode.edgeToEdge);
      SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]);
    }
  }

  String _formatDuration(Duration position) {
    final ms = position.inMilliseconds;
    final formatted = Duration(milliseconds: ms);
    String twoDigits(int n) => n.toString().padLeft(2, '0');
    final twoDigitMinutes = twoDigits(formatted.inMinutes.remainder(60));
    final twoDigitSeconds = twoDigits(formatted.inSeconds.remainder(60));
    return "${twoDigits(formatted.inHours)}:$twoDigitMinutes:$twoDigitSeconds";
  }

  void _seekBackward() {
    final newPosition = _currentPosition - Duration(seconds: 10);
    _controller.seekTo(newPosition >= Duration.zero ? newPosition : Duration.zero);
  }

  void _seekForward() {
    final newPosition = _currentPosition + Duration(seconds: 10);
    _controller.seekTo(newPosition <= _videoDuration ? newPosition : _videoDuration);
  }

  void _togglePlayPause() {
    setState(() {
      if (_controller.value.isPlaying) {
        _controller.pause();
      } else {
        if (_currentPosition >= _videoDuration) {
          _controller.seekTo(Duration.zero);
        }
        _controller.play();
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async => !_isFullScreen,
      child: Dialog(
        insetPadding: EdgeInsets.all(_isFullScreen ? 0 : 16),
        backgroundColor: Colors.black,
        child: _controller.value.isInitialized
            ? GestureDetector(
          onTap: () {
            setState(() {
              _isControlsVisible = !_isControlsVisible;
            });
          },
          child: Stack(
            children: [
              AspectRatio(
                aspectRatio: _controller.value.aspectRatio,
                child: VideoPlayer(_controller),
              ),
              // Fullscreen toggle button
              Positioned(
                top: 10,
                right: 10,
                child: IconButton(
                  icon: Icon(
                    _isFullScreen ? Icons.fullscreen_exit : Icons.fullscreen,
                    color: Colors.white,
                  ),
                  onPressed: _toggleFullScreen,
                ),
              ),
              // Controls Overlay
              _isControlsVisible
                  ? Positioned(
                bottom: 0,
                left: 0,
                right: 0,
                child: Container(
                  color: Colors.black54,
                  padding: EdgeInsets.symmetric(horizontal: 10, vertical: 5),
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      // Progress Bar
                      VideoProgressIndicator(
                        _controller,
                        allowScrubbing: true,
                        padding: EdgeInsets.symmetric(vertical: 5),
                        colors: VideoProgressColors(
                          playedColor: Colors.blue,
                          backgroundColor: Colors.grey,
                          bufferedColor: Colors.white54,
                        ),
                      ),
                      Row(
                        children: [
                          // Current Time on the left
                          Text(
                            _formatDuration(_currentPosition),
                            style: TextStyle(color: Colors.white),
                          ),
                          Spacer(),
                          // Backward 10 seconds
                          IconButton(
                            icon: Icon(Icons.replay_10, color: Colors.white),
                            onPressed: _seekBackward,
                          ),
                          // Play/Pause Button
                          IconButton(
                            icon: Icon(
                              _controller.value.isPlaying ? Icons.pause : Icons.play_arrow,
                              color: Colors.white,
                            ),
                            onPressed: _togglePlayPause,
                          ),
                          // Forward 10 seconds
                          IconButton(
                            icon: Icon(Icons.forward_10, color: Colors.white),
                            onPressed: _seekForward,
                          ),
                          Spacer(),
                          // Remaining Time on the right
                          Text(
                            "-${_formatDuration(_videoDuration - _currentPosition)}",
                            style: TextStyle(color: Colors.white),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              )
                  : SizedBox.shrink(),
            ],
          ),
        )
            : Center(
          child: CircularProgressIndicator(),
        ),
      ),
    );
  }
}

// lib/services/home_service.dart
// import 'dart:async';
//
// class HomeService {
//   // Dummy upcoming lesson data
//   Future<Map<String, dynamic>> fetchUpcomingLesson() async {
//     await Future.delayed(Duration(seconds: 2)); // Simulate delay
//     return {
//       "day": "Sun",
//       "date": "21 Jan 2024",
//       "time": "00:00 - 00:25 (starts in 3 hours)",
//       "totalLessonTime": "3 hours"
//     };
//   }
//
//   // Dummy recommended tutors data
//   Future<List<Map<String, dynamic>>> fetchRecommendedTutors() async {
//     // Simulate delay
//     await Future.delayed(Duration(seconds: 2));
//     // Dummy data
//     return [
//       {
//         "name": "John Doe",
//         "subject": "Mathematics",
//         "rating": 4.8,
//         "profilePicture": "https://example.com/john_doe.jpg",
//       },
//       {
//         "name": "Jane Smith",
//         "subject": "Physics",
//         "rating": 4.6,
//         "profilePicture": "https://example.com/jane_smith.jpg",
//       },
//       // Add more tutors as needed
//     ];
//   }
// }

// lib/services/home_service.dart

import 'dart:async';
import '../models/tutor_item.dart';
import '../models/upcoming_lesson_item.dart';

class HomeService {
  // Dummy upcoming lesson data with 'id' as primary key
  Future<UpcomingLessonItem> fetchUpcomingLesson() async {
    await Future.delayed(Duration(seconds: 2)); // Simulate delay
    return UpcomingLessonItem(
      id: 'lesson1',
      day: "Sun",
      date: "21 Jan 2024",
      time: "00:00 - 00:25 (starts in 3 hours)",
      totalLessonTime: "3 hours",
    );
  }

  // Dummy recommended tutors data with 'id' as primary key
  Future<List<TutorItem>> fetchRecommendedTutors() async {
    // Simulate delay
    await Future.delayed(Duration(seconds: 2));
    // Dummy data
    return [
      TutorItem(
        id: 'tutor1',
        name: "John Doe",
        subject: "Mathematics",
        rating: 4.8,
        profilePicture: "https://example.com/john_doe.jpg",
      ),
      TutorItem(
        id: 'tutor2',
        name: "Jane Smith",
        subject: "Physics",
        rating: 4.6,
        profilePicture: "https://example.com/jane_smith.jpg",
      ),
      // Add more tutors as needed
    ];
  }

// Example of how to fetch from Firestore in the future
/*
  import 'package:cloud_firestore/cloud_firestore.dart';

  Future<UpcomingLessonItem> fetchUpcomingLessonFromFirestore(String lessonId) async {
    try {
      DocumentSnapshot doc = await FirebaseFirestore.instance.collection('upcoming_lessons').doc(lessonId).get();
      if (doc.exists) {
        return UpcomingLessonItem.fromJson(doc.data() as Map<String, dynamic>, doc.id);
      } else {
        throw Exception('Lesson not found');
      }
    } catch (e) {
      throw Exception('Failed to load upcoming lesson: $e');
    }
  }

  Future<List<TutorItem>> fetchRecommendedTutorsFromFirestore() async {
    try {
      QuerySnapshot snapshot = await FirebaseFirestore.instance.collection('recommended_tutors').get();
      return snapshot.docs.map((doc) => TutorItem.fromJson(doc.data() as Map<String, dynamic>, doc.id)).toList();
    } catch (e) {
      throw Exception('Failed to load recommended tutors: $e');
    }
  }
  */
}

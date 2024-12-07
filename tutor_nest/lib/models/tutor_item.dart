// lib/models/tutor_item.dart

class TutorItem {
  final String id; // Primary key
  final String name;
  final String subject;
  final double rating;
  final String profilePicture;

  TutorItem({
    required this.id,
    required this.name,
    required this.subject,
    required this.rating,
    required this.profilePicture,
  });

  // Factory method to create a TutorItem from JSON or Firestore document
  factory TutorItem.fromJson(Map<String, dynamic> json, String docId) {
    return TutorItem(
      id: docId,
      name: json['name'] ?? 'Unknown Tutor',
      subject: json['subject'] ?? 'Subject not provided',
      rating: (json['rating'] ?? 0).toDouble(),
      profilePicture: json['profilePicture'] ?? '',
    );
  }

  // Method to convert a TutorItem to JSON (if needed)
  Map<String, dynamic> toJson() {
    return {
      'name': name,
      'subject': subject,
      'rating': rating,
      'profilePicture': profilePicture,
    };
  }
}

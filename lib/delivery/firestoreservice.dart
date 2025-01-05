import 'package:cloud_firestore/cloud_firestore.dart';

class FirestoreService {
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  /// Add a new delivery boy to the delivery_boys collection
  Future<void> addDeliveryBoy({
    required String name,
    required String contact,
    required double rating,
    required int ratingCount,
  }) async {
    try {
      // Generate a unique ID for the document
      String id = _firestore.collection('delivery_boys').doc().id;

      // Add a new document to the collection
      await _firestore.collection('delivery_boys').doc(id).set({
        'id': id,
        'name': name,
        'contact': contact,
        'status': 'Available', // Default status
        'current_orders': [], // Initialize with an empty list
        'rating': rating, // Rating value passed as input
        'rating_count': ratingCount, // Rating count value passed as input
      });

      print("Delivery boy added successfully.");
    } catch (e) {
      print("Error adding delivery boy: $e");
    }
  }
}

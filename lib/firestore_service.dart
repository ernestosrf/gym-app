import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

class FirestoreService {
  final FirebaseFirestore _db = FirebaseFirestore.instance;

  Future<void> addExercise(String userId, Map<String, dynamic> exerciseData) async {
    try {
      await _db.collection('users').doc(userId).collection('exercise').add(exerciseData);
    } catch (e) {
      print('Error adding exercise: $e');
    }
  }

  Future<void> updateExercise(String userId, String exerciseId, Map<String, dynamic> exerciseData) async {
    try {
      await _db.collection('users').doc(userId).collection('exercise').doc(exerciseId).update(exerciseData);
    } catch (e) {
      print('Error updating exercise: $e');
    }
  }

  Stream<QuerySnapshot> getExercises(String userId) {
    return _db.collection('users').doc(userId).collection('exercise').snapshots();
  }

  Future<void> deleteExercise(String userId, String exerciseId) async {
    try {
      await _db.collection('users').doc(userId).collection('exercise').doc(exerciseId).delete();
    } catch (e) {
      print('Error deleting exercise: $e');
    }
  }

  Future<String?> getUserIdFromFirestore() async {
  User? user = FirebaseAuth.instance.currentUser;
  if (user != null) {
    try {
      QuerySnapshot querySnapshot = await FirebaseFirestore.instance.collection('users').where('email', isEqualTo: user.email).get();
      if (querySnapshot.docs.isNotEmpty) {
        return querySnapshot.docs.first.id;
      } else {
        print('No document found for user');
        return null;
      }
    } catch (e) {
      print('Error getting user ID from Firestore: $e');
      return null;
    }
  } else {
    print('User is not logged in');
    return null;
  }
}
}

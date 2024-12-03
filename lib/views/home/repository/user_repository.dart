import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:home_ease/models/user_model.dart';

class UserRepository {
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  Future<UserModel?> fetchUserDetails(String userId) async {
    try {
      final doc = await _firestore.collection('users').doc(userId).get();
      if (doc.exists) {
        debugPrint("User data: ${doc.data()}");
        return UserModel.fromJson(doc.data()!);
      } else {
        debugPrint("User document does not exist for ID: $userId");
      }
    } catch (e) {
      debugPrint("Error fetching user: $e");
    }
    return null;
  }
}

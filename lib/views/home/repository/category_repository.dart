import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:home_ease/models/product_model.dart';

class CategoryRepository {
  final FirebaseFirestore _firestore;

  CategoryRepository(this._firestore);

  Future<List<ProductsModel>> fetchLampProducts() async {
    try {
      final snapshot = await _firestore.collection('lamp').get();
      debugPrint("Fetched ${snapshot.docs.length} lamp products.");
      return snapshot.docs
          .map((doc) => ProductsModel.fromFirestore(doc))
          .toList();
    } catch (e) {
      debugPrint("Error fetching lamp products: $e");
      rethrow;
    }
  }

  Future<List<ProductsModel>> fetchSofaProducts() async {
    try {
      final snapshot = await _firestore.collection('sofa').get();
      debugPrint("Fetched ${snapshot.docs.length} sofa products.");
      return snapshot.docs
          .map((doc) => ProductsModel.fromFirestore(doc))
          .toList();
    } catch (e) {
      debugPrint("Error fetching sofa products: $e");
      rethrow;
    }
  }

  Future<List<ProductsModel>> fetchElectronicsProducts() async {
    try {
      final snapshot = await _firestore.collection('electronics').get();
      debugPrint("Fetched ${snapshot.docs.length} electronics products.");
      return snapshot.docs
          .map((doc) => ProductsModel.fromFirestore(doc))
          .toList();
    } catch (e) {
      debugPrint("Error fetching electronics products: $e");
      rethrow;
    }
  }

  Future<List<ProductsModel>> fetchCupBoardProducts() async {
    try {
      final snapshot = await _firestore.collection('cup_board').get();
      debugPrint("Fetched ${snapshot.docs.length} cup_board products.");
      return snapshot.docs
          .map((doc) => ProductsModel.fromFirestore(doc))
          .toList();
    } catch (e) {
      debugPrint("Error fetching cup_board products: $e");
      rethrow;
    }
  }
}

final categoryRepositoryProvider = Provider((ref) {
  return CategoryRepository(FirebaseFirestore.instance);
});

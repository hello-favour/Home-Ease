import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:home_ease/models/product_model.dart';

class ProductsRepository {
  final FirebaseFirestore _firestore;

  ProductsRepository(this._firestore);

  Future<List<ProductsModel>> fetchPopularProducts() async {
    try {
      final snapshot = await _firestore.collection('popular_products').get();
      debugPrint("Fetched ${snapshot.docs.length} popular products.");
      return snapshot.docs
          .map((doc) => ProductsModel.fromFirestore(doc))
          .toList();
    } catch (e) {
      debugPrint("Error fetching popular products: $e");
      rethrow;
    }
  }

  Future<List<ProductsModel>> fetchNewArrivalProducts() async {
    try {
      final snapshot =
          await _firestore.collection('new_arrival_products').get();
      debugPrint("Fetched ${snapshot.docs.length} new arrival products.");
      return snapshot.docs
          .map((doc) => ProductsModel.fromFirestore(doc))
          .toList();
    } catch (e) {
      debugPrint("Error fetching new arrival products: $e");
      rethrow;
    }
  }

  Future<List<ProductsModel>> fetchRecommendedProducts() async {
    try {
      final snapshot =
          await _firestore.collection('recommended_products').get();
      debugPrint("Fetched ${snapshot.docs.length} recommended products.");
      return snapshot.docs
          .map((doc) => ProductsModel.fromFirestore(doc))
          .toList();
    } catch (e) {
      debugPrint("Error fetching recommended products: $e");
      rethrow;
    }
  }
}

final productsRepositoryProvider = Provider((ref) {
  return ProductsRepository(FirebaseFirestore.instance);
});

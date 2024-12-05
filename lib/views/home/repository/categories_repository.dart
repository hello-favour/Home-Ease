import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:home_ease/models/product_model.dart';

class CategoriesRepository {
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  Future<List<ProductsModel>> fetchProducts(String collectionName) async {
    try {
      final QuerySnapshot snapshot =
          await _firestore.collection(collectionName).get();

      return snapshot.docs.map((doc) {
        return ProductsModel(
          id: doc.id,
          title: doc['title'],
          description: doc['description'],
          imagePath: doc['imagePath'],
          price: (doc['price'] as num).toDouble(),
          rating: (doc['rating'] as num).toDouble(),
        );
      }).toList();
    } catch (e) {
      throw Exception('Failed to fetch products: $e');
    }
  }
}

final categoriesRepositoryProvider = Provider((ref) {
  return CategoriesRepository();
});

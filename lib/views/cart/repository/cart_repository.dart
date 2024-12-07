import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:home_ease/models/product_model.dart';

class CartRepository {
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  // Add product to Firebase cart
  Future<void> addToCart(String userId, ProductsModel product) async {
    final docRef = _firestore
        .collection('cart')
        .doc(userId)
        .collection('items')
        .doc(product.id);
    await docRef.set(product.toFirestore());
  }

  // Fetch cart items from Firebase
  Stream<List<ProductsModel>> getCartItems(String userId) {
    return _firestore
        .collection('cart')
        .doc(userId)
        .collection('items')
        .snapshots()
        .map((snapshot) => snapshot.docs.map((doc) {
              return ProductsModel.fromFirestore(doc);
            }).toList());
  }

  // Remove product from Firebase cart
  Future<void> removeFromCart(String userId, String productId) async {
    await _firestore
        .collection('cart')
        .doc(userId)
        .collection('items')
        .doc(productId)
        .delete();
  }

  // Calculate total amount of the cart
  Future<double> calculateTotalAmount(String userId) async {
    final querySnapshot = await _firestore
        .collection('cart')
        .doc(userId)
        .collection('items')
        .get();

    double total = 0.0;

    for (var doc in querySnapshot.docs) {
      final data = doc.data();
      final price = (data['price'] as num?)?.toDouble() ?? 0.0;
      total += price;
    }

    return total;
  }
}

// Provider for CartRepository
final cartRepositoryProvider = Provider<CartRepository>((ref) {
  return CartRepository();
});

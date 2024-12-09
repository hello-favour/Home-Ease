import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:home_ease/models/product_model.dart';

class FavoriteRepository {
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  // Save product to Firebase wishlist
  Future<void> addToWishlist(String userId, ProductsModel product) async {
    final docRef = _firestore
        .collection('wishlist')
        .doc(userId)
        .collection('items')
        .doc(product.id);
    await docRef.set(product.toFirestore());
  }

  // Remove product from Firebase wishlist
  Future<void> removeFromWishlist(String userId, String productId) async {
    final docRef = _firestore
        .collection('wishlist')
        .doc(userId)
        .collection('items')
        .doc(productId);
    await docRef.delete();
  }

  // Fetch wishlist items from Firebase
  Stream<List<ProductsModel>> getWishlist(String userId) {
    return _firestore
        .collection('wishlist')
        .doc(userId)
        .collection('items')
        .snapshots()
        .map((snapshot) => snapshot.docs.map((doc) {
              return ProductsModel.fromFirestore(doc);
            }).toList());
  }
}

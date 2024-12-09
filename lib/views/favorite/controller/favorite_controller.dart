import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:home_ease/models/product_model.dart';
import 'package:home_ease/views/favorite/repository/favorite_repository.dart';

class FavoriteController extends StateNotifier<List<ProductsModel>> {
  final FavoriteRepository _repository;
  final String userId;

  FavoriteController(this._repository, this.userId) : super([]);

  // Add product to wishlist and save to Firebase
  Future<void> addToWishlist(ProductsModel product) async {
    if (!state.contains(product)) {
      state = [...state, product];
      await _repository.addToWishlist(userId, product);
    }
  }

  // Remove product from wishlist and delete from Firebase
  Future<void> removeFromWishlist(ProductsModel product) async {
    state = state.where((item) => item.id != product.id).toList();
    await _repository.removeFromWishlist(userId, product.id);
  }

  // Check if a product is in wishlist
  bool isInWishlist(ProductsModel product) {
    return state.any((item) => item.id == product.id);
  }

  // Load wishlist items from Firebase
  void loadWishlist() {
    _repository.getWishlist(userId).listen((wishlist) {
      state = wishlist;
    });
  }
}

// Provider for FavoriteController
final favoriteControllerProvider = StateNotifierProvider.family<
    FavoriteController, List<ProductsModel>, String>(
  (ref, userId) {
    final repository = FavoriteRepository();
    return FavoriteController(repository, userId)..loadWishlist();
  },
);

// import 'package:flutter_riverpod/flutter_riverpod.dart';
// import 'package:home_ease/models/product_model.dart';

// class WishlistController extends StateNotifier<List<ProductsModel>> {
//   WishlistController() : super([]);

//   // Add product to wishlist
//   void addToWishlist(ProductsModel product) {
//     if (!state.contains(product)) {
//       state = [...state, product];
//     }
//   }

//   // Remove product from wishlist
//   void removeFromWishlist(ProductsModel product) {
//     state = state.where((item) => item.id != product.id).toList();
//   }

//   // Check if a product is in wishlist
//   bool isInWishlist(ProductsModel product) {
//     return state.any((item) => item.id == product.id);
//   }
// }

// // Provider for WishlistNotifier
// final wishlistNotifierProvider =
//     StateNotifierProvider<WishlistController, List<ProductsModel>>(
//   (ref) => WishlistController(),
// );

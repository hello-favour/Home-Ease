import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:home_ease/models/product_model.dart';
import 'package:home_ease/views/cart/repository/cart_repository.dart';

class CartController extends StateNotifier<AsyncValue<List<ProductsModel>>> {
  final CartRepository _repository;
  final String userId;

  CartController(this._repository, this.userId)
      : super(const AsyncValue.loading()) {
    _loadCart();
  }

  // Load cart items from Firebase
  void _loadCart() {
    _repository.getCartItems(userId).listen((cartItems) {
      state = AsyncValue.data(cartItems);
    });
  }

  // Add product to cart
  Future<void> addToCart(ProductsModel product) async {
    try {
      await _repository.addToCart(userId, product);
    } catch (e) {
      state = AsyncValue.error(e, StackTrace.current);
    }
  }

  // Remove product from cart
  Future<void> removeFromCart(String productId) async {
    try {
      await _repository.removeFromCart(userId, productId);
    } catch (e) {
      state = AsyncValue.error(e, StackTrace.current);
    }
  }

  // Get total amount of the cart
  Future<double> getTotalAmount() async {
    return await _repository.calculateTotalAmount(userId);
  }
}

final cartControllerProvider = StateNotifierProvider.family<CartController,
    AsyncValue<List<ProductsModel>>, String>((ref, userId) {
  final repository = ref.watch(cartRepositoryProvider);
  return CartController(repository, userId);
});

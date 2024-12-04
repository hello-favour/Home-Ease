import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:home_ease/models/product_model.dart';
import 'package:home_ease/views/home/repository/product_repository.dart';

class ProductsController
    extends StateNotifier<AsyncValue<List<ProductsModel>>> {
  final ProductsRepository _repository;

  ProductsController(this._repository) : super(const AsyncValue.loading());

  Future<void> fetchPopularProducts() async {
    state = const AsyncValue.loading();
    try {
      final products = await _repository.fetchPopularProducts();
      state = products.isEmpty
          ? AsyncValue.error("No popular products found", StackTrace.current)
          : AsyncValue.data(products);
    } catch (error, st) {
      state = AsyncValue.error(error, st);
    }
  }

  Future<void> fetchNewArrivalProducts() async {
    state = const AsyncValue.loading();
    try {
      final products = await _repository.fetchNewArrivalProducts();
      state = products.isEmpty
          ? AsyncValue.error(
              "No new arrival products found", StackTrace.current)
          : AsyncValue.data(products);
    } catch (error, st) {
      state = AsyncValue.error(error, st);
    }
  }

  Future<void> fetchRecommendedProducts() async {
    state = const AsyncValue.loading();
    try {
      final products = await _repository.fetchRecommendedProducts();
      state = products.isEmpty
          ? AsyncValue.error(
              "No recommended products found", StackTrace.current)
          : AsyncValue.data(products);
    } catch (error, st) {
      state = AsyncValue.error(error, st);
    }
  }
}

final popularProductsProvider =
    StateNotifierProvider<ProductsController, AsyncValue<List<ProductsModel>>>(
  (ref) {
    final controller =
        ProductsController(ref.watch(productsRepositoryProvider));
    controller.fetchPopularProducts();
    return controller;
  },
);

final newArrivalProductsProvider =
    StateNotifierProvider<ProductsController, AsyncValue<List<ProductsModel>>>(
  (ref) {
    final controller =
        ProductsController(ref.watch(productsRepositoryProvider));
    controller.fetchNewArrivalProducts();
    return controller;
  },
);

final recommendedProductsProvider =
    StateNotifierProvider<ProductsController, AsyncValue<List<ProductsModel>>>(
  (ref) {
    final controller =
        ProductsController(ref.watch(productsRepositoryProvider));
    controller.fetchRecommendedProducts();
    return controller;
  },
);

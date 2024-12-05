import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:home_ease/models/product_model.dart';
import 'package:home_ease/views/home/repository/categories_repository.dart';

class CategoriesController
    extends StateNotifier<AsyncValue<List<ProductsModel>>> {
  final CategoriesRepository _repository;

  CategoriesController(this._repository) : super(const AsyncValue.loading());

  Future<void> fetchProducts(String collectionName) async {
    try {
      state = const AsyncValue.loading();
      final products = await _repository.fetchProducts(collectionName);
      state = AsyncValue.data(products);
    } catch (e, st) {
      state = AsyncValue.error(e, st);
    }
  }
}

final productsNotifierProvider = StateNotifierProvider<CategoriesController,
    AsyncValue<List<ProductsModel>>>(
  (ref) {
    final repository = ref.watch(categoriesRepositoryProvider);
    return CategoriesController(repository);
  },
);

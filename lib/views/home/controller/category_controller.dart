import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:home_ease/models/product_model.dart';
import 'package:home_ease/views/home/repository/category_repository.dart';

class CategoryController
    extends StateNotifier<AsyncValue<List<ProductsModel>>> {
  final CategoryRepository _repository;

  CategoryController(this._repository) : super(const AsyncValue.loading());

  Future<void> fetchLampProducts() async {
    state = const AsyncValue.loading();
    try {
      final products = await _repository.fetchLampProducts();
      state = products.isEmpty
          ? AsyncValue.error("No Lamp products found", StackTrace.current)
          : AsyncValue.data(products);
    } catch (error, st) {
      state = AsyncValue.error(error, st);
    }
  }

  Future<void> fetchSofaProducts() async {
    state = const AsyncValue.loading();
    try {
      final products = await _repository.fetchSofaProducts();
      state = products.isEmpty
          ? AsyncValue.error("No Sofa products found", StackTrace.current)
          : AsyncValue.data(products);
    } catch (error, st) {
      state = AsyncValue.error(error, st);
    }
  }

  Future<void> fetchElectronicsProducts() async {
    state = const AsyncValue.loading();
    try {
      final products = await _repository.fetchElectronicsProducts();
      state = products.isEmpty
          ? AsyncValue.error(
              "No Electronics products found", StackTrace.current)
          : AsyncValue.data(products);
    } catch (error, st) {
      state = AsyncValue.error(error, st);
    }
  }

  Future<void> fetchCupBoardProducts() async {
    state = const AsyncValue.loading();
    try {
      final products = await _repository.fetchCupBoardProducts();
      state = products.isEmpty
          ? AsyncValue.error("No Cup Board products found", StackTrace.current)
          : AsyncValue.data(products);
    } catch (error, st) {
      state = AsyncValue.error(error, st);
    }
  }
}

final lampProductsProvider =
    StateNotifierProvider<CategoryController, AsyncValue<List<ProductsModel>>>(
  (ref) {
    final controller =
        CategoryController(ref.watch(categoryRepositoryProvider));
    controller.fetchLampProducts();
    return controller;
  },
);

final sofaProductsProvider =
    StateNotifierProvider<CategoryController, AsyncValue<List<ProductsModel>>>(
  (ref) {
    final controller =
        CategoryController(ref.watch(categoryRepositoryProvider));
    controller.fetchSofaProducts();
    return controller;
  },
);

final cupboardProductsProvider =
    StateNotifierProvider<CategoryController, AsyncValue<List<ProductsModel>>>(
  (ref) {
    final controller =
        CategoryController(ref.watch(categoryRepositoryProvider));
    controller.fetchCupBoardProducts();
    return controller;
  },
);

final electricnoicsProductsProvider =
    StateNotifierProvider<CategoryController, AsyncValue<List<ProductsModel>>>(
  (ref) {
    final controller =
        CategoryController(ref.watch(categoryRepositoryProvider));
    controller.fetchElectronicsProducts();
    return controller;
  },
);

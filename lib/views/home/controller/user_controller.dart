import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:home_ease/models/user_model.dart';
import 'package:home_ease/views/home/repository/user_repository.dart';

final userControllerProvider =
    StateNotifierProvider<UserController, AsyncValue<UserModel?>>(
  (ref) => UserController(ref),
);

class UserController extends StateNotifier<AsyncValue<UserModel?>> {
  final Ref _ref;

  UserController(this._ref) : super(const AsyncValue.loading());

  Future<void> fetchUser(String userId) async {
    try {
      state = const AsyncValue.loading();
      final user =
          await _ref.read(userRepositoryProvider).fetchUserDetails(userId);
      state = AsyncValue.data(user);
    } catch (e, st) {
      state = AsyncValue.error(e, st);
    }
  }
}

final userRepositoryProvider = Provider<UserRepository>((ref) {
  return UserRepository();
});

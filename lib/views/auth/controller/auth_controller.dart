import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:home_ease/models/user_model.dart';
import 'package:home_ease/views/auth/repository/auth_repository.dart';

final authServiceProvider = Provider<AuthRepository>((ref) => AuthRepository());

final authControllerProvider =
    StateNotifierProvider<AuthController, AsyncValue<UserModel?>>(
  (ref) => AuthController(ref),
);

final authStateChangeProvider = StreamProvider((ref) {
  final authController = ref.watch(authControllerProvider.notifier);
  return authController.authStateChange;
});

class AuthController extends StateNotifier<AsyncValue<UserModel?>> {
  final Ref _ref;

  AuthController(this._ref) : super(const AsyncValue.data(null));

  Stream<User?> get authStateChange =>
      _ref.read(authServiceProvider).authStateChange;

  Future<void> signUp(String email, String password, String name) async {
    state = const AsyncValue.loading();
    try {
      final user =
          await _ref.read(authServiceProvider).signUp(email, password, name);
      state = AsyncValue.data(user);
    } catch (e, st) {
      _logError('SignUp Error', e, st);
      state = AsyncValue.error(e, st);
    }
  }

  Future<void> signIn(String email, String password) async {
    state = const AsyncValue.loading();
    try {
      final user = await _ref.read(authServiceProvider).signIn(email, password);
      state = AsyncValue.data(user);
    } catch (e, st) {
      _logError('SignIn Error', e, st);
      state = AsyncValue.error(e, st);
    }
  }

  Future<void> signOut() async {
    state = const AsyncValue.loading();
    try {
      await _ref.read(authServiceProvider).signOut();
      state = const AsyncValue.data(null);
    } catch (e, st) {
      _logError('SignOut Error', e, st);
      state = AsyncValue.error(e, st);
    }
  }

  Future<void> forgotPassword(String email) async {
    try {
      await _ref.read(authServiceProvider).forgotPassword(email);
    } catch (e, st) {
      _logError('ForgotPassword Error', e, st);
      // Optionally handle this error in the UI state if needed
    }
  }

  void _logError(String context, Object error, StackTrace stackTrace) {
    debugPrint('Error in $context: $error');
    debugPrint('StackTrace: $stackTrace');
  }
}

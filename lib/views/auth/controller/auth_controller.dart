import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:home_ease/views/auth/repository/auth_repository.dart';
import 'package:home_ease/views/auth/state/auth_state.dart';

final authServiceProvider = Provider<AuthRepository>((ref) => AuthRepository());

final authControllerProvider =
    StateNotifierProvider<AuthController, AsyncValue<AuthState>>(
  (ref) => AuthController(ref),
);

class AuthController extends StateNotifier<AsyncValue<AuthState>> {
  final Ref _ref;

  AuthController(this._ref)
      : super(AsyncValue.data(AuthState(isLoading: false)));

  Future<void> signUp(String email, String password, String name) async {
    state = AsyncValue.data(AuthState(isLoading: true));
    try {
      await _ref.read(authServiceProvider).signUp(email, password, name);
      state = AsyncValue.data(AuthState(isLoading: false));
    } catch (e, st) {
      _logError('SignUp Error', e, st);
      state = AsyncValue.error(e, st);
    }
  }

  Future<void> signIn(String email, String password) async {
    state = AsyncValue.data(AuthState(isLoading: true));
    try {
      await _ref.read(authServiceProvider).signIn(email, password);
      state = AsyncValue.data(AuthState(isLoading: false));
    } catch (e, st) {
      _logError('SignIn Error', e, st);
      state = AsyncValue.error(e, st);
    }
  }

  Future<void> signInWithGoogle() async {
    state = AsyncValue.data(AuthState(isLoading: true));
    try {
      await _ref.read(authServiceProvider).signInWithGoogle();
      state = AsyncValue.data(AuthState(isLoading: false));
    } catch (e, st) {
      _logError('Google Sign-In Error', e, st);
      state = AsyncValue.error(e, st);
    }
  }

  Future<void> signOut() async {
    state = AsyncValue.data(AuthState(isLoading: true));
    try {
      await _ref.read(authServiceProvider).signOut();
      state = AsyncValue.data(AuthState(isLoading: false));
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
    }
  }

  void _logError(String context, Object error, StackTrace stackTrace) {
    debugPrint('Error in $context: $error');
    debugPrint('StackTrace: $stackTrace');
  }
}

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:home_ease/views/auth/repository/auth_repository.dart';
import 'package:home_ease/views/auth/state/auth_state.dart';

final authServiceProvider = Provider<AuthRepository>((ref) => AuthRepository());

final authControllerProvider =
    StateNotifierProvider<AuthController, AsyncValue<AuthState>>(
  (ref) => AuthController(ref),
);

class AuthController extends StateNotifier<AsyncValue<AuthState>> {
  final Ref _ref;

  AuthController(this._ref) : super(const AsyncValue.loading()) {
    _initializeAuthState();
  }

  Future<void> _initializeAuthState() async {
    final authRepository = _ref.read(authServiceProvider);
    final isFirstLogin = await authRepository.isFirstLogin();

    authRepository.authStateChange.listen((user) {
      if (user == null) {
        state = AsyncValue.data(
          isFirstLogin ? AuthState.newUser() : AuthState.loggedOut(),
        );
      } else {
        state = AsyncValue.data(AuthState.loggedIn(user));
      }
    });
  }

  Future<void> signUp(
      String email, String password, String name, String? profileBase64) async {
    state = AsyncValue.data(AuthState.loading());
    try {
      await _ref
          .read(authServiceProvider)
          .signUp(email, password, name, profileBase64);
      final user = await _ref.read(authServiceProvider).authStateChange.first
          as User; // Await the user state
      state = AsyncValue.data(AuthState.loggedIn(user));
    } catch (e, st) {
      _logError('SignUp Error', e, st);
      state = AsyncValue.error(e, st);
    }
  }

  Future<void> signIn(String email, String password) async {
    state = AsyncValue.data(AuthState.loading());
    try {
      await _ref.read(authServiceProvider).signIn(email, password);
      final user = await _ref.read(authServiceProvider).authStateChange.first
          as User; // Await the user state
      state = AsyncValue.data(AuthState.loggedIn(user));
    } catch (e, st) {
      _logError('SignIn Error', e, st);
      state = AsyncValue.error(e, st);
    }
  }

  Future<void> signInWithGoogle() async {
    state = AsyncValue.data(AuthState.loading());
    try {
      await _ref.read(authServiceProvider).signInWithGoogle();
      final user = await _ref.read(authServiceProvider).authStateChange.first
          as User; // Await the user state
      state = AsyncValue.data(AuthState.loggedIn(user));
    } catch (e, st) {
      _logError('Google Sign-In Error', e, st);
      state = AsyncValue.error(e, st);
    }
  }

  Future<void> signOut() async {
    state = AsyncValue.data(AuthState.loading());
    try {
      await _ref.read(authServiceProvider).signOut();
      state = AsyncValue.data(AuthState.loggedOut());
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
      throw Exception('Could not send reset email: $e');
    }
  }

  void _logError(String context, Object error, StackTrace stackTrace) {
    debugPrint('Error in $context: $error');
    debugPrint('StackTrace: $stackTrace');
  }
}

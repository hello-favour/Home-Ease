import 'package:firebase_auth/firebase_auth.dart';

enum AuthStatus {
  newUser, // For fresh users navigating to "Get Started"
  loggedIn, // For logged-in users
  loggedOut, // For users who have logged out
}

class AuthState {
  final bool isLoading;
  final User? user;
  final AuthStatus status;

  AuthState({
    required this.isLoading,
    this.user,
    required this.status,
  });

  AuthState copyWith({
    bool? isLoading,
    User? user,
    AuthStatus? status,
  }) {
    return AuthState(
      isLoading: isLoading ?? this.isLoading,
      user: user ?? this.user,
      status: status ?? this.status,
    );
  }

  // Factory methods for easy creation of specific states
  factory AuthState.newUser() {
    return AuthState(
      isLoading: false,
      user: null,
      status: AuthStatus.newUser,
    );
  }

  factory AuthState.loggedIn(User user) {
    return AuthState(
      isLoading: false,
      user: user,
      status: AuthStatus.loggedIn,
    );
  }

  factory AuthState.loggedOut() {
    return AuthState(
      isLoading: false,
      user: null,
      status: AuthStatus.loggedOut,
    );
  }

  factory AuthState.loading() {
    return AuthState(
      isLoading: true,
      user: null,
      status: AuthStatus.loggedOut,
    );
  }
}

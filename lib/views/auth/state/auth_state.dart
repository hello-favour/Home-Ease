import 'package:home_ease/models/user_model.dart';

class AuthState {
  final bool isLoading;
  final UserModel? user;

  AuthState({
    required this.isLoading,
    this.user,
  });

  AuthState copyWith({
    bool? isLoading,
    UserModel? user,
  }) {
    return AuthState(
      isLoading: isLoading ?? this.isLoading,
      user: user ?? this.user,
    );
  }
}

class AuthState {
  bool isLoading;
  String? otpId;
  AuthState({
    required this.isLoading,
    this.otpId,
  });

  AuthState copyWith({
    bool? isLoading,
    String? otpId,
  }) {
    return AuthState(
      isLoading: isLoading ?? this.isLoading,
      otpId: otpId ?? this.otpId,
    );
  }
}

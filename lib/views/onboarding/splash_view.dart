import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:home_ease/core/constants/app_router.dart';
import 'package:home_ease/gen/assets.gen.dart';
import 'package:home_ease/views/auth/controller/auth_controller.dart';
import 'package:home_ease/views/auth/state/auth_state.dart';
import 'package:sizer/sizer.dart';

class SplashView extends ConsumerStatefulWidget {
  const SplashView({super.key});

  @override
  ConsumerState<SplashView> createState() => _SplashViewState();
}

class _SplashViewState extends ConsumerState<SplashView> {
  bool _isNavigated = false;

  @override
  void initState() {
    super.initState();

    WidgetsBinding.instance.addPostFrameCallback((_) {
      // Use listenManual for proper listening outside build
      ref.listenManual<AsyncValue<AuthState>>(
        authControllerProvider,
        (previous, next) {
          next.whenOrNull(
            data: (authState) {
              if (!_isNavigated) {
                _isNavigated = true; // Prevent duplicate navigation
                Future.delayed(const Duration(seconds: 3), () {
                  if (authState.status == AuthStatus.newUser) {
                    context.go(AppRoutes.getStarted);
                  } else if (authState.status == AuthStatus.loggedOut) {
                    context.go(AppRoutes.login);
                  } else if (authState.status == AuthStatus.loggedIn) {
                    context.go(AppRoutes.home);
                  }
                });
              }
            },
          );
        },
        fireImmediately: true, // Listen immediately for the current state
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Center(
          child: Image.asset(
            Assets.images.cart.path,
            fit: BoxFit.cover,
            height: 30.h,
            width: 30.w,
          ),
        ),
      ),
    );
  }
}

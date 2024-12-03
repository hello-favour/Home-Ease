import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:home_ease/core/constants/app_router.dart';
import 'package:home_ease/gen/assets.gen.dart';
import 'package:home_ease/views/auth/controller/auth_controller.dart';
import 'package:sizer/sizer.dart';

class SplashView extends ConsumerStatefulWidget {
  const SplashView({super.key});

  @override
  ConsumerState<SplashView> createState() => _SplashViewState();
}

class _SplashViewState extends ConsumerState<SplashView> {
  @override
  void initState() {
    super.initState();

    ref.listenManual(
      authControllerProvider.select((asyncValue) => asyncValue.value),
      (previous, next) {
        if (next != null) {
          Future.delayed(const Duration(seconds: 3), () {
            if (ref.read(authServiceProvider).isAuthenticated) {
              context.go(AppRoutes.home);
            } else {
              context.go(AppRoutes.getStarted);
            }
          });
        }
      },
      fireImmediately: true,
    );
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

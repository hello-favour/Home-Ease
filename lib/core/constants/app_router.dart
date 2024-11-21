import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:home_ease/core/constants/app_wrapper_screen.dart';
import 'package:home_ease/views/auth/forgot_password_view.dart';
import 'package:home_ease/views/auth/login_view.dart';
import 'package:home_ease/views/auth/register_view.dart';
import 'package:home_ease/views/cart/cart_view.dart';
import 'package:home_ease/views/favorite/favorite_view.dart';
import 'package:home_ease/views/home/home_view.dart';
import 'package:home_ease/views/home/sofa_view.dart';
import 'package:home_ease/views/onboarding/splash_view.dart';
import 'package:home_ease/views/onboarding/onboarding_view.dart';
import 'package:home_ease/views/profile/profile_view.dart';

Page getPage({
  required Widget child,
  required GoRouterState state,
}) {
  return MaterialPage(
    key: state.pageKey,
    child: child,
  );
}

abstract class AppRoutes {
  static String get splash => '/splash';
  static String get onboarding => '/onboard';
  static String get login => '/login';
  static String get register => '/register';
  static String get forgotPassword => '/forgotPassword';
  static String get home => '/home';
  static String get profile => '/profile';
  static String get cart => '/cart';
  static String get favorite => '/favorite';
  static String get sofa => '/sofa';
}

final GlobalKey<NavigatorState> parentNavigatorKey =
    GlobalKey<NavigatorState>();

final GlobalKey<NavigatorState> homeTabNavigatorKey =
    GlobalKey<NavigatorState>();

final GlobalKey<NavigatorState> profileNavigatorKey =
    GlobalKey<NavigatorState>();

final GlobalKey<NavigatorState> cartNavigatorKey = GlobalKey<NavigatorState>();

final GlobalKey<NavigatorState> favoriteTabNavigationKey =
    GlobalKey<NavigatorState>();

class CustomNavigationHelper {
  static final CustomNavigationHelper _instance =
      CustomNavigationHelper._internal();

  static CustomNavigationHelper get instance => _instance;
  factory CustomNavigationHelper() {
    return _instance;
  }

  CustomNavigationHelper._internal() {
    // Router initialization happens here.
    router = GoRouter(
      navigatorKey: parentNavigatorKey,
      initialLocation: AppRoutes.home,
      routes: routes,
    );
  }

  static late GoRouter router;

  final routes = [
    GoRoute(
      path: AppRoutes.splash,
      builder: (context, state) => const SplashView(),
    ),
    GoRoute(
      path: AppRoutes.onboarding,
      builder: (context, state) => const OnboardingView(),
    ),
    GoRoute(
      path: AppRoutes.login,
      builder: (context, state) => LoginView(),
    ),
    GoRoute(
      path: AppRoutes.register,
      builder: (context, state) => RegisterView(),
    ),
    GoRoute(
      path: AppRoutes.forgotPassword,
      builder: (context, state) => ForgotPasswordView(),
    ),
    GoRoute(
      path: AppRoutes.sofa,
      builder: (context, state) => const SofaView(),
    ),
    StatefulShellRoute.indexedStack(
      parentNavigatorKey: parentNavigatorKey,
      pageBuilder: (
        BuildContext context,
        GoRouterState state,
        StatefulNavigationShell navigationShell,
      ) {
        return getPage(
            child: AppWrapperScreen(
              child: navigationShell,
            ),
            state: state);
      },
      branches: [
        StatefulShellBranch(
          navigatorKey: homeTabNavigatorKey,
          routes: [
            GoRoute(
              path: AppRoutes.home,
              pageBuilder: (context, GoRouterState state) {
                return getPage(
                  child: const HomeView(),
                  state: state,
                );
              },
              routes: [
                GoRoute(
                  path: AppRoutes.home,
                  pageBuilder: (context, state) {
                    return getPage(
                      child: const HomeView(),
                      state: state,
                    );
                  },
                ),
              ],
            ),
          ],
        ),
        StatefulShellBranch(
          navigatorKey: profileNavigatorKey,
          routes: [
            GoRoute(
              path: AppRoutes.profile,
              pageBuilder: (context, GoRouterState state) {
                return getPage(
                  child: const ProfileView(),
                  state: state,
                );
              },
            ),
          ],
        ),
        StatefulShellBranch(
          navigatorKey: cartNavigatorKey,
          routes: [
            GoRoute(
              path: AppRoutes.cart,
              pageBuilder: (context, GoRouterState state) {
                return getPage(
                  child: const CartView(),
                  state: state,
                );
              },
            ),
          ],
        ),
        StatefulShellBranch(
          navigatorKey: favoriteTabNavigationKey,
          routes: [
            GoRoute(
              path: AppRoutes.favorite,
              pageBuilder: (context, GoRouterState state) {
                return getPage(
                  child: const FavoriteView(),
                  state: state,
                );
              },
            ),
          ],
        ),
      ],
    ),
  ];
}

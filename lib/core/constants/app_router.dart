import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:home_ease/core/constants/app_wrapper_screen.dart';
import 'package:home_ease/views/auth/forgot_password_view.dart';
import 'package:home_ease/views/auth/login_view.dart';
import 'package:home_ease/views/auth/register_view.dart';
import 'package:home_ease/views/cart/cart_view.dart';
import 'package:home_ease/views/home/detail/product_detail_view.dart';
import 'package:home_ease/views/favorite/favorite_view.dart';
import 'package:home_ease/views/home/electrictonics_view.dart';
import 'package:home_ease/views/home/cupboard_view.dart';
import 'package:home_ease/views/home/home_view.dart';
import 'package:home_ease/views/home/lamp_view.dart';
import 'package:home_ease/views/home/new_arrival_product_view.dart';
import 'package:home_ease/views/home/popular_product_view.dart';
import 'package:home_ease/views/home/recommend_product_view.dart';
import 'package:home_ease/views/home/sofa_view.dart';
import 'package:home_ease/views/onboarding/get_started.dart';
import 'package:home_ease/views/onboarding/onboarding_view.dart';
import 'package:home_ease/views/onboarding/splash_view.dart';
import 'package:home_ease/views/profile/profile_view.dart';
import 'package:home_ease/views/profile/setting_view.dart';

// Page builder utility function
Page getPage({
  required Widget child,
  required GoRouterState state,
}) {
  return MaterialPage(
    key: state.pageKey,
    child: child,
  );
}

// Routes constants
abstract class AppRoutes {
  static String get splash => '/splash';
  static String get getStarted => '/getStarted';
  static String get onboarding => '/onboard';
  static String get login => '/login';
  static String get register => '/register';
  static String get forgotPassword => '/forgotPassword';
  static String get home => '/home';
  static String get profile => '/profile';
  static String get cart => '/cart';
  static String get favorite => '/favorite';
  static String get sofa => '/sofa';
  static String get popularProduct => '/popularProduct';
  static String get newArrival => '/newArrival';
  static String get recommendProduct => '/recommendProduct';
  static String get electronics => '/electronics';
  static String get lamp => '/lamp';
  static String get cupBoard => '/cupBoard';
  static String get setting => '/setting';
  static String get details => '/details';
}

// Navigator keys
final GlobalKey<NavigatorState> parentNavigatorKey =
    GlobalKey<NavigatorState>();

final GlobalKey<NavigatorState> homeTabNavigatorKey =
    GlobalKey<NavigatorState>();

final GlobalKey<NavigatorState> cartNavigatorKey = GlobalKey<NavigatorState>();

final GlobalKey<NavigatorState> favoriteTabNavigationKey =
    GlobalKey<NavigatorState>();

final GlobalKey<NavigatorState> profileNavigatorKey =
    GlobalKey<NavigatorState>();

class CustomNavigationHelper {
  static final CustomNavigationHelper _instance =
      CustomNavigationHelper._internal();

  static CustomNavigationHelper get instance => _instance;
  factory CustomNavigationHelper() {
    return _instance;
  }

  CustomNavigationHelper._internal() {
    router = GoRouter(
      navigatorKey: parentNavigatorKey,
      initialLocation: AppRoutes.splash,
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
      path: AppRoutes.getStarted,
      builder: (context, state) => const GetStartedView(),
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
    GoRoute(
      path: AppRoutes.popularProduct,
      builder: (context, state) => const PopularProductView(),
    ),
    GoRoute(
      path: AppRoutes.newArrival,
      builder: (context, state) => const NewArrivalProductView(),
    ),
    GoRoute(
      path: AppRoutes.recommendProduct,
      builder: (context, state) => const RecommendProductView(),
    ),
    GoRoute(
      path: AppRoutes.electronics,
      builder: (context, state) => const ElectrictonicsView(),
    ),
    GoRoute(
      path: AppRoutes.lamp,
      builder: (context, state) => const LampView(),
    ),
    GoRoute(
      path: AppRoutes.cupBoard,
      builder: (context, state) => const CupboardView(),
    ),
    GoRoute(
      path: AppRoutes.setting,
      builder: (context, state) => const SettingView(),
    ),
    GoRoute(
      path: AppRoutes.details,
      builder: (context, state) => const ProductDetailView(),
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
          state: state,
        );
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
      ],
    ),
  ];
}

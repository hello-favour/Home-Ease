import 'package:home_ease/core/constants/app_router.dart';
import 'package:home_ease/gen/assets.gen.dart';

class CategoriesModel {
  String? icon;
  String? title;
  String? routeKey;

  CategoriesModel({
    this.icon,
    this.title,
    this.routeKey,
  });
}

List<CategoriesModel> servicesDataList = [
  CategoriesModel(
    icon: Assets.icons.sofa.path,
    title: "Sofa",
    routeKey: AppRoutes.sofa,
  ),
  CategoriesModel(
    icon: Assets.icons.electronics.path,
    title: "Electronics",
    routeKey: AppRoutes.electronics,
  ),
  CategoriesModel(
    icon: Assets.icons.lamp.path,
    title: "Lamp",
    routeKey: AppRoutes.lamp,
  ),
  CategoriesModel(
    icon: Assets.icons.cupboard.path,
    title: "Cupboard",
    routeKey: AppRoutes.cupBoard,
  ),
];

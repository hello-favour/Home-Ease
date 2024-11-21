import 'package:home_ease/core/constants/app_router.dart';
import 'package:home_ease/gen/assets.gen.dart';

class CategoriesModel {
  String? image;
  String? title;
  String? routeKey;

  CategoriesModel({
    this.image,
    this.title,
    this.routeKey,
  });
}

List<CategoriesModel> servicesDataList = [
  CategoriesModel(
    image: Assets.icons.sofa.path,
    title: "Sofa",
    routeKey: AppRoutes.sofa,
  ),
  CategoriesModel(
    image: Assets.icons.sofa.path,
    title: "Chair",
    routeKey: AppRoutes.sofa,
  ),
  CategoriesModel(
    image: Assets.icons.sofa.path,
    title: "Lamp",
    routeKey: AppRoutes.sofa,
  ),
  CategoriesModel(
    image: Assets.icons.sofa.path,
    title: "Cupboard",
    routeKey: AppRoutes.sofa,
  ),
];

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:home_ease/core/constants/app_colors.dart';
import 'package:home_ease/core/constants/app_router.dart';
import 'package:home_ease/models/categories_model.dart';
import 'package:home_ease/utils/animation_function.dart';
import 'package:home_ease/utils/extension.dart';
import 'package:home_ease/views/home/controller/user_controller.dart';
import 'package:home_ease/utils/app_textfield.dart';
import 'package:home_ease/views/home/widgets/new_arrival_product_widget.dart';
import 'package:home_ease/views/home/widgets/offers.dart';
import 'package:home_ease/views/home/widgets/popular_product_widget.dart';
import 'package:home_ease/views/home/widgets/recommend_product_widget.dart';
import 'package:home_ease/views/home/widgets/row_text.dart';
import 'package:home_ease/views/home/widgets/services_common.dart';
import 'package:sizer/sizer.dart';

class HomeView extends ConsumerStatefulWidget {
  const HomeView({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _HomeViewState();
}

class _HomeViewState extends ConsumerState<HomeView> {
  @override
  void initState() {
    super.initState();
    final currentUser = FirebaseAuth.instance.currentUser;

    if (currentUser != null) {
      ref.read(userControllerProvider.notifier).fetchUser(currentUser.uid);
      debugPrint("USER ID: ${currentUser.uid}");
    } else {
      debugPrint("No user is currently authenticated.");
    }
  }

  @override
  Widget build(BuildContext context) {
    final userState = ref.watch(userControllerProvider);

    return Scaffold(
      body: userState.when(
        data: (user) {
          if (user == null) {
            debugPrint("GETTING USER: $user");
            return const Center(child: Text("No user found"));
          }
          return SafeArea(
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 6.w),
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    2.sH,
                    Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              "Hey ${user.name}👋🏾",
                              style: Theme.of(context).textTheme.headlineLarge,
                            ),
                            Icon(Icons.notifications,
                                color: AppColors.blackColor),
                          ],
                        ),
                        Text(
                          "Find your perfect \nproduct",
                          style: Theme.of(context).textTheme.headlineLarge,
                        ),
                      ],
                    ),
                    2.sH,
                    const AppTextfield(
                      label: "Search",
                      textInputType: TextInputType.text,
                    ),
                    const OffersList(),
                    2.sH,
                    const RowText(
                      viewAll: false,
                      title: "Shop By Category",
                    ),
                    2.sH,
                    SizedBox(
                      height: 10.h,
                      child: GridView.builder(
                        padding: EdgeInsets.zero,
                        primary: true,
                        physics: const NeverScrollableScrollPhysics(),
                        itemCount: servicesDataList.length,
                        itemBuilder: (context, index) {
                          CategoriesModel categoriesData =
                              servicesDataList[index];
                          return animationFunction(
                            index,
                            GestureDetector(
                              onTap: () {
                                context.go(categoriesData.routeKey!);
                              },
                              child: ServicesCommon(
                                modelData: categoriesData,
                              ),
                            ),
                          );
                        },
                        gridDelegate:
                            const SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisCount: 4,
                          childAspectRatio: 0.5,
                          mainAxisExtent: 150,
                          mainAxisSpacing: 100,
                        ),
                      ),
                    ),
                    2.sH,
                    RowText(
                      onTap: () {
                        context.push(AppRoutes.popularProduct);
                      },
                      title: "Popular Products",
                    ),
                    2.sH,
                    SizedBox(
                      height: MediaQuery.of(context).size.height < 700
                          ? MediaQuery.of(context).size.height * 0.4
                          : MediaQuery.of(context).size.height * 0.26,
                      child: const PopularProductWidget(),
                    ),
                    2.sH,
                    RowText(
                      onTap: () {
                        context.push(AppRoutes.newArrival);
                      },
                      title: "New Arrival",
                    ),
                    2.sH,
                    SizedBox(
                      height: MediaQuery.of(context).size.height < 700
                          ? MediaQuery.of(context).size.height * 0.4
                          : MediaQuery.of(context).size.height * 0.26,
                      child: const NewArrivalProductWidget(),
                    ),
                    2.sH,
                    RowText(
                      onTap: () {
                        context.push(AppRoutes.recommendProduct);
                      },
                      title: "Recommended for you",
                    ),
                    2.sH,
                    SizedBox(
                      height: MediaQuery.of(context).size.height < 700
                          ? MediaQuery.of(context).size.height * 0.4
                          : MediaQuery.of(context).size.height * 0.26,
                      child: const RecommendProductWidget(),
                    ),
                    2.sH,
                  ],
                ),
              ),
            ),
          );
        },
        loading: () => const Center(child: CircularProgressIndicator()),
        error: (error, stack) => Center(
          child: Text("Error: ${error.toString()}"),
        ),
      ),
    );
  }
}

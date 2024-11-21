import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:home_ease/core/constants/app_colors.dart';
import 'package:home_ease/core/constants/app_router.dart';
import 'package:home_ease/gen/assets.gen.dart';
import 'package:home_ease/models/categories_model.dart';
import 'package:home_ease/utils/animation_function.dart';
import 'package:home_ease/utils/app_textfield.dart';
import 'package:home_ease/utils/extension.dart';
import 'package:home_ease/views/home/widgets/offers.dart';
import 'package:home_ease/views/home/widgets/product_card.dart';
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
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
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
                          "Hey Dennis👋🏾",
                          style: Theme.of(context).textTheme.headlineMedium,
                        ),
                        Icon(
                          Icons.notifications,
                          color: AppColors.blackColor,
                        ),
                      ],
                    ),
                    Text(
                      "Find your perfect \nfuniture",
                      style: Theme.of(context).textTheme.headlineMedium,
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
                      CategoriesModel categoriesData = servicesDataList[index];
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
                1.sH,
                const RowText(
                  viewAll: false,
                  title: "Flash Sale",
                ),
                2.sH,
                SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
                  child: Row(
                    children: List.generate(
                      5,
                      (_) => Padding(
                        padding: const EdgeInsets.only(right: 10),
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(99),
                          child: Container(
                            padding: const EdgeInsets.all(6),
                            color: AppColors.primaryColor,
                            child: Text(
                              "All Products",
                              style: Theme.of(context)
                                  .textTheme
                                  .bodyLarge!
                                  .copyWith(
                                    color: AppColors.blackColor,
                                  ),
                            ),
                          ),
                        ),
                      ),
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
                Container(
                  height: MediaQuery.of(context).size.height < 700
                      ? MediaQuery.of(context).size.height * 0.4
                      : MediaQuery.of(context).size.height * 0.26,
                  child: ListView.builder(
                    scrollDirection: Axis.horizontal,
                    padding: EdgeInsets.zero,
                    itemCount: 10,
                    itemBuilder: (context, index) {
                      return Padding(
                        padding: const EdgeInsets.only(right: 16),
                        child: ProductCard(
                          background: AppColors.greyColor,
                          title: 'Trumin chair',
                          price: 320,
                          rating: 3.5,
                          imagePath: Assets.images.armchair.path,
                        ),
                      );
                    },
                  ),
                ),
                2.sH,
                RowText(
                  onTap: () {
                    context.push(AppRoutes.newArrival);
                  },
                  title: "New Arrival",
                ),
                2.sH,
                Container(
                  height: MediaQuery.of(context).size.height < 700
                      ? MediaQuery.of(context).size.height * 0.4
                      : MediaQuery.of(context).size.height * 0.26,
                  child: ListView.builder(
                    scrollDirection: Axis.horizontal,
                    padding: EdgeInsets.zero,
                    itemCount: 10,
                    itemBuilder: (context, index) {
                      return Padding(
                        padding: const EdgeInsets.only(right: 16),
                        child: ProductCard(
                          background: AppColors.greyColor,
                          title: 'Iron',
                          price: 320,
                          rating: 3.5,
                          imagePath: Assets.images.image4.path,
                        ),
                      );
                    },
                  ),
                ),
                2.sH,
                RowText(
                  onTap: () {
                    context.push(AppRoutes.recommendProduct);
                  },
                  title: "Recommended for you",
                ),
                2.sH,
                Container(
                  height: MediaQuery.of(context).size.height < 700
                      ? MediaQuery.of(context).size.height * 0.4
                      : MediaQuery.of(context).size.height * 0.26,
                  child: ListView.builder(
                    scrollDirection: Axis.horizontal,
                    padding: EdgeInsets.zero,
                    itemCount: 10,
                    itemBuilder: (context, index) {
                      return Padding(
                        padding: const EdgeInsets.only(right: 16),
                        child: ProductCard(
                          background: AppColors.greyColor,
                          title: 'Apple Watch',
                          price: 320,
                          rating: 3.5,
                          imagePath: Assets.images.watch1.path,
                        ),
                      );
                    },
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

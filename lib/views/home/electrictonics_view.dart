import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_svg/svg.dart';
import 'package:go_router/go_router.dart';
import 'package:home_ease/core/constants/app_colors.dart';
import 'package:home_ease/core/constants/app_router.dart';
import 'package:home_ease/gen/assets.gen.dart';
import 'package:home_ease/utils/extension.dart';
import 'package:home_ease/views/home/controller/category_controller.dart';
import 'package:home_ease/views/home/widgets/category_card.dart';
import 'package:sizer/sizer.dart';

class ElectrictonicsView extends ConsumerWidget {
  const ElectrictonicsView({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final electronicProducts = ref.watch(electricnoicsProductsProvider);
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 6.w),
          child: Column(
            children: [
              2.sH,
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  GestureDetector(
                    onTap: () {
                      context.push(AppRoutes.home);
                    },
                    child: SvgPicture.asset(Assets.icons.arrowLeft),
                  ),
                  const Spacer(),
                  Text(
                    "Electricity",
                    style: Theme.of(context).textTheme.headlineSmall,
                  ),
                  const Spacer(),
                ],
              ),
              2.sH,
              Expanded(
                child: electronicProducts.when(
                  data: (products) {
                    return ListView.builder(
                      padding: EdgeInsets.zero,
                      itemCount: products.length,
                      scrollDirection: Axis.vertical,
                      itemBuilder: (context, index) {
                        final product = products[index];
                        return Padding(
                          padding: const EdgeInsets.only(bottom: 16),
                          child: GestureDetector(
                            onTap: () {
                              context.push(AppRoutes.details,
                                  extra: products[index]);
                            },
                            child: CategoryCard(
                              background: AppColors.greyColor,
                              title: product.title,
                              price: product.price,
                              rating: product.rating,
                              imagePath: product.imagePath,
                            ),
                          ),
                        );
                      },
                    );
                  },
                  loading: () =>
                      const Center(child: CircularProgressIndicator()),
                  error: (error, stack) => Center(
                    child: Text("Error: ${error.toString()}"),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

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

class CupboardView extends ConsumerWidget {
  const CupboardView({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final cupBoardProducts = ref.watch(cupboardProductsProvider);
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
                    "Cupboard",
                    style: Theme.of(context).textTheme.headlineSmall,
                  ),
                  const Spacer(),
                ],
              ),
              2.sH,
              Expanded(
                child: cupBoardProducts.when(
                  data: (prodcuts) {
                    return ListView.builder(
                      padding: EdgeInsets.zero,
                      itemCount: prodcuts.length,
                      scrollDirection: Axis.vertical,
                      itemBuilder: (context, index) {
                        final product = prodcuts[index];
                        return Padding(
                          padding: const EdgeInsets.only(bottom: 16),
                          child: GestureDetector(
                            onTap: () {
                              context.push(AppRoutes.details,
                                  extra: prodcuts[index]);
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
                  loading: () {
                    return const Center(
                      child: CircularProgressIndicator(),
                    );
                  },
                  error: (error, stackTrace) {
                    return Center(
                      child: Text(
                        'Error: $error',
                        style: const TextStyle(color: Colors.red),
                      ),
                    );
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

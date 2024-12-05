import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_svg/svg.dart';
import 'package:go_router/go_router.dart';
import 'package:home_ease/core/constants/app_colors.dart';
import 'package:home_ease/core/constants/app_router.dart';
import 'package:home_ease/gen/assets.gen.dart';
import 'package:home_ease/utils/app_textfield.dart';
import 'package:home_ease/utils/extension.dart';
import 'package:home_ease/views/home/controller/product_controller.dart';
import 'package:home_ease/views/home/widgets/product_card.dart';
import 'package:sizer/sizer.dart';

class PopularProductView extends ConsumerWidget {
  const PopularProductView({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final popularProducts = ref.watch(popularProductsProvider);

    return Scaffold(
      body: SafeArea(
        child: SizedBox(
          width: double.infinity,
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
                        context.pop();
                      },
                      child: SvgPicture.asset(Assets.icons.arrowLeft),
                    ),
                    const Spacer(),
                    Text(
                      "Popular",
                      style: Theme.of(context).textTheme.headlineSmall,
                    ),
                    const Spacer(),
                  ],
                ),
                2.sH,
                Expanded(
                  child: popularProducts.when(
                    loading: () => const Center(
                      child: CircularProgressIndicator(),
                    ),
                    error: (error, stackTrace) => Center(
                      child: Text(
                        'Error: ${error.toString()}',
                        style: const TextStyle(color: Colors.red),
                      ),
                    ),
                    data: (products) => Column(
                      children: [
                        const AppTextfield(
                          label: "Search Product",
                          obscureText: false,
                          textInputType: TextInputType.text,
                        ),
                        2.sH,
                        Expanded(
                          child: GridView.builder(
                            gridDelegate:
                                const SliverGridDelegateWithFixedCrossAxisCount(
                              crossAxisCount: 2,
                              childAspectRatio: 0.7,
                              crossAxisSpacing: 16,
                              mainAxisSpacing: 16,
                            ),
                            itemCount: products.length,
                            itemBuilder: (context, index) {
                              final product = products[index];
                              return GestureDetector(
                                onTap: () {
                                  context.push(AppRoutes.details,
                                      extra: products[index]);
                                },
                                child: ProductCard(
                                  title: product.title,
                                  price: product.price,
                                  rating: product.rating,
                                  imagePath: product.imagePath,
                                  background: AppColors.greyBgColor,
                                ),
                              );
                            },
                          ),
                        ),
                        1.sH,
                      ],
                    ),
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

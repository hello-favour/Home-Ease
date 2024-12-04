import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:home_ease/core/constants/app_colors.dart';
import 'package:home_ease/core/constants/app_router.dart';
import 'package:home_ease/views/home/controller/product_controller.dart';
import 'package:home_ease/views/home/widgets/product_card.dart';

class NewArrivalProductWidget extends ConsumerWidget {
  const NewArrivalProductWidget({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final newArrivalProducts = ref.watch(newArrivalProductsProvider);
    return newArrivalProducts.when(
      data: (products) => ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: products.length,
        itemBuilder: (context, index) {
          final product = products[index];
          return GestureDetector(
            onTap: () {
              context.push(AppRoutes.details, extra: product);
            },
            child: Padding(
              padding: const EdgeInsets.only(right: 8.0),
              child: ProductCard(
                background: AppColors.greyColor,
                title: product.title,
                price: product.price,
                rating: product.rating,
                imagePath: product.imagePath,
              ),
            ),
          );
        },
      ),
      loading: () => const Center(child: CircularProgressIndicator()),
      error: (error, _) => Text('Error: $error'),
    );
  }
}

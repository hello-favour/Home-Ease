import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:home_ease/core/constants/app_colors.dart';
import 'package:home_ease/core/constants/app_router.dart';
import 'package:home_ease/utils/extension.dart';
import 'package:home_ease/views/favorite/controller/favorite_controller.dart';
import 'package:home_ease/views/home/widgets/product_card.dart';
import 'package:sizer/sizer.dart';

class FavoriteView extends ConsumerWidget {
  const FavoriteView({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final userId = FirebaseAuth.instance.currentUser!.uid;

    final wishlist = ref.watch(favoriteControllerProvider(userId));

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
                  const Spacer(),
                  Text(
                    "Wishlist",
                    style: Theme.of(context).textTheme.headlineSmall!.copyWith(
                          fontWeight: FontWeight.bold,
                        ),
                  ),
                  const Spacer(),
                ],
              ),
              2.sH,
              Expanded(
                child: wishlist.isEmpty
                    ? Center(
                        child: Text(
                          "Your wishlist is empty!",
                          style: Theme.of(context).textTheme.headlineSmall,
                        ),
                      )
                    : GridView.builder(
                        gridDelegate:
                            const SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisCount: 2,
                          childAspectRatio: 0.7,
                          crossAxisSpacing: 16,
                          mainAxisSpacing: 16,
                        ),
                        itemCount: wishlist.length,
                        itemBuilder: (context, index) {
                          final product = wishlist[index];

                          return Stack(
                            alignment: Alignment.center,
                            children: [
                              GestureDetector(
                                onTap: () {
                                  context.push(AppRoutes.details,
                                      extra: product);
                                },
                                child: ProductCard(
                                  title: product.title,
                                  price: product.price,
                                  rating: product.rating,
                                  imagePath: product.imagePath,
                                  background: AppColors.greyBgColor,
                                ),
                              ),
                              Positioned(
                                top: 8,
                                right: 8,
                                child: IconButton(
                                  icon: const Icon(Icons.delete,
                                      color: Colors.red),
                                  onPressed: () async {
                                    final favoriteController = ref.read(
                                        favoriteControllerProvider(userId)
                                            .notifier);
                                    await favoriteController
                                        .removeFromWishlist(product);

                                    ScaffoldMessenger.of(context).showSnackBar(
                                      SnackBar(
                                        content: Text(
                                            "${product.title} removed from wishlist."),
                                      ),
                                    );
                                  },
                                ),
                              ),
                            ],
                          );
                        },
                      ),
              ),
              1.sH,
            ],
          ),
        ),
      ),
    );
  }
}

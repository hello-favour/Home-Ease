import 'package:cached_network_image/cached_network_image.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_svg/svg.dart';
import 'package:gap/gap.dart';
import 'package:go_router/go_router.dart';
import 'package:home_ease/core/constants/app_colors.dart';
import 'package:home_ease/core/constants/app_router.dart';
import 'package:home_ease/gen/assets.gen.dart';
import 'package:home_ease/models/product_model.dart';
import 'package:home_ease/utils/app_button.dart';
import 'package:home_ease/utils/extension.dart';
import 'package:home_ease/views/cart/controller/cart_controller.dart';
import 'package:home_ease/views/favorite/controller/favorite_controller.dart';
import 'package:home_ease/views/home/detail/widgets/cart_bottom_sheet.dart';
import 'package:sizer/sizer.dart';

class ProductDetailView extends ConsumerStatefulWidget {
  final ProductsModel product;
  const ProductDetailView({
    super.key,
    required this.product,
  });

  @override
  ConsumerState<ConsumerStatefulWidget> createState() =>
      _ProductDetailViewState();
}

class _ProductDetailViewState extends ConsumerState<ProductDetailView> {
  int quantity = 1;
  bool isLoading = false;

  Future<void> addToCart() async {
    final cartController = ref.read(
        cartControllerProvider(FirebaseAuth.instance.currentUser!.uid)
            .notifier); // Replace with dynamic user ID
    setState(() {
      isLoading = true;
    });
    try {
      await cartController.addToCart(widget.product.copyWith());
      setState(() {
        isLoading = false;
      });
      showModalBottomSheet(
        context: context,
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.vertical(top: Radius.circular(20.0)),
        ),
        builder: (context) => const CartBottomSheet(),
      );
    } catch (e) {
      setState(() {
        isLoading = false;
      });
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text("Failed to add to cart: ${e.toString()}")),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    final userId = FirebaseAuth.instance.currentUser!.uid;

    // Fetch wishlist items from FavoriteController
    final isFavorite = ref
        .watch(favoriteControllerProvider(userId))
        .any((item) => item.id == widget.product.id);

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
                      context.go(AppRoutes.home);
                    },
                    child: SvgPicture.asset(Assets.icons.arrowLeft),
                  ),
                  const Spacer(),
                  GestureDetector(
                    onTap: () async {
                      final favoriteController =
                          ref.read(favoriteControllerProvider(userId).notifier);
                      if (isFavorite) {
                        await favoriteController
                            .removeFromWishlist(widget.product);
                      } else {
                        await favoriteController.addToWishlist(widget.product);
                      }
                    },
                    child: Icon(
                      isFavorite ? Icons.favorite : Icons.favorite_border,
                      color: isFavorite
                          ? AppColors.primaryColor
                          : AppColors.blackColor,
                    ),
                  ),
                  Gap(3.w),
                ],
              ),
              2.sH,
              Expanded(
                child: SingleChildScrollView(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Center(
                        child: CachedNetworkImage(
                          imageUrl: widget.product.imagePath,
                          fit: BoxFit.contain,
                          height: MediaQuery.of(context).size.height * 0.5,
                          placeholder: (context, url) =>
                              const CircularProgressIndicator(),
                          errorWidget: (context, url, error) =>
                              const Icon(Icons.error),
                        ),
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                widget.product.title,
                                style: Theme.of(context)
                                    .textTheme
                                    .headlineLarge!
                                    .copyWith(
                                      fontWeight: FontWeight.bold,
                                    ),
                              ),
                              Text(
                                "by Admin",
                                style: Theme.of(context)
                                    .textTheme
                                    .titleLarge!
                                    .copyWith(
                                      color: AppColors.darkGreyColor,
                                    ),
                              ),
                            ],
                          ),
                          Container(
                            padding: const EdgeInsets.all(5),
                            decoration: BoxDecoration(
                              border: Border.all(color: AppColors.blackColor),
                              borderRadius: BorderRadius.circular(12),
                            ),
                            child: Row(
                              children: [
                                Icon(Icons.star,
                                    color: AppColors.primaryColor, size: 16),
                                const SizedBox(width: 4),
                                Text(
                                  widget.product.rating.toString(),
                                  style: Theme.of(context).textTheme.bodySmall,
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                      2.sH,
                      Text(
                        widget.product.description,
                        style: TextStyle(
                          fontSize: 16,
                          color: Colors.grey[700],
                        ),
                      ),
                      2.sH,
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            "Total",
                            style: Theme.of(context).textTheme.headlineLarge,
                          ),
                          Text(
                            '\$${(quantity * widget.product.price).toStringAsFixed(2)}',
                            style: Theme.of(context).textTheme.headlineSmall,
                          ),
                        ],
                      ),
                      3.sH,
                      // Row(
                      //   children: [
                      //     Container(
                      //       decoration: BoxDecoration(
                      //         border: Border.all(color: AppColors.greyBgColor),
                      //       ),
                      //       child: IconButton(
                      //         icon: const Icon(Icons.remove),
                      //         onPressed: () {
                      //           setState(() {
                      //             if (quantity > 1) quantity--;
                      //           });
                      //         },
                      //       ),
                      //     ),
                      //     Container(
                      //       padding: const EdgeInsets.symmetric(
                      //           vertical: 12, horizontal: 12),
                      //       decoration: BoxDecoration(
                      //         border: Border.all(color: AppColors.greyBgColor),
                      //       ),
                      //       child: Text(
                      //         quantity.toString(),
                      //         style: const TextStyle(
                      //           fontSize: 18,
                      //           fontWeight: FontWeight.bold,
                      //         ),
                      //       ),
                      //     ),
                      //     Container(
                      //       decoration: BoxDecoration(
                      //         border: Border.all(color: AppColors.greyBgColor),
                      //       ),
                      //       child: IconButton(
                      //         icon: const Icon(Icons.add),
                      //         onPressed: () {
                      //           setState(() {
                      //             quantity++;
                      //           });
                      //         },
                      //       ),
                      //     ),
                      //   ],
                      // ),
                    ],
                  ),
                ),
              ),
              AppButton(
                title: isLoading ? "Adding..." : "Add to Cart",
                onTap: isLoading ? null : addToCart,
              ),
              2.sH,
            ],
          ),
        ),
      ),
    );
  }
}

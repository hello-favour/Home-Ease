import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:home_ease/utils/extension.dart';
import 'package:home_ease/views/cart/controller/cart_controller.dart';
import 'package:home_ease/views/cart/widgets/cart_card.dart';
import 'package:home_ease/utils/app_button.dart';
import 'package:home_ease/core/constants/app_colors.dart';
import 'package:sizer/sizer.dart';

class CartView extends ConsumerWidget {
  const CartView({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final cartState = ref
        .watch(cartControllerProvider(FirebaseAuth.instance.currentUser!.uid));

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
                    "Cart",
                    style: Theme.of(context).textTheme.headlineSmall!.copyWith(
                          fontWeight: FontWeight.bold,
                        ),
                  ),
                  const Spacer(),
                ],
              ),
              3.sH,
              Expanded(
                child: cartState.when(
                  data: (cartItems) {
                    if (cartItems.isEmpty) {
                      return Center(
                        child: Text(
                          "Your cart is empty.",
                          style: Theme.of(context).textTheme.headlineSmall,
                        ),
                      );
                    }
                    return ListView.builder(
                      itemCount: cartItems.length,
                      itemBuilder: (context, index) {
                        final product = cartItems[index];
                        return Dismissible(
                          key: Key(product.id),
                          direction: DismissDirection.endToStart,
                          background: Container(
                            alignment: Alignment.centerRight,
                            padding: const EdgeInsets.symmetric(horizontal: 20),
                            color: Colors.red,
                            child:
                                const Icon(Icons.delete, color: Colors.white),
                          ),
                          onDismissed: (direction) async {
                            await ref
                                .read(cartControllerProvider(
                                        FirebaseAuth.instance.currentUser!.uid)
                                    .notifier)
                                .removeFromCart(product.id);
                            ScaffoldMessenger.of(context).showSnackBar(
                              SnackBar(
                                content:
                                    Text("${product.title} removed from cart."),
                              ),
                            );
                          },
                          child: Padding(
                            padding: EdgeInsets.only(bottom: 5.w),
                            child: CartCard(
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
                  loading: () => const Center(
                    child: CircularProgressIndicator(),
                  ),
                  error: (error, _) => Center(
                    child: Text(
                      "Something went wrong: $error",
                      style: Theme.of(context).textTheme.bodyLarge,
                    ),
                  ),
                ),
              ),
              2.sH,
              FutureBuilder<double>(
                future: ref
                    .read(cartControllerProvider(
                            FirebaseAuth.instance.currentUser!.uid)
                        .notifier)
                    .getTotalAmount(),
                builder: (context, snapshot) {
                  if (snapshot.connectionState == ConnectionState.waiting) {
                    return const CircularProgressIndicator();
                  }
                  if (snapshot.hasError) {
                    return Text(
                      "Error: ${snapshot.error}",
                      style: Theme.of(context).textTheme.bodyLarge,
                    );
                  }
                  final totalAmount = snapshot.data ?? 0.0;
                  return Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            "Total",
                            style: Theme.of(context).textTheme.headlineSmall,
                          ),
                          Text(
                            "\$${totalAmount.toStringAsFixed(2)}",
                            style: Theme.of(context).textTheme.headlineLarge,
                          ),
                        ],
                      ),
                      SizedBox(
                        width: 40.w,
                        child: AppButton(
                          title: "Pay Now",
                          onTap: () {
                            // Add payment logic here
                          },
                        ),
                      ),
                    ],
                  );
                },
              ),
              2.sH,
            ],
          ),
        ),
      ),
    );
  }
}

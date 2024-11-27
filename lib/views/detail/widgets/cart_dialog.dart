import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:home_ease/core/constants/app_router.dart';
import 'package:home_ease/gen/assets.gen.dart';
import 'package:home_ease/utils/app_button.dart';

class CartDialog extends StatelessWidget {
  const CartDialog({super.key});

  @override
  Widget build(BuildContext context) {
    return Dialog(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(20.0),
      ),
      child: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Image.asset(
              Assets.images.cart.path,
              fit: BoxFit.cover,
            ),
            const SizedBox(height: 20.0),
            Text(
              "Successfully \nAdded To Cart",
              textAlign: TextAlign.center,
              style: Theme.of(context).textTheme.headlineSmall,
            ),
            const SizedBox(height: 30.0),
            AppButton(
              title: "Go back",
              onTap: () {
                context.push(AppRoutes.cart);
              },
            ),
          ],
        ),
      ),
    );
  }
}

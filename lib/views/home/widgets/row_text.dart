import 'package:flutter/material.dart';
import 'package:home_ease/core/constants/app_colors.dart';

class RowText extends StatelessWidget {
  final String title;
  final VoidCallback onTap;
  const RowText({
    super.key,
    required this.title,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          title,
          style: Theme.of(context).textTheme.headlineSmall,
        ),
        GestureDetector(
          onTap: onTap,
          child: Text(
            "See All",
            style: Theme.of(context).textTheme.bodyLarge!.copyWith(
                  color: AppColors.primaryColor,
                ),
          ),
        ),
      ],
    );
  }
}

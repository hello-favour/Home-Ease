import 'package:flutter/material.dart';
import 'package:home_ease/core/constants/app_colors.dart';

class RowText extends StatelessWidget {
  final String title;
  final VoidCallback? onTap;
  final bool viewAll;
  const RowText({
    super.key,
    required this.title,
    this.onTap,
    this.viewAll = true,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          title,
          style: Theme.of(context).textTheme.headlineSmall!.copyWith(
                fontWeight: FontWeight.bold,
              ),
        ),
        if (viewAll)
          GestureDetector(
            onTap: onTap,
            child: Text(
              "See All",
              style: Theme.of(context).textTheme.headlineSmall!.copyWith(
                    color: AppColors.color3,
                  ),
            ),
          ),
      ],
    );
  }
}

import 'package:flutter/material.dart';
import 'package:home_ease/core/constants/app_colors.dart';

class ProfileRow extends StatelessWidget {
  final String title;
  final String? subTitle;
  final bool text;
  final VoidCallback onTap;
  const ProfileRow({
    super.key,
    required this.title,
    this.subTitle,
    this.text = true,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              title,
              style: Theme.of(context).textTheme.titleLarge,
            ),
            if (text)
              Text(
                subTitle ?? "",
                style: Theme.of(context).textTheme.bodySmall!.copyWith(
                      color: AppColors.blackColor,
                    ),
              ),
          ],
        ),
        GestureDetector(
          onTap: onTap,
          child: Icon(
            Icons.arrow_forward_ios,
            size: 20,
            color: AppColors.darkGreyColor,
          ),
        ),
      ],
    );
  }
}

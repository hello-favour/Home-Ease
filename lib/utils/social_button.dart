import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:gap/gap.dart';
import 'package:home_ease/core/constants/app_colors.dart';
import 'package:sizer/sizer.dart';

class SocialButton extends StatelessWidget {
  final String icon;
  final String title;
  const SocialButton({super.key, required this.icon, required this.title});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: Size.infinite.width,
      height: 5.5.h,
      decoration: BoxDecoration(
        color: AppColors.whiteColor,
        borderRadius: BorderRadius.circular(5.dp),
        border: Border.all(
          color: AppColors.blackColor.withOpacity(0.5),
        ),
        // boxShadow: [
        //   BoxShadow(
        //     color: Colors.grey.shade300,
        //     blurRadius: 0.5,
        //     offset: const Offset(0, 0.5),
        //   ),
        // ],
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          SvgPicture.asset(
            icon,
            height: 4.h,
          ),
          Gap(3.w),
          Text(
            title,
            style: Theme.of(context).textTheme.bodyMedium,
          ),
        ],
      ),
    );
  }
}

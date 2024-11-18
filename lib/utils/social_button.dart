import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:home_ease/core/constants/app_colors.dart';
import 'package:sizer/sizer.dart';

class SocialButton extends StatelessWidget {
  final String icon;
  const SocialButton({super.key, required this.icon});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(vertical: 20.sp, horizontal: 10.sp),
      width: Size.fromWidth(13.h).width,
      decoration: BoxDecoration(
        color: AppColors.whiteColor,
        borderRadius: BorderRadius.circular(5.dp),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.shade300,
            blurRadius: 0.5,
            offset: const Offset(0, 0.5),
          ),
        ],
      ),
      child: SvgPicture.asset(
        icon,
        height: 4.h,
      ),
    );
  }
}

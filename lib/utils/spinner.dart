import 'package:flutter/material.dart';
import 'package:home_ease/core/constants/app_colors.dart';

class Spinner extends StatelessWidget {
  final double? width;
  final double? height;
  final Color? color;
  final double? strokeWidth;

  const Spinner({
    super.key,
    this.width = 40,
    this.height = 40,
    this.color,
    this.strokeWidth = 3,
  });

  @override
  Widget build(BuildContext context) {
    return Center(
      child: SizedBox(
        width: width,
        height: height,
        child: CircularProgressIndicator(
          color: color ?? AppColors.primaryColor,
          strokeWidth: strokeWidth!,
        ),
      ),
    );
  }
}

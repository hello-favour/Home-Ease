import 'package:flutter/material.dart';
import 'package:home_ease/core/constants/app_colors.dart';
import 'package:home_ease/models/categories_model.dart';

// ignore: must_be_immutable
class ServicesCommon extends StatefulWidget {
  ServicesCommon({super.key, required this.modelData});
  CategoriesModel modelData;

  @override
  State<ServicesCommon> createState() => _ServicesCommonState();
}

class _ServicesCommonState extends State<ServicesCommon> {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: widget.modelData.routeKey == null ? () {} : null,
      child: Column(
        children: [
          Container(
            padding: const EdgeInsets.all(15),
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              color: AppColors.greyColor,
            ),
            child: Center(
              child: Image.asset(
                widget.modelData.icon!,
                // height: 6.h,
                // width: 6.w,
                fit: BoxFit.contain,
              ),
            ),
          ),
          Text(
            widget.modelData.title!,
            style: Theme.of(context).textTheme.bodyLarge,
          ),
        ],
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:go_router/go_router.dart';
import 'package:home_ease/core/constants/app_colors.dart';
import 'package:home_ease/gen/assets.gen.dart';

class AppWrapperScreen extends StatefulWidget {
  final StatefulNavigationShell child;

  const AppWrapperScreen({
    super.key,
    required this.child,
  });

  @override
  State<AppWrapperScreen> createState() => _AppWrapperScreenState();
}

class _AppWrapperScreenState extends State<AppWrapperScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(child: widget.child),
      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: AppColors.whiteColor,
        unselectedItemColor: AppColors.darkGreyColor,
        fixedColor: AppColors.primaryColor,
        type: BottomNavigationBarType.fixed,
        currentIndex: widget.child.currentIndex,
        onTap: (index) {
          widget.child.goBranch(
            index,
            initialLocation: index == widget.child.currentIndex,
          );
          setState(() {});
        },
        items: [
          BottomNavigationBarItem(
            icon: SvgPicture.asset(
              Assets.icons.home,
              color: widget.child.currentIndex == 0
                  ? AppColors.primaryColor
                  : AppColors.darkGreyColor,
            ),
            label: "",
          ),
          BottomNavigationBarItem(
            icon: SvgPicture.asset(
              Assets.icons.profile,
              color: widget.child.currentIndex == 1
                  ? AppColors.primaryColor
                  : AppColors.darkGreyColor,
            ),
            label: "",
          ),
          BottomNavigationBarItem(
            icon: SvgPicture.asset(
              Assets.icons.shoppingCart,
              color: widget.child.currentIndex == 2
                  ? AppColors.primaryColor
                  : AppColors.darkGreyColor,
            ),
            label: "",
          ),
          BottomNavigationBarItem(
            icon: SvgPicture.asset(
              Assets.icons.like,
              color: widget.child.currentIndex == 3
                  ? AppColors.primaryColor
                  : AppColors.darkGreyColor,
            ),
            label: "",
          ),
        ],
      ),
    );
  }
}

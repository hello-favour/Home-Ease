// import 'package:flutter/material.dart';
// import 'package:flutter_svg/svg.dart';
// import 'package:go_router/go_router.dart';
// import 'package:home_ease/core/constants/app_colors.dart';
// import 'package:home_ease/gen/assets.gen.dart';

// class AppWrapperScreen extends StatefulWidget {
//   final StatefulNavigationShell child;

//   const AppWrapperScreen({
//     super.key,
//     required this.child,
//   });

//   @override
//   State<AppWrapperScreen> createState() => _AppWrapperScreenState();
// }

// class _AppWrapperScreenState extends State<AppWrapperScreen> {
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: SafeArea(child: widget.child),
//       bottomNavigationBar: BottomNavigationBar(
//         backgroundColor: AppColors.whiteColor,
//         unselectedItemColor: AppColors.darkGreyColor,
//         fixedColor: AppColors.primaryColor,
//         type: BottomNavigationBarType.fixed,
//         currentIndex: widget.child.currentIndex,
//         onTap: (index) {
//           widget.child.goBranch(
//             index,
//             initialLocation: index == widget.child.currentIndex,
//           );
//           setState(() {});
//         },
//         items: [
//           BottomNavigationBarItem(
//             icon: SvgPicture.asset(
//               Assets.icons.home,
//               color: widget.child.currentIndex == 0
//                   ? AppColors.primaryColor
//                   : AppColors.darkGreyColor,
//             ),
//             label: "",
//           ),
//           BottomNavigationBarItem(
//             icon: SvgPicture.asset(
//               Assets.icons.profile,
//               color: widget.child.currentIndex == 1
//                   ? AppColors.primaryColor
//                   : AppColors.darkGreyColor,
//             ),
//             label: "",
//           ),
//           BottomNavigationBarItem(
//             icon: SvgPicture.asset(
//               Assets.icons.shoppingCart,
//               color: widget.child.currentIndex == 2
//                   ? AppColors.primaryColor
//                   : AppColors.darkGreyColor,
//             ),
//             label: "",
//           ),
//           BottomNavigationBarItem(
//             icon: SvgPicture.asset(
//               Assets.icons.like,
//               color: widget.child.currentIndex == 3
//                   ? AppColors.primaryColor
//                   : AppColors.darkGreyColor,
//             ),
//             label: "",
//           ),
//         ],
//       ),
//     );
//   }
// }

import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:go_router/go_router.dart';
import 'package:home_ease/gen/assets.gen.dart';
import 'package:sizer/sizer.dart';

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
      bottomNavigationBar: Container(
        padding: EdgeInsets.symmetric(horizontal: 5.w, vertical: 12),
        child: Container(
          padding: const EdgeInsets.symmetric(horizontal: 8),
          decoration: BoxDecoration(
            color: Colors.black,
            borderRadius: BorderRadius.circular(32),
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              _buildNavItem(0, Assets.icons.home),
              _buildNavItem(1, Assets.icons.profile),
              _buildNavItem(2, Assets.icons.shoppingCart),
              _buildNavItem(3, Assets.icons.like),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildNavItem(int index, String iconPath) {
    final isSelected = widget.child.currentIndex == index;

    return GestureDetector(
      onTap: () {
        widget.child.goBranch(
          index,
          initialLocation: index == widget.child.currentIndex,
        );
        setState(() {});
      },
      child: Container(
        margin: const EdgeInsets.all(10),
        width: 14.w,
        padding: const EdgeInsets.symmetric(vertical: 12),
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          color: isSelected ? Colors.white : Colors.transparent,
          // borderRadius: BorderRadius.circular(24),
        ),
        child: SvgPicture.asset(
          iconPath,
          color: isSelected ? Colors.black : Colors.white,
          width: 24,
          height: 24,
        ),
      ),
    );
  }
}

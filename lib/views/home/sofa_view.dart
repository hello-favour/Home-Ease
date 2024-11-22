import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:home_ease/core/constants/app_colors.dart';
import 'package:home_ease/core/constants/app_router.dart';
import 'package:home_ease/gen/assets.gen.dart';
import 'package:home_ease/utils/extension.dart';
import 'package:home_ease/views/home/widgets/category_card.dart';
import 'package:sizer/sizer.dart';

class SofaView extends ConsumerWidget {
  const SofaView({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 6.w),
          child: Column(
            children: [
              2.sH,
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  // GestureDetector(
                  //   onTap: () {
                  //     context.push(AppRoutes.home);
                  //   },
                  //   child: SvgPicture.asset(Assets.icons.arrowLeft),
                  // ),
                  const Spacer(),
                  Text(
                    "Recommend for You",
                    style: Theme.of(context).textTheme.headlineSmall,
                  ),
                  const Spacer(),
                  GestureDetector(
                    onTap: () {
                      context.push(AppRoutes.home);
                    },
                    child: Icon(
                      Icons.close,
                      color: AppColors.blackColor,
                    ),
                  ),
                ],
              ),
              2.sH,
              Expanded(
                child: ListView.builder(
                  padding: EdgeInsets.zero,
                  itemCount: 10,
                  scrollDirection: Axis.vertical,
                  itemBuilder: (context, index) {
                    return Padding(
                      padding: const EdgeInsets.only(bottom: 16),
                      child: GestureDetector(
                        onTap: () {
                          context.push(AppRoutes.details);
                        },
                        child: CategoryCard(
                          background: AppColors.greyColor,
                          title: 'Sofa Chair',
                          price: 320,
                          rating: 3.5,
                          imagePath: Assets.images.image5.path,
                        ),
                      ),
                    );
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

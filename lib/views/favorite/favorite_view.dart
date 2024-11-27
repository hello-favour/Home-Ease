import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_svg/svg.dart';
import 'package:gap/gap.dart';
import 'package:go_router/go_router.dart';
import 'package:home_ease/core/constants/app_colors.dart';
import 'package:home_ease/core/constants/app_router.dart';
import 'package:home_ease/gen/assets.gen.dart';
import 'package:home_ease/utils/extension.dart';
import 'package:home_ease/views/home/widgets/product_card.dart';
import 'package:sizer/sizer.dart';

class FavoriteView extends ConsumerStatefulWidget {
  const FavoriteView({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _FavoriteViewState();
}

class _FavoriteViewState extends ConsumerState<FavoriteView> {
  @override
  Widget build(BuildContext context) {
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
                  GestureDetector(
                    onTap: () {
                      context.pop();
                    },
                    child: SvgPicture.asset(Assets.icons.arrowLeft),
                  ),
                  const Spacer(),
                  Text(
                    "My Wishlist",
                    style: Theme.of(context).textTheme.headlineSmall,
                  ),
                  const Spacer(),
                  GestureDetector(
                    onTap: () {
                      context.push(AppRoutes.profile);
                    },
                    child: CircleAvatar(
                      radius: 20,
                      backgroundColor: AppColors.color2,
                      backgroundImage: AssetImage(Assets.images.profile.path),
                    ),
                  ),
                  Gap(3.w),
                ],
              ),
              2.sH,
              SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Row(
                  children: List.generate(
                    8,
                    (_) => Padding(
                      padding: const EdgeInsets.only(right: 10),
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(99),
                        child: Container(
                          width: 20.w,
                          padding: const EdgeInsets.all(6),
                          color: AppColors.primaryColor,
                          alignment: Alignment.center,
                          child: Text(
                            "Chair",
                            style:
                                Theme.of(context).textTheme.bodyLarge!.copyWith(
                                      color: AppColors.blackColor,
                                    ),
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
              ),
              2.sH,
              Expanded(
                child: GridView.builder(
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    childAspectRatio: 0.7,
                    crossAxisSpacing: 16,
                    mainAxisSpacing: 16,
                  ),
                  itemBuilder: (context, index) {
                    return GestureDetector(
                      onTap: () {
                        context.push(AppRoutes.details);
                      },
                      child: ProductCard(
                        title: 'Trumin chair',
                        price: 320,
                        rating: 3.5,
                        imagePath: Assets.images.armchair.path,
                        background: AppColors.greyBgColor,
                      ),
                    );
                  },
                  itemCount: 10,
                ),
              ),
              1.sH,
            ],
          ),
        ),
      ),
    );
  }
}

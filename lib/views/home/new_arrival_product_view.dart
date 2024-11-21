import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_svg/svg.dart';
import 'package:go_router/go_router.dart';
import 'package:home_ease/core/constants/app_colors.dart';
import 'package:home_ease/gen/assets.gen.dart';
import 'package:home_ease/utils/app_textfield.dart';
import 'package:home_ease/utils/extension.dart';
import 'package:home_ease/views/home/widgets/product_card.dart';
import 'package:sizer/sizer.dart';

class NewArrivalProductView extends ConsumerStatefulWidget {
  const NewArrivalProductView({super.key});

  @override
  ConsumerState<NewArrivalProductView> createState() =>
      _NewArrivalProductViewState();
}

class _NewArrivalProductViewState extends ConsumerState<NewArrivalProductView> {
  late final TextEditingController searchController;

  @override
  void initState() {
    super.initState();
    searchController = TextEditingController();
  }

  @override
  void dispose() {
    searchController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SizedBox(
          width: double.infinity,
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
                      "New Arrival",
                      style: Theme.of(context).textTheme.headlineSmall,
                    ),
                    const Spacer(),
                  ],
                ),
                2.sH,
                Expanded(
                  child: Column(
                    children: [
                      AppTextfield(
                        label: "Search...",
                        controller: searchController,
                        obscureText: false,
                        textInputType: TextInputType.text,
                      ),
                      2.sH,
                      Expanded(
                        child: GridView.builder(
                          gridDelegate:
                              const SliverGridDelegateWithFixedCrossAxisCount(
                            crossAxisCount: 2,
                            childAspectRatio: 0.7,
                            crossAxisSpacing: 16,
                            mainAxisSpacing: 16,
                          ),
                          itemBuilder: (context, index) {
                            return ProductCard(
                              title: 'Iron',
                              price: 320,
                              rating: 3.5,
                              imagePath: Assets.images.image4.path,
                              background: AppColors.greyBgColor,
                            );
                          },
                          itemCount: 10,
                        ),
                      ),
                      1.sH,
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:home_ease/core/constants/app_colors.dart';
import 'package:home_ease/utils/extension.dart';
import 'package:home_ease/views/home/controller/user_controller.dart';
import 'package:home_ease/utils/app_textfield.dart';
import 'package:home_ease/views/home/widgets/new_arrival_product_widget.dart';
import 'package:home_ease/views/home/widgets/popular_product_widget.dart';
import 'package:home_ease/views/home/widgets/recommend_product_widget.dart';
import 'package:sizer/sizer.dart';

class HomeView extends ConsumerStatefulWidget {
  const HomeView({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _HomeViewState();
}

class _HomeViewState extends ConsumerState<HomeView> {
  @override
  void initState() {
    super.initState();
    final currentUser = FirebaseAuth.instance.currentUser;

    if (currentUser != null) {
      ref.read(userControllerProvider.notifier).fetchUser(currentUser.uid);
      debugPrint("USER ID: ${currentUser.uid}");
    } else {
      debugPrint("No user is currently authenticated.");
    }
  }

  @override
  Widget build(BuildContext context) {
    final userState = ref.watch(userControllerProvider);

    return Scaffold(
      body: userState.when(
        data: (user) {
          if (user == null) {
            debugPrint("GETTING USER: $user");
            return const Center(child: Text("No user found"));
          }
          return SafeArea(
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 6.w),
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    2.sH,
                    Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              "Hey ${user.name}👋🏾",
                              style: Theme.of(context).textTheme.headlineMedium,
                            ),
                            Icon(Icons.notifications,
                                color: AppColors.blackColor),
                          ],
                        ),
                        Text(
                          "Find your perfect \nfurniture",
                          style: Theme.of(context).textTheme.headlineMedium,
                        ),
                      ],
                    ),
                    2.sH,
                    const AppTextfield(
                      label: "Search",
                      textInputType: TextInputType.text,
                    ),
                    2.sH,
                    // Popular Products Widget
                    SizedBox(
                      height: MediaQuery.of(context).size.height < 700
                          ? MediaQuery.of(context).size.height * 0.4
                          : MediaQuery.of(context).size.height * 0.26,
                      child: const PopularProductWidget(),
                    ),
                    2.sH,
                    // New Arrival Widget
                    SizedBox(
                      height: MediaQuery.of(context).size.height < 700
                          ? MediaQuery.of(context).size.height * 0.4
                          : MediaQuery.of(context).size.height * 0.26,
                      child: const NewArrivalProductWidget(),
                    ),
                    2.sH,
                    // Recommended Products Widget
                    SizedBox(
                      height: MediaQuery.of(context).size.height < 700
                          ? MediaQuery.of(context).size.height * 0.4
                          : MediaQuery.of(context).size.height * 0.26,
                      child: const RecommendProductWidget(),
                    ),
                    2.sH,
                  ],
                ),
              ),
            ),
          );
        },
        loading: () => const Center(child: CircularProgressIndicator()),
        error: (error, stack) => Center(
          child: Text("Error: ${error.toString()}"),
        ),
      ),
    );
  }
}

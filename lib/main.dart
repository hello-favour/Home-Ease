import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:home_ease/core/constants/app_router.dart';
import 'package:home_ease/my_app.dart';

void main() {
  CustomNavigationHelper.instance;
  runApp(
    const ProviderScope(
      child: MyApp(),
    ),
  );
}

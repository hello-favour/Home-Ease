import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:home_ease/core/constants/app_router.dart';
import 'package:home_ease/firebase_options.dart';
import 'package:home_ease/my_app.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  CustomNavigationHelper.instance;
  runApp(
    const ProviderScope(
      child: MyApp(),
    ),
  );
}

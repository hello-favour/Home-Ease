import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class ObscureTextNotifier extends StateNotifier<bool> {
  ObscureTextNotifier() : super(true);

  void toggle() => state = !state;
}

final obscureTextProvider = StateNotifierProvider.family<ObscureTextNotifier,
    bool, TextEditingController>(
  (ref, controller) => ObscureTextNotifier(),
);

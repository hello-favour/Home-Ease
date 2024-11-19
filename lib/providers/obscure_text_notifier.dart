import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

// StateNotifier to manage obscure text for a specific controller
class ObscureTextNotifier extends StateNotifier<bool> {
  ObscureTextNotifier() : super(true); // Default is obscure

  void toggle() => state = !state; // Toggle obscure state
}

// Family provider for obscure text state based on controllers
final obscureTextProvider = StateNotifierProvider.family<ObscureTextNotifier,
    bool, TextEditingController>(
  (ref, controller) => ObscureTextNotifier(),
);

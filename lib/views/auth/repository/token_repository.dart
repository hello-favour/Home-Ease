import 'dart:developer';
import 'package:shared_preferences/shared_preferences.dart';

class TokenRepository {
  Future<void> saveOnboardingDetails() async {
    final prefs = await SharedPreferences.getInstance();
    try {
      await prefs.setBool('onboarding', true);
    } catch (e) {
      log(e.toString());
    }
  }

  Future<bool?> getOnboardingDetails() async {
    final prefs = await SharedPreferences.getInstance();
    final token = prefs.getBool('onboarding');
    return token;
  }
}

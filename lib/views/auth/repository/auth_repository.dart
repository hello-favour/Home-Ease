import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:home_ease/models/user_model.dart';

class AuthRepository {
  final FirebaseAuth _firebaseAuth = FirebaseAuth.instance;
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;
  final GoogleSignIn _googleSignIn = GoogleSignIn();

  bool get isAuthenticated => _firebaseAuth.currentUser != null;

  Stream<User?> get authStateChange {
    return _firebaseAuth.authStateChanges().map((user) {
      debugPrint('Auth State Change: ${user?.uid}');
      return user;
    });
  }

  Future<UserModel> signUp(
      String email, String password, String name, String? profileBase64) async {
    try {
      UserCredential userCredential =
          await _firebaseAuth.createUserWithEmailAndPassword(
        email: email,
        password: password,
      );

      final user = UserModel(
        id: userCredential.user!.uid,
        email: email,
        name: name,
        profileImage: profileBase64.toString(),
      );

      await _firestore.collection('users').doc(user.id).set(user.toMap());

      // Mark this as the first login for the user
      SharedPreferences prefs = await SharedPreferences.getInstance();
      await prefs.setBool('isFirstLogin', true);

      return user;
    } on FirebaseAuthException catch (e) {
      throw e.message ?? 'An unknown error occurred during sign-up';
    }
  }

  Future<UserModel> signIn(String email, String password) async {
    try {
      UserCredential userCredential =
          await _firebaseAuth.signInWithEmailAndPassword(
        email: email,
        password: password,
      );

      final userDoc = await _firestore
          .collection('users')
          .doc(userCredential.user!.uid)
          .get();

      return UserModel.fromJson(userDoc.data()!);
    } on FirebaseAuthException catch (e) {
      throw e.message ?? 'An unknown error occurred during sign-in';
    }
  }

  Future<void> signOut() async {
    await _firebaseAuth.signOut();
    await _googleSignIn.signOut();

    // Mark user as logged out
    SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setBool('isFirstLogin', false);
  }

  Future<void> forgotPassword(String email) async {
    try {
      await _firebaseAuth.sendPasswordResetEmail(email: email);
    } on FirebaseAuthException catch (e) {
      throw e.message ?? 'An error occurred while resetting the password';
    }
  }

  Future<UserModel> signInWithGoogle() async {
    try {
      final googleUser = await _googleSignIn.signIn();
      if (googleUser == null) {
        throw 'Google sign-in was canceled.';
      }

      final googleAuth = await googleUser.authentication;
      final credential = GoogleAuthProvider.credential(
        accessToken: googleAuth.accessToken,
        idToken: googleAuth.idToken,
      );

      final userCredential =
          await _firebaseAuth.signInWithCredential(credential);

      final user = UserModel(
        id: userCredential.user!.uid,
        email: userCredential.user!.email!,
        name: userCredential.user!.displayName ?? 'No Name',
        profileImage: userCredential.user!.photoURL ?? 'No profile',
      );

      // Store user data in Firestore if not already present
      final userDoc = await _firestore.collection('users').doc(user.id).get();
      if (!userDoc.exists) {
        await _firestore.collection('users').doc(user.id).set(user.toMap());
      }

      return user;
    } catch (e) {
      throw e.toString();
    }
  }

  Future<bool> isFirstLogin() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.getBool('isFirstLogin') ?? true;
  }
}

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:wallpaper/app/routes/app_pages.dart';

class LoginController extends GetxController {
  final passController = TextEditingController();
  final emailController = TextEditingController();
  var errorMessage = ''.obs;

  Future<void> login() async {
    final email = emailController.text.trim();
    final password = passController.text;

    if (email.isEmpty || password.isEmpty) {
      errorMessage.value = "Email and password cannot be empty";
      return;
    }

    try {
      await FirebaseAuth.instance
          .signInWithEmailAndPassword(email: email, password: password)
          .then(
            (value) => Get.toNamed('/images'),
          );
    } on FirebaseAuthException catch (e) {
      if (e.code == 'user-not-found') {
        Get.snackbar('User not found!', 'No user found for that email.');
      } else if (e.code == 'wrong-password') {
        Get.snackbar(
            'Wrong password!', 'Wrong password provided for that user.');
      } else {
        Get.snackbar('Somthing Wrong', e.toString());
      }
    } catch (e) {
      rethrow;
    }
  }

  void toSignUpPage() {
    Get.toNamed(Routes.SIGNUP);
  }

  @override
  void onInit() {
    super.onInit();
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {
    emailController.dispose();
    passController.dispose();
    super.onClose();
  }
}

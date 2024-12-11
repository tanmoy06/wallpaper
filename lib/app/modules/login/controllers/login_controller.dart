import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class LoginController extends GetxController {
  final passController = TextEditingController();
  final emailController = TextEditingController();
  var errorMessage = ''.obs;

  void login() {
    final email = emailController.text.trim();
    final password = passController.text;

    if (email.isEmpty || password.isEmpty) {
      errorMessage.value = "Email and password cannot be empty";
      return;
    }

    if (email == "test@gmail.com" && password == "pass123") {
      Get.snackbar("Login Success", "Welcome!");
      Get.toNamed('/home');
    } else {
      errorMessage.value = "Invalid email or password";
    }
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

import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SignupController extends GetxController {
  // Controllers for the signup fields
  final nameController = TextEditingController();
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  final confirmPasswordController = TextEditingController();

  // RxString for error messages
  var errorMessage = ''.obs;

  // Dispose controllers to free memory
  @override
  void onClose() {
    nameController.dispose();
    emailController.dispose();
    passwordController.dispose();
    confirmPasswordController.dispose();
    super.onClose();
  }

  // Signup logic
  void signup() {
    final name = nameController.text.trim();
    final email = emailController.text.trim();
    final password = passwordController.text;
    final confirmPassword = confirmPasswordController.text;

    if (name.isEmpty ||
        email.isEmpty ||
        password.isEmpty ||
        confirmPassword.isEmpty) {
      errorMessage.value = "All fields are required";
      return;
    }

    if (password != confirmPassword) {
      errorMessage.value = "Passwords do not match";
      return;
    }

    // Replace this with your signup logic
    if (email == "test@gmail.com") {
      Get.snackbar("Signup Success", "Welcome, $name!");
      Get.toNamed('/login');
    } else {
      errorMessage.value = "Signup failed. Try again.";
    }
  }
}

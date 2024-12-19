import 'package:firebase_auth/firebase_auth.dart';
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
  Future<void> signup() async {
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
    try {
      await FirebaseAuth.instance
          .createUserWithEmailAndPassword(
            email: email,
            password: password,
          )
          .then(
            (value) => Get.toNamed('/images'),
          );
    } on FirebaseAuthException catch (e) {
      if (e.code == 'weak-password') {
        Get.snackbar("Week password!", 'The password provided is too weak.');
      } else if (e.code == 'email-already-in-use') {
        Get.snackbar(
            "Existing account", "The account already exists for that email.");
      }
    } catch (e) {
      rethrow;
    }
  }
}

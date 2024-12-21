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
  var emailError = '';
  var passError = '';
  // Dispose controllers to free memory

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
      passError = "Passwords do not match";
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
      switch (e.code) {
        case 'invalid-email':
          emailError = 'The email address is not valid.';
          break;
        case 'weak-password':
          passError = 'The password is too weak.';
          break;
        case 'email-already-in-use':
          emailError = 'An account already exists for this email.';
          break;
        default:
          errorMessage.value = 'An unexpected error occurred: ${e.message}';
      }

      // Display error message to user (replace with your UI logic)
    } catch (e) {
      print('Error: $e'); // Handle unexpected errors
    }
  }

  Future<void> sendEmailVerification() async {
    User? user = FirebaseAuth.instance.currentUser;

    if (user != null && !user.emailVerified) {
      await user.sendEmailVerification();
      print('Verification email sent!');
    }
  }

  Future<void> checkEmailVerified() async {
    User? user = FirebaseAuth.instance.currentUser;

    if (user != null) {
      await user.reload();
      if (user.emailVerified) {
        print('Email is verified!');
      } else {
        print('Email is not verified.');
      }
    }
  }

  @override
  void onClose() {
    nameController.dispose();
    emailController.dispose();
    passwordController.dispose();
    confirmPasswordController.dispose();
    super.onClose();
  }
}

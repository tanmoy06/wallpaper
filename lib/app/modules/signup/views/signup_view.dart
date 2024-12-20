import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:wallpaper/app/services/responsive_ui_service.dart';
import '../controllers/signup_controller.dart';

class SignupView extends GetView<SignupController> {
  const SignupView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Signup')),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Center(
          child: Column(
            // mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              30.kheightBox,
              TextField(
                controller: controller.nameController,
                decoration: InputDecoration(
                  labelText: 'Name',
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(20)),
                ),
              ),
              16.kheightBox,
              TextField(
                controller: controller.emailController,
                decoration: InputDecoration(
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(20)),
                    labelText: 'Email'),
                keyboardType: TextInputType.emailAddress,
              ),
              16.kheightBox,
              TextField(
                controller: controller.passwordController,
                decoration: InputDecoration(
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(20)),
                    labelText: 'Password'),
                obscureText: true,
              ),
              16.kheightBox,
              TextField(
                controller: controller.confirmPasswordController,
                decoration: InputDecoration(
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(20)),
                    labelText: 'Confirm Password'),
                obscureText: true,
              ),
              16.kheightBox,
              Obx(() => Text(
                    controller.errorMessage.value,
                    style: const TextStyle(color: Colors.red),
                  )),
              16.kheightBox,
              ElevatedButton(
                onPressed: controller.signup,
                child: const Text('Signup'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

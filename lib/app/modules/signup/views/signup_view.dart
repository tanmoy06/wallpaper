import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../controllers/signup_controller.dart';

class SignupView extends GetView<SignupController> {
  const SignupView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Signup')),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              TextField(
                controller: controller.nameController,
                decoration: const InputDecoration(labelText: 'Name'),
              ),
              const SizedBox(height: 16),
              TextField(
                controller: controller.emailController,
                decoration: const InputDecoration(labelText: 'Email'),
                keyboardType: TextInputType.emailAddress,
              ),
              const SizedBox(height: 16),
              TextField(
                controller: controller.passwordController,
                decoration: const InputDecoration(labelText: 'Password'),
                obscureText: true,
              ),
              const SizedBox(height: 16),
              TextField(
                controller: controller.confirmPasswordController,
                decoration:
                    const InputDecoration(labelText: 'Confirm Password'),
                obscureText: true,
              ),
              const SizedBox(height: 16),
              Obx(() => Text(
                    controller.errorMessage.value,
                    style: const TextStyle(color: Colors.red),
                  )),
              const SizedBox(height: 16),
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

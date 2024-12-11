import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/login_controller.dart';

class LoginView extends GetView<LoginController> {
  const LoginView({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Login'),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            TextField(
              controller: controller.emailController,
              decoration: const InputDecoration(
                labelText: 'Email',
                border: OutlineInputBorder(),
                prefixIcon: Icon(Icons.email),
              ),
              keyboardType: TextInputType.emailAddress,
            ),
            const SizedBox(height: 16.0),
            TextField(
              controller: controller.passController,
              decoration: const InputDecoration(
                labelText: 'Password',
                border: OutlineInputBorder(),
                prefixIcon: Icon(Icons.lock),
              ),
              obscureText: true,
            ),
            const SizedBox(height: 16),
            Obx(
              () => Text(
                controller.errorMessage.value,
                style: const TextStyle(color: Colors.red),
              ),
            ),
            const SizedBox(height: 20.0),
            ElevatedButton(
              onPressed: controller.login,
              child: const Text('Login'),
            ),
            const TextButton(
              onPressed: null, // No logic, button disabled
              child: Text('Forgot Password?'),
            ),
          ],
        ),
      ),
    );
  }
}

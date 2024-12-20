import 'package:flutter/material.dart';

import 'package:get/get.dart';

import 'package:wallpaper/app/services/responsive_ui_service.dart';

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
            16.kheightBox,
            TextField(
              controller: controller.passController,
              decoration: const InputDecoration(
                labelText: 'Password',
                border: OutlineInputBorder(),
                prefixIcon: Icon(Icons.lock),
              ),
              obscureText: true,
            ),
            16.kheightBox,
            Obx(
              () => Text(
                controller.errorMessage.value,
                style: const TextStyle(color: Colors.red),
              ),
            ),
            20.kheightBox,
            ElevatedButton(
              onPressed: controller.login,
              child: const Text('Login'),
            ),
            TextButton(
              onPressed: controller.login, // No logic, button disabled
              child: Text('Forgot Password?'),
            ),
            TextButton(
              onPressed: controller.toSignUpPage,
              child: Text("Don't have account? create account"),
            )
          ],
        ),
      ),
    );
  }
}

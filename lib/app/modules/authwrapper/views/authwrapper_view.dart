import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:wallpaper/app/routes/app_pages.dart';

import '../controllers/authwrapper_controller.dart';

class AuthwrapperView extends GetView<AuthwrapperController> {
  const AuthwrapperView({super.key});
  @override
  Widget build(BuildContext context) {
    return StreamBuilder<User?>(
      stream: FirebaseAuth.instance.authStateChanges(),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return Center(child: CircularProgressIndicator()); // Loading state
        }
        if (snapshot.hasData) {
          // User is logged in
          Future.microtask(() => Get.offAllNamed(Routes.IMAGES));
          return SizedBox(); // Empty widget while redirecting
        } else {
          // User is not logged in
          Future.microtask(() => Get.offAllNamed(Routes.LOGIN));
          return SizedBox(); // Empty widget while redirecting
        }
      },
    );
  }
}

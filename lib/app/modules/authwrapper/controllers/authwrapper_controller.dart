import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';
import 'package:wallpaper/app/routes/app_pages.dart';

class AuthwrapperController extends GetxController {
  //TODO: Implement AuthwrapperController
  final FirebaseAuth _auth = FirebaseAuth.instance;
  Rxn<User> firebaseUser = Rxn<User>();

  @override
  void onInit() {
    super.onInit();
    firebaseUser.bindStream(_auth.authStateChanges());
    ever(firebaseUser, _setInitialScreen);
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {
    super.onClose();
  }

  void _setInitialScreen(User? user) {
    if (user != null) {
      Get.offAllNamed(Routes.IMAGES);
    } else {
      Get.offAllNamed(Routes.LOGIN);
    }
  }
}

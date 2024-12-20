import 'package:get/get.dart';

import '../controllers/authwrapper_controller.dart';

class AuthwrapperBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<AuthwrapperController>(
      () => AuthwrapperController(),
    );
  }
}

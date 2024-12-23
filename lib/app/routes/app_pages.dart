import 'package:get/get.dart';

import '../modules/authwrapper/bindings/authwrapper_binding.dart';
import '../modules/authwrapper/views/authwrapper_view.dart';
import '../modules/home/bindings/home_binding.dart';
import '../modules/home/views/home_view.dart';
import '../modules/images/bindings/images_binding.dart';
import '../modules/images/views/images_view.dart';
import '../modules/login/bindings/login_binding.dart';
import '../modules/login/views/login_view.dart';
import '../modules/signup/bindings/signup_binding.dart';
import '../modules/signup/views/signup_view.dart';

part 'app_routes.dart';

class AppPages {
  AppPages._();

  static const INITIAL = Routes.AUTHWRAPPER;

  static final routes = [
    GetPage(
      name: _Paths.HOME,
      page: () => const HomeView(),
      binding: HomeBinding(),
    ),
    GetPage(
      name: _Paths.LOGIN,
      page: () => const LoginView(),
      binding: LoginBinding(),
    ),
    GetPage(
      name: _Paths.SIGNUP,
      page: () => SignupView(),
      binding: SignupBinding(),
    ),
    GetPage(
      name: _Paths.IMAGES,
      page: () => ImagesView(),
      binding: ImagesBinding(),
    ),
    GetPage(
      name: _Paths.AUTHWRAPPER,
      page: () => const AuthwrapperView(),
      binding: AuthwrapperBinding(),
    ),
  ];
}

import 'package:fitness_tracker_app/core/routes/routes.dart';
import 'package:fitness_tracker_app/features/auth/login/di/login_binding.dart';
import 'package:fitness_tracker_app/features/auth/login/presentation/page/login_page.dart';
import 'package:fitness_tracker_app/features/auth/register/di/register_binding.dart';
import 'package:fitness_tracker_app/features/auth/register/presentation/page/register_page.dart';
import 'package:fitness_tracker_app/features/splash/di/splash_binding.dart';
import 'package:fitness_tracker_app/features/splash/presentation/pages/splash_page.dart';
import 'package:get/get.dart';

class Pages {
  static const initial = Routes.none;
  static const main = Routes.main;
  static final routes = [
    GetPage(
      name: Routes.none,
      page: () => const SplashPage(),
      binding: SplashBinding(),
    ),
    GetPage(
      name: Routes.login,
      page: () => const LoginPage(),
      binding: LoginBindding(),
    ),
    GetPage(
      name: Routes.register,
      page: () => const RegisterPage(),
      binding: RegisterBindding(),
    ),
  ];
}

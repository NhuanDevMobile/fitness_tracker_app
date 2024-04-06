import 'package:fitness_tracker_app/core/routes/routes.dart';
import 'package:fitness_tracker_app/features/auth/login/di/login_binding.dart';
import 'package:fitness_tracker_app/features/auth/login/presentation/page/login_page.dart';
import 'package:fitness_tracker_app/features/auth/register/di/register_binding.dart';
import 'package:fitness_tracker_app/features/auth/register/presentation/page/register_page.dart';
import 'package:fitness_tracker_app/features/auth/user/di/user_information_binding.dart';
import 'package:fitness_tracker_app/features/auth/user/presentation/pages/user_information_page.dart';
import 'package:fitness_tracker_app/features/auth/verify/di/email_verification_binding.dart';
import 'package:fitness_tracker_app/features/auth/verify/presentation/page/email_verification_page.dart';
import 'package:fitness_tracker_app/features/main/di/main_binding.dart';
import 'package:fitness_tracker_app/features/main/presentation/page/main_page.dart';
import 'package:fitness_tracker_app/features/splash/di/splash_binding.dart';
import 'package:fitness_tracker_app/features/splash/presentation/pages/splash_page.dart';
import 'package:get/get.dart';

class Pages {
  static const initial = Routes.userInfor;
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
    GetPage(
      name: Routes.emailVerify,
      page: () => const EmailVerificationPage(),
      binding: EmailVerificationBindding(),
    ),
    GetPage(
      name: Routes.main,
      page: () => const MainPage(),
      binding: MainBindding(),
    ),
    GetPage(
      name: Routes.userInfor,
      page: () => const UserInforPage(),
      binding: UserInforBindding(),
    ),
  ];
}

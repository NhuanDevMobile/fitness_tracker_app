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
import 'package:fitness_tracker_app/features/nav/exercise/di/exercise_binding.dart';
import 'package:fitness_tracker_app/features/nav/exercise/di/exercise_detail_binding.dart';
import 'package:fitness_tracker_app/features/nav/exercise/presentation/page/exercise_detail_page.dart';
import 'package:fitness_tracker_app/features/nav/exercise/presentation/page/exercise_page.dart';
import 'package:fitness_tracker_app/features/nav_diary/foods/di/food_binding.dart';
import 'package:fitness_tracker_app/features/nav_diary/foods/di/food_detail_binding.dart';
import 'package:fitness_tracker_app/features/nav_diary/foods/presentation/page/food_detail_page.dart';
import 'package:fitness_tracker_app/features/nav_diary/foods/presentation/page/food_page.dart';
import 'package:fitness_tracker_app/features/nav_diary/water_drinking/di/water_drinking_binding.dart';
import 'package:fitness_tracker_app/features/nav_diary/water_drinking/presentation/page/water_drinking_page.dart';
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
    GetPage(
      name: Routes.exercise,
      page: () => const ExercisePage(),
      binding: ExerciseBindding(),
    ),
    GetPage(
      name: Routes.exerciseDetail,
      page: () => const ExerciseDetailPage(),
      binding: ExerciseDetailBindding(),
    ),
    GetPage(
      name: Routes.waterDrink,
      page: () => const WaterDrinkingPage(),
      binding: WaterDrinkingBindding(),
    ),
    GetPage(
      name: Routes.foods,
      page: () => const FoodPage(),
      binding: FoodBindding(),
    ),
    GetPage(
      name: Routes.foodDetail,
      page: () => const FoodDetailPage(),
      binding: FoodDetailBindding(),
    ),
  ];
}

import 'package:fitness_tracker_app/features/auth/user/domain/use_case/get_user_use_case.dart';
import 'package:fitness_tracker_app/features/nav_diary/water_drinking/domain/get_water_amounts.dart';
import 'package:fitness_tracker_app/features/nav_diary/water_drinking/domain/save_water_amounts.dart';
import 'package:fitness_tracker_app/features/nav_diary/water_drinking/presentation/controller/water_drinking_controller.dart';
import 'package:get/get.dart';

class WaterDrinkingBindding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => SaveWaterAmountsUseCase(Get.find()));
    Get.lazyPut(() => GetWaterAmountsUseCase(Get.find()));
    Get.lazyPut(() => GetuserUseCase(Get.find()));
    Get.lazyPut(
        () => WaterDrinkingController(Get.find(), Get.find(), Get.find()));
  }
}

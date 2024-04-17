import 'package:fitness_tracker_app/features/auth/user/domain/use_case/get_user_use_case.dart';
import 'package:fitness_tracker_app/features/nav_diary/foods/presentation/controller/food_detail_controller.dart';
import 'package:get/get.dart';

class FoodDetailBindding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => GetuserUseCase(Get.find()));
    Get.lazyPut(() => FoodDetailController(Get.find()));
  }
}

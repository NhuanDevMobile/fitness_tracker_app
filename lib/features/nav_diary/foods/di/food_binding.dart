import 'package:fitness_tracker_app/features/nav_diary/foods/presentation/controller/food_controller.dart';
import 'package:get/get.dart';

class FoodBindding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => FoodController());
  }
}

import 'package:fitness_tracker_app/features/nav_diary/foods/presentation/controller/food_cart_controller.dart';
import 'package:get/get.dart';

class FoodCartBindding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => FoodCartController());
  }
}

import 'package:fitness_tracker_app/features/nav_diary/foods/presentation/controller/create_food_controller.dart';
import 'package:get/get.dart';

class CreateFoodBindding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => CreateFoodController());
  }
}

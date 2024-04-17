import 'package:fitness_tracker_app/features/nav_diary/foods/model/food_model.dart';
import 'package:get/get.dart';

class ItemAddFoodToCartController extends GetxController {
  FoodModel? foodModel;
  AltMeasure? selectedAltMeasure;
  @override
  void onInit() {
    if (Get.arguments is FoodModel) {
      foodModel = Get.arguments;

      update(['food']);
    }
  }
}

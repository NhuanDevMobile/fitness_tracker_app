import 'package:fitness_tracker_app/features/nav_diary/foods/model/food_model.dart';
import 'package:fitness_tracker_app/features/nav_diary/foods/model/user_relationship_food_model.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

class ItemAddFoodToCartController extends GetxController {
  FoodModel? foodModel;
  AltMeasure? selectedAltMeasure;
  TextEditingController qtyController = TextEditingController();
  RxString kCal = "".obs;
  @override
  void onInit() {
    if (Get.arguments is FoodModel) {
      foodModel = Get.arguments;
      selectedAltMeasure = foodModel!.altMeasures![0];
      qtyController.text = selectedAltMeasure!.getQlt().toString();
      kCal.value = (selectedAltMeasure!.getQlt() * foodModel!.getCalories())
          .toStringAsFixed(1)
          .toString();
      update(['food']);
    }
  }

  void onSelectedItem(AltMeasure? altMeasure) {
    selectedAltMeasure = altMeasure;
    qtyController.text = selectedAltMeasure!.getQlt().toString();
    kCal.value = (selectedAltMeasure!.getQlt() * foodModel!.getCalories())
        .toStringAsFixed(1)
        .toString();
  }

  void changeValue(String value) {
    if (value.isNotEmpty) {
      kCal.value = (int.parse(value) * foodModel!.getCalories())
          .toStringAsFixed(1)
          .toString();
    }
  }

  void onSave() {
    if (qtyController.text.isNotEmpty) {
      dynamic data = {
        "foodName": foodModel!.foodName,
        "servingQty": int.parse(qtyController.text),
        "servingUnit": selectedAltMeasure!.measure ?? "",
        "nfCalories": double.parse(kCal.value),
        "photoUrl": foodModel!.photo!.thumb,
      };
      Get.back(result: UserRelationshipFoodModel.fromJson(data));
    }
  }
}

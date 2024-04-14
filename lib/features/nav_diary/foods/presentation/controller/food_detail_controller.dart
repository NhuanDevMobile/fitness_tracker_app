import 'dart:convert';

import 'package:fitness_tracker_app/features/nav_diary/foods/model/food_model.dart';
import 'package:fitness_tracker_app/features/nav_diary/foods/model/nutrition_model.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';

class FoodDetailController extends GetxController {
  final FoodModel food = Get.arguments;
  List<NutritionModel> nutritions = [];

  @override
  void onInit() {
    getNutritions();
    super.onInit();
  }

  void getNutritions() {
    rootBundle.loadString("assets/jsons/nutritions.json").then((jsonStr) {
      final parsed = jsonDecode(jsonStr).cast<Map<String, dynamic>>();
      nutritions = parsed
          .map<NutritionModel>((json) => NutritionModel.fromJson(json))
          .toList();
      print(nutritions.length);
      update(["fetch_nutritions"]);
    });
  }

  String getNameNutrition(int id) {
    var matchedNutrition = nutritions.firstWhere(
      (element) => element.id == id,
      orElse: () => NutritionModel(id: id, name: "Unknown"),
    );
    return matchedNutrition.name ?? "";
  }
}

import 'dart:convert';

import 'package:fitness_tracker_app/core/configs/enum.dart';
import 'package:fitness_tracker_app/core/data/firebase/firestore_database/firestore_saved_food.dart';
import 'package:fitness_tracker_app/core/ui/snackbar/snackbar.dart';
import 'package:fitness_tracker_app/features/auth/user/domain/use_case/get_user_use_case.dart';
import 'package:fitness_tracker_app/features/auth/user/model/user_model.dart';
import 'package:fitness_tracker_app/features/nav_diary/foods/model/food_model.dart';
import 'package:fitness_tracker_app/features/nav_diary/foods/model/nutrition_model.dart';
import 'package:fitness_tracker_app/features/nav_diary/foods/model/saved_food_model.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';

class FoodDetailController extends GetxController {
  final GetuserUseCase _getuserUseCase;
  FoodDetailController(this._getuserUseCase);
  final FoodModel food = Get.arguments;
  List<NutritionModel> nutritions = [];
  UserModel? user;

  @override
  void onInit() async {
    user = await _getuserUseCase.getUser();
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

  saveFood() async {
    SavedFoodModel foodRequest = SavedFoodModel(
      food: food,
      createAt: DateTime.now().toString(),
    );
    final result =
        await FirestoreSavedFood.saved(food: foodRequest, userId: user!.uid!);
    if (result.status == Status.success) {
      SnackbarUtil.show("saved_food_success".tr);
    } else {
      SnackbarUtil.show("save_food_error".tr);
    }
  }
}

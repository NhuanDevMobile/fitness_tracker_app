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
  final FoodModel food = Get.arguments[0];
  final List<SavedFoodModel> savedFoods = Get.arguments[1];
  List<NutritionModel> nutritions = [];
  UserModel? user;
  RxBool isBookMarked = false.obs;

  @override
  void onInit() async {
    user = await _getuserUseCase.getUser();
    getNutritions();
    getBookMarked();
    super.onInit();
  }

  void getNutritions() {
    rootBundle.loadString("assets/jsons/nutritions.json").then((jsonStr) {
      final parsed = jsonDecode(jsonStr).cast<Map<String, dynamic>>();
      nutritions = parsed
          .map<NutritionModel>((json) => NutritionModel.fromJson(json))
          .toList();
      update(["fetch_nutritions"]);
    });
  }

  getBookMarked() {
    isBookMarked.value =
        savedFoods.any((element) => element.food!.foodName == food.foodName);
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
      isBookMarked.value = true;
      savedFoods.add(result.data!);
      SnackbarUtil.show("saved_food_success".tr);
    } else {
      SnackbarUtil.show("save_food_error".tr);
    }
  }

  deledSavedFood() async {
    String idSavedFood = savedFoods
            .where((element) => element.food!.foodName == food.foodName)
            .first
            .id ??
        "";
    int index = savedFoods
        .indexWhere((element) => element.food!.foodName == food.foodName);
    if (idSavedFood.isNotEmpty) {
      final result = await FirestoreSavedFood.delete(idSavedFood);
      if (result.status == Status.success) {
        isBookMarked.value = false;
        savedFoods.removeAt(index);
        SnackbarUtil.show("delete_saved_food_success".tr);
      } else {
        SnackbarUtil.show("delete_saved_food_error".tr);
      }
    }
  }
}

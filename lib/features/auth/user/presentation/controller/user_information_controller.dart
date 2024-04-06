import 'dart:convert';

import 'package:fitness_tracker_app/core/utils/calculator_utils.dart';
import 'package:fitness_tracker_app/features/auth/user/model/weight_loss_question_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';

class UserInforController extends GetxController {
  RxDouble percent = 0.0.obs;
  RxString gender = ''.obs;
  RxInt currentPage = 0.obs;
  final PageController pageController = PageController();
  RxInt height = 170.obs;
  RxInt weight = 60.obs;
  RxInt age = 20.obs;
  double bmi = 18.0;
  String resultBMIvalue = "";
  List<WeightLossQuestion> weightLossQuestions = [];
  @override
  void onInit() {
    onChangePage(index: 0);
    getWeightLostQuestions();
    super.onInit();
  }

  void onChangePage({required int index}) {
    percent.value = (index + 1) / 5 * 100 / 100;
    update(["fetchUserInformation"]);
  }

  void getWeightLostQuestions() {
    rootBundle
        .loadString("assets/jsons/weight_loss_questions.json")
        .then((jsonStr) {
      final parsed = jsonDecode(jsonStr).cast<Map<String, dynamic>>();
      weightLossQuestions = parsed
          .map<WeightLossQuestion>((json) => WeightLossQuestion.fromJson(json))
          .toList();
      update(["fetchUserInformation"]);
    });
  }

  void nextPage() {
    if (isStep1Completed() == false) return;
    if (currentPage.value == 4) return;
    currentPage.value++;
    pageController.nextPage(
        duration: const Duration(milliseconds: 300), curve: Curves.ease);
    if (currentPage.value == 3) {
      handleBMI();
    }
  }

  void previousPage() {
    if (currentPage.value == 0) return;
    currentPage.value--;
    pageController.previousPage(
        duration: const Duration(milliseconds: 300), curve: Curves.ease);
    update(["fetchUserInformation"]);
  }

  onChangeHeight(int value) {
    height.value = value;
    update(["fetchHeight"]);
  }

  handleBMI() {
    List<String> result = CalculatorUtils.calculateBMI(
        weight.value, height.value, age.value, gender.value);
    bmi = double.parse(result[0]);
    resultBMIvalue = result[1];
    print(bmi);
    print(resultBMIvalue);
    update(["fetchUserInformation"]);
  }

  onSeletedGender({required String value}) {
    gender.value = value;
    update(["fetchUserInformation"]);
  }

  bool isStep1Completed() {
    if (currentPage.value == 0 && gender.isEmpty) {
      return false;
    } else {
      return true;
    }
  }
}

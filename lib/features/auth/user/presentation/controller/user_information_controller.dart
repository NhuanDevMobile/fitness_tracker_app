import 'dart:convert';

import 'package:fitness_tracker_app/core/configs/enum.dart';
import 'package:fitness_tracker_app/core/data/firebase/firestore_database/firestore_user.dart';
import 'package:fitness_tracker_app/core/routes/routes.dart';
import 'package:fitness_tracker_app/core/ui/dialogs/dialogs.dart';
import 'package:fitness_tracker_app/core/ui/snackbar/snackbar.dart';
import 'package:fitness_tracker_app/core/utils/calculator_utils.dart';
import 'package:fitness_tracker_app/features/auth/user/domain/use_case/save_user_use_case.dart';
import 'package:fitness_tracker_app/features/auth/user/model/user_model.dart';
import 'package:fitness_tracker_app/features/auth/user/model/weight_loss_question_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';

class UserInforController extends GetxController {
  final SaveUserUseCase _saveUserUseCase;
  UserInforController(this._saveUserUseCase);
  RxInt age = 20.obs;
  double bmi = 18.0;
  RxInt height = 170.obs;
  RxInt weight = 60.obs;
  RxDouble percent = 0.0.obs;
  RxString gender = ''.obs;
  RxInt currentPage = 0.obs;
  String resultBMIvalue = "";
  List<WeightLossQuestion> weightLossQuestions = [];
  final PageController pageController = PageController();
  final TextEditingController displayName = TextEditingController();
  final UserModel user = Get.arguments;
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
    if (currentPage.value == 4) {
      handleUpdateUser();
    } else {
      currentPage.value++;
      pageController.nextPage(
          duration: const Duration(milliseconds: 300), curve: Curves.ease);
      if (currentPage.value == 3) {
        handleBMI();
      }
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
    update(["fetchUserInformation"]);
  }

  onSeletedGender({required String value}) {
    gender.value = value;
    update(["fetchUserInformation"]);
  }

  bool isStep1Completed() {
    if (currentPage.value == 0 && gender.isEmpty || displayName.text.isEmpty) {
      return false;
    } else {
      return true;
    }
  }

  onSeletedOption(
      {required String value, required int index, required int optionIndex}) {
    if (index == 0) {
      user.option1 = value;
    } else if (index == 1) {
      user.option2 = value;
    } else if (index == 2) {
      user.option3 = value;
    } else if (index == 3) {
      user.option4 = value;
    } else if (index == 4) {
      user.option5 = value;
    } else if (index == 5) {
      user.option6 = value;
    } else if (index == 6) {
      user.option7 = value;
    } else if (index == 7) {
      user.option8 = value;
    } else if (index == 8) {
      user.option9 = value;
    }

    weightLossQuestions[index].selectedOption = optionIndex;
    update(["fetchUserInformation"]);
  }

  handleUpdateUser() async {
    if (user.option1 == null ||
        user.option2 == null ||
        user.option3 == null ||
        user.option4 == null) {
      SnackbarUtil.show("please_select_required_questions".tr);
    } else {
      UserModel newUser = UserModel(
        uid: user.uid,
        email: user.email,
        displayName: displayName.text,
        gender: gender.value,
        height: height.value,
        weight: weight.value,
        age: age.value,
        bmi: bmi,
        resultBMIvalue: resultBMIvalue,
        isComplete: true,
        option1: user.option1,
        option2: user.option2,
        option3: user.option3,
        option4: user.option4,
        option5: user.option5,
        option6: user.option6,
        option7: user.option7,
        option8: user.option8,
        option9: user.option9,
      );
      DialogsUtils.showAlterLoading();
      final result = await FirestoreUser.updateUser(newUser);
      Get.back();
      if (result.status == Status.success) {
        _saveUserUseCase.saveUser(newUser);
        Get.offAllNamed(Routes.main);
      } else {
        SnackbarUtil.show(result.exp?.message ?? "something_went_wrong");
      }
    }
  }
}

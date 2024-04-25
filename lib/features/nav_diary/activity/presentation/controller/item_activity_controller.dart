import 'package:fitness_tracker_app/features/nav_diary/activity/models/activity_model.dart';
import 'package:fitness_tracker_app/features/nav_diary/activity/models/user_relationship_activity_model.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ItemActivityController extends GetxController {
  ActivityModel? activityModel;
  TextEditingController timeController = TextEditingController();
  TextEditingController kcalController = TextEditingController();
  @override
  void onInit() {
    if (Get.arguments is ActivityModel) {
      activityModel = Get.arguments;
      timeController.text = activityModel!.durationMin.toString();
      kcalController.text = activityModel!.nfCalories!.toStringAsFixed(2);
    }
  }

  double getCalories() {
    return int.parse(timeController.text) * double.parse(kcalController.text);
  }

  void setCalories() {
    if (isValidNumber(timeController.text) &&
        isValidNumber(kcalController.text)) {
      kcalController.text = getCalories().toStringAsFixed(1);
      update(['kcal']);
    }
  }

  void setText() {
    if (isValidNumber(kcalController.text)) {
      update(['kcal']);
    }
  }

  bool isValidNumber(String input) {
    // Sử dụng biểu thức chính quy để kiểm tra xem chuỗi có phải là một số hay không
    // Biểu thức này kiểm tra xem chuỗi có chứa chỉ các ký tự số từ 0 đến 9 và có thể có dấu chấm phẩy (.) hay không
    // Các ký tự số phải được thể hiện bởi \d, và dấu chấm phẩy (nếu có) phải được thể hiện bởi \.
    // ^ và $ đánh dấu đầu và cuối chuỗi để đảm bảo chuỗi chứa chỉ các ký tự theo đúng định dạng số.
    final RegExp numberRegExp = RegExp(r'^[0-9]+(\.[0-9]+)?$');
    return numberRegExp.hasMatch(input);
  }

  void onSave() {
    if (isValidNumber(timeController.text) &&
        isValidNumber(kcalController.text)) {
      dynamic data = {
        "exerciseName": activityModel!.name,
        "photoUrl": activityModel!.photo!.thumb,
        "duration": int.parse(timeController.text),
        "nfCalories": double.parse(kcalController.text),
      };
      Get.back(result: UserRelationshipActivityModel.fromJson(data));
    }
  }
}

import 'dart:async';

import 'package:fitness_tracker_app/features/nav_diary/activity/models/activity_model.dart';
import 'package:fitness_tracker_app/features/nav_diary/activity/models/user_relationship_activity_model.dart';
import 'package:fitness_tracker_app/features/nav_diary/activity/presentation/arguments/activity_argument.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SearchActivityController extends GetxController {
  final ActivityArgument argument = Get.arguments;
  List<ActivityModel> listActivity = [];
  List<ActivityModel> listFilterActivity = [];
  List<UserRelationshipActivityModel> listActivityRelationship = [];
  Timer? _debounceTimer;
  TextEditingController searchActivity = TextEditingController();
  RxBool isFilter = false.obs;
  @override
  void onInit() {
    listActivity = argument.listActivity;
    listActivityRelationship = argument.listActivityRelationship;
    update(['searchActivity']);
  }

  void onTypingFinished() {
    if (_debounceTimer != null) {
      _debounceTimer!.cancel();
    }

    _debounceTimer = Timer(const Duration(milliseconds: 1000), () async {
      if (searchActivity.text.trim().isNotEmpty) {
        String searchTerm = searchActivity.text.trim().toLowerCase();
        isFilter.value = true;
        listFilterActivity = listActivity
            .where(
                (activity) => activity.name!.toLowerCase().contains(searchTerm))
            .toList();
      } else {
        isFilter.value = false;
      }
    });
    update(['searchActivity']);
  }
}

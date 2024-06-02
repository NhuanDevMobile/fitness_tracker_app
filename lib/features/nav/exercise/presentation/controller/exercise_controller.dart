import 'dart:convert';

import 'package:fitness_tracker_app/features/nav/exercise/models/exercise_model.dart';
import 'package:fitness_tracker_app/features/nav/exercise/models/type_exercise_model.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';

class ExerciseController extends GetxController {
  final TypeExerciseModel typeExerciseModel = Get.arguments;
  List<ExerciseModel> exercises = [];
  @override
  void onInit() {
    getExercises();
    print(typeExerciseModel.id);
    super.onInit();
  }

  void getExercises() {
    rootBundle.loadString("assets/jsons/exercise.json").then((jsonStr) {
      final parsed = jsonDecode(jsonStr).cast<Map<String, dynamic>>();
      List<ExerciseModel> data = parsed
          .map<ExerciseModel>((json) => ExerciseModel.fromJson(json))
          .toList();
      exercises.clear();
      exercises.addAll(data
          .where((exercise) => exercise.bodyPartId == typeExerciseModel.id));
      update(["fetchExercises"]);
    });
  }
}

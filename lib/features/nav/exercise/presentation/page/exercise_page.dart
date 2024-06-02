import 'package:fitness_tracker_app/core/configs/app_colors.dart';
import 'package:fitness_tracker_app/core/routes/routes.dart';
import 'package:fitness_tracker_app/core/ui/widgets/appbar/appbar_widget.dart';
import 'package:fitness_tracker_app/features/nav/exercise/presentation/controller/exercise_controller.dart';
import 'package:fitness_tracker_app/features/nav/exercise/presentation/widgets/item_exercise.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ExercisePage extends GetView<ExerciseController> {
  const ExercisePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.white,
      appBar: AppBarWidget(
        backgroundColor: AppColors.primary,
        title: controller.typeExerciseModel.name,
        centerTitle: true,
      ),
      body: GetBuilder<ExerciseController>(
          id: "fetchExercises",
          builder: (context) {
            return ListView.builder(
                itemCount: controller.exercises.length,
                itemBuilder: (context, index) {
                  return ItemExercise(
                    item: controller.exercises[index],
                    onTap: () {
                      Get.toNamed(
                        Routes.exerciseDetail,
                        arguments: controller.exercises[index],
                      );
                    },
                  );
                });
          }),
    );
  }
}

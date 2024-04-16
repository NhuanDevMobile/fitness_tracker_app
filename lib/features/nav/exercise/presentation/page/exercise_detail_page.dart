import 'package:fitness_tracker_app/core/configs/app_colors.dart';
import 'package:fitness_tracker_app/core/configs/app_dimens.dart';
import 'package:fitness_tracker_app/core/ui/widgets/appbar/appbar_widget.dart';
import 'package:fitness_tracker_app/core/ui/widgets/images/image_network_square.dart';
import 'package:fitness_tracker_app/core/ui/widgets/text/text_widget.dart';
import 'package:fitness_tracker_app/features/nav/exercise/presentation/controller/exercise_detail_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ExerciseDetailPage extends GetView<ExerciseDetailController> {
  const ExerciseDetailPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.white,
      appBar: const AppBarWidget(
        backgroundColor: AppColors.primary,
        title: "Exercise Detail",
        centerTitle: true,
        titleColor: AppColors.white,
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            ImageNetWotkSquareWidget(
                height: 300,
                width: double.infinity,
                imageUrl: controller.exercise.gifUrl ?? ""),
            _buildDescription(),
          ],
        ),
      ),
    );
  }

  _buildDescription() {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              const TextWidget(
                text: "equipment",
                fontWeight: FontWeight.bold,
                size: AppDimens.textSize16,
              ),
              TextWidget(
                text: ' ${controller.exercise.equipment ?? ''}',
                fontWeight: FontWeight.w400,
                size: AppDimens.textSize16,
              ),
            ],
          ),
          const TextWidget(
            text: "instructions",
            fontWeight: FontWeight.bold,
            size: AppDimens.textSize16,
          ),
          const SizedBox(height: 10.0),
          ListView.builder(
            physics: const NeverScrollableScrollPhysics(),
            shrinkWrap: true,
            itemCount: controller.exercise.instructions!.length,
            itemBuilder: (context, index) {
              return TextWidget(
                text: controller.exercise.instructions![index],
              );
            },
          ),
        ],
      ),
    );
  }
}

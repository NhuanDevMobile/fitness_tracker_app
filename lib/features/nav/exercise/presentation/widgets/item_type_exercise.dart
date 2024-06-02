import 'package:fitness_tracker_app/core/configs/app_colors.dart';
import 'package:fitness_tracker_app/core/configs/app_dimens.dart';
import 'package:fitness_tracker_app/core/ui/widgets/text/text_widget.dart';
import 'package:fitness_tracker_app/features/nav/exercise/models/type_exercise_model.dart';
import 'package:flutter/material.dart';

class ItemTypeExercise extends StatelessWidget {
  final VoidCallback onTap;
  final TypeExerciseModel item;
  final int index;
  const ItemTypeExercise(
      {super.key,
      required this.item,
      required this.index,
      required this.onTap});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        decoration: BoxDecoration(
          color: AppColors.primary.withOpacity(0.89),
          borderRadius: BorderRadius.circular(10.0),
        ),
        child: Column(
            crossAxisAlignment: CrossAxisAlignment.end,
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              Align(
                  alignment: Alignment.centerLeft,
                  child: Padding(
                    padding: const EdgeInsets.only(left: 10.0, top: 10.0),
                    child: TextWidget(
                      text: item.name,
                      color: AppColors.white,
                      size: AppDimens.textSize22,
                      fontWeight: FontWeight.w600,
                    ),
                  )),
              Expanded(
                child: Align(
                  alignment: Alignment.bottomCenter,
                  child: Image.asset(
                    item.image,
                    width: double.infinity,
                  ),
                ),
              ),
            ]),
      ),
    );
  }
}

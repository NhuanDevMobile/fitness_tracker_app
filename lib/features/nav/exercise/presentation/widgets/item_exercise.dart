import 'package:fitness_tracker_app/core/configs/app_colors.dart';
import 'package:fitness_tracker_app/core/configs/app_dimens.dart';
import 'package:fitness_tracker_app/core/ui/widgets/text/text_widget.dart';
import 'package:fitness_tracker_app/features/nav/exercise/models/exercise_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class ItemExercise extends StatelessWidget {
  final ExerciseModel item;
  final VoidCallback onTap;

  const ItemExercise({super.key, required this.onTap, required this.item});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        color: AppColors.white,
        padding: const EdgeInsets.all(10.0),
        margin: const EdgeInsets.only(bottom: 10.0),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Container(
                height: 100,
                width: 150,
                decoration: BoxDecoration(
                  color: AppColors.white,
                  border: Border.all(width: 1.0, color: AppColors.primary),
                  borderRadius: const BorderRadius.all(Radius.circular(10.0)),
                  image: DecorationImage(
                      image: NetworkImage(item.gifUrl ?? ""),
                      fit: BoxFit.cover),
                )),
            const SizedBox(
              width: 10.0,
            ),
            Expanded(
              child: TextWidget(
                text: item.name ?? "",
                size: AppDimens.textSize16,
                fontWeight: FontWeight.w600,
              ),
            ),
            SvgPicture.asset(
              "assets/icons/ic_arrow_right.svg",
              height: 16.0,
              width: 16.0,
            ),
          ],
        ),
      ),
    );
  }
}

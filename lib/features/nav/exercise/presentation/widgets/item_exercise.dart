import 'package:fitness_tracker_app/core/configs/app_colors.dart';
import 'package:fitness_tracker_app/core/configs/app_dimens.dart';
import 'package:fitness_tracker_app/core/ui/widgets/images/image_network_square.dart';
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
            ImageNetWotkSquareWidget(
                height: 100, width: 150, imageUrl: item.gifUrl ?? ""),
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

import 'package:fitness_tracker_app/core/configs/app_colors.dart';
import 'package:fitness_tracker_app/core/configs/app_dimens.dart';
import 'package:fitness_tracker_app/core/ui/widgets/text/text_widget.dart';
import 'package:flutter/material.dart';

class ItemWaterAmount extends StatelessWidget {
  final VoidCallback onTap;
  final int index;
  final int currentIndex;
  final int value;
  const ItemWaterAmount(
      {super.key,
      required this.onTap,
      required this.index,
      required this.currentIndex,
      required this.value});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 12.0, vertical: 6.0),
        margin: const EdgeInsets.only(right: 8.0),
        decoration: BoxDecoration(
          color: currentIndex == index ? AppColors.blue : AppColors.transparent,
          borderRadius: BorderRadius.circular(20.0),
        ),
        child: Row(
          children: [
            const Icon(
              Icons.add,
              size: 12.0,
              color: AppColors.white,
            ),
            const SizedBox(width: 4.0),
            TextWidget(
              text: "$value ml",
              size: AppDimens.textSize15,
              fontWeight: FontWeight.w600,
              color: currentIndex == index ? AppColors.white : AppColors.black,
            ),
          ],
        ),
      ),
    );
  }
}

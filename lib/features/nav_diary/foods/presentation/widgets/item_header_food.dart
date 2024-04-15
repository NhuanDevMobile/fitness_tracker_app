import 'package:fitness_tracker_app/core/configs/app_colors.dart';
import 'package:fitness_tracker_app/core/configs/app_dimens.dart';
import 'package:fitness_tracker_app/core/ui/widgets/text/text_widget.dart';
import 'package:flutter/material.dart';

class ItemHeaderFood extends StatelessWidget {
  final String title;
  final bool isSeleted;
  final VoidCallback onTap;
  const ItemHeaderFood(
      {super.key,
      required this.title,
      required this.isSeleted,
      required this.onTap});

  @override
  Widget build(BuildContext context) {
    return Expanded(
        child: GestureDetector(
      onTap: onTap,
      child: Container(
        padding: const EdgeInsets.symmetric(vertical: 8.0, horizontal: 12.0),
        decoration: BoxDecoration(
          color: isSeleted ? AppColors.primary : AppColors.grey2,
          borderRadius: BorderRadius.circular(10.0),
        ),
        child: Center(
          child: TextWidget(
            text: title,
            color: isSeleted ? AppColors.white : AppColors.black,
            fontWeight: FontWeight.w600,
            size: AppDimens.textSize16,
          ),
        ),
      ),
    ));
  }
}

import 'package:fitness_tracker_app/core/configs/app_colors.dart';
import 'package:fitness_tracker_app/core/configs/app_dimens.dart';
import 'package:fitness_tracker_app/core/ui/widgets/text/text_widget.dart';
import 'package:flutter/material.dart';

class ItemNutritionValue extends StatelessWidget {
  final String title;
  final String value;
  const ItemNutritionValue(
      {super.key, required this.title, required this.value});

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          TextWidget(
            text: value,
            fontWeight: FontWeight.w600,
            color: AppColors.primary,
          ),
          const SizedBox(height: 4.0),
          TextWidget(
            text: title,
            size: AppDimens.textSize14,
            fontWeight: FontWeight.w600,
            color: AppColors.grey,
          ),
        ],
      ),
    );
  }
}

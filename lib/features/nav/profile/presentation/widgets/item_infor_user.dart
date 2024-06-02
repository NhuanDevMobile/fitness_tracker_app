import 'package:fitness_tracker_app/core/configs/app_colors.dart';
import 'package:fitness_tracker_app/core/configs/app_dimens.dart';
import 'package:fitness_tracker_app/core/ui/widgets/text/text_widget.dart';
import 'package:flutter/material.dart';

class ItemInforUser extends StatelessWidget {
  final String value;
  final String title;
  const ItemInforUser({super.key, required this.value, required this.title});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        TextWidget(
          text: value,
          size: AppDimens.textSize20,
          fontWeight: FontWeight.w700,
        ),
        const SizedBox(height: 4.0),
        TextWidget(
          text: title,
          size: AppDimens.textSize14,
          fontWeight: FontWeight.w400,
          color: AppColors.gray,
        ),
      ],
    );
  }
}

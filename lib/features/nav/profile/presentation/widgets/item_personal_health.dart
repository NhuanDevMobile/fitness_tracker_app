import 'package:fitness_tracker_app/core/configs/app_colors.dart';
import 'package:fitness_tracker_app/core/configs/app_dimens.dart';
import 'package:fitness_tracker_app/core/ui/widgets/text/text_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class ItemPersonalHeath extends StatelessWidget {
  final String svgIcon;
  final String title;
  final String value;
  final Color backgroundColor;
  const ItemPersonalHeath({
    super.key,
    required this.svgIcon,
    required this.title,
    required this.value,
    required this.backgroundColor,
  });

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 12.0),
        decoration: BoxDecoration(
            color: backgroundColor,
            borderRadius: const BorderRadius.all(Radius.circular(10.0))),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                Container(
                  height: 40.0,
                  width: 40.0,
                  padding: const EdgeInsets.all(6.0),
                  decoration: const BoxDecoration(
                    color: AppColors.white,
                    shape: BoxShape.circle,
                  ),
                  child: SvgPicture.asset(svgIcon),
                ),
                const SizedBox(width: 10.0),
                TextWidget(
                  text: value,
                  size: AppDimens.textSize20,
                  fontWeight: FontWeight.w700,
                )
              ],
            ),
            const SizedBox(height: 10.0),
            TextWidget(
              text: title,
              size: AppDimens.textSize14,
              fontWeight: FontWeight.w500,
            )
          ],
        ),
      ),
    );
  }
}

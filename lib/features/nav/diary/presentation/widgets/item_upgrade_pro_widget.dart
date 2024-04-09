import 'package:fitness_tracker_app/core/configs/app_colors.dart';
import 'package:fitness_tracker_app/core/configs/app_dimens.dart';
import 'package:fitness_tracker_app/core/ui/widgets/text/text_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class ItemUpgradeProWidget extends StatelessWidget {
  const ItemUpgradeProWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 24.0, vertical: 12.0),
      decoration: const BoxDecoration(
        color: AppColors.primary,
        borderRadius: BorderRadius.all(Radius.circular(12)),
        gradient: LinearGradient(
          stops: [0.3, 1.0],
          colors: [
            AppColors.primary,
            Color(0xFF79DC4F),
          ],
        ),
      ),
      child: Row(
        children: [
          SvgPicture.asset('assets/icons/ic_pro.svg'),
          const SizedBox(
            width: 10.0,
          ),
          const Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                TextWidget(
                  text: "Upgrade to premium ARISE",
                  fontWeight: FontWeight.w600,
                  color: AppColors.white,
                  size: AppDimens.textSize16,
                ),
                TextWidget(
                  text: "Upgrade to premium ARISE",
                  fontWeight: FontWeight.w600,
                  color: AppColors.white,
                  size: AppDimens.textSize14,
                  fontStyle: FontStyle.italic,
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}

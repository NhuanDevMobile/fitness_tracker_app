import 'package:fitness_tracker_app/core/configs/app_colors.dart';
import 'package:fitness_tracker_app/core/configs/app_dimens.dart';
import 'package:fitness_tracker_app/core/ui/widgets/my_separator_widget.dart';
import 'package:fitness_tracker_app/core/ui/widgets/text/text_widget.dart';
import 'package:fitness_tracker_app/features/nav_diary/activity/models/user_relationship_activity_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';

class ItemDailyActivity extends StatelessWidget {
  final Color color;
  final String title;
  final int kCal;
  final double consumeKcal;
  final VoidCallback onTap;
  final List<UserRelationshipActivityModel> relationshipActivity;
  const ItemDailyActivity({
    super.key,
    required this.color,
    required this.title,
    required this.kCal,
    required this.consumeKcal,
    required this.onTap,
    required this.relationshipActivity,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          boxShadow: [
            BoxShadow(
              color: Colors.grey.withOpacity(0.5), // Màu của bóng
              spreadRadius: 1, // Bán kính bóng được lan rộng
              blurRadius: 1, // Độ mờ của bóng
              offset: const Offset(0, 1), // Vị trí tạo bóng (dọc, ngang)
            ),
          ],
          gradient: LinearGradient(
            stops: const [0.03, 0.02],
            colors: [color, Colors.white],
          ),
          borderRadius: const BorderRadius.all(
            Radius.circular(12.0),
          )),
      child: Padding(
        padding: const EdgeInsets.all(12.0),
        child: Column(
          children: [
            Row(
              children: [
                const SizedBox(width: 11.0),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        children: [
                          TextWidget(
                            text: title,
                            color: color,
                            fontWeight: FontWeight.bold,
                            size: AppDimens.textSize20,
                          ),
                          const SizedBox(width: 4.0),
                          TextWidget(
                            text: "${consumeKcal.toStringAsFixed(2)} Kcal",
                            color: AppColors.black,
                            fontWeight: FontWeight.w600,
                          ),
                        ],
                      ),
                      const SizedBox(height: 2.0),
                      TextWidget(
                        text: "${"recomeded_util_now".tr} $kCal Kcal",
                        color: AppColors.grey,
                        size: AppDimens.textSize14,
                        fontWeight: FontWeight.w400,
                      ),
                    ],
                  ),
                ),
                GestureDetector(
                  onTap: onTap,
                  child: SvgPicture.asset(
                    "assets/icons/ic_add.svg",
                    height: 40.0,
                    width: 40.0,
                  ),
                ),
              ],
            ),
            const SizedBox(height: 10.0),
            relationshipActivity.isNotEmpty
                ? ListView.builder(
                    padding: const EdgeInsets.only(left: 12.0),
                    itemCount: relationshipActivity.length >= 3
                        ? 3
                        : relationshipActivity.length,
                    shrinkWrap: true,
                    physics: const NeverScrollableScrollPhysics(),
                    itemBuilder: (context, index) {
                      return itemDailyActivity(
                          relationshipActivity: relationshipActivity[index]);
                    },
                  )
                : const SizedBox.shrink()
          ],
        ),
      ),
    );
  }

  Widget itemDailyActivity(
      {required UserRelationshipActivityModel relationshipActivity}) {
    return Container(
      margin: const EdgeInsets.only(bottom: 12.0),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.end,
        children: [
          TextWidget(
            textAlign: TextAlign.end,
            text: relationshipActivity.getNameActivity(),
            color: AppColors.grey1,
            size: AppDimens.textSize12,
            fontWeight: FontWeight.w400,
          ),
          const Expanded(
            child: MySeparator(color: AppColors.grey, height: 1.0),
          ),
          TextWidget(
            text: relationshipActivity.getKcalActivity(),
            textAlign: TextAlign.end,
            size: AppDimens.textSize16,
            fontWeight: FontWeight.w600,
            color: AppColors.grey1,
          )
        ],
      ),
    );
  }
}

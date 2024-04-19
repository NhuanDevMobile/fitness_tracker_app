import 'package:fitness_tracker_app/core/configs/app_colors.dart';
import 'package:fitness_tracker_app/core/configs/app_dimens.dart';
import 'package:fitness_tracker_app/core/ui/widgets/text/text_widget.dart';
import 'package:fitness_tracker_app/features/nav_diary/activity/presentation/widgets/add_activity_bottomsheet.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';

class ItemActivity extends StatelessWidget {
  const ItemActivity({super.key});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Get.bottomSheet(
          AddActivityBottomSheet(
            onTapAdd: () {},
          ),
          backgroundColor: AppColors.transparent,
          shape: const RoundedRectangleBorder(
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(20.0),
              topRight: Radius.circular(20.0),
            ),
          ),
        );
      },
      child: Container(
        margin: const EdgeInsets.only(bottom: 10.0),
        padding: const EdgeInsets.symmetric(horizontal: 12.0, vertical: 12.0),
        decoration: const BoxDecoration(
            color: AppColors.white,
            borderRadius: BorderRadius.all(Radius.circular(16.0))),
        child: Row(
          children: [
            Container(
              width: 50.0,
              height: 50.0,
              decoration: BoxDecoration(
                color: Colors.grey,
                borderRadius: BorderRadius.circular(10.0),
              ),
            ),
            const SizedBox(width: 10.0),
            const Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  TextWidget(
                    text: "Bài tập 1",
                    size: AppDimens.textSize16,
                    fontWeight: FontWeight.w600,
                  ),
                  TextWidget(
                    text: "Thời gian: 30 phút",
                    size: AppDimens.textSize14,
                    fontWeight: FontWeight.w400,
                  ),
                ],
              ),
            ),
            SvgPicture.asset("assets/icons/ic_add.svg")
          ],
        ),
      ),
    );
  }
}

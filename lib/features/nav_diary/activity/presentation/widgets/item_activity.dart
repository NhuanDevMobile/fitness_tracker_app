import 'package:fitness_tracker_app/core/configs/app_colors.dart';
import 'package:fitness_tracker_app/core/configs/app_dimens.dart';
import 'package:fitness_tracker_app/core/ui/widgets/images/image_network_square.dart';
import 'package:fitness_tracker_app/core/ui/widgets/text/text_widget.dart';
import 'package:fitness_tracker_app/features/nav_diary/activity/models/activity_model.dart';
import 'package:fitness_tracker_app/features/nav_diary/activity/presentation/controller/activity_controller.dart';
import 'package:fitness_tracker_app/features/nav_diary/activity/presentation/controller/item_activity_controller.dart';
import 'package:fitness_tracker_app/features/nav_diary/activity/presentation/widgets/add_activity_bottomsheet.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';

class ItemActivity extends GetView<ActivityController> {
  const ItemActivity({super.key, required this.activityModel});

  final ActivityModel activityModel;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () async {
        final result = await Get.bottomSheet(
            GetBuilder<ItemActivityController>(
              init: ItemActivityController(),
              builder: (logic) {
                return AddActivityBottomSheet(
                  onTapAdd: () {},
                );
              },
            ),
            backgroundColor: AppColors.transparent,
            shape: const RoundedRectangleBorder(
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(20.0),
                topRight: Radius.circular(20.0),
              ),
            ),
            settings: RouteSettings(arguments: activityModel));
        if (result != null) {
          controller.addActivityRelationship(userRelationshipActivity: result);
        }
      },
      child: Container(
        margin: const EdgeInsets.only(bottom: 10.0),
        padding: const EdgeInsets.symmetric(horizontal: 12.0, vertical: 12.0),
        decoration: const BoxDecoration(
            color: AppColors.white,
            borderRadius: BorderRadius.all(Radius.circular(16.0))),
        child: Row(
          children: [
            ImageNetWotkSquareWidget(
              imageUrl: activityModel.photo!.thumb ?? "",
              height: 50.0,
              width: 50.0,
              borderRadius: 10.0,
            ),
            const SizedBox(width: 10.0),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  TextWidget(
                    text: activityModel.name ?? "",
                    size: AppDimens.textSize16,
                    fontWeight: FontWeight.w600,
                  ),
                  TextWidget(
                    text: "${activityModel.durationMin.toString()} phút",
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

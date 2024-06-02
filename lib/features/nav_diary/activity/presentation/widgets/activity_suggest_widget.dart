import 'package:fitness_tracker_app/features/nav_diary/activity/presentation/controller/activity_controller.dart';
import 'package:fitness_tracker_app/features/nav_diary/activity/presentation/widgets/item_activity.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ActivitySuggestWidget extends GetView<ActivityController> {
  const ActivitySuggestWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: GetBuilder<ActivityController>(
        id: "fetchActivity",
        builder: (logic) {
          return controller.listActivitySuggest.isNotEmpty
              ? ListView.builder(
                  shrinkWrap: true,
                  padding: const EdgeInsets.symmetric(horizontal: 12.0),
                  itemCount: controller.listActivitySuggest.length,
                  // physics: const NeverScrollableScrollPhysics(),
                  itemBuilder: (context, index) {
                    return ItemActivity(
                      activityModel: controller.listActivitySuggest[index],
                    );
                  })
              : const SizedBox.shrink();
        },
      ),
    );
  }
}

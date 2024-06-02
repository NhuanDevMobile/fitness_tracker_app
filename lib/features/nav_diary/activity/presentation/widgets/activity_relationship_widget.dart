import 'package:fitness_tracker_app/features/nav_diary/activity/presentation/controller/activity_controller.dart';
import 'package:fitness_tracker_app/features/nav_diary/activity/presentation/widgets/item_activity_relationship.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ActivityRelationshipWidget extends GetView<ActivityController> {
  const ActivityRelationshipWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: GetBuilder<ActivityController>(
        id: "listActivityRelationship",
        builder: (logic) {
          return controller.listActivityRelationship.isNotEmpty
              ? ListView.builder(
                  shrinkWrap: true,
                  padding: const EdgeInsets.symmetric(horizontal: 12.0),
                  itemCount: controller.listActivityRelationship.length,
                  // physics: const NeverScrollableScrollPhysics(),
                  itemBuilder: (context, index) {
                    return ItemActivityRelationship(
                      userRelationshipActivity:
                          controller.listActivityRelationship[index],
                    );
                  })
              : const SizedBox.shrink();
        },
      ),
    );
  }
}

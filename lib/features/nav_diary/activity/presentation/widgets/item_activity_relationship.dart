import 'package:fitness_tracker_app/core/configs/app_colors.dart';
import 'package:fitness_tracker_app/core/configs/app_dimens.dart';
import 'package:fitness_tracker_app/core/ui/widgets/images/image_network_square.dart';
import 'package:fitness_tracker_app/core/ui/widgets/text/text_widget.dart';
import 'package:fitness_tracker_app/features/nav_diary/activity/models/user_relationship_activity_model.dart';
import 'package:fitness_tracker_app/features/nav_diary/activity/presentation/controller/activity_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

enum Menu { edit, delete }

class ItemActivityRelationship extends GetView<ActivityController> {
  const ItemActivityRelationship(
      {super.key, required this.userRelationshipActivity});

  final UserRelationshipActivityModel userRelationshipActivity;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () async {},
      child: Container(
        margin: const EdgeInsets.only(bottom: 10.0),
        padding: const EdgeInsets.symmetric(horizontal: 12.0, vertical: 12.0),
        decoration: const BoxDecoration(
            color: AppColors.white,
            borderRadius: BorderRadius.all(Radius.circular(16.0))),
        child: Row(
          children: [
            ImageNetWotkSquareWidget(
              imageUrl: userRelationshipActivity.photoUrl ?? "",
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
                    text: userRelationshipActivity.exerciseName ?? "",
                    size: AppDimens.textSize16,
                    fontWeight: FontWeight.w600,
                  ),
                  TextWidget(
                    text:
                        "${userRelationshipActivity.duration.toString()} phút",
                    size: AppDimens.textSize14,
                    fontWeight: FontWeight.w400,
                  ),
                ],
              ),
            ),
            popupMenu()
          ],
        ),
      ),
    );
  }

  Widget popupMenu() {
    return PopupMenuButton<Menu>(
      color: AppColors.white,
      icon: const Icon(Icons.more_vert),
      onSelected: (Menu item) {
        if (item == Menu.edit) {
          controller.editItem(userRelationshipActivity);
        }
        if (item == Menu.delete) {
          controller.deleteItem(userRelationshipActivity);
        }
      },
      itemBuilder: (BuildContext context) => <PopupMenuEntry<Menu>>[
        const PopupMenuItem<Menu>(
          value: Menu.edit,
          child: ListTile(
            leading: Icon(Icons.edit),
            title: Text('Edit'),
          ),
        ),
        const PopupMenuItem<Menu>(
          value: Menu.delete,
          child: ListTile(
            leading: Icon(Icons.delete),
            title: Text('Delete'),
          ),
        ),
      ],
    );
  }
}

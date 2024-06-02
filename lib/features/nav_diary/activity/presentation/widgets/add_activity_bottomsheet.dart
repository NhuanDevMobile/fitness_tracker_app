import 'package:fitness_tracker_app/core/configs/app_colors.dart';
import 'package:fitness_tracker_app/core/ui/widgets/button/elevated_button_widget.dart';
import 'package:fitness_tracker_app/core/ui/widgets/images/image_network_square.dart';
import 'package:fitness_tracker_app/core/ui/widgets/text/text_widget.dart';
import 'package:fitness_tracker_app/core/ui/widgets/textfield/textfield_widget.dart';
import 'package:fitness_tracker_app/features/nav_diary/activity/presentation/controller/item_activity_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';

class AddActivityBottomSheet extends GetView<ItemActivityController> {
  final VoidCallback onTapAdd;

  const AddActivityBottomSheet({super.key, required this.onTapAdd});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          ElevatedButtonWidget(
            ontap: () {
              controller.onSave();
            },
            icon: "assets/icons/ic_control_plus.svg",
            text: "Ghi ngay",
            width: 140,
            height: 40.0,
          ),
          const SizedBox(
            height: 10.0,
          ),
          Container(
            height: 300.0,
            width: double.infinity,
            color: AppColors.white,
            child: Padding(
              padding: const EdgeInsets.all(12.0),
              child: Column(
                children: [
                  const SizedBox(height: 10.0),
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      ImageNetWotkSquareWidget(
                          height: 60.0,
                          width: 60.0,
                          imageUrl:
                              controller.activityModel!.photo!.thumb ?? "",
                          borderRadius: 10.0),
                      const SizedBox(width: 10.0),
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            TextWidget(
                                text: controller.activityModel!.name ?? "",
                                size: 16.0,
                                fontWeight: FontWeight.w400),
                            const SizedBox(height: 5.0),
                            GetBuilder<ItemActivityController>(
                              id: "kcal",
                              builder: (logic) {
                                return TextWidget(
                                    text:
                                        "${controller.kcalController.text} Calo",
                                    size: 16.0,
                                    fontWeight: FontWeight.w600);
                              },
                            )
                          ],
                        ),
                      ),
                      SvgPicture.asset("assets/icons/ic_bookmark.svg")
                    ],
                  ),
                  const SizedBox(height: 30.0),
                  TextFieldWidget(
                    backgroundColor: AppColors.white,
                    labelText: "Thời gian",
                    controller: controller.timeController,
                    onChanged: (value) {
                      controller.setCalories();
                    },
                    keyboardType: TextInputType.number,
                  ),
                  const SizedBox(height: 20.0),
                  TextFieldWidget(
                    backgroundColor: AppColors.white,
                    labelText: "Năng lượng tiêu hao",
                    controller: controller.kcalController,
                    onChanged: (value) {
                      controller.setText();
                      // controller.setCalories();
                    },
                    keyboardType: TextInputType.number,
                  ),
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}

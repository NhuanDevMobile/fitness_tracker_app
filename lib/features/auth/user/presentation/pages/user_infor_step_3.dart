import 'package:fitness_tracker_app/core/ui/widgets/text/text_widget.dart';
import 'package:fitness_tracker_app/features/auth/user/presentation/controller/user_information_controller.dart';
import 'package:fitness_tracker_app/features/auth/user/presentation/widgets/number_picker_widget.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class UserInforStep3 extends GetView<UserInforController> {
  const UserInforStep3({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(24.0),
      child: Column(
        children: [
          const TextWidget(text: "content_height_and_weight"),
          const SizedBox(height: 24.0),
          Row(
            children: [
              Obx(
                () => Expanded(
                  child: NumberPickerWidget(
                    title: "weight",
                    maxNumber: 300,
                    number: controller.weight.value,
                    onChangeNumber: (value) {
                      controller.weight.value = value;
                    },
                  ),
                ),
              ),
              const SizedBox(width: 24.0),
              Expanded(
                child: NumberPickerWidget(
                  title: "age",
                  maxNumber: 100,
                  number: controller.age.value,
                  onChangeNumber: (value) {
                    controller.age.value = value;
                  },
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}

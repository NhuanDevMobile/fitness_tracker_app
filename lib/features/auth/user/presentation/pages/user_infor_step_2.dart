import 'package:fitness_tracker_app/core/configs/app_colors.dart';
import 'package:fitness_tracker_app/core/ui/widgets/text/text_widget.dart';
import 'package:fitness_tracker_app/features/auth/user/presentation/controller/user_information_controller.dart';
import 'package:fitness_tracker_app/features/auth/user/presentation/widgets/height_silder.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';

class UserInforStep2 extends GetView<UserInforController> {
  const UserInforStep2({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(24.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const TextWidget(text: "what_is_your_excact_height"),
          const SizedBox(height: 24.0),
          Expanded(
            child: Obx(() => HeightSlider(
                  primaryColor: AppColors.primary,
                  sliderCircleColor: AppColors.primary,
                  currentHeightTextColor: AppColors.primary,
                  numberLineColor: AppColors.primary,
                  height: controller.height.value,
                  onChange: (int value) {
                    controller.height.value = value;
                  },
                )),
          ),
        ],
      ),
    );
  }
}

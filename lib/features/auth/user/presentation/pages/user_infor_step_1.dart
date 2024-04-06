import 'package:fitness_tracker_app/core/configs/app_colors.dart';
import 'package:fitness_tracker_app/core/configs/app_dimens.dart';
import 'package:fitness_tracker_app/core/ui/widgets/text/text_widget.dart';
import 'package:fitness_tracker_app/core/ui/widgets/textfield/textfield_widget.dart';
import 'package:fitness_tracker_app/features/auth/user/presentation/controller/user_information_controller.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';

class UserInforStep1 extends GetView<UserInforController> {
  const UserInforStep1({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Padding(
      padding: const EdgeInsets.all(24.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const TextWidget(
            text: "display_name",
            fontWeight: FontWeight.w600,
          ),
          const SizedBox(height: 6.0),
          const TextFieldWidget(),
          const SizedBox(height: 12.0),
          const TextWidget(
            text: "what_is_your_gender",
            fontWeight: FontWeight.w600,
          ),
          const SizedBox(height: 12.0),
          Obx(
            () => Column(
              children: [
                GestureDetector(
                  onTap: () {
                    controller.onSeletedGender(value: "male");
                  },
                  child: Container(
                    padding: const EdgeInsets.symmetric(
                        vertical: 20.0, horizontal: 20.0),
                    height: 160.0,
                    width: double.infinity,
                    decoration: BoxDecoration(
                      border: controller.gender.value == "male"
                          ? Border.all(width: 1, color: AppColors.primary)
                          : null,
                      borderRadius: const BorderRadius.all(
                        Radius.circular(30.0),
                      ),
                      color: AppColors.primary.withOpacity(0.1),
                    ),
                    child: Row(
                      children: [
                        const SizedBox(width: 20.0),
                        const Expanded(
                            child: TextWidget(
                          text: "male",
                          size: AppDimens.textSize32,
                          fontWeight: FontWeight.bold,
                          color: AppColors.primary,
                        )),
                        SvgPicture.asset("assets/icons/ic_male.svg"),
                      ],
                    ),
                  ),
                ),
                const SizedBox(height: 24.0),
                GestureDetector(
                  onTap: () {
                    controller.onSeletedGender(value: "female");
                  },
                  child: Container(
                    padding: const EdgeInsets.symmetric(
                        vertical: 20.0, horizontal: 20.0),
                    height: 160.0,
                    width: double.infinity,
                    decoration: BoxDecoration(
                      border: controller.gender.value == "female"
                          ? Border.all(width: 1, color: AppColors.secondary)
                          : null,
                      borderRadius: const BorderRadius.all(
                        Radius.circular(30.0),
                      ),
                      color: AppColors.secondary.withOpacity(0.1),
                    ),
                    child: Row(
                      children: [
                        const SizedBox(width: 20.0),
                        const Expanded(
                            child: TextWidget(
                          text: "female",
                          size: AppDimens.textSize32,
                          fontWeight: FontWeight.bold,
                          color: AppColors.secondary,
                        )),
                        SvgPicture.asset("assets/icons/ic_female.svg"),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    ));
  }
}

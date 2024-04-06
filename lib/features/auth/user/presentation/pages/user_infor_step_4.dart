import 'package:fitness_tracker_app/core/configs/app_colors.dart';
import 'package:fitness_tracker_app/core/configs/app_dimens.dart';
import 'package:fitness_tracker_app/core/ui/widgets/text/text_spand_wdiget.dart';
import 'package:fitness_tracker_app/core/ui/widgets/text/text_widget.dart';
import 'package:fitness_tracker_app/core/utils/calculator_utils.dart';
import 'package:fitness_tracker_app/features/auth/user/presentation/controller/user_information_controller.dart';
import 'package:fitness_tracker_app/features/auth/user/presentation/widgets/bmi_gauge_widget.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class UserInforStep4 extends GetView<UserInforController> {
  const UserInforStep4({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(24.0),
      child: GetBuilder<UserInforController>(
          id: "fetchUserInformation",
          builder: (_) {
            return Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    const Expanded(
                        child: TextWidget(
                      text: "your_BMI",
                      fontWeight: FontWeight.w400,
                    )),
                    IconButton(
                        onPressed: () {},
                        icon: const Icon(
                          Icons.info_sharp,
                          color: AppColors.primary,
                        )),
                  ],
                ),
                const SizedBox(height: 10.0),
                TextWidget(
                  text: controller.bmi.toString(),
                  size: 40.0,
                  fontWeight: FontWeight.bold,
                  color: AppColors.primary,
                ),
                Row(
                  children: [
                    const TextWidget(
                      text: "your_weight_result_At",
                      fontWeight: FontWeight.w400,
                      size: AppDimens.textSize14,
                    ),
                    Expanded(
                      child: TextWidget(
                        text: controller.resultBMIvalue,
                        fontWeight: FontWeight.w700,
                        size: AppDimens.textSize14,
                        maxLines: 1,
                        color: AppColors.getColorBMI(controller.bmi),
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 12.0),
                BMIGaugeWidget(
                  bmi: controller.bmi,
                  resultBMI: controller.resultBMIvalue,
                ),
                const SizedBox(height: 12.0),
                const Divider(
                  color: AppColors.grey,
                  thickness: 1.0,
                ),
                TextSpanWidget(
                  text1: "Khoảng cân nặng phù hợp của bạn:",
                  text2:
                      "${CalculatorUtils.calculateHealthyWeight(controller.height.value)[2].toString()} - ${CalculatorUtils.calculateHealthyWeight(controller.height.value)[1].toString()} kg",
                  fontWeight2: FontWeight.bold,
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(
                      vertical: 12.0, horizontal: 10.0),
                  child: Row(
                    children: [
                      _buildItem(
                          text: "weight",
                          value: "${controller.weight.toString()} kg"),
                      const Spacer(),
                      _buildItem(
                          text: "height",
                          value: "${controller.height.toString()} cm"),
                      const Spacer(),
                      _buildItem(
                          text: "age", value: controller.age.value.toString()),
                      const Spacer(),
                      _buildItem(
                          text: "gender", value: controller.gender.value),
                    ],
                  ),
                ),
                Container(
                    width: double.infinity,
                    padding: const EdgeInsets.symmetric(
                        horizontal: 12.0, vertical: 16.0),
                    decoration: const BoxDecoration(
                      color: AppColors.white,
                      borderRadius: BorderRadius.all(Radius.circular(10.0)),
                    ),
                    child: const Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        TextWidget(
                          text: "Lưu ý:",
                          size: AppDimens.textSize16,
                          fontWeight: FontWeight.w600,
                        ),
                        TextWidget(
                          text:
                              "Chỉ số BMI từ 23 trở lên là ngưỡng tăng nguy cơ mắc các bệnh mãng tính như : tiểu đường tuýp 2, tim mạch, xương khớp, bệnh gan mật,…\n\nFitness Tracker sẽ giúp bạn có được:\n- Dần cải thiện cân nặng và vóc dáng sau mỗi tuần.\n- Đạt được và duy trì chỉ số BMI lý tưởng. Giảm thiểu nguy cơ mắc các vấn đề sức khoẻ nghiêm trọng do thừa cân và béo phì.\n- Tư duy đúng về dinh dưỡng và lối sống lành mạnh.",
                          size: AppDimens.textSize16,
                          color: AppColors.black,
                          fontWeight: FontWeight.w400,
                        )
                      ],
                    ))
              ],
            );
          }),
    );
  }

  _buildItem({required String text, required String value}) {
    return Column(
      children: [
        TextWidget(
          text: value,
          size: AppDimens.textSize16,
          fontWeight: FontWeight.w600,
          color: AppColors.primary,
        ),
        const SizedBox(height: 2.0),
        TextWidget(
          text: text,
          size: AppDimens.textSize14,
          fontWeight: FontWeight.w400,
          color: AppColors.grey,
        ),
      ],
    );
  }
}

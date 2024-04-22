import 'package:fitness_tracker_app/core/configs/app_colors.dart';
import 'package:fitness_tracker_app/core/configs/app_dimens.dart';
import 'package:fitness_tracker_app/core/ui/widgets/text/text_spand_wdiget.dart';
import 'package:fitness_tracker_app/core/ui/widgets/text/text_widget.dart';
import 'package:fitness_tracker_app/core/utils/calculator_utils.dart';
import 'package:fitness_tracker_app/features/nav/diary/presentation/controller/diary_controller.dart';
import 'package:fitness_tracker_app/features/nav/diary/presentation/widgets/item_upgrade_pro_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:percent_indicator/circular_percent_indicator.dart';

class ItemResultDiary extends GetView<DiaryController> {
  const ItemResultDiary({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 450,
      width: double.infinity,
      child: Stack(
        children: [
          Positioned(
            top: -200,
            left: -100,
            right: -100,
            child: Container(
              width: double.infinity,
              height: 680,
              decoration: BoxDecoration(
                color: AppColors.white,
                shape: BoxShape.circle,
                boxShadow: [
                  BoxShadow(
                    color: Colors.grey.withOpacity(0.5), // Màu của bóng
                    spreadRadius: 1, // Bán kính bóng được lan rộng
                    blurRadius: 1, // Độ mờ của bóng
                    offset: const Offset(0, 1), // Vị trí tạo bóng (dọc, ngang)
                  ),
                ],
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 12.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const SizedBox(height: 12.0),
                const ItemUpgradeProWidget(),
                const SizedBox(height: 12.0),
                Row(
                  children: [
                    Expanded(
                      child: TextSpanWidget(
                        text1: "energy_input",
                        text2: "${controller.user!.getKcal()} Kcal",
                        textColor2: AppColors.primary,
                        fontWeight2: FontWeight.bold,
                      ),
                    ),
                    IconButton(
                        onPressed: () {},
                        icon: const Icon(
                          Icons.info_sharp,
                          color: AppColors.primary,
                        )),
                  ],
                ),
                const SizedBox(height: 20.0),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 12.0),
                  child: Row(
                    children: [
                      Column(
                        children: [
                          SvgPicture.asset(
                            'assets/icons/ic_eating.svg',
                            height: 50.0,
                            width: 40.0,
                          ),
                          TextWidget(
                            text: controller.getCaloriesConsume().toString(),
                            color: AppColors.black,
                            fontWeight: FontWeight.w600,
                          ),
                          const TextWidget(
                            text: "eaten",
                            color: AppColors.black,
                            size: AppDimens.textSize16,
                            fontWeight: FontWeight.w400,
                          ),
                        ],
                      ),
                      Expanded(
                        child: Center(
                          child: CircularPercentIndicator(
                            radius: 70.0,
                            lineWidth: 10.0,
                            percent: CalculatorUtils.phanTramTieuThu(
                                    consumed: controller.user!.getKcal(),
                                    target: controller.getCaloriesConsume()) /
                                100,
                            backgroundColor: AppColors.grey,
                            progressColor: AppColors.primary,
                            center: Column(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                TextWidget(
                                  text: controller.user!.getKcal().toString(),
                                  color: AppColors.primary,
                                  fontWeight: FontWeight.bold,
                                ),
                                const TextWidget(
                                  text: "remaining",
                                  color: AppColors.grey,
                                  fontWeight: FontWeight.w600,
                                  size: AppDimens.textSize16,
                                ),
                                TextWidget(
                                  text: CalculatorUtils.soDaTieuThu(
                                    total:
                                        controller.user!.getKcal().toDouble(),
                                    percent: CalculatorUtils.phanTramConLai(
                                      consumed: controller.user!.getKcal(),
                                      target: controller.getCaloriesConsume(),
                                    ),
                                  ).toStringAsFixed(2),
                                  color: AppColors.black,
                                  fontWeight: FontWeight.bold,
                                  size: AppDimens.textSize22,
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                      Column(
                        children: [
                          SvgPicture.asset(
                            'assets/icons/ic_fire_small.svg',
                            height: 40.0,
                            width: 40.0,
                          ),
                          const TextWidget(
                            text: "0",
                            color: AppColors.black,
                            fontWeight: FontWeight.w600,
                          ),
                          const TextWidget(
                            text: "practise",
                            color: AppColors.black,
                            size: AppDimens.textSize16,
                            fontWeight: FontWeight.w400,
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 12.0),
                Row(
                  children: [
                    _itemNutrients(
                      title: 'Carbs',
                      value: '0%',
                      percent: 0.5,
                      remaining:
                          "${calculateCarbsRemaining(totalCalories: 1913, carbsConsume: 0).toStringAsFixed(1)} g",
                    ),
                    const SizedBox(width: 12.0),
                    _itemNutrients(
                      title: 'Protein',
                      value: '0g',
                      percent: 0.5,
                      remaining:
                          "${calculateProteinRemaining(totalCalories: 1913, proteinConsume: 0).toStringAsFixed(1)} g",
                    ),
                    const SizedBox(width: 12.0),
                    _itemNutrients(
                      title: 'Fat',
                      value: '0g',
                      percent: 0.5,
                      remaining:
                          "${calculateFatRemaining(totalCalories: 1913, fatConsume: 0).toStringAsFixed(1)} g",
                    ),
                  ],
                )
              ],
            ),
          ),
        ],
      ),
    );
  }

  _itemNutrients(
      {required String title,
      required String value,
      required double percent,
      required String remaining}) {
    return Expanded(
      child: Column(
        children: [
          Row(
            children: [
              Expanded(
                child: TextWidget(
                  text: title,
                  size: AppDimens.textSize16,
                  fontWeight: FontWeight.w600,
                ),
              ),
              TextWidget(
                text: value,
                size: AppDimens.textSize16,
                fontWeight: FontWeight.w400,
              ),
            ],
          ),
          const SizedBox(height: 4.0),
          LinearProgressIndicator(
            value: percent,
            backgroundColor: AppColors.grey2,
            valueColor: const AlwaysStoppedAnimation<Color>(AppColors.primary),
            borderRadius: BorderRadius.circular(10),
          ),
          const SizedBox(height: 4.0),
          Row(
            children: [
              const Expanded(
                child: TextWidget(
                  text: "remaining",
                  size: AppDimens.textSize12,
                  fontWeight: FontWeight.w400,
                  fontStyle: FontStyle.italic,
                ),
              ),
              TextWidget(
                text: remaining,
                size: AppDimens.textSize12,
                fontWeight: FontWeight.w400,
                fontStyle: FontStyle.italic,
              ),
            ],
          ),
        ],
      ),
    );
  }

  double calculateCarbsRemaining(
      {required int totalCalories, required int carbsConsume}) {
    return ((totalCalories * 0.45) / 4) -
        carbsConsume; // Mỗi gram carbs có 4 calo
  }

// Hàm tính lượng protein từ tổng calo hàng ngày
  double calculateProteinRemaining(
      {required int totalCalories, required int proteinConsume}) {
    return ((totalCalories * 0.25) / 4) -
        proteinConsume; // Mỗi gram protein có 4 calo
  }

  double calculateFatRemaining(
      {required int totalCalories, required int fatConsume}) {
    return ((totalCalories * 0.3) / 9) -
        fatConsume; // Mỗi gram protein có 4 calo
  }
}

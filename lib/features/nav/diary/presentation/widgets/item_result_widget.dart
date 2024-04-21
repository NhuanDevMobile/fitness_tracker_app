import 'package:fitness_tracker_app/core/configs/app_colors.dart';
import 'package:fitness_tracker_app/core/configs/app_dimens.dart';
import 'package:fitness_tracker_app/core/ui/widgets/text/text_spand_wdiget.dart';
import 'package:fitness_tracker_app/core/ui/widgets/text/text_widget.dart';
import 'package:fitness_tracker_app/features/nav/diary/presentation/widgets/item_upgrade_pro_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:percent_indicator/circular_percent_indicator.dart';

class ItemResultDiary extends StatelessWidget {
  final int kCal;
  const ItemResultDiary({super.key, required this.kCal});

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
                        text2: "$kCal Kcal",
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
                          const TextWidget(
                            text: "0",
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
                            percent: 0.5,
                            backgroundColor: AppColors.grey,
                            progressColor: AppColors.primary,
                            center: const Column(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                TextWidget(
                                  text: "0",
                                  color: AppColors.primary,
                                  fontWeight: FontWeight.bold,
                                ),
                                TextWidget(
                                  text: "remaining",
                                  color: AppColors.grey,
                                  fontWeight: FontWeight.w600,
                                  size: AppDimens.textSize16,
                                ),
                                TextWidget(
                                  text: "2072",
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
                        value: '${calculateCarbs(kCal)}',
                        percent: 0.5,
                        remaining: '0g'),
                    const SizedBox(width: 12.0),
                    _itemNutrients(
                        title: 'Protein',
                        value: '0g',
                        percent: 0.5,
                        remaining: '0g'),
                    const SizedBox(width: 12.0),
                    _itemNutrients(
                        title: 'Fat',
                        value: '0g',
                        percent: 0.5,
                        remaining: '10g'),
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

  double calculateCarbs(int totalCalories) {
    return (totalCalories * 0.45) / 4; // Mỗi gram carbs có 4 calo
  }

// Hàm tính lượng protein từ tổng calo hàng ngày
  double calculateProtein(int totalCalories) {
    return (totalCalories * 0.25) / 4; // Mỗi gram protein có 4 calo
  }

// Hàm tính lượng fat từ tổng calo hàng ngày
  double calculateFat(int totalCalories) {
    return (totalCalories * 0.3) / 9; // Mỗi gram fat có 9 calo
  }
}

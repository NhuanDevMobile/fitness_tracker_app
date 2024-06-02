import 'package:fitness_tracker_app/core/configs/app_colors.dart';
import 'package:fitness_tracker_app/core/ui/widgets/text/text_spand_wdiget.dart';
import 'package:fitness_tracker_app/core/ui/widgets/text/text_widget.dart';
import 'package:fitness_tracker_app/core/utils/calculator_utils.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class ItemWaterWidget extends StatelessWidget {
  final double value;
  final double recommendedValue;
  final VoidCallback onTap;
  final int consumedWater;

  const ItemWaterWidget({
    super.key,
    required this.value,
    required this.recommendedValue,
    required this.onTap,
    required this.consumedWater,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 12.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const TextWidget(
            text: "water",
            fontWeight: FontWeight.w600,
            color: AppColors.black,
          ),
          const SizedBox(height: 10.0),
          Container(
            decoration: BoxDecoration(
              color: AppColors.white,
              borderRadius: const BorderRadius.all(
                Radius.circular(12),
              ),
              boxShadow: [
                BoxShadow(
                  color: Colors.grey.withOpacity(0.5), // Màu của bóng
                  spreadRadius: 1, // Bán kính bóng được lan rộng
                  blurRadius: 1, // Độ mờ của bóng
                  offset: const Offset(0, 1), // Vị trí tạo bóng (dọc, ngang)
                ),
              ],
            ),
            child: Row(
              children: [
                Container(
                  width: 10.0,
                  height: 75.0,
                  decoration: const BoxDecoration(
                    color: AppColors.blue,
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(12),
                      bottomLeft: Radius.circular(12),
                    ),
                  ),
                ),
                const SizedBox(width: 12.0),
                Expanded(
                    child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        const TextWidget(
                          text: "water",
                          color: AppColors.blue,
                          fontWeight: FontWeight.w600,
                        ),
                        const SizedBox(width: 4.0),
                        TextWidget(
                          text:
                              "${consumedWater / 1000} L (${CalculatorUtils.calculateWaterPercentage(consumedWater: consumedWater, targetWater: recommendedValue * 1000).toInt()}%)",
                          color: AppColors.black,
                          fontWeight: FontWeight.w600,
                        ),
                      ],
                    ),
                    const SizedBox(height: 4.0),
                    TextSpanWidget(
                      text1: "recomeded_util_now",
                      text2: "$recommendedValue L",
                    ),
                    const SizedBox(height: 4.0),
                    LinearProgressIndicator(
                      value: CalculatorUtils.calculateWaterPercentage(
                                  consumedWater: consumedWater,
                                  targetWater: recommendedValue * 1000)
                              .toInt() /
                          100,
                      minHeight: 10.0,
                      borderRadius: BorderRadius.circular(10),
                      backgroundColor: AppColors.grey2,
                      valueColor: const AlwaysStoppedAnimation<Color>(
                        AppColors.blue,
                      ),
                    )
                  ],
                )),
                const SizedBox(width: 12.0),
                GestureDetector(
                  onTap: onTap,
                  child: SvgPicture.asset(
                    "assets/icons/ic_add.svg",
                    height: 40.0,
                    width: 40.0,
                  ),
                ),
                const SizedBox(width: 12.0),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

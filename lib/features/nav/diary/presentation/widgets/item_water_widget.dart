import 'package:fitness_tracker_app/core/configs/app_colors.dart';
import 'package:fitness_tracker_app/core/configs/app_dimens.dart';
import 'package:fitness_tracker_app/core/ui/widgets/text/text_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class ItemWaterWidget extends StatelessWidget {
  const ItemWaterWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 12.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const TextWidget(
            text: "Water",
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
                    color: AppColors.purple,
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
                    const Row(
                      children: [
                        TextWidget(
                          text: "Water",
                          color: AppColors.purple,
                          fontWeight: FontWeight.w600,
                        ),
                        SizedBox(width: 4.0),
                        TextWidget(
                          text: "0.9L (75%)",
                          color: AppColors.black,
                          fontWeight: FontWeight.w600,
                        ),
                      ],
                    ),
                    const SizedBox(height: 4.0),
                    const TextWidget(
                      text: "2.5L",
                      color: AppColors.grey,
                      size: AppDimens.textSize14,
                      fontWeight: FontWeight.w400,
                    ),
                    const SizedBox(height: 4.0),
                    LinearProgressIndicator(
                      value: 0.75,
                      minHeight: 10.0,
                      borderRadius: BorderRadius.circular(10),
                      backgroundColor: AppColors.grey2,
                      valueColor: const AlwaysStoppedAnimation<Color>(
                        AppColors.purple,
                      ),
                    )
                  ],
                )),
                const SizedBox(width: 12.0),
                SvgPicture.asset(
                  "assets/icons/ic_add.svg",
                  height: 40.0,
                  width: 40.0,
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

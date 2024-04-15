import 'package:fitness_tracker_app/core/configs/app_colors.dart';
import 'package:fitness_tracker_app/core/configs/app_dimens.dart';
import 'package:fitness_tracker_app/core/ui/widgets/appbar/appbar_widget.dart';
import 'package:fitness_tracker_app/core/ui/widgets/images/image_network_square.dart';
import 'package:fitness_tracker_app/core/ui/widgets/text/text_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:percent_indicator/circular_percent_indicator.dart';

class FoodCartPage extends StatelessWidget {
  const FoodCartPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.white,
      appBar: const AppBarWidget(
        title: "Bua sang",
        centerTitle: true,
      ),
      body: Column(
        children: [
          _buildHeader(),
          const SizedBox(height: 12.0),
          _buildListFood(),
        ],
      ),
    );
  }

  _buildHeader() {
    return Container(
      height: 200,
      width: double.infinity,
      decoration: const BoxDecoration(
        color: AppColors.primary,
      ),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 12.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Center(
              child: CircularPercentIndicator(
                radius: 70.0,
                lineWidth: 10.0,
                percent: 0.5,
                backgroundColor: AppColors.gray,
                progressColor: AppColors.white,
                center: const Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    TextWidget(
                      text: "Đã ăn",
                      color: AppColors.white,
                      fontWeight: FontWeight.bold,
                    ),
                    TextWidget(
                      text: "2072",
                      color: AppColors.white,
                      fontWeight: FontWeight.bold,
                      size: AppDimens.textSize22,
                    ),
                    TextWidget(
                      text: "Calo",
                      color: AppColors.white,
                      fontWeight: FontWeight.w600,
                      size: AppDimens.textSize16,
                    ),
                  ],
                ),
              ),
            ),
            const TextWidget(
              text: "Bữa sáng",
              color: AppColors.white,
              size: AppDimens.textSize20,
              fontWeight: FontWeight.bold,
            ),
            const TextWidget(
              text: "Ngày 12/12/2021",
              color: AppColors.white,
              size: AppDimens.textSize14,
              fontWeight: FontWeight.w600,
            ),
          ],
        ),
      ),
    );
  }

  _buildListFood() {
    return Expanded(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 12.0),
        child: Column(
          children: [
            const Row(
              children: [
                Expanded(
                  child: TextWidget(
                    text: "Đã thêm",
                    fontWeight: FontWeight.w600,
                  ),
                ),
                TextWidget(
                  text: "2 món",
                  fontWeight: FontWeight.w400,
                  size: AppDimens.textSize14,
                )
              ],
            ),
            Expanded(
              child: ListView.builder(
                itemCount: 10,
                itemBuilder: (context, index) {
                  return ListTile(
                      leading: const ImageNetWotkSquareWidget(
                          height: 100,
                          width: 100,
                          imageUrl:
                              "https://nix-tag-images.s3.amazonaws.com/719_thumb.jpg"),
                      title: TextWidget(
                        text: "Food $index",
                        fontWeight: FontWeight.w600,
                      ),
                      subtitle: const TextWidget(
                        text: "1 qua to, 113 Calo",
                        size: AppDimens.textSize14,
                        fontWeight: FontWeight.w400,
                      ),
                      trailing: SvgPicture.asset(
                        "assets/icons/ic_delete.svg",
                        height: 24.0,
                        color: AppColors.error,
                      ));
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}

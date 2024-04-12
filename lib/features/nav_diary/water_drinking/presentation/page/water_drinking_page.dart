import 'package:fitness_tracker_app/core/configs/app_colors.dart';
import 'package:fitness_tracker_app/core/configs/app_dimens.dart';
import 'package:fitness_tracker_app/core/ui/widgets/appbar/appbar_widget.dart';
import 'package:fitness_tracker_app/core/ui/widgets/text/text_spand_wdiget.dart';
import 'package:fitness_tracker_app/core/ui/widgets/text/text_widget.dart';
import 'package:fitness_tracker_app/core/utils/calculator_utils.dart';
import 'package:fitness_tracker_app/features/nav_diary/water_drinking/presentation/controller/water_drinking_controller.dart';
import 'package:fitness_tracker_app/features/nav_diary/water_drinking/presentation/widgets/item_water_amount.dart';
import 'package:fitness_tracker_app/features/nav_diary/water_drinking/presentation/widgets/water_animated_loader.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';

class WaterDrinkingPage extends GetView<WaterDrinkingController> {
  const WaterDrinkingPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBarWidget(
        title: "drink_water",
        centerTitle: true,
        callbackLeading: () {
          controller.onTapBack();
        },
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            _buildWaterResult(),
            _buildDairyWater(),
          ],
        ),
      ),
    );
  }

  _buildDairyWater() {
    return GetBuilder<WaterDrinkingController>(
        id: "fetchWaterDiarys",
        builder: (context) {
          return Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const TextWidget(
                  text: "diary",
                  color: AppColors.black,
                  fontWeight: FontWeight.w600,
                ),
                const SizedBox(height: 12.0),
                ListView.builder(
                    physics: const NeverScrollableScrollPhysics(),
                    itemCount: controller.waterDiarys.length,
                    shrinkWrap: true,
                    itemBuilder: (context, index) {
                      return Container(
                          margin: const EdgeInsets.only(bottom: 12.0),
                          padding: const EdgeInsets.symmetric(
                            horizontal: 10.0,
                            vertical: 12.0,
                          ),
                          decoration: const BoxDecoration(
                            color: AppColors.white,
                            borderRadius: BorderRadius.all(
                              Radius.circular(10.0),
                            ),
                          ),
                          child: Row(
                            children: [
                              Expanded(
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    TextWidget(
                                      text: controller
                                          .waterDiarys[index].dateTimeDisplay
                                          .toString(),
                                      size: AppDimens.textSize14,
                                      fontWeight: FontWeight.w400,
                                    ),
                                    const SizedBox(height: 4.0),
                                    TextWidget(
                                      text:
                                          "${controller.waterDiarys[index].quantity} ml",
                                      size: AppDimens.textSize14,
                                      fontWeight: FontWeight.w600,
                                      color: AppColors.blue,
                                    ),
                                  ],
                                ),
                              ),
                              GestureDetector(
                                onTap: () {
                                  controller.handleDeleteWater(
                                      index: index,
                                      waterId:
                                          controller.waterDiarys[index].id!);
                                },
                                child: SvgPicture.asset(
                                  "assets/icons/ic_delete.svg",
                                  height: 24.0,
                                  color: AppColors.error,
                                ),
                              )
                            ],
                          ));
                    }),
              ],
            ),
          );
        });
  }

  _buildWaterResult() {
    return GetBuilder<WaterDrinkingController>(
        id: "fetchWaterResult",
        builder: (_) {
          return Container(
              margin:
                  const EdgeInsets.symmetric(horizontal: 20, vertical: 24.0),
              padding: const EdgeInsets.all(12.0),
              decoration: const BoxDecoration(
                color: AppColors.white,
                borderRadius: BorderRadius.all(
                  Radius.circular(10.0),
                ),
              ),
              child: Column(
                children: [
                  Row(
                    children: [
                      Expanded(
                        child: TextSpanWidget(
                          text1: "energy_input",
                          text2:
                              "${(controller.argument.recommendedWater * 1000).toInt()}ml",
                          textColor2: AppColors.blue,
                          fontWeight2: FontWeight.bold,
                        ),
                      ),
                      IconButton(
                          onPressed: () {},
                          icon: const Icon(
                            Icons.info_sharp,
                            color: AppColors.blue,
                          )),
                    ],
                  ),
                  const SizedBox(height: 12.0),
                  SizedBox(
                    height: 150,
                    width: 150,
                    child: LiquidCircularProgressIndicator(
                      value: CalculatorUtils.calculateWaterPercentage(
                            consumedWater: controller.consumedWater,
                            targetWater:
                                controller.argument.recommendedWater * 1000,
                          ) /
                          100, // Defaults to 0.5.
                      valueColor: AlwaysStoppedAnimation(
                        AppColors.blue.withOpacity(0.69),
                      ), // Defaults to the current Theme's accentColor.
                      backgroundColor: AppColors
                          .white, // Defaults to the current Theme's backgroundColor.
                      borderColor: AppColors.blue,
                      borderWidth: 6.0,
                      direction: Axis.vertical,
                      // The direction the liquid moves (Axis.vertical = bottom to top, Axis.horizontal = left to right). Defaults to Axis.vertical.
                      center: Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          TextWidget(
                            text: "${controller.consumedWater}",
                            size: AppDimens.textSize24,
                            fontWeight: FontWeight.bold,
                            color: AppColors.black,
                          ),
                          const SizedBox(height: 4.0),
                          TextWidget(
                            text:
                                "/${(controller.argument.recommendedWater * 1000).toInt()}ml",
                            size: AppDimens.textSize15,
                            fontWeight: FontWeight.w400,
                            color: AppColors.black,
                          ),
                        ],
                      ), //text inside it
                    ),
                  ),
                  const SizedBox(height: 12.0),
                  SizedBox(
                    height: 30.0,
                    width: double.infinity,
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        GestureDetector(
                          onTap: () => controller.onPreviousWater(),
                          child: Padding(
                            padding: const EdgeInsets.only(right: 8.0),
                            child: SvgPicture.asset(
                              "assets/icons/ic_arrow_left.svg",
                              color: AppColors.blue,
                              height: 20.0,
                            ),
                          ),
                        ),
                        Expanded(
                          child: ListView.builder(
                              controller: controller.scrollController,
                              itemCount: controller.waterAmounts.length,
                              scrollDirection: Axis.horizontal,
                              shrinkWrap: true,
                              itemBuilder: (context, index) {
                                return ItemWaterAmount(
                                  onTap: () {
                                    controller.onSelectedWater(index);
                                  },
                                  index: index,
                                  currentIndex: controller.currentIndexWater,
                                  value: controller.waterAmounts[index],
                                );
                              }),
                        ),
                        const SizedBox(width: 4.0),
                        Container(
                          padding: const EdgeInsets.symmetric(
                              horizontal: 12.0, vertical: 6.0),
                          decoration: BoxDecoration(
                            color: AppColors.blue,
                            borderRadius: BorderRadius.circular(20.0),
                          ),
                          child: const TextWidget(
                            text: "custom",
                            size: AppDimens.textSize15,
                            fontWeight: FontWeight.w600,
                            color: AppColors.white,
                          ),
                        ),
                        GestureDetector(
                          onTap: () => controller.onNextWater(),
                          child: Padding(
                            padding: const EdgeInsets.only(left: 8.0),
                            child: SvgPicture.asset(
                              "assets/icons/ic_arrow_right.svg",
                              color: AppColors.blue,
                              height: 20.0,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(height: 10.0),
                ],
              ));
        });
  }
}

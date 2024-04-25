import 'package:fitness_tracker_app/core/configs/app_colors.dart';
import 'package:fitness_tracker_app/core/configs/app_dimens.dart';
import 'package:fitness_tracker_app/core/routes/routes.dart';
import 'package:fitness_tracker_app/core/ui/widgets/appbar/appbar_widget.dart';
import 'package:fitness_tracker_app/core/ui/widgets/text/text_widget.dart';
import 'package:fitness_tracker_app/core/utils/calculator_utils.dart';
import 'package:fitness_tracker_app/features/nav_diary/activity/presentation/controller/activity_controller.dart';
import 'package:fitness_tracker_app/features/nav_diary/activity/presentation/widgets/activity_relationship_widget.dart';
import 'package:fitness_tracker_app/features/nav_diary/activity/presentation/widgets/activity_suggest_widget.dart';
import 'package:fitness_tracker_app/features/nav_diary/activity/presentation/widgets/item_activity_empty.dart';
import 'package:fitness_tracker_app/features/nav_diary/foods/presentation/widgets/item_header_food.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:percent_indicator/circular_percent_indicator.dart';

class ActivityPage extends GetView<ActivityController> {
  const ActivityPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const AppBarWidget(
        title: 'add_exercise',
        centerTitle: true,
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          _buildResult(),
          _buildHeader(),
          _buldListExercise(),
        ],
      ),
    );
  }

  _buildResult() {
    return Container(
      height: 400.0,
      width: double.infinity,
      padding: const EdgeInsets.symmetric(horizontal: 12.0, vertical: 24.0),
      color: Colors.white,
      child: Column(
        children: [
          GetBuilder<ActivityController>(
            id: "progressBar",
            builder: (logic) {
              return Row(
                children: [
                  CircularPercentIndicator(
                    radius: 26.0,
                    center: SvgPicture.asset("assets/icons/ic_fire_small.svg"),
                    lineWidth: 10.0,
                    backgroundColor: AppColors.grey,
                    progressColor: AppColors.primary,
                    percent: CalculatorUtils.phanTramTieuThu(
                            consumed: 1900,
                            target: controller.getCaloriesConsume()) /
                        100,
                  ),
                  const SizedBox(width: 10.0),
                  Expanded(
                      child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      TextWidget(
                        text:
                            "${controller.getCaloriesConsume().toStringAsFixed(2)}/1900 Calo",
                        size: AppDimens.textSize16,
                        fontWeight: FontWeight.w600,
                      ),
                      const TextWidget(
                        text: "Calo dot chay",
                        size: AppDimens.textSize14,
                        fontWeight: FontWeight.w400,
                      ),
                    ],
                  )),
                  GestureDetector(
                    onTap: () {
                      controller.goToSearchPage();
                    },
                    child: SvgPicture.asset("assets/icons/ic_add.svg"),
                  )
                ],
              );
            },
          ),
          GetBuilder<ActivityController>(
            id: "listActivityRelationship",
            builder: (logic) {
              return controller.listActivityRelationship.isEmpty
                  ? ItemActivityEmpty(
                      onTap: () {
                        Get.toNamed(Routes.searchActivity);
                      },
                    )
                  : const ActivityRelationshipWidget();
            },
          )
        ],
      ),
    );
  }

  _buildHeader() {
    return Obx(
      () => Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(12.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                ItemHeaderFood(
                  title: "suggest",
                  isSeleted: controller.currentPage.value == 0,
                  onTap: () {
                    controller.currentPage.value = 0;
                  },
                ),
                const SizedBox(width: 10.0),
                ItemHeaderFood(
                  title: "my_food",
                  isSeleted: controller.currentPage.value == 1,
                  onTap: () {
                    controller.currentPage.value = 1;
                  },
                ),
                const SizedBox(width: 10.0),
                ItemHeaderFood(
                  title: "saved",
                  isSeleted: controller.currentPage.value == 2,
                  onTap: () {
                    controller.currentPage.value = 2;
                  },
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  _buldListExercise() {
    return Obx(
      () => controller.currentPage.value == 0
          ? const ActivitySuggestWidget()
          : controller.currentPage.value == 1
              ? Container()
              : Container(),
    );
  }
}

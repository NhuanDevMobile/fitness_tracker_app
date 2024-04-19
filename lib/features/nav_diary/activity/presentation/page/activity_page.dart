import 'package:fitness_tracker_app/core/configs/app_dimens.dart';
import 'package:fitness_tracker_app/core/routes/routes.dart';
import 'package:fitness_tracker_app/core/ui/widgets/appbar/appbar_widget.dart';
import 'package:fitness_tracker_app/core/ui/widgets/text/text_widget.dart';
import 'package:fitness_tracker_app/features/nav_diary/activity/presentation/controller/activity_controller.dart';
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
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _buildResult(),
            _buildHeader(),
            _buldListExercise(),
          ],
        ),
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
          Row(
            children: [
              CircularPercentIndicator(
                radius: 26.0,
                center: SvgPicture.asset("assets/icons/ic_fire_small.svg"),
              ),
              const SizedBox(width: 10.0),
              const Expanded(
                  child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  TextWidget(
                    text: "0/0 Calo",
                    size: AppDimens.textSize16,
                    fontWeight: FontWeight.w600,
                  ),
                  TextWidget(
                    text: "Calo dot chay",
                    size: AppDimens.textSize14,
                    fontWeight: FontWeight.w400,
                  ),
                ],
              )),
              SvgPicture.asset("assets/icons/ic_add.svg")
            ],
          ),
          ItemActivityEmpty(
            onTap: () {
              Get.toNamed(Routes.searchActivity);
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

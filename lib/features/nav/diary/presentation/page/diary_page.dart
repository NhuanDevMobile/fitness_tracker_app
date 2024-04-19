import 'package:fitness_tracker_app/core/configs/app_colors.dart';
import 'package:fitness_tracker_app/core/configs/enum.dart';
import 'package:fitness_tracker_app/core/ui/calendar/custom_calendar.dart';
import 'package:fitness_tracker_app/core/ui/widgets/appbar/appbar_widget.dart';
import 'package:fitness_tracker_app/core/ui/widgets/text/text_widget.dart';
import 'package:fitness_tracker_app/core/utils/date_time.dart';
import 'package:fitness_tracker_app/features/nav/diary/presentation/controller/diary_controller.dart';
import 'package:fitness_tracker_app/features/nav/diary/presentation/widgets/item_daily_meal.dart';
import 'package:fitness_tracker_app/features/nav/diary/presentation/widgets/item_result_widget.dart';
import 'package:fitness_tracker_app/features/nav/diary/presentation/widgets/item_water_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';

class DiaryPage extends GetView<DiaryController> {
  const DiaryPage({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<DiaryController>(
      id: "fetchDate",
      builder: (logic) {
        return Scaffold(
          appBar: AppBarWidget(
            backgroundColor: AppColors.primary,
            title: DatetimeUtil.formatDateTimeFormat(controller.dateTime),
            centerTitle: true,
            titleColor: AppColors.white,
            leading: GestureDetector(
              onTap: () async {
                final result = await Get.bottomSheet(
                  CustomCalendar(
                    selectedDay: controller.dateTime,
                  ),
                  isScrollControlled: true,
                  isDismissible: true,
                  shape: const RoundedRectangleBorder(
                    borderRadius: BorderRadius.vertical(
                      top: Radius.circular(16.0),
                    ),
                  ),
                );
                if (result != null) {
                  controller.selectDate(result);
                }
              },
              child: SvgPicture.asset('assets/icons/ic_calendar.svg'),
            ),
          ),
          body: SingleChildScrollView(
              child: GetBuilder<DiaryController>(
            id: "fetchDiary",
            builder: (_) => controller.user == null
                ? const SizedBox.shrink()
                : Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      ItemResultDiary(),
                      ItemWaterWidget(
                        value: 0.5,
                        recommendedValue: controller.user!.getWater(),
                        onTap: () {
                          controller.onTapWater();
                        },
                        consumedWater: controller.consumedWater,
                      ),
                      _buildDailyMeal(),
                      _buildExercise(),
                    ],
                  ),
          )),
        );
      },
    );
  }

  _buildDailyMeal() {
    return GetBuilder<DiaryController>(
      id: "fetchRelationshipFood",
      builder: (logic) {
        return Padding(
          padding: const EdgeInsets.symmetric(horizontal: 12.0, vertical: 16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const TextWidget(
                text: "daily_meals",
                fontWeight: FontWeight.w600,
                color: AppColors.black,
              ),
              const SizedBox(height: 10.0),
              ItemDailyMeal(
                color: AppColors.primary,
                title: 'Breakfast',
                kCal: controller.user!
                    .getDailyMeal(dailyMeals: DailyMeals.breakfast),
                consumeKcal: controller.getCalories(controller.breakfasts),
                onTap: () async {
                  controller.gotoPage(
                      meals: DailyMeals.breakfast,
                      foodRelationship: controller.breakfasts);
                },
                relationshipFoods: controller.breakfasts,
              ),
              const SizedBox(height: 16.0),
              ItemDailyMeal(
                color: AppColors.secondary,
                title: 'Lunch',
                kCal:
                    controller.user!.getDailyMeal(dailyMeals: DailyMeals.lunch),
                consumeKcal: controller.getCalories(controller.lunchs),
                onTap: () async {
                  controller.gotoPage(
                      meals: DailyMeals.lunch,
                      foodRelationship: controller.lunchs);
                },
                relationshipFoods: controller.lunchs,
              ),
              const SizedBox(height: 16.0),
              ItemDailyMeal(
                color: const Color(0xFF12E5B0),
                title: 'Dinner',
                kCal: controller.user!
                    .getDailyMeal(dailyMeals: DailyMeals.dinner),
                consumeKcal: controller.getCalories(controller.dinners),
                onTap: () async {
                  controller.gotoPage(
                      meals: DailyMeals.dinner,
                      foodRelationship: controller.dinners);
                },
                relationshipFoods: controller.dinners,
              ),
              const SizedBox(height: 16.0),
              ItemDailyMeal(
                color: const Color(0xffB575E7),
                title: 'Snack',
                kCal:
                    controller.user!.getDailyMeal(dailyMeals: DailyMeals.snack),
                consumeKcal: controller.getCalories(controller.snacks),
                onTap: () async {
                  controller.gotoPage(
                      meals: DailyMeals.snack,
                      foodRelationship: controller.snacks);
                },
                relationshipFoods: controller.snacks,
              ),
            ],
          ),
        );
      },
    );
  }

  _buildExercise() {
    return GetBuilder<DiaryController>(
      id: "fetchRelationshipFood",
      builder: (logic) {
        return Padding(
          padding: const EdgeInsets.symmetric(horizontal: 12.0, vertical: 16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const TextWidget(
                text: "exercise",
                fontWeight: FontWeight.w600,
                color: AppColors.black,
              ),
              const SizedBox(height: 10.0),
              ItemDailyMeal(
                color: AppColors.error,
                title: 'Snack',
                kCal: controller.user!
                    .getDailyMeal(dailyMeals: DailyMeals.breakfast),
                consumeKcal: 0,
                onTap: () {},
                relationshipFoods: controller.snacks,
              ),
            ],
          ),
        );
      },
    );
  }
}

import 'package:fitness_tracker_app/core/configs/app_colors.dart';
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
              controller.dateTime = result;
              // controller.update(['updateTitle']);
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
                  ItemResultDiary(
                    kCal: controller.user!.getKcal(),
                  ),
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
  }

  _buildDailyMeal() {
    return const Padding(
      padding: EdgeInsets.symmetric(horizontal: 12.0, vertical: 16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          TextWidget(
            text: "Daily meals",
            fontWeight: FontWeight.w600,
            color: AppColors.black,
          ),
          SizedBox(height: 10.0),
          ItemDailyMeal(
            color: AppColors.primary,
            title: 'Breakfast',
          ),
          SizedBox(height: 16.0),
          ItemDailyMeal(
            color: AppColors.secondary,
            title: 'Lunch',
          ),
          SizedBox(height: 16.0),
          ItemDailyMeal(
            color: Color(0xFF12E5B0),
            title: 'Dinner',
          ),
          SizedBox(height: 16.0),
          ItemDailyMeal(
            color: Color(0xffB575E7),
            title: 'Snack',
          ),
        ],
      ),
    );
  }

  _buildExercise() {
    return const Padding(
      padding: EdgeInsets.symmetric(horizontal: 12.0, vertical: 16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          TextWidget(
            text: "Daily Exercise",
            fontWeight: FontWeight.w600,
            color: AppColors.black,
          ),
          SizedBox(height: 10.0),
          ItemDailyMeal(
            color: AppColors.error,
            title: 'Snack',
          ),
        ],
      ),
    );
  }
}

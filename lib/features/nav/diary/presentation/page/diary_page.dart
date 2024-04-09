import 'package:fitness_tracker_app/core/configs/app_colors.dart';
import 'package:fitness_tracker_app/core/ui/widgets/appbar/appbar_widget.dart';
import 'package:fitness_tracker_app/core/ui/widgets/text/text_widget.dart';
import 'package:fitness_tracker_app/features/nav/diary/presentation/widgets/item_daily_meal.dart';
import 'package:fitness_tracker_app/features/nav/diary/presentation/widgets/item_result_widget.dart';
import 'package:fitness_tracker_app/features/nav/diary/presentation/widgets/item_water_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class DiaryPage extends StatelessWidget {
  const DiaryPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBarWidget(
        backgroundColor: AppColors.primary,
        title: "2 May, Monday",
        centerTitle: true,
        titleColor: AppColors.white,
        leading: SvgPicture.asset('assets/icons/ic_calendar.svg'),
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const ItemResultDiary(),
            const ItemWaterWidget(),
            _buildDailyMeal(),
            _buildExercise(),
          ],
        ),
      ),
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

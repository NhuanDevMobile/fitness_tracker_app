import 'package:fitness_tracker_app/core/configs/app_colors.dart';
import 'package:fitness_tracker_app/core/configs/app_dimens.dart';
import 'package:fitness_tracker_app/core/routes/routes.dart';
import 'package:fitness_tracker_app/core/ui/widgets/appbar/appbar_widget.dart';
import 'package:fitness_tracker_app/core/ui/widgets/button/button_widget.dart';
import 'package:fitness_tracker_app/core/ui/widgets/text/text_widget.dart';
import 'package:fitness_tracker_app/features/nav_diary/water_drinking/presentation/controller/schedule_water_controller.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';

class ScheduleWaterPage extends GetView<ScheduleWaterController> {
  const ScheduleWaterPage({super.key});

  @override
  Widget build(BuildContext context) {
    Size screenSize = MediaQuery.of(context).size;
    return GetBuilder<ScheduleWaterController>(
      id: "timeSchedule",
      builder: (logic) {
        return Scaffold(
          backgroundColor: AppColors.white,
          appBar: AppBarWidget(
            title: "Lịch uống nước",
            actions: [
              controller.timeSchedule > 0
                  ? GestureDetector(
                      onTap: () {
                        // Get.toNamed(Routes.scheduleWater);
                        controller.timeSchedule = 0;
                        controller.saveTimeScheduleUseCase
                            .saveTimeSchedule(controller.timeSchedule);
                        controller.update(['timeSchedule']);
                      },
                      child: Padding(
                        padding: const EdgeInsets.only(right: 8.0),
                        child: SvgPicture.asset(
                          "assets/icons/ic_trash_schedule.svg",
                          color: AppColors.white,
                        ),
                      ),
                    )
                  : const SizedBox.shrink(),
            ],
          ),
          body: SafeArea(
            child: controller.timeSchedule > 0
                ? haveDataUi(screenSize)
                : noDataUi(),
          ),
        );
      },
    );
  }

  Widget noDataUi() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 15.0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const TextWidget(
            text:
                "Bạn hiện chưa có lịch uống nước nào Hãy bắt đầu tạo lịch nhắc nhở !",
            size: AppDimens.textSize16,
            fontWeight: FontWeight.w700,
            textAlign: TextAlign.center,
          ),
          const SizedBox(height: 15.0),
          SvgPicture.asset("assets/icons/ic_clock_group.svg"),
          const SizedBox(height: 15.0),
          ButtonWidget(
            ontap: () async {
              final result = await Get.toNamed(Routes.createScheduleWater);
              if (result != null) {
                controller.timeSchedule = result;
                controller.update(['timeSchedule']);
              }
            },
            text: "Tạo lịch ngay",
            height: 40.0,
            backgroundColor: AppColors.greenBold,
            borderRadius: 8.0,
          )
        ],
      ),
    );
  }

  Widget haveDataUi(Size screenSize) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 10.0, vertical: 15.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          switchNotiNotification(screenSize),
          const SizedBox(height: 25.0),
          const TextWidget(
            text: "Lịch uống nước hằng ngày của bạn",
            size: AppDimens.textSize16,
            fontWeight: FontWeight.bold,
          ),
          const SizedBox(height: 20.0),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              cardButton(controller.timeSchedule.toString()),
              const SizedBox(width: 8.0),
              SvgPicture.asset("assets/icons/ic_sword.svg"),
              const SizedBox(width: 8.0),
              cardButton("00"),
            ],
          ),
          const SizedBox(height: 15.0),
          SvgPicture.asset("assets/icons/ic_clock_time.svg"),
          const SizedBox(height: 15.0),
          ButtonWidget(
            ontap: () async {
              final result = await Get.toNamed(Routes.createScheduleWater);
              if (result != null) {
                controller.timeSchedule = result;
                controller.update(['timeSchedule']);
              }
            },
            text: "Đổi lịch",
            height: 40.0,
            backgroundColor: AppColors.greenBold,
            borderRadius: 8.0,
          )
        ],
      ),
    );
  }

  Widget switchNotiNotification(Size screenSize) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Container(
          width: screenSize.width - 50.0,
          height: 42.0,
          color: AppColors.white,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const TextWidget(
                text: "Thông báo",
                size: AppDimens.textSize13,
                fontWeight: FontWeight.w400,
              ),
              Obx(
                () => Transform.scale(
                  scaleX: 0.8,
                  scaleY: 0.8,
                  child: CupertinoSwitch(
                    value: controller.isNotification.value,
                    onChanged: (value) {
                      controller.isNotification.value = value;
                    },
                    activeColor: AppColors.primary,
                  ),
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }

  Widget cardButton(String time) {
    return Container(
      height: 83.0,
      width: 77.0,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(8.0),
        gradient: LinearGradient(
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
          colors: [
            AppColors.yellow1,
            AppColors.yellow2,
            AppColors.yellow3,
          ],
        ),
      ),
      child: Center(
        child: TextWidget(
          text: time,
          size: AppDimens.textSize42,
          fontWeight: FontWeight.w600,
        ),
      ),
    );
  }
}

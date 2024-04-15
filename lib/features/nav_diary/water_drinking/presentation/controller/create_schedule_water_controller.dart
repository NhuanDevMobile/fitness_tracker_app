import 'package:fitness_tracker_app/features/nav_diary/water_drinking/domain/get_time_schedule_use_case.dart';
import 'package:fitness_tracker_app/features/nav_diary/water_drinking/domain/save_time_schedule_use_case.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

class CreateScheduleWaterController extends GetxController {
  GetTimeScheduleUseCase getTimeScheduleUseCase = Get.find();
  SaveTimeScheduleUseCase saveTimeScheduleUseCase = Get.find();
  TextEditingController numberCount = TextEditingController();
  FocusNode focusNode = FocusNode();
  int timeSchedule = 0;
  @override
  void onInit() async {
    getTimeScheduleUseCase.getTimeSchedule().then((value) {
      timeSchedule = value ?? 0;
      numberCount.text = timeSchedule.toString();
    });
  }

  void saveTimeSchedule() async {
    await saveTimeScheduleUseCase.saveTimeSchedule(int.parse(numberCount.text));
    Get.back(result: int.parse(numberCount.text));
  }
}

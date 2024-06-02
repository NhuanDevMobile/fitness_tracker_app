import 'package:fitness_tracker_app/features/nav_diary/water_drinking/domain/get_time_schedule_use_case.dart';
import 'package:fitness_tracker_app/features/nav_diary/water_drinking/domain/save_time_schedule_use_case.dart';
import 'package:get/get.dart';

class ScheduleWaterController extends GetxController {
  GetTimeScheduleUseCase getTimeScheduleUseCase;
  SaveTimeScheduleUseCase saveTimeScheduleUseCase;
  RxBool isNotification = false.obs;
  int timeSchedule = 0;
  ScheduleWaterController(
      this.getTimeScheduleUseCase, this.saveTimeScheduleUseCase);

  @override
  void onInit() async {
    getTimeScheduleUseCase.getTimeSchedule().then((value) {
      timeSchedule = value ?? 0;
      update(['timeSchedule']);
    });
  }
}

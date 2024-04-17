import 'package:fitness_tracker_app/features/nav_diary/water_drinking/domain/get_time_schedule_use_case.dart';
import 'package:fitness_tracker_app/features/nav_diary/water_drinking/domain/save_time_schedule_use_case.dart';
import 'package:fitness_tracker_app/features/nav_diary/water_drinking/presentation/controller/schedule_water_controller.dart';
import 'package:get/get.dart';

class ScheduleWaterBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => SaveTimeScheduleUseCase(Get.find()));
    Get.lazyPut(() => GetTimeScheduleUseCase(Get.find()));
    Get.lazyPut(() => ScheduleWaterController(Get.find(), Get.find()));
  }
}

import 'package:fitness_tracker_app/features/nav_diary/water_drinking/presentation/controller/create_schedule_water_controller.dart';
import 'package:get/get.dart';

class CreateScheduleWaterBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => CreateScheduleWaterController());
  }
}

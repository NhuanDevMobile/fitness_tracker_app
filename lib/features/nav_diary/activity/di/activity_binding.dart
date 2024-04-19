import 'package:fitness_tracker_app/features/nav_diary/activity/presentation/controller/activity_controller.dart';
import 'package:get/get.dart';

class ActivityBindding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => ActivityController());
  }
}

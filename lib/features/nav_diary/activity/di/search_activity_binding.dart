import 'package:fitness_tracker_app/features/nav_diary/activity/presentation/controller/search_activity_controller.dart';
import 'package:get/get.dart';

class SearchActivityBindding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => SearchActivityController());
  }
}

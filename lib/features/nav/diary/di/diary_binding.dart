import 'package:fitness_tracker_app/features/nav/diary/presentation/controller/diary_controller.dart';
import 'package:get/get.dart';

class DiaryBindding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => DiaryController());
  }
}

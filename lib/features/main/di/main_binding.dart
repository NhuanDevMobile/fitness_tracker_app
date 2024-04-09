import 'package:fitness_tracker_app/features/main/presentation/controller/main_controller.dart';
import 'package:get/get.dart';

class MainBindding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => MainController());
  }
}

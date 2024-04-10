import 'package:fitness_tracker_app/features/nav/exercise/presentation/controller/exercise_detail_controller.dart';
import 'package:get/get.dart';

class ExerciseDetailBindding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => ExerciseDetailController());
  }
}

import 'package:fitness_tracker_app/features/nav/exercise/presentation/controller/exercise_controller.dart';
import 'package:get/get.dart';

class ExerciseBindding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => ExerciseController());
  }
}

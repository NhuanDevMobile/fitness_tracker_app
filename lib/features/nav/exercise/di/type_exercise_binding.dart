import 'package:fitness_tracker_app/features/nav/exercise/presentation/controller/type_exercise_controller.dart';
import 'package:get/get.dart';

class TypeExerciseBindding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => TypeExerciseController());
  }
}

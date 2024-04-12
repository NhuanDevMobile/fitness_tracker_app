import 'package:fitness_tracker_app/features/auth/user/domain/use_case/get_user_use_case.dart';
import 'package:fitness_tracker_app/features/nav/diary/presentation/controller/diary_controller.dart';
import 'package:get/get.dart';

class DiaryBindding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => GetuserUseCase(Get.find()));
    Get.lazyPut(() => DiaryController(Get.find()));
  }
}

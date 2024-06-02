import 'package:fitness_tracker_app/core/data/prefs/prefs.dart';
import 'package:fitness_tracker_app/features/auth/user/domain/use_case/save_user_use_case.dart';
import 'package:fitness_tracker_app/features/auth/user/presentation/controller/user_information_controller.dart';
import 'package:get/get.dart';

class UserInforBindding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => Prefs(), fenix: true);
    Get.lazyPut(() => SaveUserUseCase(Get.find()));
    Get.lazyPut(() => UserInforController(Get.find()));
  }
}

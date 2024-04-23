import 'package:fitness_tracker_app/core/data/prefs/prefs.dart';
import 'package:fitness_tracker_app/features/auth/user/domain/use_case/get_user_use_case.dart';
import 'package:fitness_tracker_app/features/nav/profile/presentation/controller/profile_controller.dart';
import 'package:get/get.dart';

class ProfileBindding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => Prefs(), fenix: true);
    Get.lazyPut(() => GetuserUseCase(Get.find()));
    Get.lazyPut(() => ProfileController(Get.find()));
  }
}

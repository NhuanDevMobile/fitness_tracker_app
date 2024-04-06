import 'package:fitness_tracker_app/features/auth/user/presentation/controller/user_information_controller.dart';
import 'package:get/get.dart';

class UserInforBindding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => UserInforController());
  }
}

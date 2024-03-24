import 'package:fitness_tracker_app/features/auth/login/presentation/controller/login_controller.dart';
import 'package:get/get.dart';

class LoginBindding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => LoginController());
  }
}

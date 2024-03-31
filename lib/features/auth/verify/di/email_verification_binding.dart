import 'package:fitness_tracker_app/features/auth/verify/presentation/controller/email_verification_controller.dart';
import 'package:get/get.dart';

class EmailVerificationBindding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => EmailVerificationController());
  }
}

import 'package:fitness_tracker_app/core/routes/routes.dart';
import 'package:get/get.dart';

class SplashController extends GetxController {
  RxDouble loadingProgress = 0.0.obs;
  @override
  void onInit() {
    simulateLoading();
    super.onInit();
  }

  Future<void> simulateLoading() async {
    for (int i = 0; i <= 100; i++) {
      await Future.delayed(const Duration(milliseconds: 20));
      loadingProgress.value = i / 100.0;
    }
    if (loadingProgress.value == 1.0) {
      Get.offNamed(Routes.login);
    }
  }
}

import 'package:get/get.dart';

class MainBindding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => MainBindding());
  }
}

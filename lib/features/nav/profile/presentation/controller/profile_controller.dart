import 'package:fitness_tracker_app/core/data/prefs/prefs.dart';
import 'package:get/get.dart';

class ProfileController extends GetxController {
  // final GetuserUseCase _getuserUseCase;
  // ProfileController(this._getuserUseCase);

  handleLogout() {
    Prefs().logout();
  }
}

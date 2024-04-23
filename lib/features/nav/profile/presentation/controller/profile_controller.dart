import 'package:fitness_tracker_app/core/data/prefs/prefs.dart';
import 'package:fitness_tracker_app/features/auth/user/domain/use_case/get_user_use_case.dart';
import 'package:fitness_tracker_app/features/auth/user/model/user_model.dart';
import 'package:get/get.dart';

class ProfileController extends GetxController {
  final GetuserUseCase _getuserUseCase;
  ProfileController(this._getuserUseCase);
  UserModel? user = UserModel();

  handleLogout() async {
    Prefs().logout();
  }

  @override
  void onInit() async {
    user = await _getuserUseCase.getUser();
    update(["fetchProfile"]);
    super.onInit();
  }
}

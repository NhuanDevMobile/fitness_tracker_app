import 'package:fitness_tracker_app/core/data/prefs/prefs.dart';
import 'package:fitness_tracker_app/core/routes/routes.dart';
import 'package:fitness_tracker_app/features/auth/user/domain/use_case/get_user_use_case.dart';
import 'package:fitness_tracker_app/features/auth/user/model/user_model.dart';
import 'package:get/get.dart';

class ProfileMenu {
  final String title;
  final String svgIcon;
  ProfileMenu({required this.title, required this.svgIcon});
}

class ProfileController extends GetxController {
  final GetuserUseCase _getuserUseCase;
  ProfileController(this._getuserUseCase);
  UserModel? user = UserModel();
  List<ProfileMenu> profileMenuList = [
    ProfileMenu(
        title: "training_process", svgIcon: "assets/icons/ic_logout.svg"),
    ProfileMenu(
        title: "training_process", svgIcon: "assets/icons/ic_logout.svg"),
    ProfileMenu(title: "logout", svgIcon: "assets/icons/ic_logout.svg"),
  ];

  handleLogout() async {
    Prefs().logout();
  }

  @override
  void onInit() async {
    user = await _getuserUseCase.getUser();
    update(["fetchProfile"]);
    super.onInit();
  }

  void onTapProfileMenu(int index) {
    switch (index) {
      case 0:
        handleLogout();
        Get.offAndToNamed(Routes.login);
        break;
    }
  }
}

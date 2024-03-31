import 'package:fitness_tracker_app/core/configs/enum.dart';
import 'package:fitness_tracker_app/core/data/firebase/firebae_auth/firebase_auth.dart';
import 'package:fitness_tracker_app/core/ui/dialogs/dialogs.dart';
import 'package:fitness_tracker_app/core/ui/snackbar/snackbar.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';

class LoginController extends GetxController {
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  void handleLoginWithEmail() async {
    DialogsUtils.showAlterLoading();

    final result = await FirebaseAuthentication.logIn(
      email: emailController.text,
      password: passwordController.text,
    );
    Get.back();
    if (result.status == Status.success) {
    } else {
      SnackbarUtil.show(result.exp?.message ?? "something_went_wrong");
    }
  }
}

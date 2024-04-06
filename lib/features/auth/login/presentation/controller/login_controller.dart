import 'package:firebase_auth/firebase_auth.dart';
import 'package:fitness_tracker_app/core/configs/enum.dart';
import 'package:fitness_tracker_app/core/data/firebase/firebae_auth/firebase_auth.dart';
import 'package:fitness_tracker_app/core/routes/routes.dart';
import 'package:fitness_tracker_app/core/ui/dialogs/dialogs.dart';
import 'package:fitness_tracker_app/core/ui/snackbar/snackbar.dart';
import 'package:fitness_tracker_app/core/utils/validator.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';

class LoginController extends GetxController {
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  RxBool isEyePassword = true.obs;
  RxString emailError = ''.obs;
  RxString passwordError = ''.obs;
  bool _validateEmail() {
    print("asdasdd");
    if (emailController.text.isEmpty) {
      emailError.value = "email_cannot_be_empty".tr;
      return false;
    } else if (!Validators.validateEmail(emailController.text)) {
      emailError.value = 'email_invalid';
      return false;
    } else if (passwordController.text.isEmpty) {
      passwordError.value = 'password_cannot_be_empty';
      return false;
    } else {
      passwordError.value = '';
      emailError.value = '';
      return true;
    }
  }

  void handleLoginWithEmail() async {
    if (!_validateEmail()) return;
    DialogsUtils.showAlterLoading();
    final result = await FirebaseAuthentication.logIn(
      email: emailController.text,
      password: passwordController.text,
    );
    Get.back();
    if (result.status == Status.success) {
      User? user = result.data;
      if (user != null && !user.emailVerified) {
        await FirebaseAuthentication.sendMailVerify();
        Get.offAllNamed(Routes.emailVerify);
      } else {
        Get.offAllNamed(Routes.userInfor);
      }
    } else {
      SnackbarUtil.show(result.exp?.message ?? "something_went_wrong");
    }
  }
}

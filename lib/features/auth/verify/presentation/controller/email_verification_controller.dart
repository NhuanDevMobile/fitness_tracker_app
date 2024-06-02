import 'package:fitness_tracker_app/core/configs/enum.dart';
import 'package:fitness_tracker_app/core/data/firebase/firebae_auth/firebase_auth.dart';
import 'package:fitness_tracker_app/core/ui/snackbar/snackbar.dart';
import 'package:get/get.dart';

class EmailVerificationController extends GetxController {
  resentEmail() async {
    final result = await FirebaseAuthentication.sendMailVerify();
    if (result.status == Status.success) {
      SnackbarUtil.show("resent_email_success".tr);
    } else {
      SnackbarUtil.show(result.exp?.message ?? "something_went_wrong");
    }
  }
}

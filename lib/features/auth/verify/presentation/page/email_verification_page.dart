import 'package:fitness_tracker_app/core/configs/app_colors.dart';
import 'package:fitness_tracker_app/core/routes/routes.dart';
import 'package:fitness_tracker_app/core/ui/widgets/button/button_widget.dart';
import 'package:fitness_tracker_app/core/ui/widgets/text/text_widget.dart';
import 'package:fitness_tracker_app/features/auth/register/presentation/widgets/background_register.dart';
import 'package:fitness_tracker_app/features/auth/verify/presentation/controller/email_verification_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class EmailVerificationPage extends GetView<EmailVerificationController> {
  const EmailVerificationPage({super.key});

  @override
  Widget build(BuildContext context) {
    return BackgoundRegisterWidget(
        child: Scaffold(
      backgroundColor: AppColors.transparent,
      body: SafeArea(
        child: SizedBox(
            width: double.infinity,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Image.asset(
                  "assets/images/img_verification.png",
                  height: 100.0,
                  width: 100.0,
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(
                      horizontal: 34.0, vertical: 20.0),
                  child: TextWidget(
                    text: "content_email_verification",
                    textAlign: TextAlign.center,
                    color: AppColors.black.withOpacity(0.6),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 24.0),
                  child: Row(
                    children: [
                      Expanded(
                        child: ButtonWidget(
                          ontap: () {
                            controller.resentEmail();
                          },
                          backgroundColor: AppColors.white,
                          borderColor: AppColors.primary,
                          isBorder: true,
                          text: "resend",
                          textColor: AppColors.primary,
                          width: 200.0,
                        ),
                      ),
                      const SizedBox(width: 20.0),
                      Expanded(
                        child: ButtonWidget(
                          ontap: () {
                            Get.offAllNamed(Routes.login);
                          },
                          text: "login",
                          textColor: AppColors.white,
                          width: 200.0,
                        ),
                      ),
                    ],
                  ),
                )
              ],
            )),
      ),
    ));
  }
}

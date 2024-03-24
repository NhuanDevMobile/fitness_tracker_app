import 'package:fitness_tracker_app/core/configs/app_colors.dart';
import 'package:fitness_tracker_app/core/routes/routes.dart';
import 'package:fitness_tracker_app/core/ui/widgets/button/button_widget.dart';
import 'package:fitness_tracker_app/core/ui/widgets/text/text_widget.dart';
import 'package:fitness_tracker_app/core/ui/widgets/textfield/textfield_widget.dart';
import 'package:fitness_tracker_app/features/auth/login/presentation/widgets/background_login.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class RegisterPage extends StatelessWidget {
  const RegisterPage({super.key});

  @override
  Widget build(BuildContext context) {
    return BackgoundLoginWidget(
      child: Scaffold(
        backgroundColor: AppColors.transparent,
        body: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 34.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const SizedBox(height: 100.0),
                Center(
                  child: Image.asset(
                    "assets/images/img_logo.png",
                    height: 170.0,
                    width: 170.0,
                  ),
                ),
                const Center(
                  child: TextWidget(
                    text: "FITNESS TRACKER",
                    size: 24.0,
                    fontWeight: FontWeight.bold,
                    color: AppColors.primary,
                  ),
                ),
                const SizedBox(height: 28.0),
                const TextWidget(
                  text: "Email",
                  fontWeight: FontWeight.bold,
                  color: AppColors.primary,
                ),
                const SizedBox(height: 16.0),
                const TextFieldWidget(
                  hintText: "Email",
                ),
                const SizedBox(height: 20.0),
                const TextWidget(
                  text: "password",
                  fontWeight: FontWeight.bold,
                  color: AppColors.primary,
                ),
                const SizedBox(height: 16.0),
                TextFieldWidget(
                  hintText: "password".tr,
                ),
                const SizedBox(height: 20.0),
                const TextWidget(
                  text: "confirm_password",
                  fontWeight: FontWeight.bold,
                  color: AppColors.primary,
                ),
                const SizedBox(height: 16.0),
                TextFieldWidget(
                  hintText: "confirm_password".tr,
                ),
                const SizedBox(height: 34.0),
                Center(
                  child: ButtonWidget(
                    width: 200.0,
                    ontap: () {},
                    text: "register",
                  ),
                ),
                const SizedBox(height: 34.0),
                Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const TextWidget(
                      text: "have_an_account",
                      fontWeight: FontWeight.w400,
                      color: AppColors.primary,
                    ),
                    GestureDetector(
                      onTap: () => Get.offAllNamed(Routes.login),
                      child: const TextWidget(
                        text: "login_here",
                        fontWeight: FontWeight.bold,
                        color: AppColors.primary,
                      ),
                    ),
                  ],
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}

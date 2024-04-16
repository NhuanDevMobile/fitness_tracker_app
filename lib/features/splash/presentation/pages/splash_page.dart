import 'package:fitness_tracker_app/core/configs/app_colors.dart';
import 'package:fitness_tracker_app/core/configs/app_dimens.dart';
import 'package:fitness_tracker_app/core/ui/widgets/text/text_widget.dart';
import 'package:fitness_tracker_app/features/splash/presentation/controller/splash_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SplashPage extends GetView<SplashController> {
  const SplashPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.white,
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Expanded(
              child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image.asset(
                "assets/images/img_logo.png",
                height: 150.0,
                width: 150.0,
              ),
              const TextWidget(
                text: "Fitness Tracker",
                fontWeight: FontWeight.w700,
                size: AppDimens.textSize18,
              ),
            ],
          )),
          Obx(
            () => Container(
              margin: const EdgeInsets.symmetric(horizontal: 80.0),
              height: 6.0,
              child: LinearProgressIndicator(
                color: AppColors.primary,
                backgroundColor: AppColors.gray,
                value: controller.loadingProgress.value,
                borderRadius: BorderRadius.circular(10.0),
                // You can customize the appearance of the progress indicator
              ),
            ),
          ),
          const SizedBox(height: 80.0),
        ],
      ),
    );
  }
}

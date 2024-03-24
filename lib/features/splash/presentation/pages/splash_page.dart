import 'package:fitness_tracker_app/core/configs/app_colors.dart';
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
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const Center(
            child: Text('Splash Page'),
          ),
          const SizedBox(height: 60.0),
          Obx(
            () => Container(
              margin: const EdgeInsets.symmetric(horizontal: 80.0),
              height: 6.0,
              child: LinearProgressIndicator(
                color: AppColors.primary,
                backgroundColor: AppColors.secondary,
                value: controller.loadingProgress.value,
                borderRadius: BorderRadius.circular(10.0),
                // You can customize the appearance of the progress indicator
              ),
            ),
          ),
        ],
      ),
    );
  }
}

import 'package:fitness_tracker_app/core/configs/app_colors.dart';
import 'package:fitness_tracker_app/core/ui/widgets/text/text_widget.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';
import 'package:lottie/lottie.dart';

class DialogsUtils {
  static void showAlterLoading() {
    Get.dialog(Dialog(
      backgroundColor: AppColors.white.withOpacity(0.8),
      shape: RoundedRectangleBorder(
        borderRadius:
            BorderRadius.circular(20.0), // Đặt giá trị border radius tùy chọn
      ),
      child: Container(
        height: 160,
        width: 40,
        padding: const EdgeInsets.symmetric(vertical: 10.0),
        child: Column(
          children: [
            Lottie.asset('assets/jsons/loading.json', height: 60.0),
            const SizedBox(height: 10),
            const TextWidget(
              text: "Loading....",
              fontWeight: FontWeight.w600,
            ),
            LoadingAnimationWidget.staggeredDotsWave(
              color: AppColors.primary,
              size: 40,
            ),
          ],
        ),
      ),
    ));
  }
}

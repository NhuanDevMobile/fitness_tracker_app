import 'package:fitness_tracker_app/core/configs/app_dimens.dart';
import 'package:fitness_tracker_app/core/routes/routes.dart';
import 'package:fitness_tracker_app/core/ui/widgets/button/button_widget.dart';
import 'package:fitness_tracker_app/core/ui/widgets/text/text_widget.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class MyFoodWidget extends StatelessWidget {
  const MyFoodWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Column(
        children: [
          Expanded(child: _buildFoodEmpty()),
          Padding(
            padding:
                const EdgeInsets.symmetric(horizontal: 24.0, vertical: 24.0),
            child: ButtonWidget(
              width: double.infinity,
              ontap: () {
                Get.toNamed(Routes.createFoodPage);
              },
              text: "add_food",
            ),
          )
        ],
      ),
    );
  }

  _buildFoodEmpty() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 24.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Image.asset(
            "assets/images/img_food_empty.png",
            height: 250.0,
            width: 250.0,
          ),
          const SizedBox(height: 16.0),
          const TextWidget(
            text: "no_food",
            fontWeight: FontWeight.w500,
            textAlign: TextAlign.center,
            size: AppDimens.textSize16,
          ),
        ],
      ),
    );
  }
}

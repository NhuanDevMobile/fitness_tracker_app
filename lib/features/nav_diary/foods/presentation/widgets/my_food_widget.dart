import 'package:fitness_tracker_app/core/configs/app_dimens.dart';
import 'package:fitness_tracker_app/core/routes/routes.dart';
import 'package:fitness_tracker_app/core/ui/widgets/button/button_widget.dart';
import 'package:fitness_tracker_app/core/ui/widgets/text/text_widget.dart';
import 'package:fitness_tracker_app/features/nav_diary/foods/presentation/controller/food_controller.dart';
import 'package:fitness_tracker_app/features/nav_diary/foods/presentation/widgets/item_my_food.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class MyFoodWidget extends GetWidget<FoodController> {
  const MyFoodWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Column(
        children: [
          GetBuilder<FoodController>(
            id: "fetchFoods",
            builder: (logic) {
              return Expanded(
                  child: controller.myFoods.isEmpty
                      ? _buildFoodEmpty()
                      : _buildMyFood());
            },
          ),
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

  _buildMyFood() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 12.0),
      child: ListView.builder(
        shrinkWrap: true,
        itemCount: controller.myFoods.length,
        itemBuilder: (context, index) {
          return ItemMyFood(
            item: controller.myFoods[index],
            onTap: () {
              // Get.toNamed(
              //   Routes.foodDetail,
              //   arguments: controller.foods[index],
              // );
            },
            onTapAdd: () {},
          );
        },
      ),
    );
  }
}

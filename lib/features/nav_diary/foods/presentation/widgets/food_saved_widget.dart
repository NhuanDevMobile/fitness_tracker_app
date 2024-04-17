import 'package:fitness_tracker_app/core/configs/app_colors.dart';
import 'package:fitness_tracker_app/features/nav_diary/foods/presentation/controller/food_controller.dart';
import 'package:fitness_tracker_app/features/nav_diary/foods/presentation/widgets/item_add_food_to_cart.dart';
import 'package:fitness_tracker_app/features/nav_diary/foods/presentation/widgets/item_food.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class FoodSavedWidget extends GetWidget<FoodController> {
  const FoodSavedWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 12.0),
        child: GetBuilder<FoodController>(
            id: 'fetchFoods',
            builder: (_) {
              return ListView.builder(
                shrinkWrap: true,
                itemCount: controller.savedFoods.length,
                itemBuilder: (context, index) {
                  return ItemFood(
                    item: controller.savedFoods[index].food!,
                    onTap: () {
                      controller
                          .onTapDetailFood(controller.savedFoods[index].food!);
                    },
                    onTapAdd: () {
                      Get.bottomSheet(
                        ItemAddFoodToCart(
                          onTapAdd: () {},
                        ),
                        backgroundColor: AppColors.transparent,
                        shape: const RoundedRectangleBorder(
                          borderRadius: BorderRadius.only(
                            topLeft: Radius.circular(20.0),
                            topRight: Radius.circular(20.0),
                          ),
                        ),
                      );
                    },
                  );
                },
              );
            }),
      ),
    );
  }
}

import 'package:fitness_tracker_app/core/configs/app_colors.dart';
import 'package:fitness_tracker_app/core/data/firebase/firestore_database/firestore_user_relationship_food.dart';
import 'package:fitness_tracker_app/core/routes/routes.dart';
import 'package:fitness_tracker_app/features/nav_diary/foods/model/user_relationship_food_model.dart';
import 'package:fitness_tracker_app/features/nav_diary/foods/presentation/controller/food_controller.dart';
import 'package:fitness_tracker_app/features/nav_diary/foods/presentation/widgets/item_add_food_to_cart.dart';
import 'package:fitness_tracker_app/features/nav_diary/foods/presentation/widgets/item_food.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class FoodSuggestWidget extends GetWidget<FoodController> {
  const FoodSuggestWidget({super.key});

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
                itemCount: controller.foods.length,
                itemBuilder: (context, index) {
                  return ItemFood(
                    item: controller.foods[index],
                    onTap: () {
                      Get.toNamed(
                        Routes.foodDetail,
                        arguments: controller.foods[index],
                      );
                    },
                    onTapAdd: () {
                      Get.bottomSheet(
                        ItemAddFoodToCart(
                          onTapAdd: () {
                            print("object");
                            FirestoreUserRelationshipFood.create(
                                userRelationshipFoodModel:
                                    UserRelationshipFoodModel(),
                                userId: "userId");
                          },
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

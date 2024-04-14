import 'package:fitness_tracker_app/core/configs/app_colors.dart';
import 'package:fitness_tracker_app/core/configs/app_dimens.dart';
import 'package:fitness_tracker_app/core/ui/widgets/appbar/appbar_widget.dart';
import 'package:fitness_tracker_app/core/ui/widgets/text/text_widget.dart';
import 'package:fitness_tracker_app/features/banner/banner_admod.dart';
import 'package:fitness_tracker_app/features/nav_diary/foods/presentation/controller/food_detail_controller.dart';
import 'package:fitness_tracker_app/features/nav_diary/foods/presentation/widgets/item_nutrition_value.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class FoodDetailPage extends GetView<FoodDetailController> {
  const FoodDetailPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.white,
      appBar: AppBarWidget(
        centerTitle: true,
        title: controller.food.foodName ?? "",
        actions: [
          IconButton(onPressed: () {}, icon: const Icon(Icons.favorite_border))
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Image.network(controller.food.photo!.highres ?? ""),
            const SizedBox(height: 12.0),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 12.0),
              child: TextWidget(
                text: controller.food.foodName ?? "",
                size: AppDimens.textSize20,
                fontWeight: FontWeight.w600,
              ),
            ),
            const SizedBox(height: 12.0),
            const BannerAdMobDisplay(),
            _buildNutritionValue(),
            _buildNutritionInfor(),
          ],
        ),
      ),
    );
  }

  _buildNutritionValue() {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.symmetric(horizontal: 12.0, vertical: 12.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          TextWidget(
            text: "nutrition_value".tr,
            size: AppDimens.textSize16,
            fontWeight: FontWeight.w600,
          ),
          const SizedBox(height: 12.0),
          Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              ItemNutritionValue(
                title: "Calories".tr,
                value: controller.food.nfCalories.toString(),
              ),
              ItemNutritionValue(
                title: "Protein".tr,
                value: controller.food.nfProtein.toString(),
              ),
              ItemNutritionValue(
                title: "Fat".tr,
                value: controller.food.nfTotalFat.toString(),
              ),
              ItemNutritionValue(
                title: "Carbs".tr,
                value: controller.food.nfTotalCarbohydrate.toString(),
              ),
            ],
          ),
        ],
      ),
    );
  }

  _buildNutritionInfor() {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.symmetric(horizontal: 12.0, vertical: 12.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          TextWidget(
            text: "nutrition_infor".tr,
            size: AppDimens.textSize16,
            fontWeight: FontWeight.w600,
          ),
          GetBuilder<FoodDetailController>(
              id: "fetch_nutritions",
              builder: (_) {
                return ListView.builder(
                    physics: const NeverScrollableScrollPhysics(),
                    itemCount: controller.food.fullNutrients!.length,
                    shrinkWrap: true,
                    itemBuilder: (context, index) {
                      return Row(
                        children: [
                          Expanded(
                            child: TextWidget(
                              text: controller.getNameNutrition(controller
                                  .food.fullNutrients![index].attrId!),
                            ),
                          ),
                          TextWidget(
                              text: controller.food.fullNutrients![index].value
                                  .toString()),
                        ],
                      );
                    });
              })
        ],
      ),
    );
  }
}

import 'package:fitness_tracker_app/core/configs/app_colors.dart';
import 'package:fitness_tracker_app/core/configs/app_dimens.dart';
import 'package:fitness_tracker_app/core/ui/widgets/appbar/appbar_widget.dart';
import 'package:fitness_tracker_app/core/ui/widgets/images/image_network_square.dart';
import 'package:fitness_tracker_app/core/ui/widgets/text/text_widget.dart';
import 'package:fitness_tracker_app/features/banner/banner_admod.dart';
import 'package:fitness_tracker_app/features/nav_diary/foods/presentation/controller/food_detail_controller.dart';
import 'package:fitness_tracker_app/features/nav_diary/foods/presentation/widgets/item_nutrition_value.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
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
          Padding(
            padding: const EdgeInsets.only(right: 10.0),
            child: SvgPicture.asset("assets/icons/ic_bookmark.svg"),
          )
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            ImageNetWotkSquareWidget(
              height: 200.0,
              width: double.infinity,
              imageUrl: controller.food.photo!.highres ?? "",
              borderRadius: 0,
            ),
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
          const Divider(),
          Row(
            children: [
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    TextWidget(
                      text: "nutrition_value".tr,
                      size: AppDimens.textSize16,
                      fontWeight: FontWeight.w600,
                    ),
                    TextWidget(
                      text: "energy_and_nutritional_ratio_of_food".tr,
                      size: AppDimens.textSize14,
                      fontWeight: FontWeight.w400,
                    ),
                  ],
                ),
              ),
              IconButton(
                  onPressed: () {},
                  icon: const Icon(
                    Icons.info_sharp,
                    color: AppColors.primary,
                  )),
            ],
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
          const SizedBox(height: 12.0),
          TextWidget(
            text:
                "* Giá trị dinh dưỡng có trong ${controller.food.servingQty}  ${controller.food.servingUnit}"
                    .tr,
            size: AppDimens.textSize14,
            fontWeight: FontWeight.w400,
            color: AppColors.error,
          ),
        ],
      ),
    );
  }

  _buildNutritionInfor() {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.symmetric(horizontal: 12.0),
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
                      return controller.food.fullNutrients![index].value != 0
                          ? Container(
                              margin: const EdgeInsets.only(top: 8.0),
                              padding: const EdgeInsets.only(bottom: 8.0),
                              decoration: const BoxDecoration(
                                border: Border(
                                  bottom: BorderSide(
                                    color: AppColors.grey,
                                    width: 0.2,
                                  ),
                                ),
                              ),
                              child: Row(
                                children: [
                                  Expanded(
                                    child: TextWidget(
                                      text: controller.getNameNutrition(
                                          controller.food.fullNutrients![index]
                                              .attrId!),
                                      size: AppDimens.textSize16,
                                    ),
                                  ),
                                  TextWidget(
                                    text: controller
                                        .food.fullNutrients![index].value
                                        .toString(),
                                    size: AppDimens.textSize16,
                                  ),
                                ],
                              ),
                            )
                          : const SizedBox.shrink();
                    });
              })
        ],
      ),
    );
  }
}

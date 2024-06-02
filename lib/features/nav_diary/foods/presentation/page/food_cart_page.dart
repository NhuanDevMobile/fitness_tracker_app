import 'package:fitness_tracker_app/core/configs/app_colors.dart';
import 'package:fitness_tracker_app/core/configs/app_dimens.dart';
import 'package:fitness_tracker_app/core/ui/widgets/appbar/appbar_widget.dart';
import 'package:fitness_tracker_app/core/ui/widgets/images/image_network_square.dart';
import 'package:fitness_tracker_app/core/ui/widgets/text/text_widget.dart';
import 'package:fitness_tracker_app/core/utils/date_time.dart';
import 'package:fitness_tracker_app/features/nav_diary/foods/model/user_relationship_food_model.dart';
import 'package:fitness_tracker_app/features/nav_diary/foods/presentation/controller/food_cart_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:percent_indicator/circular_percent_indicator.dart';

class FoodCartPage extends GetView<FoodCartController> {
  const FoodCartPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.white,
      appBar: AppBarWidget(
        title: controller.titleAppBar(),
        centerTitle: true,
      ),
      body: GetBuilder<FoodCartController>(
        id: "foodCart",
        builder: (logic) {
          return Column(
            children: [
              _buildHeader(),
              const SizedBox(height: 12.0),
              _buildListFood(),
            ],
          );
        },
      ),
    );
  }

  _buildHeader() {
    return Container(
      height: 200,
      width: double.infinity,
      decoration: const BoxDecoration(
        color: AppColors.primary,
      ),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 12.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Center(
              child: CircularPercentIndicator(
                radius: 70.0,
                lineWidth: 10.0,
                percent: 0.5,
                backgroundColor: AppColors.gray,
                progressColor: AppColors.white,
                center: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const TextWidget(
                      text: "Đã ăn",
                      color: AppColors.white,
                      fontWeight: FontWeight.bold,
                    ),
                    TextWidget(
                      text: controller.getCalories(),
                      color: AppColors.white,
                      fontWeight: FontWeight.bold,
                      size: AppDimens.textSize22,
                    ),
                    const TextWidget(
                      text: "Calo",
                      color: AppColors.white,
                      fontWeight: FontWeight.w600,
                      size: AppDimens.textSize16,
                    ),
                  ],
                ),
              ),
            ),
            TextWidget(
              text: controller.titleAppBar(),
              color: AppColors.white,
              size: AppDimens.textSize20,
              fontWeight: FontWeight.bold,
            ),
            TextWidget(
              text: DatetimeUtil.formatCustom(controller.argument.dateTime),
              color: AppColors.white,
              size: AppDimens.textSize14,
              fontWeight: FontWeight.w600,
            ),
          ],
        ),
      ),
    );
  }

  _buildListFood() {
    return Expanded(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 12.0),
        child: Column(
          children: [
            Row(
              children: [
                const Expanded(
                  child: TextWidget(
                    text: "Đã thêm",
                    fontWeight: FontWeight.w600,
                  ),
                ),
                TextWidget(
                  text: "${controller.listFoodRelationship.length} món",
                  fontWeight: FontWeight.w400,
                  size: AppDimens.textSize14,
                )
              ],
            ),
            Expanded(
              child: ListView.builder(
                itemCount: controller.listFoodRelationship.length,
                itemBuilder: (context, index) {
                  return itemFoodCart(
                      relationshipFood: controller.listFoodRelationship[index]);
                },
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget itemFoodCart({required UserRelationshipFoodModel relationshipFood}) {
    return ListTile(
        leading: ImageNetWotkSquareWidget(
            height: 100,
            width: 100,
            imageUrl: relationshipFood.photoUrl ??
                "https://nix-tag-images.s3.amazonaws.com/719_thumb.jpg"),
        title: TextWidget(
          text: relationshipFood.foodName ?? "",
          fontWeight: FontWeight.w600,
        ),
        subtitle: TextWidget(
          text: relationshipFood.getDescriptionFood(),
          size: AppDimens.textSize14,
          fontWeight: FontWeight.w400,
        ),
        trailing: GestureDetector(
          onTap: () {
            controller.deleteItem(relationshipFood);
          },
          child: SvgPicture.asset(
            "assets/icons/ic_delete.svg",
            height: 24.0,
            color: AppColors.error,
          ),
        ));
  }
}

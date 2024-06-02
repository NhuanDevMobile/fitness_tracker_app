import 'package:fitness_tracker_app/core/configs/app_colors.dart';
import 'package:fitness_tracker_app/core/configs/app_dimens.dart';
import 'package:fitness_tracker_app/core/routes/routes.dart';
import 'package:fitness_tracker_app/core/ui/widgets/appbar/appbar_widget.dart';
import 'package:fitness_tracker_app/core/ui/widgets/text/text_widget.dart';
import 'package:fitness_tracker_app/core/ui/widgets/textfield/textfield_widget.dart';
import 'package:fitness_tracker_app/features/nav_diary/foods/presentation/controller/food_controller.dart';
import 'package:fitness_tracker_app/features/nav_diary/foods/presentation/widgets/food_saved_widget.dart';
import 'package:fitness_tracker_app/features/nav_diary/foods/presentation/widgets/food_suggest_widget.dart';
import 'package:fitness_tracker_app/features/nav_diary/foods/presentation/widgets/item_header_food.dart';
import 'package:fitness_tracker_app/features/nav_diary/foods/presentation/widgets/my_food_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';

class FoodPage extends GetView<FoodController> {
  const FoodPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBarWidget(
        title: controller.titleAppBar(),
        centerTitle: true,
        actions: [
          _buildIconRight(),
        ],
      ),
      body: GetBuilder<FoodController>(
        id: "fetchFoods",
        builder: (_) => Column(
          children: [
            _buildSearch(),
            _buildHeaderFood(),
            _buldListFood(),
          ],
        ),
      ),
    );
  }

  _buildSearch() {
    return Padding(
      padding: const EdgeInsets.all(12.0),
      child: TextFieldWidget(
        hintText: "search_food".tr,
        borderRadius: 20.0,
        backgroundColor: AppColors.white,
        prefixIcon: IconButton(
          icon: const Icon(Icons.search),
          onPressed: () {},
        ),
      ),
    );
  }

  _buildIconRight() {
    return GestureDetector(
      onTap: () async {
        final result =
            await Get.toNamed(Routes.foodCart, arguments: controller.argument);
        controller.update(['listFoodRelationship']);
      },
      child: Padding(
        padding: const EdgeInsets.only(right: 10.0, bottom: 4.0),
        child: SizedBox(
          height: 50.0,
          width: 50.0,
          child: Stack(
            children: [
              Container(
                padding: const EdgeInsets.all(6.0),
                decoration: const BoxDecoration(
                    color: AppColors.white, shape: BoxShape.circle),
                child: SvgPicture.asset(
                  "assets/icons/ic_cart_food.svg",
                  height: 24.0,
                  width: 24.0,
                ),
              ),
              Positioned(
                right: 0.0,
                top: 0.0,
                child: Container(
                  height: 20.0,
                  width: 20.0,
                  decoration: const BoxDecoration(
                    color: AppColors.secondary,
                    shape: BoxShape.circle,
                  ),
                  child: Center(
                      child: GetBuilder<FoodController>(
                    id: "listFoodRelationship",
                    builder: (logic) {
                      return TextWidget(
                        text: controller.listFoodRelationship.isNotEmpty
                            ? controller.listFoodRelationship.length.toString()
                            : "0",
                        size: AppDimens.textSize12,
                        color: AppColors.white,
                        fontWeight: FontWeight.w500,
                      );
                    },
                  )),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }

  _buildHeaderFood() {
    return Obx(
      () => Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(12.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                ItemHeaderFood(
                  title: "suggest",
                  isSeleted: controller.currentPage.value == 0,
                  onTap: () {
                    controller.currentPage.value = 0;
                  },
                ),
                const SizedBox(width: 10.0),
                ItemHeaderFood(
                  title: "my_food",
                  isSeleted: controller.currentPage.value == 1,
                  onTap: () {
                    controller.currentPage.value = 1;
                  },
                ),
                const SizedBox(width: 10.0),
                ItemHeaderFood(
                  title: "saved",
                  isSeleted: controller.currentPage.value == 2,
                  onTap: () {
                    controller.currentPage.value = 2;
                  },
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  _buldListFood() {
    return Obx(() => controller.currentPage.value == 0
        ? const FoodSuggestWidget()
        : controller.currentPage.value == 1
            ? const MyFoodWidget()
            : const FoodSavedWidget());
  }
}

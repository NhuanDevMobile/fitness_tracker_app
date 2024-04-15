import 'package:fitness_tracker_app/core/configs/app_colors.dart';
import 'package:fitness_tracker_app/core/ui/widgets/appbar/appbar_widget.dart';
import 'package:fitness_tracker_app/core/ui/widgets/textfield/textfield_widget.dart';
import 'package:fitness_tracker_app/features/nav_diary/foods/presentation/controller/food_controller.dart';
import 'package:fitness_tracker_app/features/nav_diary/foods/presentation/widgets/food_suggest_widget.dart';
import 'package:fitness_tracker_app/features/nav_diary/foods/presentation/widgets/item_header_food.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class FoodPage extends GetView<FoodController> {
  const FoodPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBarWidget(
        title: controller.titleAppBar(),
        centerTitle: true,
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
                  title: "favourite",
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
            ? Container()
            : Container());
  }
}

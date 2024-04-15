import 'package:fitness_tracker_app/core/configs/app_colors.dart';
import 'package:fitness_tracker_app/core/routes/routes.dart';
import 'package:fitness_tracker_app/core/ui/widgets/appbar/appbar_widget.dart';
import 'package:fitness_tracker_app/core/ui/widgets/textfield/textfield_widget.dart';
import 'package:fitness_tracker_app/features/nav_diary/foods/presentation/controller/food_controller.dart';
import 'package:fitness_tracker_app/features/nav_diary/foods/presentation/widgets/item_food.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class FoodPage extends GetView<FoodController> {
  const FoodPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const AppBarWidget(),
      body: GetBuilder<FoodController>(
        id: "fetchFoods",
        builder: (_) => Column(
          children: [
            _buildSearch(),
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

  _buldListFood() {
    return Expanded(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 12.0),
        child: ListView.builder(
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
              onTapAdd: () {},
            );
          },
        ),
      ),
    );
  }
}

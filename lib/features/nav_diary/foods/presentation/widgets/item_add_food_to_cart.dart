import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:fitness_tracker_app/core/configs/app_colors.dart';
import 'package:fitness_tracker_app/core/ui/widgets/button/elevated_button_widget.dart';
import 'package:fitness_tracker_app/core/ui/widgets/text/text_widget.dart';
import 'package:fitness_tracker_app/core/ui/widgets/textfield/textfield_widget.dart';
import 'package:fitness_tracker_app/features/nav_diary/foods/model/food_model.dart';
import 'package:fitness_tracker_app/features/nav_diary/foods/presentation/controller/item_add_to_cart_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ItemAddFoodToCart extends StatelessWidget {
  final VoidCallback onTapAdd;
  final ItemAddFoodToCartController controller;
  const ItemAddFoodToCart(
      {super.key, required this.onTapAdd, required this.controller});

  @override
  Widget build(BuildContext context) {
    List<String> languages = ["cup", "g", "tsp", "tsps"];
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        ElevatedButtonWidget(
          ontap: onTapAdd,
          icon: "assets/icons/ic_control_plus.svg",
          text: "Ghi ngay",
          width: 140,
          height: 40.0,
        ),
        const SizedBox(
          height: 10.0,
        ),
        Container(
          decoration: const BoxDecoration(color: AppColors.white),
          child: SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.all(12.0),
              child: Column(
                children: [
                  const SizedBox(height: 12.0),
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const SizedBox(
                        width: 60,
                        child: TextFieldWidget(
                          height: 50.0,
                          backgroundColor: AppColors.white,
                          keyboardType: TextInputType.number,
                        ),
                      ),
                      const SizedBox(width: 10.0),
                      GetBuilder<ItemAddFoodToCartController>(
                        id: "food",
                        builder: (_) {
                          return controller.foodModel != null
                              ? Expanded(
                                  child: DropdownButtonFormField2<AltMeasure>(
                                    value: controller.selectedAltMeasure,
                                    items: controller.foodModel!.altMeasures!
                                        .map((item) =>
                                            DropdownMenuItem<AltMeasure>(
                                              value: item,
                                              child: Text(
                                                item.measure ?? "",
                                                style: const TextStyle(
                                                  fontSize: 14,
                                                ),
                                              ),
                                            ))
                                        .toList(),
                                    onChanged: (value) {
                                      controller.selectedAltMeasure = value;
                                    },
                                    decoration: InputDecoration(
                                      contentPadding:
                                          const EdgeInsets.symmetric(
                                              vertical: 4),
                                      label:
                                          const TextWidget(text: "Chọn đơn vị"),
                                      border: OutlineInputBorder(
                                        borderRadius: BorderRadius.circular(10),
                                      ),
                                      enabledBorder: OutlineInputBorder(
                                        borderSide: const BorderSide(
                                            width: 1, color: AppColors.primary),
                                        borderRadius: BorderRadius.circular(10),
                                      ),
                                      focusedBorder: OutlineInputBorder(
                                        borderSide: const BorderSide(
                                            width: 1, color: AppColors.primary),
                                        borderRadius: BorderRadius.circular(10),
                                      ),
                                    ),
                                  ),
                                )
                              : const SizedBox.shrink();
                        },
                      ),
                      const SizedBox(width: 10.0),
                      const Center(
                        child: TextWidget(
                          text: "213 Kcal",
                          color: AppColors.primary,
                          fontWeight: FontWeight.bold,
                        ),
                      )
                    ],
                  ),
                  const SizedBox(height: 12.0),
                ],
              ),
            ),
          ),
        ),
      ],
    );
  }
}

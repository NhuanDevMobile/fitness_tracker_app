import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:fitness_tracker_app/core/configs/app_colors.dart';
import 'package:fitness_tracker_app/core/configs/app_dimens.dart';
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
          ontap: controller.onSave,
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
                      SizedBox(
                        width: 60,
                        child: TextFieldWidget(
                          height: 50.0,
                          backgroundColor: AppColors.white,
                          keyboardType: TextInputType.number,
                          controller: controller.qtyController,
                          onChanged: (value) {
                            controller
                                .changeValue(controller.qtyController.text);
                          },
                        ),
                      ),
                      const SizedBox(width: 10.0),
                      GetBuilder<ItemAddFoodToCartController>(
                        id: "food",
                        builder: (_) {
                          return controller.foodModel != null
                              ? Expanded(
                                  child: DropdownButtonFormField2<AltMeasure>(
                                    isExpanded: true,
                                    value: controller.selectedAltMeasure,
                                    items: controller.foodModel!.altMeasures!
                                        .map((item) =>
                                            DropdownMenuItem<AltMeasure>(
                                              value: item,
                                              child: TextWidget(
                                                text: item.measure ?? "",
                                                size: AppDimens.textSize14,
                                                maxLines: 1,
                                              ),
                                            ))
                                        .toList(),
                                    onChanged: (value) {
                                      controller.onSelectedItem(value);
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
                              : const Expanded(child: SizedBox.shrink());
                        },
                      ),
                      const SizedBox(width: 10.0),
                      Obx(() {
                        return SizedBox(
                          width: 90.0,
                          child: Center(
                            child: TextWidget(
                              text: "${controller.kCal.value}kcal",
                              color: AppColors.primary,
                              fontWeight: FontWeight.bold,
                              maxLines: 1,
                            ),
                          ),
                        );
                      })
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

import 'package:fitness_tracker_app/core/configs/app_colors.dart';
import 'package:fitness_tracker_app/core/configs/app_dimens.dart';
import 'package:fitness_tracker_app/core/ui/widgets/text/text_widget.dart';
import 'package:fitness_tracker_app/features/nav_diary/foods/model/food_model.dart';
import 'package:flutter/material.dart';

class ItemFood extends StatelessWidget {
  final FoodModel item;
  final VoidCallback onTap;
  final VoidCallback onTapAdd;
  const ItemFood(
      {super.key,
      required this.item,
      required this.onTap,
      required this.onTapAdd});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        margin: const EdgeInsets.only(bottom: 10.0),
        padding: const EdgeInsets.symmetric(horizontal: 12.0, vertical: 4.0),
        decoration: const BoxDecoration(
          color: AppColors.white,
          borderRadius: BorderRadius.all(
            Radius.circular(10.0),
          ),
        ),
        child: Row(children: [
          SizedBox(
            height: 80.0,
            width: 80.0,
            child: Image.network(item.photo!.thumb ?? ""),
          ),
          const SizedBox(width: 10.0),
          Expanded(
              child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              TextWidget(
                text: item.foodName ?? "",
                fontWeight: FontWeight.w600,
              ),
              TextWidget(
                text: item.descriptionFood(),
                color: AppColors.grey,
                fontWeight: FontWeight.w400,
                size: AppDimens.textSize14,
                fontStyle: FontStyle.italic,
              ),
            ],
          )),
          IconButton(onPressed: onTapAdd, icon: const Icon(Icons.add))
        ]),
      ),
    );
  }
}

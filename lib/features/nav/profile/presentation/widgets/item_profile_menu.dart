import 'package:fitness_tracker_app/core/configs/app_colors.dart';
import 'package:fitness_tracker_app/core/ui/widgets/text/text_widget.dart';
import 'package:fitness_tracker_app/features/nav/profile/presentation/controller/profile_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class ItemProfileMenu extends StatelessWidget {
  final ProfileMenu item;
  final VoidCallback onTap;
  final int index;
  const ItemProfileMenu(
      {super.key,
      required this.item,
      required this.index,
      required this.onTap});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        margin: const EdgeInsets.only(top: 10.0),
        padding: const EdgeInsets.symmetric(horizontal: 30.0, vertical: 20.0),
        decoration: const BoxDecoration(
          color: AppColors.white,
          borderRadius: BorderRadius.all(
            Radius.circular(10.0),
          ),
        ),
        child: Row(
          children: [
            SvgPicture.asset(
              "assets/icons/ic_logout.svg",
              color: AppColors.red,
            ),
            const SizedBox(width: 14.0),
            Expanded(
              child: TextWidget(
                text: item.title,
                color: index == 2 ? AppColors.red : AppColors.black,
              ),
            ),
            SvgPicture.asset("assets/icons/ic_next.svg")
          ],
        ),
      ),
    );
  }
}

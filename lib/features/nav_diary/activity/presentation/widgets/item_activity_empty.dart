import 'package:fitness_tracker_app/core/configs/app_colors.dart';
import 'package:fitness_tracker_app/core/configs/app_dimens.dart';
import 'package:fitness_tracker_app/core/ui/widgets/button/button_widget.dart';
import 'package:fitness_tracker_app/core/ui/widgets/text/text_widget.dart';
import 'package:flutter/widgets.dart';

class ItemActivityEmpty extends StatelessWidget {
  final VoidCallback onTap;
  const ItemActivityEmpty({super.key, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return Container(
      color: AppColors.white,
      child: Column(
        children: [
          const SizedBox(height: 10.0),
          Image.asset(
            "assets/images/img_exercise_empty.png",
            height: 100.0,
            width: 100.0,
          ),
          const SizedBox(height: 10.0),
          const TextWidget(
            text:
                "Đốt cháy Calo giúp bạn thon gọn,\n khoẻ mạnh hơn và giảm cân hiệu quả hơn.",
            textAlign: TextAlign.center,
            size: AppDimens.textSize16,
            fontWeight: FontWeight.w400,
          ),
          const SizedBox(height: 20.0),
          ButtonWidget(
            ontap: onTap,
            text: "add_exercise",
            height: 40.0,
            width: 200.0,
          )
        ],
      ),
    );
  }
}

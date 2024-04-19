import 'package:fitness_tracker_app/core/configs/app_colors.dart';
import 'package:fitness_tracker_app/core/ui/widgets/button/elevated_button_widget.dart';
import 'package:fitness_tracker_app/core/ui/widgets/text/text_widget.dart';
import 'package:fitness_tracker_app/core/ui/widgets/textfield/textfield_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class AddActivityBottomSheet extends StatelessWidget {
  final VoidCallback onTapAdd;
  const AddActivityBottomSheet({super.key, required this.onTapAdd});

  @override
  Widget build(BuildContext context) {
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
          height: 300.0,
          width: double.infinity,
          color: AppColors.white,
          child: Padding(
            padding: const EdgeInsets.all(12.0),
            child: Column(
              children: [
                const SizedBox(height: 10.0),
                Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      height: 60.0,
                      width: 60.0,
                      decoration: const BoxDecoration(
                        color: AppColors.grey,
                        borderRadius: BorderRadius.all(
                          Radius.circular(10.0),
                        ),
                      ),
                    ),
                    const SizedBox(width: 10.0),
                    const Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          TextWidget(
                              text: "Bài tập 1",
                              size: 16.0,
                              fontWeight: FontWeight.w400),
                          SizedBox(height: 5.0),
                          TextWidget(
                              text: "50 Calo",
                              size: 16.0,
                              fontWeight: FontWeight.w600)
                        ],
                      ),
                    ),
                    SvgPicture.asset("assets/icons/ic_bookmark.svg")
                  ],
                ),
                const SizedBox(height: 30.0),
                const TextFieldWidget(
                  backgroundColor: AppColors.white,
                  labelText: "Thời gian",
                ),
                const SizedBox(height: 20.0),
                const TextFieldWidget(
                  backgroundColor: AppColors.white,
                  labelText: "Năng lượng tiêu hao",
                ),
              ],
            ),
          ),
        )
      ],
    );
  }
}

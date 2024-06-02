import 'package:fitness_tracker_app/core/configs/app_colors.dart';
import 'package:fitness_tracker_app/core/configs/app_dimens.dart';
import 'package:fitness_tracker_app/core/ui/widgets/text/text_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

// ignore: must_be_immutable
class NumberPickerWidget extends StatefulWidget {
  final double? height;
  final String title;
  final int maxNumber;
  late int number;
  Function(int) onChangeNumber;
  NumberPickerWidget({
    super.key,
    this.height = 180.0,
    required this.title,
    required this.maxNumber,
    required this.number,
    required this.onChangeNumber,
  });

  @override
  State<NumberPickerWidget> createState() => _NumberPickerWidgetState();
}

class _NumberPickerWidgetState extends State<NumberPickerWidget> {
  void onTapMinus() {
    if (widget.number > 0) {
      setState(() {
        widget.number--;
        widget.onChangeNumber(widget.number);
      });
    }
  }

  void onTapPlus() {
    if (widget.number < widget.maxNumber) {
      setState(() {
        widget.number++;
        widget.onChangeNumber(widget.number);
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      height: widget.height,
      padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 20.0),
      decoration: BoxDecoration(
        color: AppColors.secondary.withOpacity(0.6),
        borderRadius: const BorderRadius.all(
          Radius.circular(30.0),
        ),
      ),
      child: Column(
        children: [
          TextWidget(
            text: widget.title,
            color: AppColors.white,
            fontWeight: FontWeight.w600,
          ),
          const SizedBox(height: 14.0),
          Expanded(
            child: TextWidget(
              text: widget.number.toString(),
              size: AppDimens.textSize28,
              fontWeight: FontWeight.w800,
              color: AppColors.white,
            ),
          ),
          Row(
            children: [
              GestureDetector(
                onTap: onTapMinus,
                child: SvgPicture.asset("assets/icons/ic_minus.svg"),
              ),
              const Spacer(),
              GestureDetector(
                onTap: onTapPlus,
                child: SvgPicture.asset("assets/icons/ic_plus.svg"),
              )
            ],
          )
        ],
      ),
    );
  }
}

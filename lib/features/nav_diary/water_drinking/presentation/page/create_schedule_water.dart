import 'package:fitness_tracker_app/core/configs/app_colors.dart';
import 'package:fitness_tracker_app/core/configs/app_dimens.dart';
import 'package:fitness_tracker_app/core/ui/widgets/appbar/appbar_widget.dart';
import 'package:fitness_tracker_app/core/ui/widgets/button/button_widget.dart';
import 'package:fitness_tracker_app/core/ui/widgets/text/text_widget.dart';
import 'package:fitness_tracker_app/core/utils/keyboard.dart';
import 'package:fitness_tracker_app/features/nav_diary/water_drinking/presentation/controller/create_schedule_water_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';

class CreateScheduleWater extends GetView<CreateScheduleWaterController> {
  const CreateScheduleWater({super.key});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        KeyboardUtlis.dimissKeyboard();
      },
      child: Scaffold(
        appBar: const AppBarWidget(
          title: "Thời gian nhắc",
          centerTitle: true,
        ),
        body: bodyContent(),
        // backgroundColor: AppColors.colorPink3,
        bottomNavigationBar: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 15.0, vertical: 30.0),
          child: ButtonWidget(
            text: "Lưu",
            ontap: () {
              controller.saveTimeSchedule();
            },
            height: 35.0,
            backgroundColor: AppColors.primary,
          ),
        ),
      ),
    );
  }

  Widget bodyContent() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 10.0),
      child: Column(
        // mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const SizedBox(height: 100.0),
          TextFormField(
            focusNode: controller.focusNode,
            controller: controller.numberCount,
            style: const TextStyle(fontSize: AppDimens.textSize42),
            textAlign: TextAlign.center,
            keyboardType: TextInputType.number,
            decoration: const InputDecoration(
                focusedBorder: InputBorder.none,
                enabledBorder: InputBorder.none),
            onChanged: (val) {
              // if (val.isEmpty) {
              //   controller.numberCount.text = "0";
              // }
            },
            inputFormatters: [IntegerFormatter()],
          ),
          const TextWidget(
            text: "phút",
            fontWeight: FontWeight.w400,
            size: AppDimens.textSize20,
          ),
          const SizedBox(height: 40.0),
          Row(
            children: [
              Expanded(
                child: buttonCard(false, () {
                  if (int.parse(controller.numberCount.text) > 0) {
                    controller.numberCount.text =
                        (int.parse(controller.numberCount.text) - 1).toString();
                  }
                }),
              ),
              const SizedBox(width: 5.0),
              Expanded(
                child: buttonCard(true, () {
                  controller.numberCount.text =
                      (int.parse(controller.numberCount.text) + 1).toString();
                }),
              ),
            ],
          )
        ],
      ),
    );
  }

  Widget buttonCard(bool isRight, VoidCallback callback) {
    return GestureDetector(
      onTap: callback,
      child: Container(
        height: 50.0,
        decoration: BoxDecoration(
          borderRadius: isRight
              ? const BorderRadius.only(
                  topRight: Radius.circular(10.0),
                  bottomRight: Radius.circular(10.0),
                )
              : const BorderRadius.only(
                  topLeft: Radius.circular(10.0),
                  bottomLeft: Radius.circular(10.0),
                ),
          color: AppColors.primary,
        ),
        child: Center(
          child: isRight ? const Icon(Icons.add,color: AppColors.white) : const Icon(Icons.remove,color: AppColors.white),
        ),
      ),
    );
  }
}

class IntegerFormatter extends TextInputFormatter {
  @override
  TextEditingValue formatEditUpdate(
    TextEditingValue oldValue,
    TextEditingValue newValue,
  ) {
    String newText = newValue.text.replaceAll(RegExp('[^0-9]'), '');

    // Kiểm tra nếu newValue rỗng, thay thế nó bằng số 0
    if (newText.isEmpty) {
      newText = '0';
    } else if (newText.length > 1 && newText[0] == '0') {
      // Loại bỏ số 0 dư thừa nếu có
      newText = int.parse(newText).toString();
    }

    // Trả về giá trị mới với chỉ các số nguyên
    return TextEditingValue(
      text: newText,
      selection: TextSelection.collapsed(offset: newText.length),
    );
  }
}

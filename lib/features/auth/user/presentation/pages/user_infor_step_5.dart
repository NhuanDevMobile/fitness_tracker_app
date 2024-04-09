import 'package:fitness_tracker_app/core/configs/app_colors.dart';
import 'package:fitness_tracker_app/core/ui/widgets/text/text_widget.dart';
import 'package:fitness_tracker_app/features/auth/user/presentation/controller/user_information_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class UserInforStep5 extends GetView<UserInforController> {
  const UserInforStep5({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      height: MediaQuery.of(context).size.height,
      child: GetBuilder<UserInforController>(
        id: "fetchUserInformation",
        builder: (_) => ListView.builder(
          padding: const EdgeInsets.all(24.0),
          shrinkWrap: true,
          itemCount: controller.weightLossQuestions.length,
          itemBuilder: (context, index) {
            return Column(
              children: [
                TextWidget(
                    text: controller.weightLossQuestions[index].question),
                const SizedBox(height: 12.0),
                ListView.builder(
                    physics: const NeverScrollableScrollPhysics(),
                    shrinkWrap: true,
                    itemCount:
                        controller.weightLossQuestions[index].options.length,
                    itemBuilder: (context, index2) {
                      return GestureDetector(
                        onTap: () {
                          print(controller
                              .weightLossQuestions[index].options[index2]);
                        },
                        child: Container(
                          padding: const EdgeInsets.symmetric(
                              vertical: 10.0, horizontal: 24.0),
                          margin: const EdgeInsets.only(bottom: 10.0),
                          decoration: BoxDecoration(
                              color: AppColors.white,
                              borderRadius: BorderRadius.circular(10.0)),
                          child: TextWidget(
                            text: controller
                                .weightLossQuestions[index].options[index2],
                          ),
                        ),
                      );
                    })
              ],
            );
          },
        ),
      ),
    );
  }
}

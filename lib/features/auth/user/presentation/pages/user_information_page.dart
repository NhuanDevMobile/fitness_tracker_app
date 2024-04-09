import 'package:fitness_tracker_app/core/configs/app_colors.dart';
import 'package:fitness_tracker_app/core/ui/widgets/appbar/appbar_widget.dart';
import 'package:fitness_tracker_app/core/ui/widgets/button/button_widget.dart';
import 'package:fitness_tracker_app/features/auth/user/presentation/controller/user_information_controller.dart';
import 'package:fitness_tracker_app/features/auth/user/presentation/pages/user_infor_step_1.dart';
import 'package:fitness_tracker_app/features/auth/user/presentation/pages/user_infor_step_2.dart';
import 'package:fitness_tracker_app/features/auth/user/presentation/pages/user_infor_step_3.dart';
import 'package:fitness_tracker_app/features/auth/user/presentation/pages/user_infor_step_4.dart';
import 'package:fitness_tracker_app/features/auth/user/presentation/pages/user_infor_step_5.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:percent_indicator/linear_percent_indicator.dart';

class UserInforPage extends GetView<UserInforController> {
  const UserInforPage({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<UserInforController>(
        id: "fetchUserInformation",
        builder: (_) => Scaffold(
              body: _buildBody(context),
              appBar: AppBarWidget(
                title: controller.currentPage.value == 4
                    ? "build_a_roadmap"
                    : "basic_information",
                centerTitle: true,
                callbackLeading: () {
                  controller.previousPage();
                },
              ),
              bottomNavigationBar: _buildBottomNavigationBar(),
            ));
  }

  _buildBottomNavigationBar() {
    return Padding(
      padding: const EdgeInsets.only(left: 22.0, right: 22.0, bottom: 60.0),
      child: ButtonWidget(
        ontap: () {
          controller.nextPage();
        },
        text: "continue",
        backgroundColor:
            controller.currentPage.value == 0 && controller.gender.value == ""
                ? AppColors.grey
                : AppColors.primary,
      ),
    );
  }

  _buildBody(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      child: Column(
        children: [
          const SizedBox(height: 10.0),
          LinearPercentIndicator(
            width: MediaQuery.of(context).size.width,
            lineHeight: 8.0,
            percent: controller.percent.value,
            padding: EdgeInsets.zero,
            backgroundColor: AppColors.grey,
            progressColor: AppColors.primary,
          ),
          Expanded(
            child: PageView(
              physics: const NeverScrollableScrollPhysics(),
              controller: controller.pageController,
              onPageChanged: (value) {
                controller.onChangePage(index: value);
              },
              children: const [
                UserInforStep1(),
                UserInforStep2(),
                UserInforStep3(),
                UserInforStep4(),
                UserInforStep5(),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

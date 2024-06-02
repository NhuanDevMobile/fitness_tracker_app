import 'package:fitness_tracker_app/core/configs/app_colors.dart';
import 'package:fitness_tracker_app/core/configs/app_dimens.dart';
import 'package:fitness_tracker_app/core/ui/widgets/appbar/appbar_widget.dart';
import 'package:fitness_tracker_app/core/ui/widgets/text/text_widget.dart';
import 'package:fitness_tracker_app/features/nav/profile/presentation/controller/profile_controller.dart';
import 'package:fitness_tracker_app/features/nav/profile/presentation/widgets/item_infor_user.dart';
import 'package:fitness_tracker_app/features/nav/profile/presentation/widgets/item_personal_health.dart';
import 'package:fitness_tracker_app/features/nav/profile/presentation/widgets/item_profile_menu.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ProfilePage extends GetView<ProfileController> {
  const ProfilePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: AppColors.primary,
        appBar: const AppBarWidget(
          leading: SizedBox.shrink(),
        ),
        body: SingleChildScrollView(
            child: GetBuilder<ProfileController>(
          id: "fetchProfile",
          builder: (_) => Column(
            children: [
              _buildHeader(context),
              _buildBody(),
            ],
          ),
        )));
  }

  _buildHeader(BuildContext context) {
    return Container(
      color: AppColors.black,
      height: 320.0,
      width: double.infinity,
      child: Stack(
        children: [
          Column(
            children: [
              Container(
                height: 200.0,
                color: AppColors.primary,
              ),
              Expanded(
                  child: Container(
                color: AppColors.backgroundColor,
              ))
            ],
          ),
          Positioned(
            bottom: 10,
            left: 20,
            right: 20,
            child: Stack(
              children: [
                Column(
                  children: [
                    Container(
                      height: 200.0,
                      width: double.infinity,
                      decoration: const BoxDecoration(
                        color: AppColors.white,
                        borderRadius: BorderRadius.all(
                          Radius.circular(16.0),
                        ),
                      ),
                      child: Column(
                        children: [
                          const SizedBox(height: 60.0),
                          TextWidget(
                            text: controller.user!.displayName ?? "",
                            color: AppColors.black,
                            size: AppDimens.textSize16,
                            fontWeight: FontWeight.w700,
                          ),
                          TextWidget(
                            text: controller.user!.email ?? "",
                            color: AppColors.black,
                            size: AppDimens.textSize14,
                          ),
                          const SizedBox(height: 20.0),
                          Row(
                            children: [
                              Expanded(
                                child: ItemInforUser(
                                  value: controller.user!.age.toString(),
                                  title: "weight",
                                ),
                              ),
                              Expanded(
                                child: ItemInforUser(
                                  value:
                                      "${controller.user!.height.toString()} cm",
                                  title: "height",
                                ),
                              ),
                              Expanded(
                                child: ItemInforUser(
                                  value: controller.user!.gender ?? "",
                                  title: "gender",
                                ),
                              )
                            ],
                          )
                        ],
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
          Positioned(
            top: 60,
            left: MediaQuery.of(context).size.width / 2 - 100,
            right: MediaQuery.of(context).size.width / 2 - 100,
            child: const Center(
              child: CircleAvatar(
                radius: 52.0,
                backgroundColor: AppColors.white,
                child: CircleAvatar(
                  radius: 48.0,
                  backgroundImage:
                      AssetImage("assets/images/img_avatar_male.jpg"),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  _buildBody() {
    return Container(
      color: AppColors.backgroundColor,
      child: Column(
        children: [
          Container(
            padding:
                const EdgeInsets.symmetric(horizontal: 20.0, vertical: 20.0),
            margin: const EdgeInsets.symmetric(horizontal: 20.0),
            decoration: const BoxDecoration(
              color: AppColors.white,
              borderRadius: BorderRadius.all(
                Radius.circular(16.0),
              ),
            ),
            child: Column(
              children: [
                Row(
                  children: [
                    ItemPersonalHeath(
                      svgIcon: "assets/icons/ic_bmi.svg",
                      value: controller.user!.bmi.toString(),
                      title: "bmi",
                      backgroundColor: const Color(0xFFFCDCDE),
                    ),
                    const SizedBox(width: 10.0),
                    ItemPersonalHeath(
                      svgIcon: "assets/icons/ic_kcal.svg",
                      value: controller.user!.bmi.toString(),
                      title: "bmi",
                      backgroundColor: const Color(0xFFD8EFFF),
                    ),
                  ],
                ),
                const SizedBox(height: 10.0),
                Row(
                  children: [
                    ItemPersonalHeath(
                      svgIcon: "assets/icons/ic_bmi.svg",
                      value: controller.user!.bmi.toString(),
                      title: "bmi",
                      backgroundColor: const Color(0xFFF1C850).withOpacity(0.6),
                    ),
                    const SizedBox(width: 10.0),
                    ItemPersonalHeath(
                      svgIcon: "assets/icons/ic_bmi.svg",
                      value: controller.user!.bmi.toString(),
                      title: "bmi",
                      backgroundColor: const Color(0xFF3ED598).withOpacity(0.5),
                    ),
                  ],
                )
              ],
            ),
          ),
          ListView.builder(
            padding:
                const EdgeInsets.symmetric(horizontal: 20.0, vertical: 10.0),
            shrinkWrap: true,
            itemCount: controller.profileMenuList.length,
            physics: const NeverScrollableScrollPhysics(),
            itemBuilder: ((context, index) {
              return ItemProfileMenu(
                item: controller.profileMenuList[index],
                index: index,
                onTap: () {
                  controller.onTapProfileMenu(index);
                },
              );
            }),
          ),
          const SizedBox(height: 50.0),
        ],
      ),
    );
  }
}

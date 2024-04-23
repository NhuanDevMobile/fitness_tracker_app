import 'package:fitness_tracker_app/core/configs/app_colors.dart';
import 'package:fitness_tracker_app/core/routes/routes.dart';
import 'package:fitness_tracker_app/core/ui/widgets/button/button_widget.dart';
import 'package:fitness_tracker_app/core/ui/widgets/text/text_widget.dart';
import 'package:fitness_tracker_app/features/nav/profile/presentation/controller/profile_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ProfilePage extends GetView<ProfileController> {
  const ProfilePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: NestedScrollView(
      headerSliverBuilder: (BuildContext context, bool innerBoxIsScrolled) {
        return <Widget>[_buildHeader()];
      },
      body: SingleChildScrollView(
        child: _buildBody(),
      ),
    ));
  }

  _buildHeader() {
    var top = 0.0;
    return SliverAppBar(
      backgroundColor: AppColors.primary,
      expandedHeight: 200.0,
      elevation: 0,
      floating: false,
      pinned: true,
      flexibleSpace: LayoutBuilder(
        builder: (BuildContext context, BoxConstraints constraints) {
          // print('constraints=' + constraints.toString());
          top = constraints.biggest.height;
          return GetBuilder<ProfileController>(
              id: "fetchProfile",
              builder: (_) => FlexibleSpaceBar(
                    centerTitle: true,
                    title: AnimatedOpacity(
                      duration: const Duration(milliseconds: 100),
                      opacity: top ==
                              MediaQuery.of(context).padding.top +
                                  kToolbarHeight
                          ? 1.0
                          : 0.0,
                      child: Container(
                        margin: const EdgeInsets.only(
                            top: 60.0, left: 20.0, right: 20.0),
                        child: Row(
                          children: [
                            const CircleAvatar(
                              radius: 20.0,
                              backgroundImage: AssetImage(
                                  "assets/images/img_avatar_male.jpg"),
                            ),
                            Expanded(
                                child: Center(
                              child: TextWidget(
                                text: controller.user!.displayName ?? "N/A",
                                color: AppColors.white,
                                fontWeight: FontWeight.bold,
                              ),
                            )),
                            const SizedBox(
                              width: 40.0,
                            ),
                          ],
                        ),
                      ),
                    ),
                    background: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const SizedBox(
                          height: 50.0,
                        ),
                        const CircleAvatar(
                          radius: 50.0,
                          backgroundImage:
                              AssetImage("assets/images/img_avatar_male.jpg"),
                        ),
                        const SizedBox(height: 10.0),
                        TextWidget(
                          text: controller.user!.displayName ?? "N/A",
                          color: AppColors.white,
                          fontWeight: FontWeight.bold,
                        ),
                        TextWidget(
                          text: controller.user!.email ?? "N/A",
                          color: AppColors.white,
                          fontWeight: FontWeight.bold,
                        ),
                      ],
                    ),
                  ));
        },
      ),
    );
  }

  _buildBody() {
    return Column(
      children: [
        ButtonWidget(
          ontap: () {
            controller.handleLogout();
            Get.offAndToNamed(Routes.login);
          },
          text: "BUtton",
        )
      ],
    );
  }
}

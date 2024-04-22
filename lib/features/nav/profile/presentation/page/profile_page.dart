import 'package:fitness_tracker_app/core/configs/app_colors.dart';
import 'package:fitness_tracker_app/core/ui/widgets/text/text_widget.dart';
import 'package:fitness_tracker_app/features/nav/profile/presentation/controller/profile_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ProfilePage extends GetView<ProfileController> {
  const ProfilePage({super.key});

  @override
  Widget build(BuildContext context) {
    var top = 0.0;
    return Scaffold(
        body: NestedScrollView(
      headerSliverBuilder: (BuildContext context, bool innerBoxIsScrolled) {
        return <Widget>[
          SliverAppBar(
              backgroundColor: AppColors.primary,
              expandedHeight: 200.0,
              floating: false,
              pinned: true,
              flexibleSpace: LayoutBuilder(
                  builder: (BuildContext context, BoxConstraints constraints) {
                // print('constraints=' + constraints.toString());
                top = constraints.biggest.height;
                return FlexibleSpaceBar(
                  centerTitle: true,
                  title: const AnimatedOpacity(
                    duration: Duration(milliseconds: 300),
                    //opacity: top == MediaQuery.of(context).padding.top + kToolbarHeight ? 1.0 : 0.0,
                    opacity: 1.0,
                    child: Row(
                      children: [
                        TextWidget(text: "text"),
                      ],
                    ),
                  ),
                  background: Container(
                    child: const Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        TextWidget(text: "text"),
                      ],
                    ),
                  ),
                );
              })),
        ];
      },
      body: SingleChildScrollView(
        child: Container(),
      ),
    ));
    // return Scaffold(
    //   appBar: const AppBarWidget(
    //     leading: SizedBox.shrink(),
    //     title: "profile",
    //     centerTitle: true,
    //   ),
    //   body: Center(
    //     child: Column(
    //       mainAxisAlignment: MainAxisAlignment.center,
    //       children: [
    //         const SizedBox(height: 16),
    //         const SizedBox(height: 8),
    //         const Text(
    //           'Software Developer',
    //           style: TextStyle(
    //             fontSize: 16,
    //             color: Colors.grey,
    //           ),
    //         ),
    //         const SizedBox(height: 16),
    //         ElevatedButton(
    //           onPressed: () {
    //             controller.handleLogout();
    //             Get.offAndToNamed(Routes.login);
    //           },
    //           child: const Text('Logout'),
    //         ),
    //       ],
    //     ),
    //   ),
    // );
  }
}

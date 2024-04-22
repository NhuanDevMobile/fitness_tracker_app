import 'package:fitness_tracker_app/core/configs/app_colors.dart';
import 'package:fitness_tracker_app/core/data/firebase/firestore_database/firestore_activity.dart';
import 'package:fitness_tracker_app/core/ui/widgets/button/button_widget.dart';
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
              elevation: 0,
              floating: false,
              pinned: true,
              flexibleSpace: LayoutBuilder(
                  builder: (BuildContext context, BoxConstraints constraints) {
                // print('constraints=' + constraints.toString());
                top = constraints.biggest.height;
                return FlexibleSpaceBar(
                  centerTitle: true,
                  title: AnimatedOpacity(
                    duration: const Duration(milliseconds: 100),
                    opacity: top ==
                            MediaQuery.of(context).padding.top + kToolbarHeight
                        ? 1.0
                        : 0.0,
                    child: Container(
                      margin: const EdgeInsets.only(
                          top: 50.0, left: 20.0, right: 20.0),
                      child: const Row(
                        children: [
                          CircleAvatar(),
                          Expanded(
                              child: Center(
                                  child: TextWidget(text: "Flutter Baba"))),
                          SizedBox(
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
                      ),
                      const TextWidget(text: "sdasda"),
                      ButtonWidget(
                          ontap: () async {
                            final result = await FirestoreActivity.getFoods();
                            print(result.data);
                          },
                          text: "text")
                    ],
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

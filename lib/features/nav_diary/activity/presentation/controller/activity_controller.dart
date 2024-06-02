import 'package:fitness_tracker_app/core/configs/app_colors.dart';
import 'package:fitness_tracker_app/core/configs/enum.dart';
import 'package:fitness_tracker_app/core/data/firebase/firestore_database/firestore_activity.dart';
import 'package:fitness_tracker_app/core/data/firebase/firestore_database/firestore_user_relationship_activity.dart';
import 'package:fitness_tracker_app/core/routes/routes.dart';
import 'package:fitness_tracker_app/core/ui/snackbar/snackbar.dart';
import 'package:fitness_tracker_app/features/auth/user/domain/use_case/get_user_use_case.dart';
import 'package:fitness_tracker_app/features/nav_diary/activity/models/activity_model.dart';
import 'package:fitness_tracker_app/features/nav_diary/activity/models/user_relationship_activity_model.dart';
import 'package:fitness_tracker_app/features/nav_diary/activity/presentation/arguments/activity_argument.dart';
import 'package:fitness_tracker_app/features/nav_diary/activity/presentation/controller/item_relationship_controller.dart';
import 'package:fitness_tracker_app/features/nav_diary/activity/presentation/widgets/edit_relationship_bottomsheet.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';

class ActivityController extends GetxController {
  RxInt currentPage = 0.obs;
  List<ActivityModel> listActivity = [];
  List<ActivityModel> listActivitySuggest = [];
  List<UserRelationshipActivityModel> listActivityRelationship = [];
  String userId = "";
  GetuserUseCase getuserUseCase = Get.find();
  final ActivityArgument argument = Get.arguments;
  @override
  void onInit() async {
    await getuserUseCase.getUser().then((value) {
      userId = value!.uid ?? "";
    });
    getActivities();
    setActivity();
  }

  void setActivity() {
    listActivityRelationship = argument.listActivityRelationship;
    print(listActivityRelationship.length);
    update(['listActivityRelationship', 'progressBar']);
  }

  double getCaloriesConsume() {
    double nfCalories = 0;
    for (var item in listActivityRelationship) {
      nfCalories += item.nfCalories ?? 0;
    }

    return nfCalories;
  }

  getActivities() async {
    print("Nhuan");
    final result = await FirestoreActivity.getActivities();
    if (result.status == Status.success) {
      listActivity = result.data!;
      listActivitySuggest =
          listActivity.where((element) => element.isSuggest == true).toList();
      update(["fetchActivity"]);
    } else {
      SnackbarUtil.show(result.exp?.message ?? "something_went_wrong");
    }
  }

  void addActivityRelationship(
      {required UserRelationshipActivityModel userRelationshipActivity}) async {
    userRelationshipActivity.createAt =
        DateFormat("yyyy-MM-dd'T'00:00:00").format(argument.dateTime);
    final result = await FirestoreUserRelationshipActivity.create(
        userRelationshipActivityModel: userRelationshipActivity,
        userId: userId);

    if (result.status == Status.success) {
      listActivityRelationship.insert(0, userRelationshipActivity);
      update(['listActivityRelationship', 'progressBar']);
    } else {
      SnackbarUtil.show(result.exp!.message ?? "something_went_wrong");
    }
  }

  deleteItem(UserRelationshipActivityModel userRelationshipActivity) async {
    final result = await FirestoreUserRelationshipActivity.delete(
        userRelationshipActivity.id ?? "");
    if (result.status == Status.success) {
      listActivityRelationship.remove(userRelationshipActivity);
      update(['listActivityRelationship', 'progressBar']);
    } else {
      SnackbarUtil.show(result.exp!.message ?? "something_went_wrong");
    }
  }

  editItem(UserRelationshipActivityModel userRelationshipActivity) async {
    final result = await Get.bottomSheet(
        GetBuilder<ItemRelationshipController>(
          init: ItemRelationshipController(),
          builder: (logic) {
            return EditRelationshipBottomSheet(
              onTapAdd: () {},
            );
          },
        ),
        backgroundColor: AppColors.transparent,
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(20.0),
            topRight: Radius.circular(20.0),
          ),
        ),
        settings: RouteSettings(arguments: userRelationshipActivity));

    if (result != null) {
      final resultUpdate = await FirestoreUserRelationshipActivity.update(
          userRelationshipActivity: result);
      if (resultUpdate.status == Status.success) {
        int index = listActivityRelationship
            .indexWhere((element) => element.id == result.id);
        if (index != -1) {
          listActivityRelationship[index] = result;
        }
        update(['listActivityRelationship', 'progressBar']);
      } else {
        SnackbarUtil.show(result.exp!.message ?? "something_went_wrong");
      }
    }
  }

  goToSearchPage() {
    Get.toNamed(
      Routes.searchActivity,
      arguments: ActivityArgument(
          listActivity: listActivity,
          dateTime: argument.dateTime,
          listActivityRelationship: listActivityRelationship),
    );
  }
}

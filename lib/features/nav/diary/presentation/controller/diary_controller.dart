import 'package:fitness_tracker_app/core/configs/enum.dart';
import 'package:fitness_tracker_app/core/data/firebase/firestore_database/firestore_user_relationship_activity.dart';
import 'package:fitness_tracker_app/core/data/firebase/firestore_database/firestore_user_relationship_food.dart';
import 'package:fitness_tracker_app/core/data/firebase/firestore_database/firestore_water.dart';
import 'package:fitness_tracker_app/core/routes/routes.dart';
import 'package:fitness_tracker_app/core/ui/snackbar/snackbar.dart';
import 'package:fitness_tracker_app/core/utils/date_time.dart';
import 'package:fitness_tracker_app/features/auth/user/domain/use_case/get_user_use_case.dart';
import 'package:fitness_tracker_app/features/auth/user/model/user_model.dart';
import 'package:fitness_tracker_app/features/nav/diary/presentation/arguments/food_argument.dart';
import 'package:fitness_tracker_app/features/nav_diary/activity/models/user_relationship_activity_model.dart';
import 'package:fitness_tracker_app/features/nav_diary/activity/presentation/arguments/activity_argument.dart';
import 'package:fitness_tracker_app/features/nav_diary/foods/model/user_relationship_food_model.dart';
import 'package:fitness_tracker_app/features/nav_diary/water_drinking/model/water_model.dart';
import 'package:fitness_tracker_app/features/nav_diary/water_drinking/presentation/argument/water_argument.dart';
import 'package:get/get.dart';

class DiaryController extends GetxController {
  final GetuserUseCase _getuserUseCase;
  DiaryController(this._getuserUseCase);
  RxBool isLoading = false.obs;
  UserModel? user;
  List<WaterModel> waterDiarys = [];
  List<UserRelationshipFoodModel> breakfasts = [];
  List<UserRelationshipFoodModel> lunchs = [];
  List<UserRelationshipFoodModel> dinners = [];
  List<UserRelationshipFoodModel> snacks = [];
  List<UserRelationshipActivityModel> listActivityRelationship = [];
  DateTime dateTime = DateTime.now();
  int consumedWater = 0;
  RxString titleDate = "".obs;
  double consumeKcal = 0;
  double kcalBreakfasts = 0;
  double kcalDinner = 0;
  double kcalSnacks = 0;
  double kcalLunchs = 0;
  @override
  void onInit() async {
    titleDate.value = DatetimeUtil.formatDateTimeFormat(dateTime);
    user = await _getuserUseCase.getUser();
    if (user != null) {
      getWaterDiarys();
      getRelationshipFood();
      getRelationshipActivity();
    }
    update(["fetchDiary"]);
    super.onInit();
  }

  selectDate(DateTime selectDay) {
    dateTime = selectDay;
    clearDaTa();
    getWaterDiarys();
    getRelationshipFood();
    update(['fetchDate']);
  }

  getWaterDiarys() async {
    print("Nhuan");
    final result = await FirestoreWater.getWaterByUserIdAndDate(
        userId: user!.uid!, dateTime: DatetimeUtil.format(dateTime));
    if (result.status == Status.success) {
      waterDiarys = result.data!;
      consumedWater = calculateTotalWater(waterDiarys);
      update(["fetchDiary"]);
    } else {
      SnackbarUtil.show(result.exp?.message ?? "something_went_wrong");
    }
  }

  double getCalories(List<UserRelationshipFoodModel> listFoodRelationship) {
    double nfCalories = 0;
    if (listFoodRelationship.isNotEmpty) {
      for (var element in listFoodRelationship) {
        nfCalories += element.nfCalories ?? 0;
      }
    }
    return nfCalories;
  }

  double getCaloriesConsume() {
    double nfCalories = getCalories(breakfasts) +
        getCalories(lunchs) +
        getCalories(dinners) +
        getCalories(snacks);

    return nfCalories;
  }

  double getCaloriesConsumeActivity() {
    double nfCalories = 0;
    for (var item in listActivityRelationship) {
      nfCalories += item.nfCalories ?? 0;
    }

    return nfCalories;
  }

  void clearDaTa() {
    snacks.clear();
    breakfasts.clear();
    dinners.clear();
    lunchs.clear();
  }

  getRelationshipFood() async {
    print("Nhuan");
    final result = await FirestoreUserRelationshipFood.getFoodByDate(
        userId: user!.uid!, date: DatetimeUtil.format(dateTime), mealId: "1");
    if (result.status == Status.success) {
      if (result.data!.isNotEmpty) {
        List<UserRelationshipFoodModel> list = result.data!;
        breakfasts = list.where((element) => element.mealId! == 1).toList();
        lunchs = list.where((element) => element.mealId! == 2).toList();
        dinners = list.where((element) => element.mealId! == 3).toList();
        snacks = list.where((element) => element.mealId! == 4).toList();
      }
      update(["fetchRelationshipFood", "fetchDiary"]);
    } else {
      SnackbarUtil.show(result.exp?.message ?? "something_went_wrong");
    }
  }

  getRelationshipActivity() async {
    final result = await FirestoreUserRelationshipActivity.getActivityByDate(
        userId: user!.uid!, date: DatetimeUtil.format(dateTime));
    if (result.status == Status.success) {
      if (result.data!.isNotEmpty) {
        listActivityRelationship = result.data!;
      }
      update(["fetchRelationshipActivity"]);
    } else {
      SnackbarUtil.show(result.exp?.message ?? "something_went_wrong");
    }
  }

  int calculateTotalWater(List<WaterModel> waterDiaries) {
    int totalWater = 0;
    for (var waterDiary in waterDiaries) {
      totalWater += waterDiary.quantity!;
    }
    return totalWater;
  }

  onTapWater() async {
    final WaterArgument callbackResult = await Get.toNamed(Routes.waterDrink,
        arguments: WaterArgument(
            waterDiarys: waterDiarys,
            consumedWater: consumedWater,
            recommendedWater: user!.getWater()));
    consumedWater = callbackResult.consumedWater;
    waterDiarys = callbackResult.waterDiarys;
    update(["fetchDiary"]);
  }

  gotoPage(
      {required DailyMeals meals,
      required List<UserRelationshipFoodModel> foodRelationship}) async {
    Get.toNamed(
      Routes.foods,
      arguments: FoodArgument(
          listFood: [],
          typeDailyMeal: meals,
          dateTime: dateTime,
          listFoodRelationship: foodRelationship),
    );
    update(['fetchRelationshipFood', 'fetchDiary']);
  }

  gotoPageActivity() async {
    await Get.toNamed(
      Routes.activity,
      arguments: ActivityArgument(
        listActivity: [],
        dateTime: dateTime,
        listActivityRelationship: listActivityRelationship,
      ),
    );
    update(['fetchRelationshipActivity']);
  }
}

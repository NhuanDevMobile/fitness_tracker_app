import 'package:fitness_tracker_app/core/configs/enum.dart';
import 'package:fitness_tracker_app/core/data/firebase/firestore_database/firestore_user_relationship_food.dart';
import 'package:fitness_tracker_app/core/data/firebase/firestore_database/firestore_water.dart';
import 'package:fitness_tracker_app/core/routes/routes.dart';
import 'package:fitness_tracker_app/core/ui/snackbar/snackbar.dart';
import 'package:fitness_tracker_app/core/utils/date_time.dart';
import 'package:fitness_tracker_app/features/auth/user/domain/use_case/get_user_use_case.dart';
import 'package:fitness_tracker_app/features/auth/user/model/user_model.dart';
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
  DateTime dateTime = DateTime.now();
  int consumedWater = 0;
  RxString titleDate = "".obs;
  @override
  void onInit() async {
    titleDate.value = DatetimeUtil.formatDateTimeFormat(dateTime);
    user = await _getuserUseCase.getUser();
    if (user != null) {
      getWaterDiarys();
      getRelationshipFood();
    }
    update(["fetchDiary"]);
    super.onInit();
  }

  getWaterDiarys() async {
    print("Nhuan");
    final result = await FirestoreWater.getWaterByUserIdAndDate(
        userId: user!.uid!, dateTime: "2024-04-12T00:00:00.000");
    if (result.status == Status.success) {
      waterDiarys = result.data!;
      consumedWater = calculateTotalWater(waterDiarys);
      update(["fetchDiary"]);
    } else {
      SnackbarUtil.show(result.exp?.message ?? "something_went_wrong");
    }
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
        update(["fetchRelationshipFood"]);
      }
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
}

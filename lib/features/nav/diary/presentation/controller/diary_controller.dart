import 'package:fitness_tracker_app/core/configs/enum.dart';
import 'package:fitness_tracker_app/core/data/firebase/firestore_database/firestore_water.dart';
import 'package:fitness_tracker_app/core/routes/routes.dart';
import 'package:fitness_tracker_app/core/ui/snackbar/snackbar.dart';
import 'package:fitness_tracker_app/core/utils/date_time.dart';
import 'package:fitness_tracker_app/features/auth/user/domain/use_case/get_user_use_case.dart';
import 'package:fitness_tracker_app/features/auth/user/model/user_model.dart';
import 'package:fitness_tracker_app/features/nav_diary/water_drinking/model/water_model.dart';
import 'package:fitness_tracker_app/features/nav_diary/water_drinking/presentation/argument/water_argument.dart';
import 'package:get/get.dart';

class DiaryController extends GetxController {
  final GetuserUseCase _getuserUseCase;
  DiaryController(this._getuserUseCase);
  RxBool isLoading = false.obs;
  UserModel? user;
  List<WaterModel> waterDiarys = [];
  DateTime dateTime = DateTime.now();
  int consumedWater = 0;
  RxString titleDate = "".obs;
  @override
  void onInit() async {
    titleDate.value = DatetimeUtil.formatDateTimeFormat(dateTime);
    user = await _getuserUseCase.getUser();
    if (user != null) {
      getWaterDiarys();
    }
    update(["fetchDiary"]);
    super.onInit();
  }

  getWaterDiarys() async {
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

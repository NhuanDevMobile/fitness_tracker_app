import 'package:fitness_tracker_app/core/configs/enum.dart';
import 'package:fitness_tracker_app/core/data/firebase/firestore_database/firestore_water.dart';
import 'package:fitness_tracker_app/core/ui/snackbar/snackbar.dart';
import 'package:fitness_tracker_app/features/auth/user/domain/use_case/get_user_use_case.dart';
import 'package:fitness_tracker_app/features/auth/user/model/user_model.dart';
import 'package:fitness_tracker_app/features/nav_diary/water_drinking/domain/get_water_amounts.dart';
import 'package:fitness_tracker_app/features/nav_diary/water_drinking/domain/save_water_amounts.dart';
import 'package:fitness_tracker_app/features/nav_diary/water_drinking/model/water_model.dart';
import 'package:fitness_tracker_app/features/nav_diary/water_drinking/presentation/argument/water_argument.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class WaterDrinkingController extends GetxController {
  final SaveWaterAmountsUseCase saveWaterAmountsUseCase;
  final GetWaterAmountsUseCase getWaterAmountsUseCase;
  final GetuserUseCase _getuserUseCase;
  WaterDrinkingController(this.saveWaterAmountsUseCase,
      this.getWaterAmountsUseCase, this._getuserUseCase);
  bool firstTap = true;
  int currentIndexWater = 0;
  List<int> waterAmounts = [];
  UserModel user = UserModel();

  final ScrollController scrollController = ScrollController();
  final WaterArgument argument = Get.arguments;
  List<WaterModel> waterDiarys = [];
  int consumedWater = 0;
  @override
  void onInit() async {
    consumedWater = argument.consumedWater;
    waterDiarys = argument.waterDiarys;
    user = (await _getuserUseCase.getUser())!;
    getWaterAmountsUseCase.getWaterAmounts().then((value) {
      waterAmounts = value;
      update(["fetchWaterResult"]);
    });
    super.onInit();
  }

  void onNextWater() {
    if (currentIndexWater < waterAmounts.length - 1) {
      currentIndexWater = currentIndexWater + 1;
      scrollController.animateTo(
        scrollController.offset + 100,
        duration: const Duration(milliseconds: 500),
        curve: Curves.ease,
      );
    }
    update(["fetchWaterResult"]);
  }

  void onPreviousWater() {
    if (currentIndexWater > 0) {
      currentIndexWater = currentIndexWater - 1;
      scrollController.animateTo(
        scrollController.offset - 100,
        duration: const Duration(milliseconds: 500),
        curve: Curves.ease,
      );
    }
    update(["fetchWaterResult"]);
  }

  onSelectedWater(int index) {
    if (firstTap) {
      // Nếu đây là lần tap đầu tiên
      firstTap = false;
      currentIndexWater = index;
      update(["fetchWaterResult"]);
    } else if (firstTap == false && currentIndexWater == index) {
      handleInsertWater(currentIndexWater);
      firstTap = false;
      update(["fetchWaterResult"]);
    } else if (firstTap == true && currentIndexWater == index) {
      handleInsertWater(currentIndexWater);
      firstTap = true;
      update(["fetchWaterResult"]);
    } else if (firstTap == false && currentIndexWater != index) {
      currentIndexWater = index;
      firstTap = false;
      update(["fetchWaterResult"]);
    } else {
      firstTap = true;
      update(["fetchWaterResult"]);
    }
  }

  int calculateTotalWater(List<WaterModel> waterDiaries) {
    int totalWater = 0;
    for (var waterDiary in waterDiaries) {
      totalWater += waterDiary.quantity!;
    }
    return totalWater;
  }

  handleInsertWater(int index) async {
    final now = DateTime.now();
    final dateOnly = DateTime(now.year, now.month, now.day);
    final result = await FirestoreWater.addWater(
        userId: user.uid!,
        quantity: waterAmounts[index],
        dateTimeDisplay: now.toIso8601String(),
        createAt: dateOnly.toIso8601String());
    if (result.status == Status.success) {
      waterDiarys.add(result.data!);
      consumedWater = calculateTotalWater(waterDiarys);
      update(["fetchWaterDiarys"]);
      update(["fetchWaterResult"]);
    } else {
      print("object");
      SnackbarUtil.show(result.exp?.message ?? "something_went_wrong");
    }
  }

  handleDeleteWater({required int index, required String waterId}) async {
    final result = await FirestoreWater.deleteWaterById(
        userId: user.uid!, waterId: waterId);
    if (result.status == Status.success) {
      waterDiarys.removeAt(index);
      consumedWater = calculateTotalWater(waterDiarys);
      update(["fetchWaterDiarys"]);
      update(["fetchWaterResult"]);
    } else {
      SnackbarUtil.show(result.exp?.message ?? "something_went_wrong");
    }
  }

  onTapBack() {
    Get.back(
      result: WaterArgument(
        waterDiarys: waterDiarys,
        consumedWater: consumedWater,
        recommendedWater: argument.recommendedWater,
      ),
    );
  }
}

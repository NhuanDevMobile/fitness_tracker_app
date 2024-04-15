import 'package:fitness_tracker_app/core/configs/enum.dart';
import 'package:fitness_tracker_app/core/data/firebase/firestore_database/firestore_food.dart';
import 'package:fitness_tracker_app/core/ui/snackbar/snackbar.dart';
import 'package:fitness_tracker_app/features/nav/diary/presentation/arguments/food_argument.dart';
import 'package:fitness_tracker_app/features/nav_diary/foods/model/food_model.dart';
import 'package:get/get.dart';

class FoodController extends GetxController {
  final FoodArgument argument = Get.arguments;
  List<FoodModel> foods = [];
  RxInt currentPage = 0.obs;
  @override
  void onInit() {
    getFoods();
    super.onInit();
  }

  void getFoods() async {
    final result = await FirestoreFood.getFoods();
    if (result.status == Status.success) {
      foods = result.data!;
      update(["fetchFoods"]);
    } else {
      SnackbarUtil.show(result.exp!.message ?? "something_went_wrong");
    }
  }

  String titleAppBar() {
    if (argument.typeDailyMeal == DailyMeals.breakfast) {
      return "breakfast".tr;
    } else if (argument.typeDailyMeal == DailyMeals.lunch) {
      return "lunch".tr;
    } else if (argument.typeDailyMeal == DailyMeals.dinner) {
      return "dinner".tr;
    } else if (argument.typeDailyMeal == DailyMeals.snack) {
      return "snack".tr;
    } else {
      return '';
    }
  }
}

import 'package:fitness_tracker_app/core/configs/enum.dart';
import 'package:fitness_tracker_app/core/data/firebase/firestore_database/firestore_food.dart';
import 'package:fitness_tracker_app/core/ui/snackbar/snackbar.dart';
import 'package:fitness_tracker_app/features/nav_diary/foods/model/food_model.dart';
import 'package:get/get.dart';

class FoodController extends GetxController {
  List<FoodModel> foods = [];
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
}

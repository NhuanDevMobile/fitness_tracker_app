import 'package:fitness_tracker_app/core/configs/enum.dart';
import 'package:fitness_tracker_app/core/data/firebase/firestore_database/firestore_user_relationship_food.dart';
import 'package:fitness_tracker_app/core/ui/snackbar/snackbar.dart';
import 'package:fitness_tracker_app/features/nav/diary/presentation/arguments/food_argument.dart';
import 'package:fitness_tracker_app/features/nav_diary/foods/model/user_relationship_food_model.dart';
import 'package:get/get.dart';

class FoodCartController extends GetxController {
  List<UserRelationshipFoodModel> listFoodRelationship = [];
  final FoodArgument argument = Get.arguments;

  @override
  void onInit() {
    getFoodRelationship();
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

  String getCalories() {
    double nfCalories = 0;
    if (listFoodRelationship.isNotEmpty) {
      for (var element in listFoodRelationship) {
        nfCalories += element.nfCalories ?? 0;
      }
    }
    return nfCalories.toStringAsFixed(2).toString();
  }

  getFoodRelationship() {
    listFoodRelationship = argument.listFoodRelationship;
    update(['foodCart']);
  }

  deleteItem(UserRelationshipFoodModel relationshipFood) async {
    final result =
        await FirestoreUserRelationshipFood.delete(relationshipFood.id ?? "");
    if (result.status == Status.success) {
      listFoodRelationship.remove(relationshipFood);
      update(['foodCart']);
    } else {
      SnackbarUtil.show(result.exp!.message ?? "something_went_wrong");
    }
  }
}

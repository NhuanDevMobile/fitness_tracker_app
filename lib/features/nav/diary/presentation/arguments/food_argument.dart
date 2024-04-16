import 'package:fitness_tracker_app/core/configs/enum.dart';
import 'package:fitness_tracker_app/features/nav_diary/foods/model/food_model.dart';

class FoodArgument {
  List<FoodModel> listFood;
  DailyMeals typeDailyMeal;
  DateTime dateTime;
  FoodArgument({
    required this.listFood,
    required this.typeDailyMeal,
    required this.dateTime,
  });
}

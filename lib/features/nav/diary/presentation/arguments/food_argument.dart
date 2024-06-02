import 'package:fitness_tracker_app/core/configs/enum.dart';
import 'package:fitness_tracker_app/features/nav_diary/foods/model/food_model.dart';
import 'package:fitness_tracker_app/features/nav_diary/foods/model/user_relationship_food_model.dart';

class FoodArgument {
  List<FoodModel> listFood;
  List<UserRelationshipFoodModel> listFoodRelationship;
  DailyMeals typeDailyMeal;
  DateTime dateTime;
  FoodArgument({
    required this.listFood,
    required this.typeDailyMeal,
    required this.dateTime,
    required this.listFoodRelationship,
  });
}

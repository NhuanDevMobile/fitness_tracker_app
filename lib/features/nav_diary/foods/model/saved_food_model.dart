import 'package:fitness_tracker_app/features/nav_diary/foods/model/food_model.dart';

class SavedFoodModel {
  String? id;
  String? userId;
  FoodModel? food;
  String? createAt;

  SavedFoodModel({this.id, this.userId, this.createAt, this.food});

  factory SavedFoodModel.fromJson(Map<String, dynamic> json) => SavedFoodModel(
        id: json["id"],
        userId: json["userId"],
        createAt: json["createAt"],
        food: FoodModel.fromJson(json["food"]),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "userId": userId,
        "createAt": createAt,
        "food": food!.toJson(),
      };
}

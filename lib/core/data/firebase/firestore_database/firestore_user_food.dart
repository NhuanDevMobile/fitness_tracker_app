import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:fitness_tracker_app/core/data/firebase/model/result.dart';
import 'package:fitness_tracker_app/features/nav_diary/foods/model/user_food_model.dart';

class FirestoreUserFood {
  static final _fireStoreUserFoodCollection =
      FirebaseFirestore.instance.collection('user_foods');

  static Future<Result<void>> create(
      {required UserFoodModel food, required String userId}) async {
    try {
      String foodId = _fireStoreUserFoodCollection.doc().id;
      food.id = foodId;
      food.userId = userId;
      await _fireStoreUserFoodCollection.doc(foodId).set(food.toJson());
      return Result.success(null);
    } on FirebaseException catch (e) {
      return Result.error(e);
    }
  }
}

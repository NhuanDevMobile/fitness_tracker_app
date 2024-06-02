import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:fitness_tracker_app/core/data/firebase/model/result.dart';
import 'package:fitness_tracker_app/features/nav_diary/foods/model/saved_food_model.dart';

class FirestoreSavedFood {
  static final _fireStoreSavedFoodCollection =
      FirebaseFirestore.instance.collection('saved_foods');

  static Future<Result<SavedFoodModel>> saved(
      {required SavedFoodModel food, required String userId}) async {
    try {
      String foodId = _fireStoreSavedFoodCollection.doc().id;
      food.id = foodId;
      food.userId = userId;
      await _fireStoreSavedFoodCollection.doc(foodId).set(food.toJson());
      return Result.success(food);
    } on FirebaseException catch (e) {
      return Result.error(e);
    }
  }

  static Future<Result<void>> delete(String idSavedFood) async {
    try {
      await _fireStoreSavedFoodCollection.doc(idSavedFood).delete();
      return Result.success(null);
    } on FirebaseException catch (e) {
      return Result.error(e);
    }
  }

  static Future<Result<List<SavedFoodModel>>> getListFoodByUserId(
      String userId) async {
    try {
      QuerySnapshot querySnapshot = await _fireStoreSavedFoodCollection
          .where('userId', isEqualTo: userId)
          .get();

      List<SavedFoodModel> foodList = querySnapshot.docs.map((doc) {
        Map<String, dynamic> data = doc.data() as Map<String, dynamic>;
        return SavedFoodModel.fromJson(data);
      }).toList();

      return Result.success(foodList);
    } on FirebaseException catch (e) {
      return Result.error(e);
    }
  }
}

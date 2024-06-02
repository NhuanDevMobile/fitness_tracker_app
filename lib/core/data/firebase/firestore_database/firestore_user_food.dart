import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:fitness_tracker_app/core/data/firebase/model/result.dart';
import 'package:fitness_tracker_app/features/nav_diary/foods/model/user_food_model.dart';

class FirestoreUserFood {
  static final _fireStoreUserFoodCollection =
      FirebaseFirestore.instance.collection('user_foods');

  static Future<Result<UserFoodModel>> create(
      {required UserFoodModel food, required String userId}) async {
    try {
      String foodId = _fireStoreUserFoodCollection.doc().id;
      food.id = foodId;
      food.userId = userId;
      await _fireStoreUserFoodCollection.doc(foodId).set(food.toJson());

      return Result.success(food);
    } on FirebaseException catch (e) {
      return Result.error(e);
    }
  }

  static Future<Result<List<UserFoodModel>>> getListUserFood(
      String userId) async {
    try {
      QuerySnapshot querySnapshot = await _fireStoreUserFoodCollection
          .where('userId', isEqualTo: userId)
          .get();

      // Chuyển đổi querySnapshot thành danh sách các đối tượng UserFoodModel
      List<UserFoodModel> foodList = querySnapshot.docs.map((doc) {
        Map<String, dynamic> data = doc.data() as Map<String, dynamic>;
        return UserFoodModel.fromJson(data);
      }).toList();

      return Result.success(foodList);
    } on FirebaseException catch (e) {
      return Result.error(e);
    }
  }
}

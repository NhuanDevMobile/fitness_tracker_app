import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:fitness_tracker_app/core/data/firebase/model/result.dart';
import 'package:fitness_tracker_app/features/nav_diary/foods/model/user_relationship_food_model.dart';

class FirestoreUserRelationshipFood {
  static final _fireStoreUserRelationshipFoodCollection =
      FirebaseFirestore.instance.collection('user_relationship_food');

  static Future<Result<UserRelationshipFoodModel>> create(
      {required UserRelationshipFoodModel userRelationshipFoodModel,
      required String userId}) async {
    try {
      String foodId = _fireStoreUserRelationshipFoodCollection.doc().id;
      userRelationshipFoodModel.id = foodId;
      userRelationshipFoodModel.userId = userId;
      await _fireStoreUserRelationshipFoodCollection
          .doc(foodId)
          .set(userRelationshipFoodModel.toJson());
      return Result.success(userRelationshipFoodModel);
    } on FirebaseException catch (e) {
      return Result.error(e);
    }
  }

  static Future<Result<List<UserRelationshipFoodModel>>> getFoodByDate({
    required String userId,
    required String date,
    required String mealId,
  }) async {
    try {
      QuerySnapshot querySnapshot =
          await _fireStoreUserRelationshipFoodCollection
              .where('userId', isEqualTo: userId)
              .where('createAt', isEqualTo: date)
              // .where('mealId', isEqualTo: mealId)
              .get();

      List<UserRelationshipFoodModel> foodList = querySnapshot.docs
          .map((doc) => UserRelationshipFoodModel.fromJson(
              doc.data() as Map<String, dynamic>))
          .toList();
      return Result.success(foodList);
    } on FirebaseException catch (e) {
      return Result.error(e);
    }
  }

  static Future<Result<void>> delete(String idRelationFood) async {
    try {
      await _fireStoreUserRelationshipFoodCollection
          .doc(idRelationFood)
          .delete();
      return Result.success(null);
    } on FirebaseException catch (e) {
      return Result.error(e);
    }
  }
}

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
}

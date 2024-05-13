import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:fitness_tracker_app/core/data/firebase/model/result.dart';
import 'package:fitness_tracker_app/features/nav_diary/activity/models/user_relationship_activity_model.dart';

class FirestoreUserRelationshipActivity {
  static final _fireStoreUserRelationshipActivityCollection =
      FirebaseFirestore.instance.collection('user_relationship_exercise');

  static Future<Result<UserRelationshipActivityModel>> create(
      {required UserRelationshipActivityModel userRelationshipActivityModel,
      required String userId}) async {
    try {
      String exerciseId = _fireStoreUserRelationshipActivityCollection.doc().id;
      userRelationshipActivityModel.id = exerciseId;
      userRelationshipActivityModel.userId = userId;
      await _fireStoreUserRelationshipActivityCollection
          .doc(exerciseId)
          .set(userRelationshipActivityModel.toJson());
      return Result.success(userRelationshipActivityModel);
    } on FirebaseException catch (e) {
      return Result.error(e);
    }
  }

  static Future<Result<List<UserRelationshipActivityModel>>> getActivityByDate(
      {required String userId, required String date}) async {
    try {
      QuerySnapshot querySnapshot =
          await _fireStoreUserRelationshipActivityCollection
              .where('userId', isEqualTo: userId)
              .where('createAt', isEqualTo: date)
              // .where('mealId', isEqualTo: mealId)
              .get();

      List<UserRelationshipActivityModel> activityList = querySnapshot.docs
          .map((doc) => UserRelationshipActivityModel.fromJson(
              doc.data() as Map<String, dynamic>))
          .toList();
      return Result.success(activityList);
    } on FirebaseException catch (e) {
      return Result.error(e);
    }
  }

  static Future<Result<void>> delete(String idRelationActivity) async {
    try {
      await _fireStoreUserRelationshipActivityCollection
          .doc(idRelationActivity)
          .delete();
      return Result.success(null);
    } on FirebaseException catch (e) {
      return Result.error(e);
    }
  }

  static Future<Result<bool>> update(
      {required UserRelationshipActivityModel userRelationshipActivity}) async {
    try {
      await _fireStoreUserRelationshipActivityCollection
          .doc(userRelationshipActivity.id)
          .update(userRelationshipActivity.toJson());
      return Result.success(true);
    } on FirebaseException catch (e) {
      return Result.error(e);
    }
  }
}

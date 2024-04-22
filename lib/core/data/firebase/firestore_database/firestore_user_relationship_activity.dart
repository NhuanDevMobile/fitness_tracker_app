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
}

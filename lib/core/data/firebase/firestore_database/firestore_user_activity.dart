import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:fitness_tracker_app/core/data/firebase/model/result.dart';
import 'package:fitness_tracker_app/features/nav_diary/activity/models/user_activity_model.dart';

class FirestoreUserActivity {
  static final _fireStoreUserExerciseCollection =
      FirebaseFirestore.instance.collection('user_exercises');

  static Future<Result<UserActivityModel>> create(
      {required UserActivityModel activityModel,
      required String userId}) async {
    try {
      String activityId = _fireStoreUserExerciseCollection.doc().id;
      activityModel.id = activityId;
      activityModel.userId = userId;
      await _fireStoreUserExerciseCollection
          .doc(activityId)
          .set(activityModel.toJson());

      return Result.success(activityModel);
    } on FirebaseException catch (e) {
      return Result.error(e);
    }
  }

  static Future<Result<List<UserActivityModel>>> getListUserActivity(
      String userId) async {
    try {
      QuerySnapshot querySnapshot = await _fireStoreUserExerciseCollection
          .where('userId', isEqualTo: userId)
          .get();

      // Chuyển đổi querySnapshot thành danh sách các đối tượng UserFoodModel
      List<UserActivityModel> foodList = querySnapshot.docs.map((doc) {
        Map<String, dynamic> data = doc.data() as Map<String, dynamic>;
        return UserActivityModel.fromJson(data);
      }).toList();

      return Result.success(foodList);
    } on FirebaseException catch (e) {
      return Result.error(e);
    }
  }
}

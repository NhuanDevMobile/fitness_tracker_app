import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:fitness_tracker_app/core/data/firebase/model/result.dart';
import 'package:fitness_tracker_app/features/nav_diary/activity/models/saved_activity_model.dart';

class FirestoreSavedActivity {
  static final _fireStoreSavedExerciseCollection =
      FirebaseFirestore.instance.collection('saved_exercises');

  static Future<Result<SavedActivityModel>> saved(
      {required SavedActivityModel savedActivityModel,
      required String userId}) async {
    try {
      String activityId = _fireStoreSavedExerciseCollection.doc().id;
      savedActivityModel.id = activityId;
      savedActivityModel.userId = userId;
      await _fireStoreSavedExerciseCollection
          .doc(activityId)
          .set(savedActivityModel.toJson());
      return Result.success(savedActivityModel);
    } on FirebaseException catch (e) {
      return Result.error(e);
    }
  }

  static Future<Result<void>> delete({required String idSavedActivity}) async {
    try {
      await _fireStoreSavedExerciseCollection.doc(idSavedActivity).delete();
      return Result.success(null);
    } on FirebaseException catch (e) {
      return Result.error(e);
    }
  }

  static Future<Result<List<SavedActivityModel>>> getListExerciseByUserId(
      String userId) async {
    try {
      QuerySnapshot querySnapshot = await _fireStoreSavedExerciseCollection
          .where('userId', isEqualTo: userId)
          .get();

      List<SavedActivityModel> activityList = querySnapshot.docs.map((doc) {
        Map<String, dynamic> data = doc.data() as Map<String, dynamic>;
        return SavedActivityModel.fromJson(data);
      }).toList();

      return Result.success(activityList);
    } on FirebaseException catch (e) {
      return Result.error(e);
    }
  }
}

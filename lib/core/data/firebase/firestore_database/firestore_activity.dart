import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:fitness_tracker_app/core/data/firebase/model/result.dart';
import 'package:fitness_tracker_app/features/nav_diary/activity/models/activity_model.dart';

class FirestoreActivity {
  static final _fireStoreFoodCollection =
      FirebaseFirestore.instance.collection('exercises');
  static Future<Result<List<ActivityModel>>> getActivities() async {
    try {
      QuerySnapshot querySnapshot = await _fireStoreFoodCollection.get();

      // Chuyển đổi querySnapshot thành danh sách các đối tượng FoodModel
      List<ActivityModel> foodList = querySnapshot.docs.map((doc) {
        // Thực hiện chuyển đổi kiểu từ Object? sang Map<String, dynamic>
        Map<String, dynamic> data = doc.data() as Map<String, dynamic>;
        return ActivityModel.fromJson(data);
      }).toList();
      return Result.success(foodList);
    } on FirebaseException catch (e) {
      return Result.error(e);
    }
  }
}

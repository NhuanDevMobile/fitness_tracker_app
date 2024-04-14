import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:fitness_tracker_app/core/data/firebase/model/result.dart';
import 'package:fitness_tracker_app/features/nav_diary/foods/model/food_model.dart';

class FirestoreFood {
  static final _fireStoreFoodCollection =
      FirebaseFirestore.instance.collection('foods');
  static Future<Result<List<FoodModel>>> getFoods() async {
    try {
      QuerySnapshot querySnapshot = await _fireStoreFoodCollection.get();

      // Chuyển đổi querySnapshot thành danh sách các đối tượng FoodModel
      List<FoodModel> foodList = querySnapshot.docs.map((doc) {
        // Thực hiện chuyển đổi kiểu từ Object? sang Map<String, dynamic>
        Map<String, dynamic> data = doc.data() as Map<String, dynamic>;
        return FoodModel.fromJson(data);
      }).toList();
      return Result.success(foodList);
    } on FirebaseException catch (e) {
      return Result.error(e);
    }
  }
}

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:fitness_tracker_app/core/data/firebase/model/result.dart';
import 'package:fitness_tracker_app/features/nav_diary/water_drinking/model/water_model.dart';

class FirestoreWater {
  static final _fireStorWaterCollection =
      FirebaseFirestore.instance.collection('water');

  static Future<Result<WaterModel>> addWater({
    required String userId,
    required int quantity,
    required String createAt,
    required String dateTimeDisplay,
  }) async {
    try {
      // Tạo một waterId mới
      String waterId = _fireStorWaterCollection.doc().id;

      // Thêm dữ liệu vào Firestore với waterId
      await _fireStorWaterCollection
          .doc(userId)
          .collection('daily_water')
          .doc(waterId)
          .set({
        'id': waterId, // Thêm waterId vào dữ liệu
        'userId': userId,
        'quantity': quantity,
        'createAt': createAt,
        'dateTimeDisplay': dateTimeDisplay,
      });

      return Result.success(WaterModel(
        id: waterId,
        userId: userId,
        quantity: quantity,
        createAt: DateTime.parse(createAt),
        dateTimeDisplay: DateTime.parse(dateTimeDisplay),
      ));
    } on FirebaseException catch (e) {
      return Result.error(e);
    }
  }

  static Future<Result<List<WaterModel>>> getWaterByUserIdAndDate({
    required String userId,
    required String dateTime,
  }) async {
    try {
      final querySnapshot = await _fireStorWaterCollection
          .doc(userId)
          .collection('daily_water')
          .where('userId', isEqualTo: userId)
          .where('createAt', isEqualTo: dateTime)
          .get();
      final waterList = querySnapshot.docs
          .map((doc) => WaterModel.fromJson(doc.data()))
          .toList();
      return Result.success(waterList);
    } on FirebaseException catch (e) {
      return Result.error(e);
    }
  }

  static Future<Result<void>> deleteWaterById({
    required String userId,
    required String waterId,
  }) async {
    try {
      await _fireStorWaterCollection
          .doc(userId)
          .collection('daily_water')
          .doc(waterId)
          .delete();
      return Result.success(null);
    } on FirebaseException catch (e) {
      return Result.error(e);
    }
  }
}

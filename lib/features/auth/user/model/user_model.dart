import 'package:fitness_tracker_app/core/configs/enum.dart';
import 'package:fitness_tracker_app/core/utils/calculator_utils.dart';

class UserModel {
  final String? uid;
  final String? email;
  final String? displayName;
  final String? createdAt;
  final String? updateAt;
  final String? gender;
  final int? height;
  final int? weight;
  final int? age;
  final double? bmi;
  final String? resultBMIvalue;
  late String? option1;
  late String? option2;
  late String? option3;
  late String? option4;
  late String? option5;
  late String? option6;
  late String? option7;
  late String? option8;
  late String? option9;
  final bool? isComplete;

  UserModel({
    this.uid,
    this.email,
    this.displayName,
    this.createdAt,
    this.updateAt,
    this.gender,
    this.height,
    this.weight,
    this.age,
    this.bmi,
    this.resultBMIvalue,
    this.option1,
    this.option2,
    this.option3,
    this.option4,
    this.option5,
    this.option6,
    this.option7,
    this.option8,
    this.option9,
    this.isComplete,
  });

  // Factory constructor để tạo một User từ một Map (JSON)
  factory UserModel.fromJson(Map<String, dynamic> map) => UserModel(
        uid: map['uid'],
        email: map['email'],
        displayName: map['displayName'],
        createdAt: map['createdAt'],
        updateAt: map['updateAt'],
        gender: map['gender'],
        height: map['height'],
        weight: map['weight'],
        age: map['age'],
        bmi: map['bmi'],
        resultBMIvalue: map['resultBMIvalue'],
        option1: map['option1'],
        option2: map['option2'],
        option3: map['option3'],
        option4: map['option4'],
        option5: map['option5'],
        option6: map['option6'],
        option7: map['option7'],
        option8: map['option8'],
        option9: map['option9'],
        isComplete: map['isComplete'] ?? false,
      );

  // Phương thức để chuyển đổi User thành một Map (JSON)
  Map<String, dynamic> toJson() {
    return {
      'uid': uid,
      'email': email,
      'displayName': displayName,
      'createdAt': createdAt ?? DateTime.now().toString(),
      'updateAt': updateAt,
      'gender': gender,
      'height': height,
      'weight': weight,
      'age': age,
      'bmi': bmi,
      'resultBMIvalue': resultBMIvalue,
      'option1': option1,
      'option2': option2,
      'option3': option3,
      'option4': option4,
      'option5': option5,
      'option6': option6,
      'option7': option7,
      'option8': option8,
      'option9': option9,
      'isComplete': isComplete,
    };
  }

  double acitityValue() {
    if (option1 == "Rất ít vận động (Hệ số 1.2)") {
      return 1.2;
    } else if (option1 == "Vận động nhẹ nhàng (Hệ số 1.375)") {
      return 1.375;
    } else if (option1 == "Vận động linh hoạt (Hệ số 1.55)") {
      return 1.55;
    } else if (option1 == "Vận động tích cực (Hệ số 1.725)") {
      return 1.75;
    } else {
      return 1.9;
    }
  }

  int getKcal() {
    if (weight == null || height == null || age == null || gender == null) {
      return 0;
    } else {
      double dailyEnergyIntake = CalculatorUtils.calculateDailyEnergyIntake(
        weightInKg: weight!.toDouble(),
        heightInCm: height!.toDouble(),
        age: age!,
        gender: gender!,
        activityLevel: acitityValue(),
      );
      // Chuyển đổi kết quả từ double sang int
      int kcalInt = dailyEnergyIntake.toInt();
      return kcalInt;
    }
  }

  double getWater() {
    if (weight == null) return 0;
    return double.parse(
        CalculatorUtils.calculateDailyWaterIntake(weight!).toStringAsFixed(2));
  }

  int getDailyMeal({required DailyMeals dailyMeals}) {
    double mealKcal = 0;

    if (getKcal() == 0) {
      mealKcal = 0;
    } else {
      if (dailyMeals == DailyMeals.breakfast) {
        mealKcal = getKcal() * 0.25;
      } else if (dailyMeals == DailyMeals.lunch) {
        mealKcal = getKcal() * 0.35;
      } else if (dailyMeals == DailyMeals.dinner) {
        mealKcal = getKcal() * 0.3;
      } else {
        mealKcal = getKcal() * 0.1;
      }
    }
    return mealKcal.toInt();
  }
}

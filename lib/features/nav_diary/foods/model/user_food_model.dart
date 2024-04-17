class UserFoodModel {
  String? id;
  String? userId;
  String? photoUrl;
  String? foodName;
  int? servingQty;
  String? servingUnit;
  double? nfCalories;
  double? nfProtein;
  double? nfTotalCarbohydrate;
  double? nfTotalFat;
  double? nfCholesterol;
  double? nfSodium;
  double? nfCanxi;

  UserFoodModel({
    this.id,
    this.photoUrl,
    this.foodName,
    this.servingQty,
    this.servingUnit,
    this.nfCalories,
    this.nfProtein,
    this.nfTotalCarbohydrate,
    this.nfTotalFat,
    this.nfCholesterol,
    this.nfSodium,
    this.nfCanxi,
    this.userId,
  });

  factory UserFoodModel.fromJson(Map<String, dynamic> json) => UserFoodModel(
        id: json["id"],
        userId: json["userId"],
        photoUrl: json["photoUrl"],
        foodName: json["foodName"],
        servingQty: json["servingQty"],
        servingUnit: json["servingUnit"],
        nfCalories: json["nfCalories"]?.toDouble(),
        nfProtein: json["nfProtein"]?.toDouble(),
        nfTotalCarbohydrate: json["nfTotalCarbohydrate"]?.toDouble(),
        nfTotalFat: json["nfTotalFat"]?.toDouble(),
        nfCholesterol: json["nfCholesterol"]?.toDouble(),
        nfSodium: json["nfSodium"]?.toDouble(),
        nfCanxi: json["nfCanxi"]?.toDouble(),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "userId": userId,
        "photoUrl": photoUrl,
        "foodName": foodName,
        "servingQty": servingQty,
        "servingUnit": servingUnit,
        "nfCalories": nfCalories,
        "nfProtein": nfProtein,
        "nfTotalCarbohydrate": nfTotalCarbohydrate,
        "nfTotalFat": nfTotalFat,
        "nfCholesterol": nfCholesterol,
        "nfSodium": nfSodium,
        "nfCanxi": nfCanxi,
      };
  String descriptionFood() {
    return '$servingQty $servingUnit, ${nfCalories!.toStringAsFixed(1)} Kcal';
  }
}

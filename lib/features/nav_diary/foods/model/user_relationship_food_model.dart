class UserRelationshipFoodModel {
  String? id;
  String? userId;
  String? createAt;
  String? foodName;
  String? photoUrl;
  int? servingQty;
  String? servingUnit;
  int? mealId;
  double? nfCalories;
  double? nfTotalFat;
  double? nfTotalCarbohydrate;
  double? nfProtein;

  UserRelationshipFoodModel({
    this.id,
    this.userId,
    this.createAt,
    this.foodName,
    this.photoUrl,
    this.servingQty,
    this.servingUnit,
    this.mealId,
    this.nfCalories,
    this.nfProtein,
    this.nfTotalCarbohydrate,
    this.nfTotalFat,
  });

  factory UserRelationshipFoodModel.fromJson(Map<String, dynamic> json) =>
      UserRelationshipFoodModel(
        id: json["id"],
        userId: json["userId"],
        createAt: json["createAt"],
        foodName: json["foodName"],
        photoUrl: json["photoUrl"],
        servingQty: json["servingQty"],
        servingUnit: json["servingUnit"],
        mealId: json["mealId"],
        nfCalories: json["nfCalories"]?.toDouble(),
        nfProtein: json["nfProtein"]?.toDouble(),
        nfTotalCarbohydrate: json["nfTotalCarbohydrate"]?.toDouble(),
        nfTotalFat: json["nfTotalFat"]?.toDouble(),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "userId": userId,
        "createAt": createAt,
        "foodName": foodName,
        "photoUrl": photoUrl,
        "servingQty": servingQty,
        "servingUnit": servingUnit,
        "mealId": mealId,
        "nfCalories": nfCalories,
        "nfProtein": nfProtein,
        "nfTotalCarbohydrate": nfTotalCarbohydrate,
        "nfTotalFat": nfTotalFat,
      };
  String getNameFood() {
    return "$servingQty $foodName";
  }

  String getKcalFood() {
    return "$nfCalories Kcal";
  }

  String getDescriptionFood() {
    return "$servingQty $servingUnit, $nfCalories Calo";
  }
}

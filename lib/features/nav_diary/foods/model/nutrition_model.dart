class NutritionModel {
  int? id;
  int? servingQty;
  String? category;
  String? name;
  String? unit;
  int? value;

  NutritionModel({
    this.id,
    this.servingQty,
    this.category,
    this.name,
    this.unit,
    this.value,
  });

  factory NutritionModel.fromJson(Map<String, dynamic> json) => NutritionModel(
        id: json["id"],
        servingQty: json["serving_qty"],
        category: json["category"],
        name: json["name"],
        unit: json["unit"],
        value: json["value"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "serving_qty": servingQty,
        "category": category,
        "name": name,
        "unit": unit,
        "value": value,
      };
}

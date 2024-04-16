class FoodModel {
  String? foodName;
  dynamic brandName;
  int? servingQty;
  String? servingUnit;
  double? servingWeightGrams;
  double? nfCalories;
  double? nfTotalFat;
  double? nfSaturatedFat;
  double? nfCholesterol;
  double? nfSodium;
  double? nfTotalCarbohydrate;
  double? nfDietaryFiber;
  double? nfSugars;
  double? nfProtein;
  double? nfPotassium;
  double? nfP;
  List<FullNutrient>? fullNutrients;
  dynamic nixBrandName;
  dynamic nixBrandId;
  dynamic nixItemName;
  dynamic nixItemId;
  dynamic upc;
  DateTime? consumedAt;
  Metadata? metadata;
  int? source;
  int? ndbNo;
  Tags? tags;
  List<AltMeasure>? altMeasures;
  dynamic lat;
  dynamic lng;
  int? mealType;
  Photo? photo;
  dynamic subRecipe;
  dynamic classCode;
  dynamic brickCode;
  dynamic tagId;

  FoodModel({
    this.foodName,
    this.brandName,
    this.servingQty,
    this.servingUnit,
    this.servingWeightGrams,
    this.nfCalories,
    this.nfTotalFat,
    this.nfSaturatedFat,
    this.nfCholesterol,
    this.nfSodium,
    this.nfTotalCarbohydrate,
    this.nfDietaryFiber,
    this.nfSugars,
    this.nfProtein,
    this.nfPotassium,
    this.nfP,
    this.fullNutrients,
    this.nixBrandName,
    this.nixBrandId,
    this.nixItemName,
    this.nixItemId,
    this.upc,
    this.consumedAt,
    this.metadata,
    this.source,
    this.ndbNo,
    this.tags,
    this.altMeasures,
    this.lat,
    this.lng,
    this.mealType,
    this.photo,
    this.subRecipe,
    this.classCode,
    this.brickCode,
    this.tagId,
  });

  factory FoodModel.fromJson(Map<String, dynamic> json) => FoodModel(
        foodName: json["food_name"],
        brandName: json["brand_name"],
        servingQty: json["serving_qty"],
        servingUnit: json["serving_unit"],
        servingWeightGrams: json["serving_weight_grams"]?.toDouble(),
        nfCalories: json["nf_calories"]?.toDouble(),
        nfTotalFat: json["nf_total_fat"]?.toDouble(),
        nfSaturatedFat: json["nf_saturated_fat"]?.toDouble(),
        nfCholesterol: json["nf_cholesterol"]?.toDouble(),
        nfSodium: json["nf_sodium"]?.toDouble(),
        nfTotalCarbohydrate: json["nf_total_carbohydrate"]?.toDouble(),
        nfDietaryFiber: json["nf_dietary_fiber"]?.toDouble(),
        nfSugars: json["nf_sugars"]?.toDouble(),
        nfProtein: json["nf_protein"]?.toDouble(),
        nfPotassium: json["nf_potassium"]?.toDouble(),
        nfP: json["nf_p"]?.toDouble(),
        fullNutrients: json["full_nutrients"] == null
            ? []
            : List<FullNutrient>.from(
                json["full_nutrients"]!.map((x) => FullNutrient.fromJson(x))),
        nixBrandName: json["nix_brand_name"],
        nixBrandId: json["nix_brand_id"],
        nixItemName: json["nix_item_name"],
        nixItemId: json["nix_item_id"],
        upc: json["upc"],
        consumedAt: json["consumed_at"] == null
            ? null
            : DateTime.parse(json["consumed_at"]),
        metadata: json["metadata"] == null
            ? null
            : Metadata.fromJson(json["metadata"]),
        source: json["source"],
        ndbNo: json["ndb_no"],
        tags: json["tags"] == null ? null : Tags.fromJson(json["tags"]),
        altMeasures: json["alt_measures"] == null
            ? []
            : List<AltMeasure>.from(
                json["alt_measures"]!.map((x) => AltMeasure.fromJson(x))),
        lat: json["lat"],
        lng: json["lng"],
        mealType: json["meal_type"],
        photo: json["photo"] == null ? null : Photo.fromJson(json["photo"]),
        subRecipe: json["sub_recipe"],
        classCode: json["class_code"],
        brickCode: json["brick_code"],
        tagId: json["tag_id"],
      );

  Map<String, dynamic> toJson() => {
        "food_name": foodName,
        "brand_name": brandName,
        "serving_qty": servingQty,
        "serving_unit": servingUnit,
        "serving_weight_grams": servingWeightGrams,
        "nf_calories": nfCalories,
        "nf_total_fat": nfTotalFat,
        "nf_saturated_fat": nfSaturatedFat,
        "nf_cholesterol": nfCholesterol,
        "nf_sodium": nfSodium,
        "nf_total_carbohydrate": nfTotalCarbohydrate,
        "nf_dietary_fiber": nfDietaryFiber,
        "nf_sugars": nfSugars,
        "nf_protein": nfProtein,
        "nf_potassium": nfPotassium,
        "nf_p": nfP,
        "full_nutrients": fullNutrients == null
            ? []
            : List<dynamic>.from(fullNutrients!.map((x) => x.toJson())),
        "nix_brand_name": nixBrandName,
        "nix_brand_id": nixBrandId,
        "nix_item_name": nixItemName,
        "nix_item_id": nixItemId,
        "upc": upc,
        "consumed_at": consumedAt?.toIso8601String(),
        "metadata": metadata?.toJson(),
        "source": source,
        "ndb_no": ndbNo,
        "tags": tags?.toJson(),
        "alt_measures": altMeasures == null
            ? []
            : List<dynamic>.from(altMeasures!.map((x) => x.toJson())),
        "lat": lat,
        "lng": lng,
        "meal_type": mealType,
        "photo": photo?.toJson(),
        "sub_recipe": subRecipe,
        "class_code": classCode,
        "brick_code": brickCode,
        "tag_id": tagId,
      };

  String descriptionFood() {
    return '$servingQty $servingUnit, ${servingWeightGrams}g, ${nfCalories!.toStringAsFixed(1)} Kcal';
  }
}

class AltMeasure {
  double? servingWeight;
  String? measure;
  int? seq;
  int? qty;

  AltMeasure({
    this.servingWeight,
    this.measure,
    this.seq,
    this.qty,
  });

  factory AltMeasure.fromJson(Map<String, dynamic> json) => AltMeasure(
        servingWeight: json["serving_weight"]?.toDouble(),
        measure: json["measure"],
        seq: json["seq"],
        qty: json["qty"],
      );

  Map<String, dynamic> toJson() => {
        "serving_weight": servingWeight,
        "measure": measure,
        "seq": seq,
        "qty": qty,
      };
}

class FullNutrient {
  int? attrId;
  double? value;

  FullNutrient({
    this.attrId,
    this.value,
  });

  factory FullNutrient.fromJson(Map<String, dynamic> json) => FullNutrient(
        attrId: json["attr_id"],
        value: json["value"]?.toDouble(),
      );

  Map<String, dynamic> toJson() => {
        "attr_id": attrId,
        "value": value,
      };
}

class Metadata {
  bool? isRawFood;

  Metadata({
    this.isRawFood,
  });

  factory Metadata.fromJson(Map<String, dynamic> json) => Metadata(
        isRawFood: json["is_raw_food"],
      );

  Map<String, dynamic> toJson() => {
        "is_raw_food": isRawFood,
      };
}

class Photo {
  String? thumb;
  String? highres;
  bool? isUserUploaded;

  Photo({
    this.thumb,
    this.highres,
    this.isUserUploaded,
  });

  factory Photo.fromJson(Map<String, dynamic> json) => Photo(
        thumb: json["thumb"],
        highres: json["highres"],
        isUserUploaded: json["is_user_uploaded"],
      );

  Map<String, dynamic> toJson() => {
        "thumb": thumb,
        "highres": highres,
        "is_user_uploaded": isUserUploaded,
      };
}

class Tags {
  String? item;
  dynamic measure;
  String? quantity;
  int? foodGroup;
  int? tagId;

  Tags({
    this.item,
    this.measure,
    this.quantity,
    this.foodGroup,
    this.tagId,
  });

  factory Tags.fromJson(Map<String, dynamic> json) => Tags(
        item: json["item"],
        measure: json["measure"],
        quantity: json["quantity"],
        foodGroup: json["food_group"],
        tagId: json["tag_id"],
      );

  Map<String, dynamic> toJson() => {
        "item": item,
        "measure": measure,
        "quantity": quantity,
        "food_group": foodGroup,
        "tag_id": tagId,
      };
}

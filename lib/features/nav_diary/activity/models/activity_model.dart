class ActivityModel {
  int? tagId;
  bool? isSuggest;
  dynamic benefits;
  String? userInput;
  int? durationMin;
  int? compendiumCode;
  double? met;
  dynamic description;
  Photo? photo;
  String? name;
  double? nfCalories;

  ActivityModel({
    this.tagId,
    this.isSuggest,
    this.benefits,
    this.userInput,
    this.durationMin,
    this.compendiumCode,
    this.met,
    this.description,
    this.photo,
    this.name,
    this.nfCalories,
  });

  factory ActivityModel.fromJson(Map<String, dynamic> json) => ActivityModel(
        tagId: json["tag_id"],
        isSuggest: json["isSuggest"],
        benefits: json["benefits"],
        userInput: json["user_input"],
        durationMin: json["duration_min"],
        compendiumCode: json["compendium_code"],
        met: json["met"]?.toDouble(),
        description: json["description"],
        photo: json["photo"] == null ? null : Photo.fromJson(json["photo"]),
        name: json["name"],
        nfCalories: json["nf_calories"]?.toDouble(),
      );

  Map<String, dynamic> toJson() => {
        "tag_id": tagId,
        "isSuggest": isSuggest,
        "benefits": benefits,
        "user_input": userInput,
        "duration_min": durationMin,
        "compendium_code": compendiumCode,
        "met": met,
        "description": description,
        "photo": photo?.toJson(),
        "name": name,
        "nf_calories": nfCalories,
      };
}

class Photo {
  String? highres;
  String? thumb;
  bool? isUserUploaded;

  Photo({
    this.highres,
    this.thumb,
    this.isUserUploaded,
  });

  factory Photo.fromJson(Map<String, dynamic> json) => Photo(
        highres: json["highres"],
        thumb: json["thumb"],
        isUserUploaded: json["is_user_uploaded"],
      );

  Map<String, dynamic> toJson() => {
        "highres": highres,
        "thumb": thumb,
        "is_user_uploaded": isUserUploaded,
      };
}

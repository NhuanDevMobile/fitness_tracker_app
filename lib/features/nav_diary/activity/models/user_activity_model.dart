class UserActivityModel {
  String? id;
  String? userId;
  String? photoUrl;
  String? name;
  int? duration;
  double? calories;

  UserActivityModel({
    this.id,
    this.photoUrl,
    this.userId,
    this.duration,
    this.name,
    this.calories,
  });

  factory UserActivityModel.fromJson(Map<String, dynamic> json) =>
      UserActivityModel(
        id: json["id"],
        userId: json["userId"],
        photoUrl: json["photoUrl"],
        name: json["name"],
        duration: json["duration"],
        calories: json["calories"]?.toDouble(),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "userId": userId,
        "photoUrl": photoUrl,
        "name": name,
        "duration": duration,
        "calories": calories,
      };
}

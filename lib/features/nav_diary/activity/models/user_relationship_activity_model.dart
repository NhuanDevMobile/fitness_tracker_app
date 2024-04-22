class UserRelationshipActivityModel {
  String? id;
  String? userId;
  String? createAt;
  String? exerciseName;
  String? photoUrl;
  int? duration;
  double? nfCalories;

  UserRelationshipActivityModel({
    this.id,
    this.userId,
    this.createAt,
    this.exerciseName,
    this.photoUrl,
    this.duration,
    this.nfCalories,
  });

  factory UserRelationshipActivityModel.fromJson(Map<String, dynamic> json) =>
      UserRelationshipActivityModel(
        id: json["id"],
        userId: json["userId"],
        createAt: json["createAt"],
        exerciseName: json["exerciseName"],
        photoUrl: json["photoUrl"],
        duration: json["duration"],
        nfCalories: json["nfCalories"]?.toDouble(),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "userId": userId,
        "createAt": createAt,
        "exerciseName": exerciseName,
        "photoUrl": photoUrl,
        "duration": duration,
        "nfCalories": nfCalories,
      };
}

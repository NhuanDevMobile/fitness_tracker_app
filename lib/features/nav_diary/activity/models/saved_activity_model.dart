import 'package:fitness_tracker_app/features/nav_diary/activity/models/activity_model.dart';

class SavedActivityModel {
  String? id;
  String? userId;
  ActivityModel? activityModel;
  String? createAt;

  SavedActivityModel({this.id, this.userId, this.createAt, this.activityModel});

  factory SavedActivityModel.fromJson(Map<String, dynamic> json) =>
      SavedActivityModel(
        id: json["id"],
        userId: json["userId"],
        createAt: json["createAt"],
        activityModel: ActivityModel.fromJson(json["activityModel"]),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "userId": userId,
        "createAt": createAt,
        "activityModel": activityModel!.toJson(),
      };
}

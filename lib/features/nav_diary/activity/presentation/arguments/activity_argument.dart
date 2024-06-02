import 'package:fitness_tracker_app/features/nav_diary/activity/models/activity_model.dart';
import 'package:fitness_tracker_app/features/nav_diary/activity/models/user_relationship_activity_model.dart';

class ActivityArgument {
  List<ActivityModel> listActivity;
  List<UserRelationshipActivityModel> listActivityRelationship;
  DateTime dateTime;
  double kcal;
  ActivityArgument({
    required this.listActivity,
    required this.dateTime,
    required this.listActivityRelationship,
    this.kcal = 0,
  });
}

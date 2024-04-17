import 'package:fitness_tracker_app/core/configs/prefs_constants.dart';
import 'package:fitness_tracker_app/core/data/prefs/prefs.dart';

class SaveTimeScheduleUseCase {
  final Prefs _prefs;

  SaveTimeScheduleUseCase(this._prefs);

  Future saveTimeSchedule(int time) async {
    _prefs.setInt(PrefsConstants.timeSchedule, time);
  }
}

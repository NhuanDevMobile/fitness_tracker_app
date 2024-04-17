import 'package:fitness_tracker_app/core/configs/prefs_constants.dart';
import 'package:fitness_tracker_app/core/data/prefs/prefs.dart';

class GetTimeScheduleUseCase {
  final Prefs _prefs;

  GetTimeScheduleUseCase(this._prefs);

  Future<int?> getTimeSchedule() async {
    final timer = await _prefs.getInt(PrefsConstants.timeSchedule);
    return timer;
  }
}

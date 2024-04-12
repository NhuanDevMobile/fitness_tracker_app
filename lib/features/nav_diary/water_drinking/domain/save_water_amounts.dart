import 'package:fitness_tracker_app/core/configs/prefs_constants.dart';
import 'package:fitness_tracker_app/core/data/prefs/prefs.dart';

class SaveWaterAmountsUseCase {
  final Prefs _prefs;

  SaveWaterAmountsUseCase(this._prefs);

  Future saveWaterAmounts(List<int> waterAmounts) async {
    _prefs.set(PrefsConstants.waterAmounts, waterAmounts);
  }
}

import 'dart:convert';

import 'package:fitness_tracker_app/core/configs/prefs_constants.dart';
import 'package:fitness_tracker_app/core/data/prefs/prefs.dart';

class GetWaterAmountsUseCase {
  final Prefs _prefs;

  GetWaterAmountsUseCase(this._prefs);

  Future<List<int>> getWaterAmounts() async {
    final waterJson = await _prefs.getObject(PrefsConstants.waterAmounts);
    if (waterJson.isEmpty) {
      return [100, 200, 300, 400, 500];
    }
    return List<int>.from(json.decode(waterJson));
  }
}

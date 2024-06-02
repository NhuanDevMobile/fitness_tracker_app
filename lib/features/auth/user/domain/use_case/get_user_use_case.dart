import 'dart:convert';

import 'package:fitness_tracker_app/core/configs/prefs_constants.dart';
import 'package:fitness_tracker_app/core/data/prefs/prefs.dart';
import 'package:fitness_tracker_app/features/auth/user/model/user_model.dart';

class GetuserUseCase {
  final Prefs _prefs;

  GetuserUseCase(this._prefs);

  Future<UserModel?> getUser() async {
    final tokenJson = await _prefs.getObject(PrefsConstants.user);
    if (tokenJson.isEmpty) {
      return null;
    }
    return UserModel.fromJson(json.decode(tokenJson));
  }
}

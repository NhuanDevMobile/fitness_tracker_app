import 'package:fitness_tracker_app/core/configs/prefs_constants.dart';
import 'package:fitness_tracker_app/core/data/prefs/prefs.dart';
import 'package:fitness_tracker_app/features/auth/user/model/user_model.dart';

class SaveUserUseCase {
  final Prefs _prefs;

  SaveUserUseCase(this._prefs);

  Future saveUser(UserModel user) async {
    _prefs.set(PrefsConstants.user, user);
  }
}

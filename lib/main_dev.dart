import 'package:fitness_tracker_app/app.dart';
import 'package:fitness_tracker_app/app_config.dart';
import 'package:flutter/material.dart';

import 'flavors.dart';

Future<void> main() async {
  await appConfig();
  F.appFlavor = Flavor.dev;
  runApp(const App());
}

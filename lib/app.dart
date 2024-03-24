import 'package:fitness_tracker_app/app_binding.dart';
import 'package:fitness_tracker_app/core/lang/translation_service.dart';
import 'package:fitness_tracker_app/core/routes/pages.dart';
import 'package:fitness_tracker_app/core/utils/behavior.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class App extends StatelessWidget {
  const App({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      initialRoute: Pages.initial,
      scrollBehavior: MyBehavior(),
      getPages: Pages.routes,
      initialBinding: AppBinding(),
      locale: LocalizationService.locale,
      fallbackLocale: LocalizationService.fallbackLocale,
      translations: LocalizationService(),
    );
  }
}

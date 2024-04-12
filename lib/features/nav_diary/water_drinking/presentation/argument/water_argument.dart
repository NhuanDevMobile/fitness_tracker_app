import 'package:fitness_tracker_app/features/nav_diary/water_drinking/model/water_model.dart';

class WaterArgument {
  final List<WaterModel> waterDiarys;
  final int consumedWater;
  final double recommendedWater;
  WaterArgument(
      {required this.waterDiarys,
      required this.consumedWater,
      required this.recommendedWater});
}

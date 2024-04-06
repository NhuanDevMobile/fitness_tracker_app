import 'package:fitness_tracker_app/core/configs/app_colors.dart';
import 'package:fitness_tracker_app/core/configs/app_dimens.dart';
import 'package:fitness_tracker_app/core/configs/enum.dart';
import 'package:fitness_tracker_app/core/ui/widgets/text/text_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:syncfusion_flutter_gauges/gauges.dart';

class BMIGaugeWidget extends StatelessWidget {
  final double bmi;
  final String resultBMI;
  final TypeBMIGauge? typeBMIGauge;
  const BMIGaugeWidget({
    super.key,
    required this.bmi,
    required this.resultBMI,
    this.typeBMIGauge = TypeBMIGauge.linear,
  });

  @override
  Widget build(BuildContext context) {
    return typeBMIGauge == TypeBMIGauge.linear
        ? SizedBox(
            width: double.infinity,
            child: SfLinearGauge(
              minorTicksPerInterval: 4,
              showTicks: false,
              animateAxis: true,
              axisTrackStyle: const LinearAxisTrackStyle(thickness: 1),
              minimum: 0,
              maximum: 40,
              labelOffset: 6,
              interval: 10,
              markerPointers: [
                LinearWidgetPointer(
                    value: bmi, // Giá trị bạn muốn hiển thị marker
                    position: LinearElementPosition.outside,
                    offset: 5, // Độ dời của marker
                    child: Stack(
                      children: [
                        SvgPicture.asset(
                          "assets/icons/ic_marker_BMI.svg",
                          height: 40.0,
                          width: 40.0,
                          color: getMarkerColor(bmi),
                        ),
                        Positioned.fill(
                          child: Center(
                            child: TextWidget(
                              text: resultBMI,
                              size: AppDimens.textSize12,
                              color: AppColors.white,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                        ),
                      ],
                    )),
              ],
              ranges: const <LinearGaugeRange>[
                LinearGaugeRange(
                  startValue: 0,
                  endValue: 18.4,
                  position: LinearElementPosition.outside,
                  color: Color(0xFF84CDEE),
                ),
                LinearGaugeRange(
                  startValue: 18.5,
                  endValue: 24.9,
                  position: LinearElementPosition.outside,
                  color: AppColors.primary,
                ),
                LinearGaugeRange(
                    startValue: 25.0,
                    endValue: 29.9,
                    position: LinearElementPosition.outside,
                    color: Color(0xFFFFDF32)),
                LinearGaugeRange(
                    startValue: 30.0,
                    endValue: 40.0,
                    position: LinearElementPosition.outside,
                    color: AppColors.error),
              ],
            ),
          )
        : SizedBox(
            height: 250,
            width: 250,
            child: SfRadialGauge(
              axes: <RadialAxis>[
                RadialAxis(
                  minimum: 0,
                  maximum: 40,
                  ranges: <GaugeRange>[
                    GaugeRange(
                      startValue: 0,
                      endValue: 18.4,
                      color: const Color(0xFF84CDEE),
                      sizeUnit: GaugeSizeUnit.factor,
                      label: "sdfsfds",
                      startWidth: 0.45,
                      endWidth: 0.45,
                    ),
                    GaugeRange(
                      startValue: 18.5,
                      endValue: 24.9,
                      color: AppColors.primary,
                      sizeUnit: GaugeSizeUnit.factor,
                      startWidth: 0.45,
                      endWidth: 0.45,
                    ),
                    GaugeRange(
                      startValue: 25.0,
                      endValue: 29.9,
                      color: const Color(0xFFFFDF32),
                      sizeUnit: GaugeSizeUnit.factor,
                      startWidth: 0.45,
                      endWidth: 0.45,
                    ),
                    GaugeRange(
                      startValue: 30.0,
                      endValue: 40.0,
                      color: AppColors.error,
                      sizeUnit: GaugeSizeUnit.factor,
                      startWidth: 0.45,
                      endWidth: 0.45,
                    ),
                  ],
                  pointers: <GaugePointer>[
                    NeedlePointer(
                      value: bmi,
                      needleColor: Colors.black,
                      enableAnimation: true,
                      animationType: AnimationType.ease,
                      needleLength: 0.7,
                      needleStartWidth: 1,
                      needleEndWidth: 5,
                      knobStyle: const KnobStyle(
                        knobRadius: 0.1,
                        sizeUnit: GaugeSizeUnit.factor,
                      ),
                    ),
                  ],
                ),
              ],
            ),
          );
  }

  Color getMarkerColor(double bmi) {
    if (bmi < 18.5) {
      return const Color(0xFF84CDEE);
    } else if (bmi >= 18.5 && bmi < 25) {
      return AppColors.primary;
    } else if (bmi >= 25 && bmi < 30) {
      return const Color(0xFFFFDF32);
    } else {
      return const Color(0xFFF5554A);
    }
  }
}

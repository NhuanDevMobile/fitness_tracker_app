import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class BannerAdMobDisplay extends StatefulWidget {
  const BannerAdMobDisplay({super.key});

  @override
  State<BannerAdMobDisplay> createState() => _BannerAdmoState();
}

class _BannerAdmoState extends State<BannerAdMobDisplay> {
  @override
  Widget build(BuildContext context) {
    return SizedBox(
        width: double.infinity,
        child: SvgPicture.asset("assets/images/img_banner_admod.svg"));
  }
}

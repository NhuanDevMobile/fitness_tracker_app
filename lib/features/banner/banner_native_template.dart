import 'package:flutter/material.dart';

class BannerNaviveTemplate extends StatefulWidget {
  const BannerNaviveTemplate({super.key});

  @override
  State<BannerNaviveTemplate> createState() => _BannerNaviveTemplateState();
}

class _BannerNaviveTemplateState extends State<BannerNaviveTemplate> {
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 16.0),
      height: 250.0,
      decoration: const BoxDecoration(
        image: DecorationImage(
          image: AssetImage('assets/images/img_banner_navite_small.png'),
          fit: BoxFit.fill,
        ),
      ),
    );
  }
}

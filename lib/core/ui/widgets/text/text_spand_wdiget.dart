import 'package:fitness_tracker_app/core/configs/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class TextSpanWidget extends StatelessWidget {
  final String text1;
  final String text2;
  final double size;
  final FontWeight fontWeight2;
  const TextSpanWidget({
    super.key,
    required this.text1,
    required this.text2,
    this.size = 16.0,
    this.fontWeight2 = FontWeight.normal,
  });

  @override
  Widget build(BuildContext context) {
    return RichText(
      text: TextSpan(
        style: GoogleFonts.nunitoSans(
          textStyle: TextStyle(
            fontSize: size,
            overflow: TextOverflow.ellipsis,
            color: AppColors.black,
          ),
        ),
        children: [
          TextSpan(
            text: text1,
            style: GoogleFonts.nunitoSans(
              textStyle: TextStyle(
                fontSize: size,
                overflow: TextOverflow.ellipsis,
              ),
            ),
          ),
          const TextSpan(text: " "),
          TextSpan(
            text: text2,
            style: GoogleFonts.nunitoSans(
              textStyle: TextStyle(
                  fontSize: size,
                  overflow: TextOverflow.ellipsis,
                  fontWeight: fontWeight2),
            ),
          ),
        ],
      ),
    );
  }
}

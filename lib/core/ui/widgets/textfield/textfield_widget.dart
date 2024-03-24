import 'package:flutter/material.dart';

import '../../../configs/app_colors.dart';
import '../../../configs/app_dimens.dart';

class TextFieldWidget extends StatelessWidget {
  final double height;
  final Color? hintColor;
  final String? hintText;
  final bool? obscureText;
  final Color? backgroundColor;
  final Color? focusedColor;
  final double? focusedWidth;
  final Color? enableColor;
  final double? enableWidth;
  final IconButton? suffixIcon;
  final IconButton? prefixIcon;
  final Function? onChanged;
  final Function? onCompleted;
  final Color? textColor;
  final Function()? onTap;
  final FocusNode? focusNode;
  final String? labelText;
  final TextEditingController? controller;
  final TextInputType keyboardType;

  const TextFieldWidget(
      {Key? key,
      this.height = 55.0,
      this.onChanged,
      this.suffixIcon,
      this.prefixIcon,
      this.obscureText = false,
      this.backgroundColor,
      this.focusedWidth = 0,
      this.enableWidth = 0,
      this.controller,
      this.hintText,
      this.hintColor,
      this.focusedColor = AppColors.grey,
      this.enableColor = AppColors.grey,
      this.onTap,
      this.focusNode,
      this.labelText,
      this.textColor,
      this.keyboardType = TextInputType.text,
      this.onCompleted})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: height,
      child: TextField(
        controller: controller,
        onChanged: (String valueOnChanged) {
          if (onChanged != null) onChanged!(valueOnChanged);
        },
        onSubmitted: (String value) {
          if (onCompleted != null) onCompleted!(value);
        },
        obscureText: obscureText!,
        focusNode: focusNode,
        enabled: true,
        cursorColor: AppColors.primary,
        keyboardType: keyboardType,
        // style: GoogleFonts.poppins(
        //   color: AppColors.blackColor,
        //   fontWeight: FontWeight.w500,
        //   fontSize: AppDimens.textSize16,
        // ),
        decoration: InputDecoration(
          fillColor: backgroundColor ?? AppColors.primary.withOpacity(0.1),
          filled: true,
          contentPadding: const EdgeInsets.only(
            left: 15.0,
          ),
          labelText: labelText,
          labelStyle: const TextStyle(
              color: AppColors.black, fontSize: AppDimens.textSize16),
          suffixIcon: suffixIcon,
          prefixIcon: prefixIcon,
          hintText: hintText,
          hintStyle: TextStyle(
              fontSize: AppDimens.textSize16,
              color: hintColor ?? AppColors.primary),
          enabledBorder: OutlineInputBorder(
            borderSide: BorderSide.none,
            borderRadius: BorderRadius.circular(10.0),
          ),
          focusedBorder: OutlineInputBorder(
            borderSide: BorderSide.none,
            borderRadius: BorderRadius.circular(10.0),
          ),
        ),
      ),
    );
  }
}

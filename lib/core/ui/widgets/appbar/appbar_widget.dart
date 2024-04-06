import 'package:fitness_tracker_app/core/configs/app_dimens.dart';
import 'package:fitness_tracker_app/core/ui/widgets/text/text_widget.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class AppBarWidget extends StatelessWidget implements PreferredSizeWidget {
  final double? height;
  final String? title;
  final List<Widget>? actions;
  final Color backgroundColor;
  final VoidCallback? onTapIconAction;
  final Widget? leading;
  final bool? centerTitle;
  final VoidCallback? callbackLeading;

  const AppBarWidget(
      {Key? key,
      this.height = 40,
      this.title,
      this.actions,
      this.backgroundColor = Colors.transparent,
      this.onTapIconAction,
      this.leading,
      this.centerTitle = false,
      this.callbackLeading})
      : super(key: key);

  @override
  Size get preferredSize => Size.fromHeight(height!);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: backgroundColor,
      elevation: 0.0,
      centerTitle: centerTitle,
      title: title != null
          ? TextWidget(
              text: title!,
              fontWeight: FontWeight.w600,
              size: AppDimens.textSize18,
            )
          : const SizedBox.shrink(),
      titleSpacing: 0.0,
      leading: leading ??
          InkWell(
            onTap: callbackLeading ?? () => Get.back(),
            child: const Padding(
                padding:
                    EdgeInsets.only(top: 4.0, left: 4.0, bottom: 4.0, right: 0),
                child: Icon(
                  Icons.arrow_back_ios_new,
                  color: Colors.black,
                )),
          ),
      actions: actions ?? [],
    );
  }
}

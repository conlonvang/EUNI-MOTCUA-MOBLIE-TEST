import 'package:euni_core_ui/euni_core_ui.dart';
import 'package:flutter/material.dart';

import '../../apps/constants/colors.const.dart';
import 'HAlert/h_text.dart';

class HeaderWidgetEuni extends StatelessWidget implements PreferredSizeWidget {
  final String title;
  final Color backgroundColor;
  final Widget? leading;
  final List<Widget>? actions;
  final IconData? iconRight;
  final Function()? onIconRightTap;

  const HeaderWidgetEuni({
    super.key,
    required this.title,
    required this.backgroundColor,
    this.leading,
    this.actions,
    this.iconRight,
    this.onIconRightTap,
  });

  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: backgroundColor,
      centerTitle: true,
      leading: leading,
      actions: [
        if (actions != null) ...actions!,
        if (iconRight != null)
          IconButton(
            icon: Icon(
              iconRight,
              size: 24.sp,
              color: AppColors.basicWhiteColor,
            ),
            onPressed: onIconRightTap,
          ),
      ],
      elevation: 0,
      title: HText(
        text: title,
        style: TextStyle(
          fontWeight: FontWeight.bold,
          fontSize: 20.sp,
          color: AppColors.basicWhiteColor,
        ),
      ),
    );
  }

  @override
  Size get preferredSize => Size.fromHeight(72.h);
}

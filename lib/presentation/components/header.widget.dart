import 'package:euni_core_ui/euni_core_ui.dart';
import 'package:flutter/material.dart';

import '../../apps/constants/colors.const.dart';

class HeaderWidget extends StatelessWidget implements PreferredSizeWidget {
  final String title;
  final Icon? icon;
  final void Function()? onPressed;
  final Icon? rightIcon;
  final void Function()? onRightIconPressed;
  final Color backgroundColor;

  const HeaderWidget({
    super.key,
    required this.title,
    this.icon,
    this.onPressed,
    this.rightIcon,
    this.onRightIconPressed,
    required this.backgroundColor,
  });

  @override
  Widget build(BuildContext context) {
    return AppBar(
      toolbarHeight: 55.h,
      elevation: 1,
      backgroundColor: backgroundColor,
      centerTitle: true,
      leading: IconButton(
        onPressed: onPressed ?? () => context.pop(),
        icon: icon ??
            Icon(
              Icons.arrow_back_ios,
              color: AppColors.basicWhiteColor,
              size: 25.sp,
            ),
      ),
      title: Text(
        title,
        style: TextStyle(color: AppColors.basicWhiteColor, fontSize: 20.sp),
      ),
      actions: [
        if (rightIcon != null)
          IconButton(
            icon: rightIcon!,
            onPressed: onRightIconPressed,
          ),
      ],
    );
  }

  @override
  Size get preferredSize => Size.fromHeight(72.h);
}

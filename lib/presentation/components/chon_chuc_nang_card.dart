import 'package:euni_core_ui/euni_core_ui.dart';
import 'package:flutter/material.dart';

import '../../apps/constants/colors.const.dart';

class ChonChucNangCard extends StatelessWidget {
  final String textTitle;
  final String textContent;
  final Function()? onTap;
  const ChonChucNangCard({
    super.key,
    required this.textTitle,
    required this.textContent,
    this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: ClipRRect(
        borderRadius: BorderRadius.circular(20.sp),
        child: Container(
          height: 120.h,
          width: 400.w,
          decoration: BoxDecoration(
            color: AppColors.cardColor,
            borderRadius: BorderRadius.circular(20.sp),
          ),
          child: Stack(
            children: [
              Positioned(
                top: -60.h,
                right: -30.w,
                child: Container(
                  height: 150.h,
                  width: 250.w,
                  decoration: const BoxDecoration(
                    color: AppColors.overlayCardColor1,
                    shape: BoxShape.circle,
                  ),
                ),
              ),
              Positioned(
                top: -20.h,
                right: -70.w,
                bottom: -1,
                child: Container(
                  height: 150.h,
                  width: 150.w,
                  decoration: const BoxDecoration(
                    color: AppColors.overlayCardColor2,
                    shape: BoxShape.circle,
                  ),
                ),
              ),
              Padding(
                padding: EdgeInsets.only(left: 20.w, top: 20.h),
                child: SingleChildScrollView(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        textTitle,
                        textAlign: TextAlign.start,
                        style: TextStyle(color: AppColors.basicWhiteColor, fontSize: 20.sp),
                        overflow: TextOverflow.visible,
                        softWrap: true,
                      ),
                      SizedBox(
                        height: 10.h,
                      ),
                      Text(
                        textContent,
                        textAlign: TextAlign.start,
                        style: TextStyle(color: AppColors.basicWhiteColor, fontSize: 18.sp, fontStyle: FontStyle.italic),
                        overflow: TextOverflow.visible,
                        softWrap: true,
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
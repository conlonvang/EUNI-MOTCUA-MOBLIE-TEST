import 'package:euni_core_ui/euni_core_ui.dart';
import 'package:flutter/material.dart';

import '../../../../apps/configs/injection.dart';
import '../../../../apps/configs/service_location.dart';
import '../../../../apps/constants/colors.const.dart';
import '../../../../routers/routes.name.dart';
import '../../../components/chon_chuc_nang_card.dart';
import '../../../components/header_screen.dart';

class ChonChucNangCTDT extends StatelessWidget {
  const ChonChucNangCTDT({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          HeaderWidgetEuni(
            title: 'Chương trình đào tạo',
            backgroundColor: AppColors.primaryBackgroundColor,
            leading: IconButton(
              icon: Icon(
                Icons.arrow_back_ios,
                color: AppColors.basicWhiteColor,
                size: 24.sp,
              ),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
          ),
          SizedBox(
            height: 20.h,
          ),
          Padding(
            padding: const EdgeInsets.all(20),
            child: Column(
              children: [
                Text(
                  'Vui lòng chọn chức năng chương trình đào tạo',
                  style: TextStyle(
                      color:AppColors.textTitleCCN,
                      fontSize: 20.sp),
                ),
                SizedBox(
                  height: 30.h,
                ),
                ChonChucNangCard(
                  textTitle: 'Chương trình đào tạo',
                  textContent: 'Sinh viên xem chương trình đào tạo theo học kỳ',
                  onTap: () {
                    getIt<NavigationService>().toNamed(RouteConfigName.CHUONGTRINHDAOTAO);
                  },
                ),
                SizedBox(
                  height: 20.h,
                ),
                ChonChucNangCard(
                  textTitle: 'Môn học tự chọn',
                  textContent: 'Xem các môn tự chọn',
                  onTap: () {
                    getIt<NavigationService>().toNamed(RouteConfigName.MON_HOC_TU_CHON);
                  },
                ),
                SizedBox(
                  height: 20.h,
                ),
                ChonChucNangCard(
                  textTitle: 'Thống kê',
                  textContent: 'Thống kê các môn mà sinh viên đã học',
                  onTap: () {
                    getIt<NavigationService>().toNamed(RouteConfigName.THONG_KE_CTDT);
                  },
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}
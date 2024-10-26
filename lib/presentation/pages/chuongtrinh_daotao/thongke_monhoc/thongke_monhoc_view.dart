import 'package:euni_core_ui/euni_core_ui.dart';
import 'package:flutter/material.dart';

import '../../../../apps/constants/colors.const.dart';
import '../../../../data/repositories/thongkemonhoc_euni_api_datasource.dart';
import 'bang_thong_ke.dart';
import 'bieu_do_thong_ke.dart';
import 'cubit/thongke_monhoc_cubit.dart';

class ThongKeView extends StatefulWidget {
  const ThongKeView({super.key});

  @override
  State<ThongKeView> createState() => _ThongKeViewState();
}

class _ThongKeViewState extends State<ThongKeView> {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      initialIndex: 1,
      length: 2,
      child: BlocProvider(
        create: (context) => ThongKeMonHocCubit(ThongKeMonHocEuniApiDataSource())..fetchThongKeMonHoc(),
        child: Scaffold(
          appBar: AppBar(
            toolbarHeight: 55.h,
            elevation: 1,
            backgroundColor: AppColors.primaryBackgroundColor,
            centerTitle: true,
            leading: IconButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              icon: Icon(
                Icons.arrow_back_ios,
                color: AppColors.basicWhiteColor,
                size: 25.sp,
              ),
            ),
            title: Text(
              'Thống kê',
              style: TextStyle(
                color: AppColors.basicWhiteColor,
                fontSize: 20.sp,
                fontWeight: FontWeight.bold,
              ),
            ),
            bottom: PreferredSize(
              preferredSize: Size.fromHeight(50.h),
              child: Container(
                color: AppColors.primaryBackgroundColor,
                child: TabBar(
                  isScrollable: false,
                  labelPadding: EdgeInsets.zero,
                  tabs: <Widget>[
                    Container(
                      width: MediaQuery.of(context).size.width / 2,
                      child: Tab(
                        child: Text(
                          'Biểu đồ thống kê',
                          textAlign: TextAlign.left,
                          style: TextStyle(
                            color: AppColors.basicWhiteColor,
                            fontSize: 15.sp,
                          ),
                        ),
                      ),
                    ),
                    Container(
                      width: MediaQuery.of(context).size.width / 2,
                      child: Tab(
                        child: Center(
                          child: Text(
                            'Bảng thống kê',
                            textAlign: TextAlign.left,
                            style: TextStyle(
                              color: AppColors.basicWhiteColor,
                              fontSize: 15.sp,
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                  indicatorSize: TabBarIndicatorSize.label,
                  indicator: BoxDecoration(
                    border: Border(
                      bottom: BorderSide(
                        color: AppColors.basicWhiteColor,
                        width: 4.0.w,
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ),
          body: const TabBarView(
            children: <Widget>[
              BieuDoThongKeView(),
              BangThongKe(),
            ],
          ),
        ),
      ),
    );
  }
}

import 'package:euni_core_ui/euni_core_ui.dart';
import 'package:flutter/material.dart';
import '../../../apps/constants/colors.const.dart';
import '../../../data/repositories/thoikhoabieu.repository.dart';
import '../../../data/repositories/thoikhoabieuhocky.repository.dart';
import 'cubit/thoi_khoa_bieu_cubit.dart';
import 'hocky/thoi_khoa_bieu_hoc_ky/thoi_khoa_bieu_hoc_ky_cubit.dart';
import 'hocky/thoikhoabieu_hocky.dart';
import 'ngay/thoikhoabieu_ngay.dart';
import 'thang/thoikhoabieu_thang.dart';
import 'tuan/thoikhoabieu_tuan.dart';

class ThoiKhoaBieuView extends StatefulWidget {
  const ThoiKhoaBieuView({super.key});

  @override
  State<ThoiKhoaBieuView> createState() => _ThoiKhoaBieuViewState();
}

class _ThoiKhoaBieuViewState extends State<ThoiKhoaBieuView> {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 4,
      initialIndex: 0,
      child: Scaffold(
        appBar: AppBar(
          toolbarHeight: 55.0,
          elevation: 1,
          backgroundColor: AppColors.primaryBackgroundColor,
          centerTitle: true,
          leading: IconButton(
            onPressed: () => Navigator.of(context).pop(),
            icon:  Icon(Icons.arrow_back_ios, color: AppColors.basicWhiteColor, size: 25.0.sp),
          ),
          title:  Text(
            'Thời khóa biểu',
            style: TextStyle(
              color: AppColors.basicWhiteColor,
              fontSize: 20.0.sp,
              fontWeight: FontWeight.bold,
            ),
          ),
          bottom: PreferredSize(
            preferredSize: const Size.fromHeight(50.0),
            child: Container(
              color: AppColors.primaryBackgroundColor,
              child:  TabBar(
                tabs: const [
                  Tab(text: 'Ngày'),
                  Tab(text: 'Tuần'),
                  Tab(text: 'Tháng'),
                  Tab(text: 'Học kỳ'),
                ],
                indicatorSize: TabBarIndicatorSize.label,
                indicator: BoxDecoration(
                  border: Border(
                    bottom: BorderSide(color: AppColors.basicWhiteColor, width: 4.0.w),
                  ),
                ),
                labelColor: AppColors.basicWhiteColor,
                unselectedLabelColor: AppColors.basicWhiteColor,
                labelStyle: const TextStyle(fontWeight: FontWeight.bold),
                unselectedLabelStyle: const TextStyle(fontWeight: FontWeight.normal),
              ),
            ),
          ),
        ),
        body: MultiBlocProvider(
          providers: [
            BlocProvider(
              create: (context) => ThoiKhoaBieuCubit(ThoiKhoaBieuRepository())..fetchXemThoiKhoaBieu(0),
            ),
            BlocProvider(
              create: (context) => ThoiKhoaBieuHocKyCubit(ThoiKhoaBieuHocKyRepository())..fetchXemThoiKhoaBieuHocKy(null),
            ),
          ],
          child: const TabBarView(
            children: [
              ThoiKhoaBieuNgay(),
              ThoiKhoaBieuTuan(),
              ThoiKhoaBieuThang(),
              ThoiKhoaBieuHocKy(),
            ],
          ),
        ),
      ),
    );
  }
}

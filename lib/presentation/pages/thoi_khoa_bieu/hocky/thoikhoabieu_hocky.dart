import 'package:euni_core_ui/euni_core_ui.dart';
import 'package:euni_daotao_mobile/apps/constants/colors.const.dart';
import 'package:flutter/material.dart';
import '../../../components/customExpandedTile.dart' as custom;
import '../../../../domain/entities/thoi_khoa_bieu/thoi_khoa_bieu_hoc_ky/hocky.entity.dart';
import 'thoi_khoa_bieu_hoc_ky/thoi_khoa_bieu_hoc_ky_cubit.dart';

class ThoiKhoaBieuHocKy extends StatelessWidget {
  const ThoiKhoaBieuHocKy({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocBuilder<ThoiKhoaBieuHocKyCubit, ThoiKhoaBieuHocKyState>(
        builder: (context, state) {
          if (state.isLoading) {
            return const Center(child: CircularProgressIndicator());
          }

          final hocKies = state.dataThoiKhoaBieuHocKy.source?.hocKies ?? [];
          if (hocKies.isEmpty) {
            return const Center(child: Text('Không có dữ liệu học kỳ'));
          }

          return Column(
            children: [
              InkWell(
                onTap: () {
                  _showBottomSheet(context, hocKies, (selectedHocKy) {
                    context.read<ThoiKhoaBieuHocKyCubit>().updateSelectedHocKy(selectedHocKy);
                    context.read<ThoiKhoaBieuHocKyCubit>().fetchXemThoiKhoaBieuHocKy(selectedHocKy.value);
                  });
                },
                child: Container(
                  margin: const EdgeInsets.symmetric(
                    horizontal: 17,
                    vertical: 12,
                  ),
                  width: double.infinity,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "Chọn học kỳ:",
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontFamily: "UTMAvo",
                          fontSize: 14.sp,
                        ),
                      ),
                      SizedBox(height: 12.h),
                      Row(
                        children: <Widget>[
                          Expanded(
                            child: Text(
                              state.selectedHocKy?.text ?? state.dataThoiKhoaBieuHocKy.source?.hocKies?.first.text ?? 'Chọn học kỳ',
                            ),
                          ),
                          Icon(
                            Icons.keyboard_arrow_down,
                            color: const Color(0xFF0F0F0F),
                            size: 24.sp,
                          ),
                        ],
                      ),
                      SizedBox(height: 10.h),
                      Divider(height: 1.h, color: Colors.grey),
                      SizedBox(height: 20.h),
                      Text(
                        "Danh sách môn học:",
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontFamily: "UTMAvo",
                          fontSize: 14.sp,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              Expanded(
                child: Container(
                  margin: EdgeInsets.symmetric(horizontal: 17.w),
                  child: ListView.builder(
                    itemCount: state.dataThoiKhoaBieuHocKy.source?.thoiKhoaBieuMonHocsHocKy?.length ?? 0,
                    itemBuilder: (context, index) {
                      final monHoc = state.dataThoiKhoaBieuHocKy.source!.thoiKhoaBieuMonHocsHocKy?[index];
                      return Padding(
                        padding: EdgeInsets.only(bottom: 10.h),
                        child: custom.ExpansionTile1(
                          initiallyExpanded: false,
                          headerBackgroundColor: const Color(0xff5E35B1),
                          nameSubject: monHoc?.tenMon,
                          pointNumber: monHoc?.maMon,
                          children: <Widget>[
                            Container(
                              padding: EdgeInsets.only(top: 6.h, bottom: 3.h),
                              decoration: BoxDecoration(
                                color: const Color(0xff5E35B1).withOpacity(0.1),
                                borderRadius: const BorderRadius.only(
                                  bottomRight: Radius.circular(20),
                                  bottomLeft: Radius.circular(20),
                                ),
                              ),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: <Widget>[
                                  Container(
                                    margin: const EdgeInsets.fromLTRB(17, 2, 17, 8),
                                    child: Column(
                                      crossAxisAlignment: CrossAxisAlignment.start,
                                      children: <Widget>[
                                        Row(
                                          crossAxisAlignment: CrossAxisAlignment.start,
                                          children: [
                                            SizedBox(
                                              width: 140.w,
                                              child: Text(
                                                'Mã nhóm:',
                                                style: TextStyle(color: AppColors.basicBlackColor, fontSize: 14.sp),
                                              ),
                                            ),
                                            Expanded(
                                              child: Text(
                                                monHoc?.nhomTo ?? 'Cố định',
                                                style: TextStyle(color: AppColors.basicBlackColor, fontSize: 14.sp),
                                              ),
                                            ),
                                          ],
                                        ),
                                        SizedBox(height: 8.h),
                                        Row(
                                          crossAxisAlignment: CrossAxisAlignment.start,
                                          children: [
                                            SizedBox(
                                              width: 140.w,
                                              child: Text(
                                                'Mã lớp:',
                                                style: TextStyle(color: AppColors.basicBlackColor, fontSize: 14.sp),
                                              ),
                                            ),
                                            Expanded(
                                              child: Text(
                                                monHoc?.lop ?? 'Không có',
                                                style: TextStyle(color: AppColors.basicBlackColor, fontSize: 14.sp),
                                              ),
                                            ),
                                          ],
                                        ),
                                        SizedBox(height: 8.h),
                                        Row(
                                          crossAxisAlignment: CrossAxisAlignment.start,
                                          children: [
                                            SizedBox(
                                              width: 140.w,
                                              child: Text(
                                                'Số tín chỉ:',
                                                style: TextStyle(color: AppColors.basicBlackColor, fontSize: 14.sp),
                                              ),
                                            ),
                                            Expanded(
                                              child: Text(
                                                '${monHoc?.soTinChi ?? 0}',
                                                style: TextStyle(color: AppColors.basicBlackColor, fontSize: 14.sp),
                                              ),
                                            ),
                                          ],
                                        ),
                                        SizedBox(height: 8.h),
                                        Row(
                                          crossAxisAlignment: CrossAxisAlignment.start,
                                          children: [
                                            SizedBox(
                                              width: 140.w,
                                              child: Text(
                                                'Giảng viên:',
                                                style: TextStyle(color: AppColors.basicBlackColor, fontSize: 14.sp),
                                              ),
                                            ),
                                            Expanded(
                                              child: Text(
                                                monHoc?.giangVien ?? 'Không có',
                                                style: TextStyle(color: AppColors.basicBlackColor, fontSize: 14.sp),
                                              ),
                                            ),
                                          ],
                                        ),
                                        SizedBox(height: 8.h),
                                        Row(
                                          crossAxisAlignment: CrossAxisAlignment.start,
                                          children: [
                                            SizedBox(
                                              width: 140.w,
                                              child: Text(
                                                'Thời gian học:',
                                                style: TextStyle(color: AppColors.basicBlackColor, fontSize: 14.sp),
                                              ),
                                            ),
                                            Expanded(
                                              child: Column(
                                                crossAxisAlignment: CrossAxisAlignment.start,
                                                children: [
                                                  for (var chiTiet in monHoc?.chiTietLichHocs ?? [])
                                                    Padding(
                                                      padding: EdgeInsets.only(bottom: 8.h),
                                                      child: Column(
                                                        crossAxisAlignment: CrossAxisAlignment.start,
                                                        children: [
                                                          Text(
                                                            'Thứ ${chiTiet.thu} - Phòng: ${chiTiet.phong}',
                                                            style: TextStyle(color: AppColors.basicBlackColor, fontSize: 13.sp),
                                                          ),
                                                          Text(
                                                            'Tiết bắt đầu: ${chiTiet.tietBatDau}',
                                                            style: TextStyle(color: AppColors.basicBlackColor, fontSize: 13.sp),
                                                          ),
                                                          Text(
                                                            'Thời gian: ${chiTiet.thoiGianHoc}',
                                                            style: TextStyle(color: AppColors.basicBlackColor, fontSize: 13.sp),
                                                          ),
                                                        ],
                                                      ),
                                                    ),
                                                ],
                                              ),
                                            ),
                                          ],
                                        )
                                      ],
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      );
                    },
                  ),
                ),
              ),
            ],
          );
        },
      ),
    );
  }

  void _showBottomSheet(BuildContext context, List<HocKy> hocKies, Function(HocKy selectedHocKy) onHocKySelected) {
    showModalBottomSheet(
      context: context,
      backgroundColor: Colors.transparent,
      isScrollControlled: true,
      builder: (BuildContext buildContext) {
        return SafeArea(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              const Spacer(),
              Container(
                height: 52.h,
                width: double.infinity,
                decoration: const BoxDecoration(
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(20),
                    topRight: Radius.circular(20),
                  ),
                  color: Color(0xFFF2F2F2),
                ),
                child: Stack(
                  children: <Widget>[
                    Center(
                      child: Text(
                        "Chọn học kỳ",
                        style: TextStyle(
                          fontWeight: FontWeight.w800,
                          fontFamily: "UTMAvo",
                          fontSize: 14.sp,
                        ),
                      ),
                    ),
                    Positioned(
                      right: 18,
                      top: 9,
                      child: InkWell(
                        onTap: () {
                          Navigator.of(context).pop();
                        },
                        child: Container(
                          height: 24.h,
                          width: 24.w,
                          decoration: BoxDecoration(
                            color: AppColors.basicWhiteColor,
                            borderRadius: BorderRadius.circular(12),
                          ),
                          child: const Icon(
                            Icons.close,
                            color: AppColors.basicBlackColor,
                          ),
                        ),
                      ),
                    )
                  ],
                ),
              ),
              Expanded(
                child: Container(
                  color: AppColors.basicWhiteColor,
                  child: ListView.separated(
                    padding: const EdgeInsets.only(bottom: 5),
                    itemBuilder: (buildContext, index) {
                      final hocKy = hocKies[index];
                      return InkWell(
                        onTap: () {
                          Navigator.of(context).pop();
                          onHocKySelected(hocKy);
                        },
                        child: Container(
                          height: 51.h,
                          width: double.infinity,
                          color: AppColors.basicWhiteColor,
                          child: Center(
                            child: Text(
                              hocKy.text ?? "",
                              style: TextStyle(
                                fontSize: 14.sp,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                        ),
                      );
                    },
                    separatorBuilder: (_, __) {
                      return Container(
                        height: 1.h,
                      );
                    },
                    itemCount: hocKies.length,
                  ),
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}

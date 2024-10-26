import 'package:euni_core_ui/euni_core_ui.dart';
import 'package:euni_daotao_mobile/presentation/pages/xem_diem/cubit/xem_diem_cubit.dart';
import 'package:flutter/material.dart';

import '../../../../apps/constants/colors.const.dart';
import '../../../../data/repositories/xemdiem.repository.dart';
import '../../../components/customExpandedTile.dart' as custom;
import '../../../components/header_screen.dart';
import '../../../components/shimmer_load.dart';

class XemDiemChiTietView extends StatefulWidget {
  final int index;
  const XemDiemChiTietView({super.key, required this.index});

  @override
  State<XemDiemChiTietView> createState() => _XemDiemChiTietViewState();
}

class _XemDiemChiTietViewState extends State<XemDiemChiTietView> {
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => XemDiemCubit(XemDiemRepository())..fetchXemDiem(),
      child: BlocBuilder<XemDiemCubit, XemDiemSate>(
        builder: (context, state) {
          if (state.dataXemDiem.sources == null) {
            return ShimmerLoading();
          }
          final source = state.dataXemDiem.sources![widget.index];
          if (source.tongKetDiems == null) {
            return ShimmerLoading();
          }
          return Scaffold(
            body: Column(
              children: [
                HeaderWidgetEuni(
                  title: source.title ?? "",
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
                SizedBox(height: 10.h),
                Container(
                  height: 150.sp,
                  margin: EdgeInsets.symmetric(horizontal: 17.w),
                  padding: const EdgeInsets.fromLTRB(16, 18, 16, 10),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20),
                    color: Colors.white,
                    boxShadow: [
                      BoxShadow(
                        color: const Color(0xFF5A5A5A).withOpacity(0.3),
                        blurRadius: 5,
                        offset: const Offset(0, 0),
                      ),
                    ],
                  ),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      _contentCard("Điểm trung bình tích lũy hệ 4: ", source.tongKetDiems![0].value),
                      _contentCard("Số tín chỉ tích lũy: ", source.tongKetDiems![1].value),
                      _contentCard("Điểm rèn luyện: ", source.tongKetDiems![2].value),
                    ],
                  ),
                ),
                Expanded(
                  child: Container(
                    margin: EdgeInsets.symmetric(horizontal: 17.w),
                    child: ListView.builder(
                      itemCount: source.diemMonHocs?.length ?? 0,
                      itemBuilder: (context, ind) {
                        final monHoc = source.diemMonHocs![ind];
                        return Padding(
                          padding: EdgeInsets.only(bottom: 10.h),
                          child: custom.ExpansionTile1(
                            initiallyExpanded: false,
                            headerBackgroundColor: const Color(0xff5E35B1),
                            nameSubject: monHoc.tenMon,
                            pointNumber: monHoc.diemTongKetSoHe4,
                            point: monHoc.diemTongKetChu,
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
                                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                            children: [
                                              Text(
                                                'Mã môn: ',
                                                style: TextStyle(color: Colors.black, fontSize: 14.sp),
                                              ),
                                              Text(
                                                '${monHoc.maMon}',
                                                style: TextStyle(color: Colors.black, fontSize: 14.sp),
                                              ),
                                              const Spacer(),
                                              Text(
                                                'Số TC: ',
                                                style: TextStyle(color: Colors.black, fontSize: 14.sp),
                                              ),
                                              Text(
                                                '${monHoc.soTinChi}',
                                                style: TextStyle(color: Colors.black, fontSize: 14.sp),
                                              ),
                                            ],
                                          ),
                                        ],
                                      ),
                                    ),
                                    Container(
                                      margin: const EdgeInsets.fromLTRB(17, 6, 17, 8),
                                      child: Column(
                                        children: List.generate(monHoc.diemThanhPhans?.length ?? 0, (index) {
                                          final diemTP = monHoc.diemThanhPhans![index];
                                          return Row(
                                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                            children: <Widget>[
                                              Text(
                                                "${diemTP.tenThanhPhan}: ",
                                                style: TextStyle(color: Colors.black, fontSize: 14.sp),
                                              ),
                                              Text(
                                                diemTP.diemThanhPhan ?? '',
                                                style: TextStyle(color: Colors.black, fontSize: 14.sp),
                                              ),
                                            ],
                                          );
                                        }),
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
            ),
          );
        },
      ),
    );
  }

  Widget _contentCard(String title, String? content) {
    String content0 = content ?? "";
    if (content0.trim().toLowerCase() == "trung bình khá") {
      content0 = "TB Khá";
    }

    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(title, style: TextStyle(fontSize: 13.sp, fontFamily: "UTMAvo", fontWeight: FontWeight.w500, color: Colors.black87)),
        Padding(
          padding: const EdgeInsets.only(right: 15.0),
          child: Text(content0, style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold, fontSize: 13.sp)),
        ),
      ],
    );
  }
}

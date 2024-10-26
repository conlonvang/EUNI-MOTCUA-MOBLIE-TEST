import 'package:euni_core_ui/euni_core_ui.dart';
import 'package:euni_daotao_mobile/data/repositories/hocphi.repository.dart';
import 'package:euni_daotao_mobile/presentation/pages/hoc_phi/cubit/hoc_phi_cubit.dart';
import 'package:flutter/material.dart';

import '../../../apps/constants/colors.const.dart';
import '../../components/header_screen.dart';
import '../../components/customExpandedTile.dart' as custom;
import '../../components/shimmer_load.dart';

class HocPhiView extends StatefulWidget {
  const HocPhiView({super.key});

  @override
  State<HocPhiView> createState() => _HocPhiViewState();
}

class _HocPhiViewState extends State<HocPhiView> {
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => HocPhiCubit(HocPhiRepository())..fetchXemHocPhi(),
      child: BlocBuilder<HocPhiCubit, HocPhiState>(
        builder: (context, state) {
          if (state.dataHocPhi.source == null) {
            return ShimmerLoading();
          }
          final source = state.dataHocPhi.source;
          return SafeArea(
            top: false,
            child: Scaffold(
              body: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  HeaderWidgetEuni(
                    title: "Học phí",
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
                    height: 220.sp,
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
                        _contentCard("Tổng học phí: ", source?.calculateHocPhi!.hocPhiChuaGiam),
                        _contentCard("Miễn giảm: ", source?.calculateHocPhi!.mienGiam),
                        _contentCard("Phải thu: ", source?.calculateHocPhi!.phaiThu),
                        _contentCard("Đã thu: ", source?.calculateHocPhi!.daThu),
                        _contentCard("Còn nợ: ", source?.calculateHocPhi!.conNo),
                      ],
                    ),
                  ),
                  SizedBox(height: 16.h),
                  Padding(
                    padding: EdgeInsets.only(left: 17.w, bottom: 20.h),
                    child: Text(
                      "Học phí theo kỳ: ",
                      style: TextStyle(
                        fontSize: 16.sp,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                  Expanded(
                    child: Container(
                      margin: EdgeInsets.symmetric(horizontal: 17.w),
                      child: ListView.builder(
                        itemCount: source?.hocPhis?.length ?? 0,
                        itemBuilder: (context, ind) {
                          final hocPhi = source?.hocPhis![ind];
                          return Padding(
                            padding: EdgeInsets.only(bottom: 10.h),
                            child: custom.ExpansionTile1(
                              initiallyExpanded: false,
                              headerBackgroundColor: const Color(0xff5E35B1),
                              nameSubject: hocPhi?.hocKy,
                              point: hocPhi?.hocPhiChuaGiam,
                              children: <Widget>[
                                Container(
                                  padding: EdgeInsets.only(top: 6.h, bottom: 3.h),
                                  decoration: BoxDecoration(
                                    color: Colors.white,
                                    borderRadius: const BorderRadius.only(
                                      bottomRight: Radius.circular(20),
                                      bottomLeft: Radius.circular(20),
                                    ),
                                    border: Border.all(
                                      color: Colors.black,
                                    ),
                                  ),
                                  child: Column(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: <Widget>[
                                      Container(
                                        margin: const EdgeInsets.fromLTRB(17, 2, 17, 8),
                                        child: Padding(
                                          padding: EdgeInsets.only(right: 20.w),
                                          child: Column(
                                            crossAxisAlignment: CrossAxisAlignment.start,
                                            children: <Widget>[
                                              Row(
                                                children: [
                                                  Text(
                                                    'Học phí: ',
                                                    style: TextStyle(color: Colors.black, fontSize: 14.sp),
                                                  ),
                                                  const Spacer(),
                                                  Text(
                                                    '${hocPhi?.hocPhiChuaGiam} ₫',
                                                    style: TextStyle(color: Colors.black, fontSize: 14.sp),
                                                  ),
                                                ],
                                              ),
                                              Row(
                                                children: [
                                                  Text(
                                                    'Miễn giảm: ',
                                                    style: TextStyle(color: Colors.black, fontSize: 14.sp),
                                                  ),
                                                  const Spacer(),
                                                  Text(
                                                    '${hocPhi?.mienGiam} ₫',
                                                    style: TextStyle(color: Colors.black, fontSize: 14.sp),
                                                  ),
                                                ],
                                              ),
                                              Row(
                                                children: [
                                                  Text(
                                                    'Phải thu: ',
                                                    style: TextStyle(color: Colors.black, fontSize: 14.sp),
                                                  ),
                                                  const Spacer(),
                                                  Text(
                                                    '${hocPhi?.phaiThu} ₫',
                                                    style: TextStyle(color: Colors.black, fontSize: 14.sp),
                                                  ),
                                                ],
                                              ),
                                              Row(
                                                children: [
                                                  Text(
                                                    'Đã thu: ',
                                                    style: TextStyle(color: Colors.black, fontSize: 14.sp),
                                                  ),
                                                  const Spacer(),
                                                  Text(
                                                    '${hocPhi?.daThu} ₫',
                                                    style: TextStyle(color: Colors.black, fontSize: 14.sp),
                                                  ),
                                                ],
                                              ),
                                              Row(
                                                children: [
                                                  Text(
                                                    'Còn nợ: ',
                                                    style: TextStyle(color: Colors.black, fontSize: 14.sp),
                                                  ),
                                                  const Spacer(),
                                                  Text(
                                                    '${hocPhi?.conNo} ₫',
                                                    style: TextStyle(color: Colors.black, fontSize: 14.sp),
                                                  ),
                                                ],
                                              ),
                                            ],
                                          ),
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
            ),
          );
        },
      ),
    );
  }

  Widget _contentCard(String title, String? content) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(title, style: TextStyle(fontSize: 13.sp, fontFamily: "UTMAvo", fontWeight: FontWeight.w500, color: Colors.black87)),
        Padding(
          padding: const EdgeInsets.only(right: 15.0),
          child: Text('$content ₫', style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold, fontSize: 13.sp)),
        ),
      ],
    );
  }
}

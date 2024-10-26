import 'package:euni_core_ui/euni_core_ui.dart';
import 'package:euni_daotao_mobile/data/repositories/xemdiem.repository.dart';
import 'package:euni_daotao_mobile/presentation/pages/xem_diem/cubit/xem_diem_cubit.dart';
import 'package:euni_daotao_mobile/presentation/pages/xem_diem/xemdiem_monhoc/xemdiem_monhoc_view.dart';
import 'package:flutter/material.dart';
import '../../../apps/constants/colors.const.dart';
import '../../components/header_screen.dart';
import 'xemdiem_chitiet/xemdiem_chitiet_view.dart';

class XemDiemView extends StatefulWidget {
  const XemDiemView({super.key});

  @override
  State<XemDiemView> createState() => _XemDiemViewState();
}

class _XemDiemViewState extends State<XemDiemView> {
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => XemDiemCubit(XemDiemRepository())..fetchXemDiem(),
      child: BlocBuilder<XemDiemCubit, XemDiemSate>(
        builder: (context, state) {
          return Scaffold(
            body: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                HeaderWidgetEuni(
                  title: 'Xem điểm',
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
                  iconRight: Icons.tune,
                  onIconRightTap: () {
                    showSearchDialog(context);
                  },
                ),
                SizedBox(height: 5.h),
                Padding(
                  padding: EdgeInsets.only(left: 15.w, top: 5.h),
                  child: const Text('Danh sách học kỳ:'),
                ),
                SizedBox(height: 10.h),
                Expanded(
                  child: SingleChildScrollView(
                    child: Column(
                      children: List.generate(state.dataXemDiem.sources?.length ?? 0, (index) {
                        final source = state.dataXemDiem.sources?[index];
                        return GestureDetector(
                          onTap: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) {
                                  return XemDiemChiTietView(index: index);
                                },
                              ),
                            );
                          },
                          child: Container(
                            height: 42,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(20),
                              color: const Color.fromARGB(255, 203, 203, 203).withOpacity(0.7),
                            ),
                            margin: const EdgeInsets.symmetric(horizontal: 17, vertical: 5),
                            padding: const EdgeInsets.symmetric(horizontal: 13),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: <Widget>[
                                Expanded(
                                  child: Text(
                                    '${source?.title}',
                                    style: TextStyle(
                                      color: Colors.black,
                                      fontSize: 14.sp,
                                      fontWeight: FontWeight.w500,
                                      fontFamily: "UTMAvo",
                                    ),
                                  ),
                                ),
                                SizedBox(width: 10.0.h),
                                Icon(
                                  Icons.arrow_forward_ios,
                                  size: 12.sp,
                                  color: const Color(0xFF58595B),
                                )
                              ],
                            ),
                          ),
                        );
                      }),
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

  void showSearchDialog(BuildContext context) {
    Alert(
      context: context,
      content: Column(
        children: [
          ListTile(
            title: const Text('Môn học'),
            leading: const Icon(Icons.book),
            onTap: () {
              Navigator.of(context, rootNavigator: true).pop();
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => const XemDiemMonHocView(),
                ),
              );
            },
          ),
          ListTile(
            title: const Text('Học kỳ'),
            leading: const Icon(Icons.calendar_today),
            onTap: () {
              Navigator.of(context, rootNavigator: true).pop();
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => const XemDiemView(),
                ),
              );
            },
          ),
        ],
      ),
      buttons: [
        DialogButton(
          onPressed: () {
            Navigator.of(context, rootNavigator: true).pop();
          },
          color: AppColors.primaryBackgroundColor,
          child: Text(
            "Đóng",
            style: TextStyle(color: AppColors.basicWhiteColor, fontSize: 18.sp),
          ),
        ),
      ],
      style: AlertStyle(
        backgroundColor: AppColors.basicWhiteColor,
        titleStyle: TextStyle(fontSize: 22.sp, color: AppColors.basicBlackColor),
        alertBorder: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(15.0),
        ),
      ),
    ).show();
  }
}

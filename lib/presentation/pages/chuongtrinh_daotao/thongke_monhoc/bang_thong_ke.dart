import 'package:euni_core_ui/euni_core_ui.dart';
import 'package:flutter/material.dart';
import 'package:horizontal_data_table/horizontal_data_table.dart';

import '../../../../apps/constants/colors.const.dart';
import '../../../components/shimmer_load.dart';
import 'cubit/thongke_monhoc_cubit.dart';

class BangThongKe extends StatefulWidget {
  const BangThongKe({super.key});

  @override
  State<BangThongKe> createState() => _BangThongKeState();
}

class _BangThongKeState extends State<BangThongKe> {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ThongKeMonHocCubit, ThongKeMonHocState>(
      builder: (context, state) {
        if (state.isLoading) {
          return Center(child: ShimmerLoading());
        }
        final thongKeTienDoTables = state.dataTKTD.source!.thongKeTienDoTables!;
        return Scaffold(
          body: state.isLoading
              ? ShimmerLoading()
              : state.dataTKTD.source?.thongKeTienDoTables?.isNotEmpty == true
                  ? HorizontalDataTable(
                      leftHandSideColumnWidth: 230.0.w,
                      rightHandSideColumnWidth: 200.0.w,
                      isFixedHeader: true,
                      headerWidgets: context.read<ThongKeMonHocCubit>().getTitleWidget(),
                      leftSideItemBuilder: context.read<ThongKeMonHocCubit>().leftSideItemBuilder,
                      rightSideItemBuilder: context.read<ThongKeMonHocCubit>().rightSideItemBuilder,
                      itemCount: thongKeTienDoTables.length,
                      rowSeparatorWidget: Divider(
                        color: AppColors.dividerColor,
                        height: 1.0.h,
                        thickness: 0.5.h,
                      ),
                      leftHandSideColBackgroundColor: AppColors.basicWhiteColor,
                      rightHandSideColBackgroundColor: AppColors.basicWhiteColor,
                    )
                  : Center(
                      child: Text(
                        "Không có dữ liệu",
                        style: TextStyle(fontStyle: FontStyle.italic, fontSize: 14.0.sp),
                      ),
                    ),
        );
      },
    );
  }
}

import 'package:euni_core_ui/euni_core_ui.dart';
import 'package:flutter/material.dart';
import 'package:horizontal_data_table/horizontal_data_table.dart';

import '../../../../apps/constants/colors.const.dart';
import '../../../../data/repositories/chuongtrinhdaotao_api_datasource.dart';
import '../../../components/header_screen.dart';
import '../../../components/shimmer_load.dart';
import 'cubit/mon_hoc_tu_chon_cubit.dart';

class MonHocTuChonEuniView extends StatefulWidget {
  const MonHocTuChonEuniView({super.key});

  @override
  State<MonHocTuChonEuniView> createState() => _MonHocTuChonEuniViewState();
}

class _MonHocTuChonEuniViewState extends State<MonHocTuChonEuniView> {
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) {
        int? selectedCTDT;
        String? selectedCN;
        return MonHocTuChonCubit(ChuongTrinhDaoTaoEuniApiDataSource())..fetchMonHocTuChon(selectedCTDT, selectedCN);
      },
      child: BlocBuilder<MonHocTuChonCubit, MonHocTuChonState>(
        builder: (context, state) {
          return Scaffold(
            body: SafeArea(
              child: Column(
                children: [
                  HeaderWidgetEuni(
                    title: 'Môn học tự chọn',
                    backgroundColor: AppColors.primaryBackgroundColor,
                    leading: IconButton(
                      icon: const Icon(
                        Icons.arrow_back_ios,
                        color: AppColors.basicWhiteColor,
                        size: 24,
                      ),
                      onPressed: () {
                        Navigator.of(context).pop();
                      },
                    ),
                    iconRight: Icons.tune,
                    onIconRightTap: () {
                      context.read<MonHocTuChonCubit>().showSearchDialog(context);
                    },
                  ),
                  Expanded(
                    child: state.isLoading
                        ? ShimmerLoading()
                        : state.dataMHTC.source?.monHocTuChonTieuChuans?.isNotEmpty == true
                            ? HorizontalDataTable(
                                leftHandSideColumnWidth: 230.w,
                                rightHandSideColumnWidth: 480.w,
                                isFixedHeader: true,
                                headerWidgets: context.read<MonHocTuChonCubit>().getTitleWidget(),
                                leftSideItemBuilder: context.read<MonHocTuChonCubit>().generateFirstColumnRow,
                                rightSideItemBuilder: context.read<MonHocTuChonCubit>().generateRightHandSideColumnRow,
                                itemCount: state.monHocTuChons.length + state.monHocTuChonTieuChuan.length,
                              )
                            : Center(
                                child: Text(
                                  "Không có dữ liệu. Vui lòng chọn chuyên ngành",
                                  style: TextStyle(fontStyle: FontStyle.italic, fontSize: 14.0.sp),
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
}

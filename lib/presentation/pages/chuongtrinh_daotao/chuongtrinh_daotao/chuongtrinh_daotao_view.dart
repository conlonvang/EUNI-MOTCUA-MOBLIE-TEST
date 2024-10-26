import 'package:euni_core_ui/euni_core_ui.dart';
import 'package:flutter/material.dart';
import 'package:horizontal_data_table/horizontal_data_table.dart';

import '../../../../apps/constants/colors.const.dart';
import '../../../../data/repositories/chuongtrinhdaotao_api_datasource.dart';
import '../../../components/header_screen.dart';
import '../../../components/shimmer_load.dart';
import 'cubit/chuong_trinh_dao_tao_cubit.dart';

class ChuongTrinhDaoTaoView extends StatefulWidget {
  const ChuongTrinhDaoTaoView({super.key});

  @override
  State<ChuongTrinhDaoTaoView> createState() => _ChuongTrinhDaoTaoEuniViewState();
}

class _ChuongTrinhDaoTaoEuniViewState extends State<ChuongTrinhDaoTaoView> {
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) {
        int? selectedCTDT;
        String? selectedCN;
        return ChuongTrinhDaoTaoCubit(ChuongTrinhDaoTaoEuniApiDataSource())..fetchChuongTrinhDaoTao(selectedCTDT, selectedCN);
      },
      child: BlocBuilder<ChuongTrinhDaoTaoCubit, ChuongTrinhDaoTaoState>(
        builder: (context, state) {
          return Scaffold(
            body: SafeArea(
              child: Column(
                children: [
                  HeaderWidgetEuni(
                    title: 'Chương trình đào tạo',
                    backgroundColor: AppColors.primaryBackgroundColor,
                    iconRight: Icons.tune,
                    onIconRightTap: () {
                      context.read<ChuongTrinhDaoTaoCubit>().showSearchDialog(context);
                    },
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
                  ),
                  Expanded(
                    child: state.isLoading
                        ? ShimmerLoading()
                        : state.dataCTDT.source?.monHocBatBuocHocKies?.isNotEmpty == true
                            ? HorizontalDataTable(
                                leftHandSideColumnWidth: 230.w,
                                rightHandSideColumnWidth: 560.w,
                                isFixedHeader: true,
                                headerWidgets: context.read<ChuongTrinhDaoTaoCubit>().getTitleWidget(),
                                leftSideItemBuilder: context.read<ChuongTrinhDaoTaoCubit>().generateFirstColumnRow,
                                rightSideItemBuilder: context.read<ChuongTrinhDaoTaoCubit>().generateRightHandSideColumnRow,
                                itemCount: state.monHocBatBuocCTDT.length + state.monHocBatBuocHocKies.length,
                              )
                            : Center(
                                child: Text(
                                  "Không có dữ liệu",
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
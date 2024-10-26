import 'package:euni_core_ui/euni_core_ui.dart';
import 'package:flutter/material.dart';
import '../../../../../apps/constants/colors.const.dart';
import '../../../../../data/repositories/thongkemonhoc_euni_api_datasource.dart';
import '../../../../../domain/entities/chuong_trinh_dao_tao/thongke_tiendo/data_TKTD.entity.dart';
import '../../../../../domain/entities/chuong_trinh_dao_tao/thongke_tiendo/header_TKTD.entity.dart';
import '../../../../../domain/entities/chuong_trinh_dao_tao/thongke_tiendo/source_TKTD.entity.dart';
import '../../../../../domain/entities/chuong_trinh_dao_tao/thongke_tiendo/thongke_tiendo_chart.entity.dart';
import '../../../../../domain/entities/chuong_trinh_dao_tao/thongke_tiendo/thongke_tiendo_table.entity.dart';

part 'thongke_monhoc_state.dart';

class ThongKeMonHocCubit extends Cubit<ThongKeMonHocState> {
  final ThongKeMonHocEuniApiDataSource repository;
  ThongKeMonHocCubit(this.repository)
      : super(const ThongKeMonHocState(
          isLoading: true,
          dataTKTD: DataThongKeTienDo(),
          headerTKTD: [],
          sourceTKTD: [],
          thongKeTienDoChart: [],
          thongKeTienDoTable: [],
        ));
  Future<void> fetchThongKeMonHoc() async {
    emit(state.copyWith(isLoading: true));

    final response = await repository.getThongKeTienDoEuni();

    if (response.result && response.data != null) {
      final dataTKMH = response.data;

      if (dataTKMH.source != null) {
        emit(state.copyWith(
          isLoading: false,
          dataTKTD: dataTKMH,
        ));
      } else {
        emit(state.copyWith(
          isLoading: false,
          dataTKTD: dataTKMH,
        ));
      }
    } else {
      emit(state.copyWith(isLoading: false, dataTKTD: DataThongKeTienDo()));
    }
  }

  List<Widget> getTitleWidget() {
    return [
      getTitleItemWidgetFixed(),
      getHeaderWidgets(),
    ];
  }

  Widget getTitleItemWidgetFixed() {
    return Container(
      color: AppColors.primaryBackgroundColor,
      width: 230.w,
      height: 70.h,
      padding: EdgeInsets.fromLTRB(5, 0, 0, 0),
      alignment: Alignment.centerLeft,
      child: Row(
        children: [
          Text(
            'STT',
            style: TextStyle(fontWeight: FontWeight.bold, color: AppColors.basicWhiteColor),
          ),
          SizedBox(width: 20.w),
          Text(
            'Tên học kỳ',
            style: TextStyle(fontWeight: FontWeight.bold, color: AppColors.basicWhiteColor),
          ),
        ],
      ),
    );
  }

  Widget getHeaderWidgets() {
    if (state.dataTKTD.header?.thongKeTienDoTables == null || state.dataTKTD.header!.thongKeTienDoTables!.isEmpty) {
      return Container(
        color: AppColors.primaryBackgroundColor,
        width: 90.w,
        height: 70.h,
        padding: EdgeInsets.fromLTRB(5, 0, 0, 0),
        alignment: Alignment.centerLeft,
        child: Center(
          child: Text(
            "No Data",
            style: TextStyle(fontWeight: FontWeight.bold, color: Colors.white),
            textAlign: TextAlign.center,
          ),
        ),
      );
    } else {
      List<Widget> headerWidgets = [];
      var headers = state.dataTKTD.header!.thongKeTienDoTables!;

      for (int i = 2; i < headers.length; i++) {
        String headerText = headers[i].text ?? "";
        headerWidgets.add(
          Container(
            color: AppColors.primaryBackgroundColor,
            width: 100.w,
            height: 70.h,
            padding: EdgeInsets.fromLTRB(5, 0, 0, 0),
            alignment: Alignment.centerLeft,
            child: Center(
              child: Text(
                headerText,
                style: TextStyle(fontWeight: FontWeight.bold, color: Colors.white),
                textAlign: TextAlign.center,
              ),
            ),
          ),
        );
      }
      return Row(
        children: headerWidgets,
      );
    }
  }

  Widget leftSideItemBuilder(BuildContext context, int index) {
    var left = state.dataTKTD.source!.thongKeTienDoTables!;
    return Container(
      width: 230.w,
      height: 70.h,
      child: Row(
        children: [
          Container(
            child: Text(left[index].stt.toString()),
            width: 50.w,
            height: 70.h,
            padding: EdgeInsets.fromLTRB(5, 0, 0, 0),
            alignment: Alignment.center,
          ),
          Container(
            child: Text(left[index].tenHocKy ?? ''),
            width: 180.w,
            height: 70.h,
            padding: EdgeInsets.fromLTRB(5, 0, 0, 0),
            alignment: Alignment.center,
          ),
        ],
      ),
    );
  }

  Widget rightSideItemBuilder(BuildContext context, int index) {
    var right = state.dataTKTD.source!.thongKeTienDoTables!;
    return Container(
      height: 70.h,
      width: 200.w,
      child: Row(
        children: [
          Container(
            child: Text(right[index].tongSoMonDaHoc.toString()),
            width: 90.w,
            height: 70.h,
            padding: EdgeInsets.fromLTRB(5, 0, 0, 0),
            alignment: Alignment.center,
          ),
          Container(
            child: Text(right[index].trongSo.toString()),
            width: 90.w,
            height: 70.h,
            padding: EdgeInsets.fromLTRB(5, 0, 0, 0),
            alignment: Alignment.center,
          ),
        ],
      ),
    );
  }
}

import 'package:euni_core_ui/euni_core_ui.dart';
import 'package:flutter/material.dart';
import '../../../../../apps/configs/injection.dart';
import '../../../../../apps/configs/service_location.dart';
import '../../../../../apps/constants/colors.const.dart';
import '../../../../../data/repositories/chuongtrinhdaotao_api_datasource.dart';
import '../../../../../domain/entities/chuong_trinh_dao_tao/monhoc_tuchon/chuong_trinh_dao_tao.entity.dart';
import '../../../../../domain/entities/chuong_trinh_dao_tao/monhoc_tuchon/chuyen_nganh.entity.dart';
import '../../../../../domain/entities/chuong_trinh_dao_tao/monhoc_tuchon/data.entity.dart';
import '../../../../../domain/entities/chuong_trinh_dao_tao/monhoc_tuchon/header.entity.dart';
import '../../../../../domain/entities/chuong_trinh_dao_tao/monhoc_tuchon/mon_hoc.entity.dart';
import '../../../../../domain/entities/chuong_trinh_dao_tao/monhoc_tuchon/mon_hoc_tu_chon.entity.dart';
import '../../../../../domain/entities/chuong_trinh_dao_tao/monhoc_tuchon/mon_hoc_tu_chon_tieu_chuan.entity.dart';
import '../../../../../domain/entities/chuong_trinh_dao_tao/monhoc_tuchon/source.entity.dart';
import '../../../../../routers/routes.name.dart';


part 'mon_hoc_tu_chon_state.dart';

class MonHocTuChonCubit extends Cubit<MonHocTuChonState> {
  final ChuongTrinhDaoTaoEuniApiDataSource repository;

  MonHocTuChonCubit(this.repository)
      : super(const MonHocTuChonState(
          isLoading: true,
          monHocTuChons: [],
          monHocTuChonTieuChuan: [],
          dataMHTC: DataMonHocTuChon(),
          headerMHTC: [],
          sourceMHTC: [],
          chuongTrinhDaoTaoMHTC: [],
          chuyenNganhMHTC: [],
        ));
  Future<void> fetchMonHocTuChon(int? selectedCTDT, String? selectedCN) async {
    emit(state.copyWith(isLoading: true));
    final response = await repository.getMonHocTuChonEuni(
      selectedCTDT: selectedCTDT,
      selectedCN: selectedCN,
    );

    if (response.result && response.data != null) {
      final dataMHTC = response.data;
      if (dataMHTC.source?.monHocTuChonTieuChuans?.isNotEmpty == true) {
        List<MonHocMHTC> allMonHocTuChons = [];
        List<MonHocTuChonTieuChuanMHTC> monHocTuChonTieuChuan = [];

        for (var tuChonTieuChuan in dataMHTC.source.monHocTuChonTieuChuans!) {
          monHocTuChonTieuChuan.add(tuChonTieuChuan);
          allMonHocTuChons.addAll(tuChonTieuChuan.monHocTuChons!);
        }

        emit(state.copyWith(
          isLoading: false,
          dataMHTC: dataMHTC,
          monHocTuChons: allMonHocTuChons,
          monHocTuChonTieuChuan: monHocTuChonTieuChuan,
        ));
      } else {
        emit(state.copyWith(
          isLoading: false,
          dataMHTC: dataMHTC,
          monHocTuChons: [],
          monHocTuChonTieuChuan: [],
        ));
      }
    } else {
      emit(state.copyWith(
        isLoading: false,
        dataMHTC: const DataMonHocTuChon(),
        monHocTuChons: [],
        monHocTuChonTieuChuan: [],
      ));
    }
  }

  Widget generateFirstColumnRow(BuildContext context, int index) {
    int currentIndex = 0;
    for (var tuChonTieuChuan in state.monHocTuChonTieuChuan) {
      final monHocTuChons = tuChonTieuChuan.monHocTuChons ?? [];
      if (index == currentIndex) {
        return Container(
          height: 70.h,
          color: AppColors.primaryBackgroundColor1,
          child: Row(
            children: [
              Container(
                width: 230.w,
                height: 70.h,
                padding: const EdgeInsets.fromLTRB(5, 0, 0, 0),
                alignment: Alignment.centerLeft,
                child: Text(
                  tuChonTieuChuan.title ?? '',
                  style: const TextStyle(
                    color: AppColors.basicWhiteColor,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ],
          ),
        );
      }
      currentIndex++;
      for (var monHoc in monHocTuChons) {
        if (index == currentIndex) {
          return Container(
            height: 70.h,
            child: Row(
              children: [
                Container(
                  width: 80.w,
                  height: 70.h,
                  padding: const EdgeInsets.fromLTRB(5, 0, 0, 0),
                  alignment: Alignment.centerLeft,
                  child: Text(monHoc.maMon ?? ''),
                ),
                GestureDetector(
                  onTap: () {
                    getIt<NavigationService>().toNamed(
                        RouteConfigName.passParams(
                          RouteConfigName.DE_CUONG_MON_HOC,
                          {},
                        ),
                        parameters: {
                          'maMonHoc': monHoc.maMon ?? " ",
                        });
                  },
                  child: Container(
                    width: 150.w,
                    height: 70.h,
                    padding: const EdgeInsets.fromLTRB(5, 0, 0, 0),
                    alignment: Alignment.centerLeft,
                    child: Text(monHoc.tenMon ?? ''),
                  ),
                ),
              ],
            ),
          );
        }
        currentIndex++;
      }
    }
    return Container();
  }

  Widget generateRightHandSideColumnRow(BuildContext context, int index) {
    int currentIndex = 0;
    for (var tuChonTieuChuan in state.monHocTuChonTieuChuan) {
      final monHocTuChons = tuChonTieuChuan.monHocTuChons ?? [];
      if (index == currentIndex) {
        return Container(
          color: AppColors.primaryBackgroundColor1,
          height: 70.h,
          child: Row(
            children: [
              Container(
                width: 80.w,
                height: 30.h,
                padding: const EdgeInsets.fromLTRB(5, 0, 0, 0),
                alignment: Alignment.center,
                child: const Text(
                  '',
                  style: TextStyle(
                    color: AppColors.basicWhiteColor,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ],
          ),
        );
      }
      currentIndex++;
      for (var monHoc in monHocTuChons) {
        if (index == currentIndex) {
          return Container(
            color: AppColors.basicWhiteColor,
            height: 70.h,
            child: Row(
              children: <Widget>[
                Container(
                  width: 80.w,
                  height: 70.h,
                  padding: const EdgeInsets.fromLTRB(5, 0, 0, 0),
                  alignment: Alignment.center,
                  child: Text(
                    monHoc.soTinChi ?? "",
                  ),
                ),
                Container(
                  width: 80.w,
                  height: 70.h,
                  padding: const EdgeInsets.fromLTRB(5, 0, 0, 0),
                  alignment: Alignment.center,
                  child: monHoc.monDaHoc == true
                      ? const IconAtom(
                          icon: Icons.close,
                          color: AppColors.blueShade300,
                        )
                      : null,
                ),
                Container(
                  width: 80.w,
                  height: 70.h,
                  padding: const EdgeInsets.fromLTRB(5, 0, 0, 0),
                  alignment: Alignment.center,
                  child: Text(
                    monHoc.tongTiet ?? "",
                  ),
                ),
                Container(
                  width: 80.w,
                  height: 70.h,
                  padding: const EdgeInsets.fromLTRB(5, 0, 0, 0),
                  alignment: Alignment.center,
                  child: Text(
                    monHoc.lyThuyet ?? "",
                  ),
                ),
                Container(
                  width: 80.w,
                  height: 70.h,
                  padding: const EdgeInsets.fromLTRB(5, 0, 0, 0),
                  alignment: Alignment.center,
                  child: Text(
                    monHoc.thucHanh ?? "",
                  ),
                ),
                Container(
                  width: 80.w,
                  height: 70.h,
                  padding: const EdgeInsets.fromLTRB(5, 0, 0, 0),
                  alignment: Alignment.center,
                  child: IconAtom(
                    icon: Icons.list,
                    color: AppColors.blueShade300,
                    onTap: () {
                      getIt<NavigationService>().toNamed(
                          RouteConfigName.passParams(
                            RouteConfigName.DE_CUONG_MON_HOC,
                            {},
                          ),
                          parameters: {
                            'maMonHoc': monHoc.maMon ?? " ",
                          });
                    },
                  ),
                ),
              ],
            ),
          );
        }
        currentIndex++;
      }
    }
    return Container();
  }

  List<Widget> getTitleWidget() {
    return [
      getTitleItemWidgetFixed(),
      getTitleItemWidget(),
    ];
  }

  Widget getTitleItemWidgetFixed() {
    return Container(
      color: AppColors.primaryBackgroundColor,
      width: 230.w,
      height: 70.h,
      padding: const EdgeInsets.fromLTRB(5, 0, 0, 0),
      alignment: Alignment.centerLeft,
      child: Row(
        children: [
          const Text(
            'Mã MH',
            style: TextStyle(fontWeight: FontWeight.bold, color: AppColors.basicWhiteColor),
          ),
          SizedBox(width: 20.w),
          const Text(
            'Tên MH',
            style: TextStyle(fontWeight: FontWeight.bold, color: AppColors.basicWhiteColor),
          ),
        ],
      ),
    );
  }

  Widget getTitleItemWidget() {
    if (state.dataMHTC.header!.monHocTuChons == null || state.dataMHTC.header!.monHocTuChons!.isEmpty) {
      return Container(
        color: AppColors.primaryBackgroundColor,
        width: 80.w,
        height: 70.h,
        padding: const EdgeInsets.fromLTRB(5, 0, 0, 0),
        alignment: Alignment.centerLeft,
        child: const Center(
          child: Text(
            "No Data",
            style: TextStyle(fontWeight: FontWeight.bold, color: Colors.white),
            textAlign: TextAlign.center,
          ),
        ),
      );
    } else {
      List<Widget> titleWidgets = [];
      var monHocTuChons = state.dataMHTC.header!.monHocTuChons!;

      for (int i = 3; i < monHocTuChons.length; i++) {
        String titleText = monHocTuChons[i].text ?? "";
        titleWidgets.add(
          Container(
            color: AppColors.primaryBackgroundColor,
            width: 80.w,
            height: 70.h,
            padding: const EdgeInsets.fromLTRB(5, 0, 0, 0),
            alignment: Alignment.centerLeft,
            child: Center(
              child: Text(
                titleText,
                style: const TextStyle(fontWeight: FontWeight.bold, color: Colors.white),
                textAlign: TextAlign.center,
              ),
            ),
          ),
        );
      }
      return Row(
        children: titleWidgets,
      );
    }
  }

  void updateSelectedValues(int? selectedCTDT, String? selectedCN) {
    emit(state.copyWith(
      selectedCTDT: selectedCTDT,
      selectedCN: selectedCN,
    ));
  }

  void showSearchDialog(BuildContext context) {
    int? selectedCTDT = state.selectedCTDT ?? state.dataMHTC.source!.chuongTrinhDaoTaos?.first.value;
    String? selectedCN = state.selectedCN ?? state.dataMHTC.source!.chuyenNganhs?.first.value;
    Alert(
      context: context,
      content: StatefulBuilder(
        builder: (BuildContext context, StateSetter setState) {
          return Column(
            children: [
              BaseSingleSelect<int?>(
                title: 'Chương trình đào tạo',
                id: 'CTDT',
                readOnly: false,
                defaultValue: selectedCTDT,
                name: 'CTDT',
                items: state.dataMHTC.source!.chuongTrinhDaoTaos!
                    .map((e) => BaseSingleSelectItemBottomSheet(
                          label: e.text ?? "",
                          value: e.value,
                        ))
                    .toList(),
                onSelected: (int? value) {
                  setState(() {
                    selectedCTDT = value;
                  });
                },
              ),
              BaseSingleSelect<String?>(
                title: 'Chuyên ngành',
                id: 'CN',
                defaultValue: selectedCN,
                readOnly: false,
                name: 'CN',
                items: state.dataMHTC.source!.chuyenNganhs!
                    .where((e) => e.text != null)
                    .map((e) => BaseSingleSelectItemBottomSheet(
                          label: e.text ?? "",
                          value: e.value,
                        ))
                    .toList(),
                onSelected: (value) {
                  setState(() {
                    selectedCN = value;
                  });
                },
              ),
            ],
          );
        },
      ),
      buttons: [
        DialogButton(
          onPressed: () {
            Navigator.of(context, rootNavigator: true).pop();
            context.read<MonHocTuChonCubit>().updateSelectedValues(selectedCTDT, selectedCN);
            fetchMonHocTuChon(selectedCTDT, selectedCN);
          },
          color: AppColors.primaryBackgroundColor,
          child: Text(
            "Tìm kiếm",
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
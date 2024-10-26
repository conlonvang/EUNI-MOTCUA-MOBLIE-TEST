import 'package:euni_core_ui/euni_core_ui.dart';
import 'package:flutter/material.dart';
import '../../../../../apps/configs/injection.dart';
import '../../../../../apps/configs/service_location.dart';
import '../../../../../apps/constants/colors.const.dart';
import '../../../../../data/repositories/chuongtrinhdaotao_api_datasource.dart';
import '../../../../../domain/entities/chuong_trinh_dao_tao/chuongtrinh_daotao/chuongtrinh_daotao.entity.dart';
import '../../../../../domain/entities/chuong_trinh_dao_tao/chuongtrinh_daotao/chuyen_nganh.entity.dart';
import '../../../../../domain/entities/chuong_trinh_dao_tao/chuongtrinh_daotao/data.entity.dart';
import '../../../../../domain/entities/chuong_trinh_dao_tao/chuongtrinh_daotao/header.entity.dart';
import '../../../../../domain/entities/chuong_trinh_dao_tao/chuongtrinh_daotao/monhoc_batbuoc.entity.dart';
import '../../../../../domain/entities/chuong_trinh_dao_tao/chuongtrinh_daotao/monhoc_batbuoc_header.entity.dart';
import '../../../../../domain/entities/chuong_trinh_dao_tao/chuongtrinh_daotao/monhoc_batbuoc_hocki.entity.dart';
import '../../../../../domain/entities/chuong_trinh_dao_tao/chuongtrinh_daotao/source.entity.dart';
import '../../../../../routers/routes.name.dart';
part 'chuong_trinh_dao_tao_state.dart';

class ChuongTrinhDaoTaoCubit extends Cubit<ChuongTrinhDaoTaoState> {
  final ChuongTrinhDaoTaoEuniApiDataSource repository;

  ChuongTrinhDaoTaoCubit(this.repository)
      : super(const ChuongTrinhDaoTaoState(
          isLoading: true,
          dataCTDT: DataChuongTrinhDaoTao(),
          headerCTDT: [],
          monHocBatBuocHocKies: [],
          sourceCTDT: [],
          monHocBatBuocCTDT: [],
          chuongTrinhDaoTaoCTDT: [],
          chuyenNhanhCTDT: [],
          monHocBatBuocHeaderCTDT: [],
        ));
  Future<void> fetchChuongTrinhDaoTao(int? selectedCTDT, String? selectedCN) async {
    emit(state.copyWith(isLoading: true));
    final response = await repository.getChuongTrinhDaoTaoEuni(
      selectedCTDT: selectedCTDT,
      selectedCN: selectedCN,
    );
    if (response.result && response.data != null) {
      final dataCTDT = response.data;

      if (dataCTDT.source?.monHocBatBuocHocKies?.isNotEmpty == true) {
        List<MonHocBatBuocCTDT> allMonHocTuChons = [];
        List<MonHocBatBuocHocKiCTDT> monHocBatBuocHocKies = [];

        for (var monHocBatBuoc in dataCTDT.source.monHocBatBuocHocKies) {
          monHocBatBuocHocKies.add(monHocBatBuoc);
          allMonHocTuChons.addAll(monHocBatBuoc.monHocBatBuocs);
        }

        emit(state.copyWith(
          isLoading: false,
          dataCTDT: dataCTDT,
          monHocBatBuocCTDT: allMonHocTuChons,
          monHocBatBuocHocKies: monHocBatBuocHocKies,
        ));
      } else {
        emit(state.copyWith(
          isLoading: false,
          dataCTDT: dataCTDT,
          monHocBatBuocCTDT: [],
          monHocBatBuocHocKies: [],
        ));
      }
    } else {
      emit(state.copyWith(
        isLoading: false,
        dataCTDT: const DataChuongTrinhDaoTao(),
        monHocBatBuocCTDT: [],
        monHocBatBuocHocKies: [],
      ));
    }
  }

  Widget generateFirstColumnRow(BuildContext context, int index) {
    int currentIndex = 0;
    for (var monHocBatBuocHocKi in state.monHocBatBuocHocKies) {
      final monHocBatBuocs = monHocBatBuocHocKi.monHocBatBuocs ?? [];
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
                  monHocBatBuocHocKi.title ?? '',
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
      for (var monHocBatBuoc in monHocBatBuocs) {
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
                  child: Text(monHocBatBuoc.maMon ?? ''),
                ),
                GestureDetector(
                  onTap: () {
                    getIt<NavigationService>().toNamed(
                        RouteConfigName.passParams(
                          RouteConfigName.DE_CUONG_MON_HOC,
                          {},
                        ),
                        parameters: {
                          'maMonHoc': monHocBatBuoc.maMon ?? " ",
                        });
                  },
                  child: Container(
                    width: 150.w,
                    height: 70.h,
                    padding: const EdgeInsets.fromLTRB(5, 0, 0, 0),
                    alignment: Alignment.centerLeft,
                    child: Text(monHocBatBuoc.tenMon ?? ''),
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
    for (var monHocBatBuocHocKi in state.monHocBatBuocHocKies) {
      final monHocBatBuocs = monHocBatBuocHocKi.monHocBatBuocs ?? [];
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
                child: Text(
                  '${monHocBatBuocHocKi.tongSoTinChiHocKy}',
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
      for (var monHocBatBuoc in monHocBatBuocs) {
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
                    monHocBatBuoc.soTinChi ?? "",
                  ),
                ),
                Container(
                  width: 80.w,
                  height: 70.h,
                  padding: const EdgeInsets.fromLTRB(5, 0, 0, 0),
                  alignment: Alignment.center,
                  child: monHocBatBuoc.monBatBuoc == true
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
                  child: monHocBatBuoc.monDaHoc == true
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
                    monHocBatBuoc.tongTiet ?? "",
                  ),
                ),
                Container(
                  width: 80.w,
                  height: 70.h,
                  padding: const EdgeInsets.fromLTRB(5, 0, 0, 0),
                  alignment: Alignment.center,
                  child: Text(
                    monHocBatBuoc.lyThuyet ?? "",
                  ),
                ),
                Container(
                  width: 80.w,
                  height: 70.h,
                  padding: const EdgeInsets.fromLTRB(5, 0, 0, 0),
                  alignment: Alignment.center,
                  child: Text(
                    monHocBatBuoc.thucHanh ?? "",
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
                            'maMonHoc': monHocBatBuoc.maMon ?? " ",
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
    if (state.dataCTDT.header?.monHocBatBuocs == null || state.dataCTDT.header!.monHocBatBuocs!.isEmpty) {
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
      var monHocBatBuoc = state.dataCTDT.header!.monHocBatBuocs!;
      for (int i = 3; i < monHocBatBuoc.length; i++) {
        String titleText = monHocBatBuoc[i].text ?? "No Title";
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
    int? selectedCTDT = state.selectedCTDT ?? state.dataCTDT.source!.chuongTrinhDaoTaos?.first.value;
    String? selectedCN = state.selectedCN ?? state.dataCTDT.source!.chuyenNganhs?.first.value;
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
                items: state.dataCTDT.source!.chuongTrinhDaoTaos!
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
                items: state.dataCTDT.source!.chuyenNganhs!
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
            context.read<ChuongTrinhDaoTaoCubit>().updateSelectedValues(selectedCTDT, selectedCN);
            fetchChuongTrinhDaoTao(selectedCTDT, selectedCN);
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
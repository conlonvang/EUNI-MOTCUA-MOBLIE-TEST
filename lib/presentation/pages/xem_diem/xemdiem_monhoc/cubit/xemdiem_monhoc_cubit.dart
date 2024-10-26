import 'package:bloc/bloc.dart';
import 'package:euni_core_ui/euni_core_ui.dart';
import 'package:euni_daotao_mobile/domain/entities/xem_diem/xemdiem_monhoc/data_xemdiem_monhoc.entity.dart';
import 'package:euni_daotao_mobile/domain/entities/xem_diem/xemdiem_monhoc/diem_thanhphan_monhoc.entity.dart';
import 'package:euni_daotao_mobile/domain/entities/xem_diem/xemdiem_monhoc/source_xemdiem_monhoc.entity.dart';
import 'package:euni_daotao_mobile/domain/entities/xem_diem/xemdiem_monhoc/tongket_diem_monhoc.dart';

import '../../../../../data/repositories/xemdiem.repository.dart';
import '../../../../../domain/entities/xem_diem/xemdiem_monhoc/diem_monhoc.entity.dart';

part 'xemdiem_monhoc_state.dart';

class XemDiemMonHocCubit extends Cubit<XemDiemMonHocState> {
  final XemDiemRepository repository;
  XemDiemMonHocCubit(this.repository)
      : super(const XemDiemMonHocState(
          isLoading: true,
          dataXemDiem: DataXemDiemMonHoc(),
          sourceXemDiem: SourceXemDiemMonHoc(),
          diemMonHoc: [],
          diemThanhPhan: [],
          tongKetDiem: [],
        ));
  Future<void> fetchXemDiemMonHoc() async {
    emit(state.copyWith(isLoading: true));

    final responsive = await repository.getXemDiemMonHoc();

    if (responsive.result && responsive.data != null) {
      emit(state.copyWith(
        isLoading: false,
        dataXemDiem: responsive.data as DataXemDiemMonHoc,
      ));
    } else {
      emit(state.copyWith(isLoading: false));
    }
  }
}

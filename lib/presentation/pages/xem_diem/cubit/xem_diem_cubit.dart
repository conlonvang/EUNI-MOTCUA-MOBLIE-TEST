import 'package:euni_core_ui/euni_core_ui.dart';
import 'package:euni_daotao_mobile/data/repositories/xemdiem.repository.dart';
import 'package:euni_daotao_mobile/domain/entities/xem_diem/data_xemdiem.entity.dart';

import '../../../../domain/entities/xem_diem/diem_monhoc.entity.dart';
import '../../../../domain/entities/xem_diem/diem_monhoc_header.entity.dart';
import '../../../../domain/entities/xem_diem/diem_thanhphan.entity.dart';
import '../../../../domain/entities/xem_diem/diem_thanhphan_header.entity.dart';
import '../../../../domain/entities/xem_diem/header.entity.dart';
import '../../../../domain/entities/xem_diem/source.enity.dart';
import '../../../../domain/entities/xem_diem/tongket_diem.entity.dart';

part 'xem_diem_state.dart';

class XemDiemCubit extends Cubit<XemDiemSate> {
  final XemDiemRepository repository;

  XemDiemCubit(this.repository)
      : super(const XemDiemSate(
          isLoading: true,
          dataXemDiem: DataXemDiem(),
          headerXemDiem: [],
          sourceXemDiem: SourceXemDiem(),
          diemMonHocHeader: [],
          diemMonHoc: [],
          diemThanhPhanHeader: [],
          diemThanhPhan: [],
          tongKetDiem: [],
        ));

  Future<void> fetchXemDiem() async {
    emit(state.copyWith(isLoading: true));

    final responsive = await repository.getXemDiemHocKy();

    if (responsive.result && responsive.data != null) {
      emit(state.copyWith(
        isLoading: false,
        dataXemDiem: responsive.data as DataXemDiem,
      ));
    } else {
      emit(state.copyWith(isLoading: false));
    }
  }
}

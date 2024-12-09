import 'package:euni_core_ui/euni_core_ui.dart';
import 'package:euni_daotao_mobile/data/repositories/thoikhoabieuhocky.repository.dart';
import 'package:euni_daotao_mobile/domain/entities/thoi_khoa_bieu/thoi_khoa_bieu_hoc_ky/hocky.entity.dart';
import 'package:euni_daotao_mobile/domain/entities/thoi_khoa_bieu/thoi_khoa_bieu_hoc_ky/source.entity.dart';

import '../../../../../domain/entities/thoi_khoa_bieu/thoi_khoa_bieu_hoc_ky/data_thoikhoabieuhocky.entity.dart';
import '../../../../../domain/entities/thoi_khoa_bieu/thoi_khoa_bieu_hoc_ky/thoikhoabieu_monhochocky.entity.dart';

part 'thoi_khoa_bieu_hoc_ky_state.dart';

class ThoiKhoaBieuHocKyCubit extends Cubit<ThoiKhoaBieuHocKyState> {
  final ThoiKhoaBieuHocKyRepository repository;

  ThoiKhoaBieuHocKyCubit(this.repository)
      : super(const ThoiKhoaBieuHocKyState(
          isLoading: true,
          dataThoiKhoaBieuHocKy: DataThoiKhoaBieuHocKy(),
          sourceThoiKhoaBieuHocKy: SourceThoiKhoaBieuHocKy(),
          hocKy: [],
          thoiKhoaBieuMonHocHocKy: [],
        ));
  Future<void> fetchDanhSachHocKy() async {
    emit(state.copyWith(isLoading: true));
    final response = await repository.getXemThoiKhoaBieuHocKy(null);
    if (response.result && response.data != null) {
      final data = response.data as DataThoiKhoaBieuHocKy;
      final List<HocKy> hocKies = data.source?.hocKies ?? [];
      final int? selectedHocKy = hocKies.isNotEmpty ? hocKies.first.value : null;
      emit(state.copyWith(
        isLoading: false,
        dataThoiKhoaBieuHocKy: data,
        hocKy: hocKies,
        selectedHocKy: hocKies.isNotEmpty ? hocKies.first : null,
      ));

      if (selectedHocKy != null) {
        fetchXemThoiKhoaBieuHocKy(selectedHocKy);
      }
    } else {
      emit(state.copyWith(isLoading: false));
    }
  }

  Future<void> fetchXemThoiKhoaBieuHocKy(int? hocKy) async {
    emit(state.copyWith(isLoading: true));
    final response = await repository.getXemThoiKhoaBieuHocKy(hocKy);
    if (response.result && response.data != null) {
      emit(state.copyWith(
        isLoading: false,
        dataThoiKhoaBieuHocKy: response.data as DataThoiKhoaBieuHocKy,
      ));
    } else {
      emit(state.copyWith(isLoading: false));
    }
  }

  void updateSelectedHocKy(HocKy hocKy) {
    emit(state.copyWith(selectedHocKy: hocKy));
  }
}

import 'package:euni_core_ui/euni_core_ui.dart';
import 'package:euni_daotao_mobile/data/repositories/thoikhoabieu.repository.dart';
import 'package:euni_daotao_mobile/domain/entities/thoi_khoa_bieu/data_thoikhoabieu.entity.dart';
import 'package:euni_daotao_mobile/domain/entities/thoi_khoa_bieu/source.entity.dart';
import 'package:euni_daotao_mobile/domain/entities/thoi_khoa_bieu/thoikhoabieu_hockies.entity.dart';

import '../../../../domain/entities/thoi_khoa_bieu/thoikhoabieu_monhoc.entity.dart';
import '../../../../domain/entities/thoi_khoa_bieu/thoikhoabieu_tuans.entity.dart';

part 'thoi_khoa_bieu_state.dart';

class ThoiKhoaBieuCubit extends Cubit<ThoiKhoaBieuState> {
  final ThoiKhoaBieuRepository repository;
  final Set<int> loadedHocKies = {};
  int? currentHocKy;
  final Map<int, List<ThoiKhoaBieuMonHoc>> cachedHocKyData = {};
  ThoiKhoaBieuCubit(this.repository)
      : super(const ThoiKhoaBieuState(
          isLoading: true,
          dataThoiKhoaBieu: DataThoiKhoaBieu(),
          sourceThoiKhoaBieu: SourceThoiKhoaBieu(),
          thoiKhoaBieuHocKies: [],
          thoiKhoaBieuMonHoc: [],
          thoiKhoaBieuTuan: [],
        ));

  Map<int, DataThoiKhoaBieu> loadedHocKiesData = {};

  Future<void> fetchXemThoiKhoaBieu(int hocKyIndex) async {
    print("Fetching data for hocKyIndex: $hocKyIndex");

    if (loadedHocKiesData.containsKey(hocKyIndex)) {
      print("HocKy $hocKyIndex already loaded, skipping API call.");

      emit(state.copyWith(
        isLoading: false,
        dataThoiKhoaBieu: loadedHocKiesData[hocKyIndex]!,
      ));
      return;
    }

    emit(state.copyWith(isLoading: true));

    final hocKies = state.dataThoiKhoaBieu.source?.hocKies;

    if (hocKies == null || hocKies.isEmpty) {
      final initialResponse = await repository.getXemThoiKhoaBieu(null);
      if (initialResponse.result && initialResponse.data != null) {
        emit(state.copyWith(
          isLoading: false,
          dataThoiKhoaBieu: initialResponse.data as DataThoiKhoaBieu,
        ));
      } else {
        emit(state.copyWith(isLoading: false));
        return;
      }
    }

    final updatedHocKies = state.dataThoiKhoaBieu.source?.hocKies;
    if (updatedHocKies != null && hocKyIndex >= 0 && hocKyIndex < updatedHocKies.length) {
    

      final hocKy = updatedHocKies[hocKyIndex].valueHocKy;
      if (hocKy != null) {
        final response = await repository.getXemThoiKhoaBieu(hocKy);
        if (response.result && response.data != null) {
          emit(state.copyWith(
            isLoading: false,
            dataThoiKhoaBieu: response.data as DataThoiKhoaBieu,
          ));

          loadedHocKiesData[hocKyIndex] = response.data as DataThoiKhoaBieu;
        } else {
          emit(state.copyWith(isLoading: false));
        }
      }
    } else {
    
      emit(state.copyWith(isLoading: false));
    }
  }
}

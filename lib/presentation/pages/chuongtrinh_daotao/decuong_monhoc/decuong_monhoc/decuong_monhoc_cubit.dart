import 'package:euni_core_ui/euni_core_ui.dart';
import '../../../../../data/repositories/decuongmonhoc_euni_api_datasource.dart';
import '../../../../../domain/entities/de_cuong_mon_hoc/data.entity.dart';

part 'decuong_monhoc_state.dart';
class DeCuongMonHocCubit extends Cubit<DeCuongMonHocState> {
  final DeCuongMonHocEuniApiDataSource repository;
  DeCuongMonHocCubit(this.repository)
      : super(const DeCuongMonHocState(
          isLoading: true,
          dataDCMH: DataDeCuongMonHoc(),
        ));

  Future<void> fetchDeCuongMonHoc(String maMonHoc) async {
    emit(state.copyWith(isLoading: true));
    final response = await repository.getDeCuongMonHocEuni(maMonHoc: maMonHoc);
    if (response.result && response.data != null) {
      final dataDCMH = response.data;

      if (dataDCMH.results.isNotEmpty) {
        emit(state.copyWith(
          isLoading: false,
          dataDCMH: dataDCMH,
        ));
      } else {
        emit(state.copyWith(
          isLoading: false,
          dataDCMH: const DataDeCuongMonHoc(results: []),
        ));
      }
    } else {
      emit(state.copyWith(
        isLoading: false,
      ));
    }
  }
}
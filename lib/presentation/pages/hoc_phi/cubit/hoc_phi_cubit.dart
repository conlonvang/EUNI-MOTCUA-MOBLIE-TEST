import 'package:euni_core_ui/euni_core_ui.dart';
import 'package:euni_daotao_mobile/data/repositories/hocphi.repository.dart';
import 'package:euni_daotao_mobile/domain/entities/hoc_phi/data_hocphi.enitity.dart';
import 'package:euni_daotao_mobile/domain/entities/hoc_phi/hoc_phi.entity.dart';
import 'package:euni_daotao_mobile/domain/entities/hoc_phi/source.entity.dart';
import '../../../../domain/entities/hoc_phi/calculate_hocphi.enitity.dart';

part 'hoc_phi_state.dart';

class HocPhiCubit extends Cubit<HocPhiState> {
  final HocPhiRepository repository;
  HocPhiCubit(this.repository)
      : super(const HocPhiState(
          isLoading: true,
          dataHocPhi: DataHocPhi(),
          sourceHocPhi: SourceHocPhi(),
          calculateHocPhi: CalculateHocPhi(),
          hocPhis: [],
        ));
  Future<void> fetchXemHocPhi() async {
    emit(state.copyWith(isLoading: true));

    final responsive = await repository.getHocPhi();

    if (responsive.result && responsive.data != null) {
      emit(state.copyWith(
        isLoading: false,
        dataHocPhi: responsive.data as DataHocPhi,
      ));
    } else {
      emit(state.copyWith(isLoading: false));
    }
  }
}

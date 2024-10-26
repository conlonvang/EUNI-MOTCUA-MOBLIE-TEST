part of 'hoc_phi_cubit.dart';

class HocPhiState extends Equatable {
  final bool isLoading;
  final DataHocPhi dataHocPhi;
  final SourceHocPhi sourceHocPhi;
  final CalculateHocPhi calculateHocPhi;
  final List<HocPhis> hocPhis;
  const HocPhiState({
    this.isLoading = false,
    required this.dataHocPhi,
    required this.sourceHocPhi,
    required this.calculateHocPhi,
    required this.hocPhis,
  });
  HocPhiState copyWith({
    bool? isLoading,
    DataHocPhi? dataHocPhi,
    SourceHocPhi? sourceHocPhi,
    CalculateHocPhi? calculateHocPhi,
    List<HocPhis>? hocPhis,
  }) {
    return HocPhiState(
      isLoading: isLoading ?? this.isLoading,
      dataHocPhi: dataHocPhi ?? this.dataHocPhi,
      sourceHocPhi: sourceHocPhi ?? this.sourceHocPhi,
      calculateHocPhi: calculateHocPhi ?? this.calculateHocPhi,
      hocPhis: hocPhis ?? this.hocPhis,
    );
  }

  @override
  // TODO: implement props
  List<Object?> get props => [
    isLoading,
    dataHocPhi,
    sourceHocPhi,
    calculateHocPhi,
    hocPhis,
  ];
}

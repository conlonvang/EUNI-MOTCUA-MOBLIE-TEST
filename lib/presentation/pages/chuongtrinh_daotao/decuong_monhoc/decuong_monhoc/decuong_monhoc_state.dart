part of 'decuong_monhoc_cubit.dart';

class DeCuongMonHocState extends Equatable {
  final bool isLoading;
  final DataDeCuongMonHoc dataDCMH;
  const DeCuongMonHocState({
    this.isLoading = false,
    required this.dataDCMH,
  });
  DeCuongMonHocState copyWith({
    bool? isLoading,
    DataDeCuongMonHoc? dataDCMH,
  }) {
    return DeCuongMonHocState(
      isLoading: isLoading ?? this.isLoading,
      dataDCMH: dataDCMH ?? this.dataDCMH,
    );
  }

  @override
  List<Object> get props => [
        isLoading,
        dataDCMH,
      ];
}
part of 'trang_chu_cubit.dart';

class TrangChuState extends Equatable {
  const TrangChuState({
    required this.isLoading,
    required this.totalHoSo,
    required this.dangXuLy,
    required this.hoanThanh,
     this.selectedLanguage,
  });

  final bool isLoading;
  final int totalHoSo;
  final int dangXuLy;
  final int hoanThanh;
  final String? selectedLanguage;

  TrangChuState copyWith({
    final bool? isLoading,
    int? totalHoSo,
    int? dangXuLy,
    int? hoanThanh,
    String? selectedLanguage,
  }) {
    return TrangChuState(
      isLoading: isLoading ?? this.isLoading,
      totalHoSo: totalHoSo ?? this.totalHoSo,
      dangXuLy: dangXuLy ?? this.dangXuLy,
      hoanThanh: hoanThanh ?? this.hoanThanh,
      selectedLanguage: selectedLanguage ?? this.selectedLanguage,
    );
  }

  @override
  List<Object?> get props => [
        isLoading,
        totalHoSo,
        dangXuLy,
        hoanThanh,
        selectedLanguage,
      ];
}

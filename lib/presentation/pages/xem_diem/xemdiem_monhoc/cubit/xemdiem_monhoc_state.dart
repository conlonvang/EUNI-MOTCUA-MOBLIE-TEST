part of 'xemdiem_monhoc_cubit.dart';

class XemDiemMonHocState extends Equatable {
  final bool isLoading;
  final DataXemDiemMonHoc dataXemDiem;

  final SourceXemDiemMonHoc sourceXemDiem;

  final List<DiemMonHoc> diemMonHoc;

  final List<DiemThanhPhanMonHoc> diemThanhPhan;
  final List<TongKetDiemMonHoc> tongKetDiem;
  const XemDiemMonHocState({
    this.isLoading = false,
    required this.dataXemDiem,
    required this.sourceXemDiem,
    required this.diemMonHoc,
    required this.diemThanhPhan,
    required this.tongKetDiem,
  });
  XemDiemMonHocState copyWith({
    bool? isLoading,
    DataXemDiemMonHoc? dataXemDiem,
    SourceXemDiemMonHoc? sourceXemDiem,
    List<DiemMonHoc>? diemMonHoc,
    List<DiemThanhPhanMonHoc>? diemThanhPhan,
    List<TongKetDiemMonHoc>? tongKetDiem,
  }) {
    return XemDiemMonHocState(
      isLoading: isLoading ?? this.isLoading,
      dataXemDiem: dataXemDiem ?? this.dataXemDiem,
      sourceXemDiem: sourceXemDiem ?? this.sourceXemDiem,
      diemMonHoc: diemMonHoc ?? this.diemMonHoc,
      diemThanhPhan: diemThanhPhan ?? this.diemThanhPhan,
      tongKetDiem: tongKetDiem ?? this.tongKetDiem,
    );
  }

  @override
  // TODO: implement props
  List<Object?> get props => [
        isLoading,
        dataXemDiem,
        sourceXemDiem,
        diemMonHoc,
        diemThanhPhan,
        tongKetDiem,
      ];
}

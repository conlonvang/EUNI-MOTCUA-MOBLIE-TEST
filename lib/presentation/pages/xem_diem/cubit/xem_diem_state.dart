part of 'xem_diem_cubit.dart';

class XemDiemSate extends Equatable {
  final bool isLoading;
  final DataXemDiem dataXemDiem;
  final List<HeaderXemDiem> headerXemDiem;
  final SourceXemDiem sourceXemDiem;
  final List<DiemMonHocHeader> diemMonHocHeader;
  final List<DiemMonHoc> diemMonHoc;
  final List<DiemThanhPhanHeader> diemThanhPhanHeader;
  final List<DiemThanhPhan> diemThanhPhan;
  final List<TongKetDiem> tongKetDiem;

  const XemDiemSate({
    this.isLoading = false,
    required this.dataXemDiem,
    required this.headerXemDiem,
    required this.sourceXemDiem,
    required this.diemMonHocHeader,
    required this.diemMonHoc,
    required this.diemThanhPhanHeader,
    required this.diemThanhPhan,
    required this.tongKetDiem,
  });
  XemDiemSate copyWith({
    bool? isLoading,
    DataXemDiem? dataXemDiem,
    List<HeaderXemDiem>? headerXemDiem,
    SourceXemDiem? sourceXemDiem,
     List<DiemMonHocHeader>? diemMonHocHeader,
   List<DiemMonHoc>? diemMonHoc,
   List<DiemThanhPhanHeader>? diemThanhPhanHeader,
   List<DiemThanhPhan>? diemThanhPhan,
   List<TongKetDiem>? tongKetDiem,
  }) {
    return XemDiemSate(
      isLoading: isLoading ?? this.isLoading,
      dataXemDiem: dataXemDiem ?? this.dataXemDiem,
      headerXemDiem: headerXemDiem ?? this.headerXemDiem,
      sourceXemDiem: sourceXemDiem ?? this.sourceXemDiem,
      diemMonHocHeader: diemMonHocHeader ?? this.diemMonHocHeader,
      diemMonHoc: diemMonHoc ?? this.diemMonHoc,
      diemThanhPhanHeader: diemThanhPhanHeader ?? this.diemThanhPhanHeader,
      diemThanhPhan: diemThanhPhan ?? this.diemThanhPhan,
      tongKetDiem:  tongKetDiem ?? this.tongKetDiem,
    );
  }

  @override
  List<Object?> get props => [
        isLoading,
        dataXemDiem,
        headerXemDiem,
        sourceXemDiem,
        diemMonHocHeader,
        diemMonHoc,
        diemThanhPhanHeader,
        diemThanhPhan,
        tongKetDiem,
      ];
}

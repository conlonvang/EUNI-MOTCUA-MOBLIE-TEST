part of 'thoi_khoa_bieu_hoc_ky_cubit.dart';

class ThoiKhoaBieuHocKyState extends Equatable {
  final bool isLoading;
  final DataThoiKhoaBieuHocKy dataThoiKhoaBieuHocKy;
  final SourceThoiKhoaBieuHocKy sourceThoiKhoaBieuHocKy;
  final List<HocKy> hocKy;
  final List<ThoiKhoaBieuMonHocHocKy> thoiKhoaBieuMonHocHocKy;
  final HocKy? selectedHocKy;
  const ThoiKhoaBieuHocKyState({
    this.isLoading = false,
    required this.dataThoiKhoaBieuHocKy,
    required this.sourceThoiKhoaBieuHocKy,
    required this.thoiKhoaBieuMonHocHocKy,
    required this.hocKy,
     this.selectedHocKy,
    
  });
  ThoiKhoaBieuHocKyState copyWith({
    bool? isLoading,
    DataThoiKhoaBieuHocKy? dataThoiKhoaBieuHocKy,
    SourceThoiKhoaBieuHocKy? sourceThoiKhoaBieuHocKy,
    List<HocKy>? hocKy,
    List<ThoiKhoaBieuMonHocHocKy>? thoiKhoaBieuMonHocHocKy,
    HocKy? selectedHocKy,
  }) {
    return ThoiKhoaBieuHocKyState(
      isLoading: isLoading ?? this.isLoading,
      dataThoiKhoaBieuHocKy:  dataThoiKhoaBieuHocKy ?? this.dataThoiKhoaBieuHocKy,
      sourceThoiKhoaBieuHocKy:  sourceThoiKhoaBieuHocKy ?? this.sourceThoiKhoaBieuHocKy,
      hocKy: hocKy ?? this.hocKy,
      thoiKhoaBieuMonHocHocKy: thoiKhoaBieuMonHocHocKy ?? this.thoiKhoaBieuMonHocHocKy,
       selectedHocKy: selectedHocKy ?? this.selectedHocKy,
    );
  }
  
  @override
  // TODO: implement props
  List<Object?> get props => [
    isLoading,
    dataThoiKhoaBieuHocKy,
    sourceThoiKhoaBieuHocKy,
    hocKy,
    thoiKhoaBieuMonHocHocKy,
    selectedHocKy,
  ];
}

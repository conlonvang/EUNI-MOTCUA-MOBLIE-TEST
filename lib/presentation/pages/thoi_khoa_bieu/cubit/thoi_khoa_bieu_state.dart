part of 'thoi_khoa_bieu_cubit.dart';

class ThoiKhoaBieuState extends Equatable {
  final DataThoiKhoaBieu dataThoiKhoaBieu;
  final bool isLoading;
  final SourceThoiKhoaBieu sourceThoiKhoaBieu;
  final List<ThoiKhoaBieuMonHoc> thoiKhoaBieuMonHoc;
  final List<ThoiKhoaBieuHocKies> thoiKhoaBieuHocKies;
  final List<ThoiKhoaBieuTuans> thoiKhoaBieuTuan;
   final int hocKy;
  const ThoiKhoaBieuState({
    this.isLoading = false,
    required this.dataThoiKhoaBieu,
    required this.sourceThoiKhoaBieu,
    required this.thoiKhoaBieuHocKies,
    required this.thoiKhoaBieuMonHoc,
    required this.thoiKhoaBieuTuan,
    this.hocKy =0,
  });
  ThoiKhoaBieuState copyWith({
    bool? isLoading,
    DataThoiKhoaBieu? dataThoiKhoaBieu,
    SourceThoiKhoaBieu? sourceThoiKhoaBieu,
    List<ThoiKhoaBieuMonHoc>? thoiKhoaBieuMonHoc,
    List<ThoiKhoaBieuHocKies>? thoiKhoaBieuHocKies,
    List<ThoiKhoaBieuTuans>? thoiKhoaBieuTuan,
    int? hocKy,
  }) {
    return ThoiKhoaBieuState(
      isLoading: isLoading ?? this.isLoading,
      dataThoiKhoaBieu: dataThoiKhoaBieu ?? this.dataThoiKhoaBieu,
      sourceThoiKhoaBieu: sourceThoiKhoaBieu ?? this.sourceThoiKhoaBieu,
      thoiKhoaBieuMonHoc: thoiKhoaBieuMonHoc ?? this.thoiKhoaBieuMonHoc,
      thoiKhoaBieuHocKies: thoiKhoaBieuHocKies ?? this.thoiKhoaBieuHocKies,
      thoiKhoaBieuTuan: thoiKhoaBieuTuan ?? this.thoiKhoaBieuTuan,
      hocKy: hocKy ?? this.hocKy,
    );
  }
  
  @override
  // TODO: implement props
  List<Object?> get props => [
    isLoading,
    dataThoiKhoaBieu,
    sourceThoiKhoaBieu,
    thoiKhoaBieuMonHoc,
    thoiKhoaBieuHocKies,
    thoiKhoaBieuTuan,
    hocKy
  ];
}

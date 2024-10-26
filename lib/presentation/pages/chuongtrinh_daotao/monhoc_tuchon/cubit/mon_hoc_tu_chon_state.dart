part of 'mon_hoc_tu_chon_cubit.dart';

class MonHocTuChonState extends Equatable {
  final bool isLoading;
  final List<MonHocMHTC> monHocTuChons;
  final List<MonHocTuChonTieuChuanMHTC> monHocTuChonTieuChuan;
  final DataMonHocTuChon dataMHTC;
  final List<HeaderMonHocTuChon> headerMHTC;
  final List<SourceMonHocTuChon> sourceMHTC;
  final List<MonHocTuChonMHTC>? textHeaderMHTC;
  final String? maChuyenNganh;
  final int? selectedCTDT;
  final String? selectedCN;
  final List<ChuyenNganhMHTC> chuyenNganhMHTC;
  final List<ChuongTrinhDaoTaoMHTC> chuongTrinhDaoTaoMHTC;

  const MonHocTuChonState({
    this.isLoading = false,
    required this.monHocTuChons,
    required this.monHocTuChonTieuChuan,
    required this.dataMHTC,
    required this.headerMHTC,
    required this.sourceMHTC,
    this.textHeaderMHTC,
    this.maChuyenNganh,
    this.selectedCTDT,
    this.selectedCN,
    required this.chuyenNganhMHTC,
    required this.chuongTrinhDaoTaoMHTC,
  });
  MonHocTuChonState copyWith({
    bool? isLoading,
    List<MonHocMHTC>? monHocTuChons,
    List<MonHocTuChonTieuChuanMHTC>? monHocTuChonTieuChuan,
    DataMonHocTuChon? dataMHTC,
    List<HeaderMonHocTuChon>? headerMHTC,
    List<SourceMonHocTuChon>? sourceMHTC,
    List<MonHocTuChonMHTC>? textHeaderMHTC,
    String? maChuyenNganh,
    int? selectedCTDT,
    String? selectedCN,
    List<ChuyenNganhMHTC>? chuyenNganhMHTC,
    List<ChuongTrinhDaoTaoMHTC>? chuongTrinhDaoTaoMHTC,
  }) {
    return MonHocTuChonState(
      isLoading: isLoading ?? this.isLoading,
      monHocTuChons: monHocTuChons ?? this.monHocTuChons,
      monHocTuChonTieuChuan: monHocTuChonTieuChuan ?? this.monHocTuChonTieuChuan,
      dataMHTC: dataMHTC ?? this.dataMHTC,
      headerMHTC: headerMHTC ?? this.headerMHTC,
      sourceMHTC: sourceMHTC ?? this.sourceMHTC,
      textHeaderMHTC: textHeaderMHTC ?? this.textHeaderMHTC,
      maChuyenNganh: maChuyenNganh ?? this.maChuyenNganh,
      selectedCTDT: selectedCTDT ?? this.selectedCTDT,
      selectedCN: selectedCN ?? this.selectedCN,
      chuyenNganhMHTC: chuyenNganhMHTC ?? this.chuyenNganhMHTC,
      chuongTrinhDaoTaoMHTC: chuongTrinhDaoTaoMHTC ?? this.chuongTrinhDaoTaoMHTC,
    );
  }

  @override
  List<Object?> get props => [
        isLoading,
        monHocTuChons,
        monHocTuChonTieuChuan,
        dataMHTC,
        headerMHTC,
        sourceMHTC,
        textHeaderMHTC,
        maChuyenNganh,
        selectedCTDT,
        selectedCN,
        chuongTrinhDaoTaoMHTC,
        chuyenNganhMHTC,
      ];
}
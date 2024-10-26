part of 'chuong_trinh_dao_tao_cubit.dart';

class ChuongTrinhDaoTaoState extends Equatable {
  final bool isLoading;
  final DataChuongTrinhDaoTao dataCTDT;
  final List<HeaderChuongTrinhDaoTao> headerCTDT;
  final List<SourceChuongTrinhDaoTao> sourceCTDT;
  final List<MonHocBatBuocCTDT> monHocBatBuocCTDT;
  final List<ChuongTrinhDaoTaoCTDT> chuongTrinhDaoTaoCTDT;
  final List<MonHocBatBuocHocKiCTDT> monHocBatBuocHocKies;
  final List<ChuyenNganhCTDT> chuyenNhanhCTDT;
  final List<MonHocBatBuocHeaderCTDT> monHocBatBuocHeaderCTDT;
  final int? selectedCTDT; 
  final String? selectedCN;

  const ChuongTrinhDaoTaoState({
    this.isLoading = false,
    required this.monHocBatBuocHocKies,
    required this.dataCTDT,
    required this.headerCTDT,
    required this.sourceCTDT,
    required this.monHocBatBuocCTDT,
    required this.chuongTrinhDaoTaoCTDT,
    required this.chuyenNhanhCTDT,
    required this.monHocBatBuocHeaderCTDT,
    this.selectedCTDT, 
    this.selectedCN,     
  });

  ChuongTrinhDaoTaoState copyWith({
    bool? isLoading,
    DataChuongTrinhDaoTao? dataCTDT,
    List<HeaderChuongTrinhDaoTao>? headerCTDT,
    List<SourceChuongTrinhDaoTao>? sourceCTDT,
    List<MonHocBatBuocCTDT>? monHocBatBuocCTDT,
    List<ChuongTrinhDaoTaoCTDT>? chuongTrinhDaoTaoCTDT,
    List<ChuyenNganhCTDT>? chuyenNhanhCTDT,
    List<MonHocBatBuocHeaderCTDT>? monHocBatBuocHeaderCTDT,
    List<MonHocBatBuocHocKiCTDT>? monHocBatBuocHocKies,
    int? selectedCTDT, 
    String? selectedCN, 
  }) {
    return ChuongTrinhDaoTaoState(
      isLoading: isLoading ?? this.isLoading,
      monHocBatBuocHocKies: monHocBatBuocHocKies ?? this.monHocBatBuocHocKies,
      dataCTDT: dataCTDT ?? this.dataCTDT,
      headerCTDT: headerCTDT ?? this.headerCTDT,
      sourceCTDT: sourceCTDT ?? this.sourceCTDT,
      monHocBatBuocCTDT: monHocBatBuocCTDT ?? this.monHocBatBuocCTDT,
      chuongTrinhDaoTaoCTDT: chuongTrinhDaoTaoCTDT ?? this.chuongTrinhDaoTaoCTDT,
      chuyenNhanhCTDT: chuyenNhanhCTDT ?? this.chuyenNhanhCTDT,
      monHocBatBuocHeaderCTDT: monHocBatBuocHeaderCTDT ?? this.monHocBatBuocHeaderCTDT,
      selectedCTDT: selectedCTDT ?? this.selectedCTDT,  
      selectedCN: selectedCN ?? this.selectedCN,      
    );
  }

  @override
  List<Object?> get props => [
        isLoading,
        dataCTDT,
        headerCTDT,
        sourceCTDT,
        monHocBatBuocCTDT,
        chuongTrinhDaoTaoCTDT,
        monHocBatBuocHocKies,
        chuyenNhanhCTDT,
        monHocBatBuocHeaderCTDT,
        selectedCTDT, 
        selectedCN,   
      ];
}
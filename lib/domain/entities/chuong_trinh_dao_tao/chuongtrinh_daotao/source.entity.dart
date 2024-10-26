import 'dart:convert';
import 'package:euni_core_ui/euni_core_ui.dart';

import 'chuongtrinh_daotao.entity.dart';
import 'chuyen_nganh.entity.dart';
import 'monhoc_batbuoc_hocki.entity.dart';

class SourceChuongTrinhDaoTao extends Equatable {
  final List<MonHocBatBuocHocKiCTDT>? monHocBatBuocHocKies;
  final List<ChuongTrinhDaoTaoCTDT>? chuongTrinhDaoTaos;
  final List<ChuyenNganhCTDT>? chuyenNganhs;
  const SourceChuongTrinhDaoTao({
    this.monHocBatBuocHocKies,
    this.chuongTrinhDaoTaos,
    this.chuyenNganhs,
  });
  SourceChuongTrinhDaoTao copyWith({
    List<MonHocBatBuocHocKiCTDT>? monHocBatBuocHocKies,
    List<ChuongTrinhDaoTaoCTDT>? chuongTrinhDaoTaos,
    List<ChuyenNganhCTDT>? chuyenNganhs,
  }) {
    return SourceChuongTrinhDaoTao(
      monHocBatBuocHocKies: monHocBatBuocHocKies ?? this.monHocBatBuocHocKies,
      chuongTrinhDaoTaos: chuongTrinhDaoTaos ?? this.chuongTrinhDaoTaos,
      chuyenNganhs: chuyenNganhs ?? this.chuyenNganhs,
    );
  }

  @override
  List<Object?> get props => [
        monHocBatBuocHocKies,
        chuongTrinhDaoTaos,
        chuyenNganhs,
      ];

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'monHocBatBuocHocKies': monHocBatBuocHocKies?.map((x) => x.toMap()).toList(),
      'chuongTrinhDaoTaos': chuongTrinhDaoTaos?.map((x) => x.toMap()).toList(),
      'chuyenNganhs': chuyenNganhs?.map((x) => x.toMap()).toList(),
    };
  }

  factory SourceChuongTrinhDaoTao.fromMap(Map<String, dynamic> map) {
    return SourceChuongTrinhDaoTao(
      monHocBatBuocHocKies: map['monHocBatBuocHocKies'] != null
          ? List<MonHocBatBuocHocKiCTDT>.from(
              (map['monHocBatBuocHocKies'] as List<dynamic>).map<MonHocBatBuocHocKiCTDT?>(
                (x) => MonHocBatBuocHocKiCTDT.fromMap(x as Map<String, dynamic>),
              ),
            )
          : null,
      chuongTrinhDaoTaos: map['chuongTrinhDaoTaos'] != null
          ? List<ChuongTrinhDaoTaoCTDT>.from(
              (map['chuongTrinhDaoTaos'] as List<dynamic>).map<ChuongTrinhDaoTaoCTDT?>(
                (x) => ChuongTrinhDaoTaoCTDT.fromMap(x as Map<String, dynamic>),
              ),
            )
          : null,
      chuyenNganhs: map['chuyenNganhs'] != null
          ? List<ChuyenNganhCTDT>.from(
              (map['chuyenNganhs'] as List<dynamic>).map<ChuyenNganhCTDT?>(
                (x) => ChuyenNganhCTDT.fromMap(x as Map<String, dynamic>),
              ),
            )
          : null,
    );
  }

  String toJson() => json.encode(toMap());

  factory SourceChuongTrinhDaoTao.fromJson(String source) => SourceChuongTrinhDaoTao.fromMap(json.decode(source) as Map<String, dynamic>);
}
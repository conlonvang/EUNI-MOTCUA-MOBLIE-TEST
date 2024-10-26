import 'dart:convert';

import 'package:euni_core_ui/euni_core_ui.dart';

import 'chuong_trinh_dao_tao.entity.dart';
import 'chuyen_nganh.entity.dart';
import 'mon_hoc_tu_chon_tieu_chuan.entity.dart';

class SourceMonHocTuChon extends Equatable {
  final List<MonHocTuChonTieuChuanMHTC>? monHocTuChonTieuChuans;
  final List<ChuongTrinhDaoTaoMHTC>? chuongTrinhDaoTaos;
  final List<ChuyenNganhMHTC>? chuyenNganhs;

  const SourceMonHocTuChon({
    this.monHocTuChonTieuChuans,
    this.chuongTrinhDaoTaos,
    this.chuyenNganhs,
  });

  SourceMonHocTuChon copyWith({
    List<MonHocTuChonTieuChuanMHTC>? monHocTuChonTieuChuans,
    List<ChuongTrinhDaoTaoMHTC>? chuongTrinhDaoTaos,
    List<ChuyenNganhMHTC>? chuyenNganhs,
  }) {
    return SourceMonHocTuChon(
      monHocTuChonTieuChuans: monHocTuChonTieuChuans ?? this.monHocTuChonTieuChuans,
      chuongTrinhDaoTaos: chuongTrinhDaoTaos ?? this.chuongTrinhDaoTaos,
      chuyenNganhs: chuyenNganhs ?? this.chuyenNganhs,
    );
  }

  @override
  List<Object?> get props => [
        monHocTuChonTieuChuans,
        chuongTrinhDaoTaos,
      ];

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'monHocTuChonTieuChuans': monHocTuChonTieuChuans?.map((x) => x.toMap()).toList(),
      'chuongTrinhDaoTaos': chuongTrinhDaoTaos?.map((x) => x.toMap()).toList(),
      'chuyenNganhs': chuyenNganhs?.map((x) => x.toMap()).toList(),
    };
  }

  factory SourceMonHocTuChon.fromMap(Map<String, dynamic> map) {
    return SourceMonHocTuChon(
      monHocTuChonTieuChuans: map['monHocTuChonTieuChuans'] != null
          ? List<MonHocTuChonTieuChuanMHTC>.from(
              (map['monHocTuChonTieuChuans'] as List<dynamic>).map<MonHocTuChonTieuChuanMHTC?>(
                (x) => MonHocTuChonTieuChuanMHTC.fromMap(x as Map<String, dynamic>),
              ),
            )
          : null,
      chuongTrinhDaoTaos: map['chuongTrinhDaoTaos'] != null
          ? List<ChuongTrinhDaoTaoMHTC>.from(
              (map['chuongTrinhDaoTaos'] as List<dynamic>).map<ChuongTrinhDaoTaoMHTC?>(
                (x) => ChuongTrinhDaoTaoMHTC.fromMap(x as Map<String, dynamic>),
              ),
            )
          : null,
      chuyenNganhs: map['chuyenNganhs'] != null
          ? List<ChuyenNganhMHTC>.from(
              (map['chuyenNganhs'] as List<dynamic>).map<ChuyenNganhMHTC?>(
                (x) => ChuyenNganhMHTC.fromMap(x as Map<String, dynamic>),
              ),
            )
          : null,
    );
  }

  String toJson() => json.encode(toMap());

  factory SourceMonHocTuChon.fromJson(String source) => SourceMonHocTuChon.fromMap(json.decode(source) as Map<String, dynamic>);
}
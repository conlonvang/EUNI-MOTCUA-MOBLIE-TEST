import 'dart:convert';

import 'package:euni_core_ui/euni_core_ui.dart';

import 'package:euni_daotao_mobile/domain/entities/xem_diem/xemdiem_monhoc/diem_thanhphan_monhoc.entity.dart';

class DiemMonHoc extends Equatable {
  final int? stt;
  final String? maMon;
  final String? nhomMon;
  final String? tenMon;
  final String? soTinChi;
  final String? diemTongKetChu;
  final String? diemTongKetSoHe4;
  final bool? ketQua;
  final bool? chiTiet;
  final List<DiemThanhPhanMonHoc>? diemThanhPhans;
  const DiemMonHoc({
    this.stt,
    this.maMon,
    this.nhomMon,
    this.tenMon,
    this.soTinChi,
    this.diemTongKetChu,
    this.diemTongKetSoHe4,
    this.ketQua,
    this.chiTiet,
    this.diemThanhPhans,
  });
    DiemMonHoc copyWith({
 int? stt,
   String? maMon,
   String? nhomMon,
   String? tenMon,
   String? soTinChi,
   String? diemTongKetChu,
   String? diemTongKetSoHe4,
   bool? ketQua,
   bool? chiTiet,
   List<DiemThanhPhanMonHoc>? diemThanhPhans,
  }) {
    return DiemMonHoc(
     stt: stt ?? this.stt,
     maMon: maMon ?? this.maMon,
     nhomMon: nhomMon ?? this.nhomMon,
     tenMon: tenMon ?? this.tenMon,
     soTinChi: soTinChi ?? this.soTinChi,
     diemTongKetChu: diemTongKetChu ?? this.diemTongKetChu,
     diemTongKetSoHe4: diemTongKetSoHe4 ?? this.diemTongKetSoHe4,
     ketQua: ketQua ?? this.ketQua,
     chiTiet: chiTiet ?? this.chiTiet,
     diemThanhPhans: diemThanhPhans ?? this.diemThanhPhans,
     
    );
  }
  
   @override
  List<Object?> get props => [
        stt,
        maMon,
        nhomMon,
        tenMon,
        soTinChi,
        diemTongKetChu,
        diemTongKetSoHe4,
        ketQua,
        chiTiet,
        diemThanhPhans,
      ];

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'stt': stt,
      'maMon': maMon,
      'nhomMon': nhomMon,
      'tenMon': tenMon,
      'soTinChi': soTinChi,
      'diemTongKetChu': diemTongKetChu,
      'diemTongKetSoHe4': diemTongKetSoHe4,
      'ketQua': ketQua,
      'chiTiet': chiTiet,
     'diemThanhPhans': diemThanhPhans?.map((x) => x.toMap()).toList(),
    };
  }

  factory DiemMonHoc.fromMap(Map<String, dynamic> map) {
    return DiemMonHoc(
      stt: map['stt'] != null ? map['stt'] as int : null,
      maMon: map['maMon'] != null ? map['maMon'] as String : null,
      nhomMon: map['nhomMon'] != null ? map['nhomMon'] as String : null,
      tenMon: map['tenMon'] != null ? map['tenMon'] as String : null,
      soTinChi: map['soTinChi'] != null ? map['soTinChi'] as String : null,
      diemTongKetChu: map['diemTongKetChu'] != null ? map['diemTongKetChu'] as String : null,
      diemTongKetSoHe4: map['diemTongKetSoHe4'] != null ? map['diemTongKetSoHe4'] as String : null,
      ketQua: map['ketQua'] != null ? map['ketQua'] as bool : null,
      chiTiet: map['chiTiet'] != null ? map['chiTiet'] as bool : null,
      diemThanhPhans: map['diemThanhPhans'] != null
          ? List<DiemThanhPhanMonHoc>.from(
              (map['diemThanhPhans'] as List<dynamic>).map<DiemThanhPhanMonHoc>(
                (x) => DiemThanhPhanMonHoc.fromMap(x as Map<String, dynamic>),
              ),
            )
          : null,
    );
  }

  String toJson() => json.encode(toMap());

  factory DiemMonHoc.fromJson(String source) => DiemMonHoc.fromMap(json.decode(source) as Map<String, dynamic>);
}

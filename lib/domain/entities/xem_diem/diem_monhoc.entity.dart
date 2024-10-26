
import 'dart:convert';

import 'package:euni_core_ui/euni_core_ui.dart';
import 'diem_thanhphan.entity.dart';

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
  final List<DiemThanhPhan>? diemThanhPhans;

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
    return {
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
          ? List<DiemThanhPhan>.from(
              (map['diemThanhPhans'] as List<dynamic>).map<DiemThanhPhan>(
                (x) => DiemThanhPhan.fromMap(x as Map<String, dynamic>),
              ),
            )
          : null,
    );
  }

  String toJson() => json.encode(toMap());

  factory DiemMonHoc.fromJson(String source) =>
      DiemMonHoc.fromMap(json.decode(source) as Map<String, dynamic>);
}

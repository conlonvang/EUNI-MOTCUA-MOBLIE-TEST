import 'dart:convert';

import 'package:euni_core_ui/euni_core_ui.dart';

class MonHocMHTC extends Equatable {
  final int? stt;
  final String? maMon;
  final String? tenMon;
  final String? soTinChi;
  final bool? monDaHoc;
  final String? tongTiet;
  final String? lyThuyet;
  final String? thucHanh;

  const MonHocMHTC({
    this.stt,
    this.maMon,
    this.tenMon,
    this.soTinChi,
    this.monDaHoc,
    this.tongTiet,
    this.lyThuyet,
    this.thucHanh,
  });
  MonHocMHTC copyWith({
    int? stt,
    String? maMon,
    String? tenMon,
    String? soTinChi,
    bool? monDaHoc,
    String? tongTiet,
    String? lyThuyet,
    String? thucHanh,
  }) {
    return MonHocMHTC(
      stt: stt ?? this.stt,
      maMon: maMon ?? this.maMon,
      tenMon: tenMon ?? this.tenMon,
      soTinChi: soTinChi ?? this.soTinChi,
      monDaHoc: monDaHoc ?? this.monDaHoc,
      tongTiet: tongTiet ?? this.tongTiet,
      lyThuyet: lyThuyet ?? this.lyThuyet,
      thucHanh: thucHanh ?? this.thucHanh,
    );
  }

  @override
  List<Object?> get props => [
        stt,
        maMon,
        tenMon,
        soTinChi,
        monDaHoc,
        tongTiet,
        lyThuyet,
        thucHanh
      ];

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'stt': stt,
      'maMon': maMon,
      'tenMon': tenMon,
      'soTinChi': soTinChi,
      'monDaHoc': monDaHoc,
      'tongTiet': tongTiet,
      'lyThuyet': lyThuyet,
      'thucHanh': thucHanh,
    };
  }

  factory MonHocMHTC.fromMap(Map<String, dynamic> map) {
    return MonHocMHTC(
      stt: map['stt'] != null ? map['stt'] as int : null,
      maMon: map['maMon'] != null ? map['maMon'] as String : null,
      tenMon: map['tenMon'] != null ? map['tenMon'] as String : null,
      soTinChi: map['soTinChi'] != null ? map['soTinChi'] as String : null,
      monDaHoc: map['monDaHoc'] != null ? map['monDaHoc'] as bool : null,
      tongTiet: map['tongTiet'] != null ? map['tongTiet'] as String : null,
      lyThuyet: map['lyThuyet'] != null ? map['lyThuyet'] as String : null,
      thucHanh: map['thucHanh'] != null ? map['thucHanh'] as String : null,
    );
  }

  String toJson() => json.encode(toMap());

  factory MonHocMHTC.fromJson(String source) => MonHocMHTC.fromMap(json.decode(source) as Map<String, dynamic>);
}
import 'dart:convert';

import 'package:euni_core_ui/euni_core_ui.dart';

class HocPhis extends Equatable {
  final int? stt;
  final String? hocKy;
  final String? hocPhiChuaGiam;
  final String? mienGiam;
  final String? phaiThu;
  final String? daThu;
  final String? conNo;
  const HocPhis({
    this.stt,
    this.hocKy,
    this.hocPhiChuaGiam,
    this.mienGiam,
    this.phaiThu,
    this.daThu,
    this.conNo,
  });
  HocPhis copyWith({
    int? stt,
    String? hocKy,
    String? hocPhiChuaGiam,
    String? mienGiam,
    String? phaiThu,
    String? daThu,
    String? conNo,
  }) {
    return HocPhis(
      stt: stt ?? this.stt,
      hocKy: hocKy ?? this.hocKy,
      hocPhiChuaGiam: hocPhiChuaGiam ?? this.hocPhiChuaGiam,
      mienGiam: mienGiam ?? this.mienGiam,
      phaiThu: phaiThu ?? this.phaiThu,
      daThu: daThu ?? this.daThu,
      conNo: conNo ?? this.conNo,
    );
  }
  
  @override
  List<Object?> get props => [
    stt,
    hocKy,
    hocPhiChuaGiam,
    mienGiam,
    phaiThu,
    daThu,
    conNo,
  ];

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'stt': stt,
      'hocKy': hocKy,
      'hocPhiChuaGiam': hocPhiChuaGiam,
      'mienGiam': mienGiam,
      'phaiThu': phaiThu,
      'daThu': daThu,
      'conNo': conNo,
    };
  }

  factory HocPhis.fromMap(Map<String, dynamic> map) {
    return HocPhis(
      stt: map['stt'] != null ? map['stt'] as int : null,
      hocKy: map['hocKy'] != null ? map['hocKy'] as String : null,
      hocPhiChuaGiam: map['hocPhiChuaGiam'] != null ? map['hocPhiChuaGiam'] as String : null,
      mienGiam: map['mienGiam'] != null ? map['mienGiam'] as String : null,
      phaiThu: map['phaiThu'] != null ? map['phaiThu'] as String : null,
      daThu: map['daThu'] != null ? map['daThu'] as String : null,
      conNo: map['conNo'] != null ? map['conNo'] as String : null,
    );
  }

  String toJson() => json.encode(toMap());

  factory HocPhis.fromJson(String source) => HocPhis.fromMap(json.decode(source) as Map<String, dynamic>);
}

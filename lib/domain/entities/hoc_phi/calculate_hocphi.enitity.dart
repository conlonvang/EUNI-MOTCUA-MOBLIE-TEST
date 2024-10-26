import 'dart:convert';
import 'package:euni_core_ui/euni_core_ui.dart';

class CalculateHocPhi extends Equatable {
  final String? title;
  final String? hocPhiChuaGiam;
  final String? mienGiam;
  final String? phaiThu;
  final String? daThu;
  final String? conNo;
  const CalculateHocPhi({
    this.title,
    this.hocPhiChuaGiam,
    this.mienGiam,
    this.phaiThu,
    this.daThu,
    this.conNo,
  });
  CalculateHocPhi copyWith({
    String? title,
    String? hocPhiChuaGiam,
    String? mienGiam,
    String? phaiThu,
    String? daThu,
    String? conNo,
  }) {
    return CalculateHocPhi(
      title: title ?? this.title,
      hocPhiChuaGiam: hocPhiChuaGiam ?? this.hocPhiChuaGiam,
      mienGiam: mienGiam ?? this.mienGiam,
      phaiThu: phaiThu ?? this.phaiThu,
      daThu: daThu ?? this.daThu,
      conNo: conNo ?? this.conNo,
    );
  }
  
  @override
  List<Object?> get props =>[
    title,
    hocPhiChuaGiam,
    mienGiam,
    phaiThu,
    daThu,
    conNo,
  ];

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'title': title,
      'hocPhiChuaGiam': hocPhiChuaGiam,
      'mienGiam': mienGiam,
      'phaiThu': phaiThu,
      'daThu': daThu,
      'conNo': conNo,
    };
  }

  factory CalculateHocPhi.fromMap(Map<String, dynamic> map) {
    return CalculateHocPhi(
      title: map['title'] != null ? map['title'] as String : null,
      hocPhiChuaGiam: map['hocPhiChuaGiam'] != null ? map['hocPhiChuaGiam'] as String : null,
      mienGiam: map['mienGiam'] != null ? map['mienGiam'] as String : null,
      phaiThu: map['phaiThu'] != null ? map['phaiThu'] as String : null,
      daThu: map['daThu'] != null ? map['daThu'] as String : null,
      conNo: map['conNo'] != null ? map['conNo'] as String : null,
    );
  }

  String toJson() => json.encode(toMap());

  factory CalculateHocPhi.fromJson(String source) => CalculateHocPhi.fromMap(json.decode(source) as Map<String, dynamic>);
}

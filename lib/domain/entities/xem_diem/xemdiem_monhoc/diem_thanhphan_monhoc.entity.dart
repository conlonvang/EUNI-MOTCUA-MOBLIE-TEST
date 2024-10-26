
import 'dart:convert';
import 'package:euni_core_ui/euni_core_ui.dart';

class DiemThanhPhanMonHoc extends Equatable {
  final String? tenThanhPhan;
  final String? trongSo;
  final String? diemThanhPhan;
  const DiemThanhPhanMonHoc({
    this.tenThanhPhan,
    this.trongSo,
    this.diemThanhPhan,
  });
  DiemThanhPhanMonHoc copyWith({
   String? tenThanhPhan,
    String? trongSo,
    String? diemThanhPhan,
  }) {
    return DiemThanhPhanMonHoc(
       tenThanhPhan: tenThanhPhan ?? this.tenThanhPhan,
      trongSo: trongSo ?? this.trongSo,
      diemThanhPhan: diemThanhPhan ?? this.diemThanhPhan,
     
    );
  }

  @override
 List<Object?> get props =>[ tenThanhPhan,
  trongSo,diemThanhPhan,];


  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'tenThanhPhan': tenThanhPhan,
      'trongSo': trongSo,
      'diemThanhPhan': diemThanhPhan,
    };
  }

  factory DiemThanhPhanMonHoc.fromMap(Map<String, dynamic> map) {
    return DiemThanhPhanMonHoc(
      tenThanhPhan: map['tenThanhPhan'] != null ? map['tenThanhPhan'] as String : null,
      trongSo: map['trongSo'] != null ? map['trongSo'] as String : null,
      diemThanhPhan: map['diemThanhPhan'] != null ? map['diemThanhPhan'] as String : null,
    );
  }

  String toJson() => json.encode(toMap());

  factory DiemThanhPhanMonHoc.fromJson(String source) => DiemThanhPhanMonHoc.fromMap(json.decode(source) as Map<String, dynamic>);
}

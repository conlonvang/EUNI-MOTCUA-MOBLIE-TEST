
import 'dart:convert';

import 'package:euni_core_ui/euni_core_ui.dart';

class DiemThanhPhan extends Equatable {
  final String? tenThanhPhan;
  final String? trongSo;
  final String? diemThanhPhan;
  const DiemThanhPhan({
    this.tenThanhPhan,
    this.trongSo,
    this.diemThanhPhan,
  });
  DiemThanhPhan copyWith({
   String? tenThanhPhan,
    String? trongSo,
    String? diemThanhPhan,
  }) {
    return DiemThanhPhan(
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

  factory DiemThanhPhan.fromMap(Map<String, dynamic> map) {
    return DiemThanhPhan(
      tenThanhPhan: map['tenThanhPhan'] != null ? map['tenThanhPhan'] as String : null,
      trongSo: map['trongSo'] != null ? map['trongSo'] as String : null,
      diemThanhPhan: map['diemThanhPhan'] != null ? map['diemThanhPhan'] as String : null,
    );
  }

  String toJson() => json.encode(toMap());

  factory DiemThanhPhan.fromJson(String source) => DiemThanhPhan.fromMap(json.decode(source) as Map<String, dynamic>);
}

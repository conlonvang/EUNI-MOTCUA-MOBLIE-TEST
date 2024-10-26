// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

import 'package:euni_core_ui/euni_core_ui.dart';

import 'package:euni_daotao_mobile/domain/entities/hoc_phi/calculate_hocphi.enitity.dart';
import 'package:euni_daotao_mobile/domain/entities/hoc_phi/hoc_phi.entity.dart';

class SourceHocPhi extends Equatable {
  final CalculateHocPhi? calculateHocPhi;
  final List<HocPhis>? hocPhis;
  const SourceHocPhi({
    this.calculateHocPhi,
    this.hocPhis,
  });
  SourceHocPhi copyWith({
    CalculateHocPhi? calculateHocPhi,
    List<HocPhis>? hocPhis,
  }) {
    return SourceHocPhi(
      calculateHocPhi: calculateHocPhi ?? this.calculateHocPhi,
      hocPhis: hocPhis ?? this.hocPhis,
    );
  }
  
  @override

  List<Object?> get props =>[
    calculateHocPhi,
    hocPhis
  ];
  

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'calculateHocPhi': calculateHocPhi?.toMap(),
      'hocPhis': hocPhis?.map((x) => x.toMap()).toList(),
    };
  }

  factory SourceHocPhi.fromMap(Map<String, dynamic> map) {
    return SourceHocPhi(
      calculateHocPhi: map['calculateHocPhi'] != null ? CalculateHocPhi.fromMap(map['calculateHocPhi'] as Map<String,dynamic>) : null,
      hocPhis: map['hocPhis'] != null ? List<HocPhis>.from((map['hocPhis'] as List<dynamic>).map<HocPhis?>((x) => HocPhis.fromMap(x as Map<String,dynamic>),),) : null,
    );
  }

  String toJson() => json.encode(toMap());

  factory SourceHocPhi.fromJson(String source) => SourceHocPhi.fromMap(json.decode(source) as Map<String, dynamic>);
}

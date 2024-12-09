// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

import 'package:euni_core_ui/euni_core_ui.dart';

import 'package:euni_daotao_mobile/domain/entities/thoi_khoa_bieu/thoikhoabieu_hockies.entity.dart';
import 'package:euni_daotao_mobile/domain/entities/thoi_khoa_bieu/thoikhoabieu_tuans.entity.dart';

import 'thoikhoabieu_monhoc.entity.dart';

class SourceThoiKhoaBieu extends Equatable {
  final List<ThoiKhoaBieuMonHoc>? thoiKhoaBieuMonHocs;
  final List<ThoiKhoaBieuHocKies>? hocKies;
  final List<ThoiKhoaBieuTuans>? tuans;
  const SourceThoiKhoaBieu({
    this.thoiKhoaBieuMonHocs,
    this.hocKies,
    this.tuans,
  });
  SourceThoiKhoaBieu copyWith({
    List<ThoiKhoaBieuMonHoc>? thoiKhoaBieuMonHocs,
    List<ThoiKhoaBieuHocKies>? hocKies,
    List<ThoiKhoaBieuTuans>? tuans,
  }) {
    return SourceThoiKhoaBieu(
      hocKies: hocKies ?? this.hocKies,
      thoiKhoaBieuMonHocs: thoiKhoaBieuMonHocs ?? this.thoiKhoaBieuMonHocs,
      tuans: tuans ?? this.tuans,
    );
  }
  
  @override

  List<Object?> get props =>[
    hocKies,
    thoiKhoaBieuMonHocs,
    tuans,
  ];

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'thoiKhoaBieuMonHocs': thoiKhoaBieuMonHocs?.map((x) => x.toMap()).toList(),
      'hocKies': hocKies?.map((x) => x.toMap()).toList(),
      'tuans': tuans?.map((x) => x.toMap()).toList(),
    };
  }

  factory SourceThoiKhoaBieu.fromMap(Map<String, dynamic> map) {
    return SourceThoiKhoaBieu(
      thoiKhoaBieuMonHocs: map['thoiKhoaBieuMonHocs'] != null ? List<ThoiKhoaBieuMonHoc>.from((map['thoiKhoaBieuMonHocs'] as List<dynamic>).map<ThoiKhoaBieuMonHoc?>((x) => ThoiKhoaBieuMonHoc.fromMap(x as Map<String,dynamic>),),) : null,
      hocKies: map['hocKies'] != null ? List<ThoiKhoaBieuHocKies>.from((map['hocKies'] as List<dynamic>).map<ThoiKhoaBieuHocKies?>((x) => ThoiKhoaBieuHocKies.fromMap(x as Map<String,dynamic>),),) : null,
      tuans: map['tuans'] != null ? List<ThoiKhoaBieuTuans>.from((map['tuans'] as List<dynamic>).map<ThoiKhoaBieuTuans?>((x) => ThoiKhoaBieuTuans.fromMap(x as Map<String,dynamic>),),) : null,
    );
  }

  String toJson() => json.encode(toMap());

  factory SourceThoiKhoaBieu.fromJson(String source) => SourceThoiKhoaBieu.fromMap(json.decode(source) as Map<String, dynamic>);
}

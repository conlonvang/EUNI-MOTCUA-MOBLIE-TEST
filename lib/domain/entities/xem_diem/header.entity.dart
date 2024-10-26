import 'dart:convert';

import 'package:euni_core_ui/euni_core_ui.dart';

import 'package:euni_daotao_mobile/domain/entities/xem_diem/diem_monhoc_header.entity.dart';
import 'package:euni_daotao_mobile/domain/entities/xem_diem/diem_thanhphan_header.entity.dart';


class HeaderXemDiem extends Equatable {
  final List<DiemMonHocHeader>? diemMonHocs;
  final List<DiemThanhPhanHeader>? diemThanhPhans;

  const HeaderXemDiem({
    this.diemMonHocs,
    this.diemThanhPhans,
  });

  HeaderXemDiem copyWith({
    List<DiemMonHocHeader>? diemMonHocs,
    List<DiemThanhPhanHeader>? diemThanhPhans,
  }) {
    return HeaderXemDiem(
      diemMonHocs: diemMonHocs ?? this.diemMonHocs,
      diemThanhPhans: diemThanhPhans ?? this.diemThanhPhans,
    );
  }

  @override
  List<Object?> get props => [diemMonHocs, diemThanhPhans];

  Map<String, dynamic> toMap() {
    return {
      'diemMonHocs': diemMonHocs?.map((x) => x.toMap()).toList(),
      'diemThanhPhans': diemThanhPhans?.map((x) => x.toMap()).toList(),
    };
  }

  factory HeaderXemDiem.fromMap(Map<String, dynamic> map) {
    return HeaderXemDiem(
      diemMonHocs: map['diemMonHocs'] != null
          ? List<DiemMonHocHeader>.from(
              (map['diemMonHocs'] as List).map(
                (x) => DiemMonHocHeader.fromMap(x as Map<String, dynamic>),
              ),
            )
          : null,
      diemThanhPhans: map['diemThanhPhans'] != null
          ? List<DiemThanhPhanHeader>.from(
              (map['diemThanhPhans'] as List).map(
                (x) => DiemThanhPhanHeader.fromMap(x as Map<String, dynamic>),
              ),
            )
          : null,
    );
  }

  String toJson() => json.encode(toMap());

  factory HeaderXemDiem.fromJson(String source) =>
      HeaderXemDiem.fromMap(json.decode(source) as Map<String, dynamic>);
}

import 'dart:convert';

import 'package:euni_core_ui/euni_core_ui.dart';

import 'diem_monhoc_header.entity.dart';
import 'diem_thanhphan_monhoc_header.entity.dart';

class HeaderXemDiemMonHoc extends Equatable {
  final List<DiemMonHocHeader>? diemMonHocs;
  final List<DiemThanhPhanMonHocHeader>? diemThanhPhans;

  const HeaderXemDiemMonHoc({
    this.diemMonHocs,
    this.diemThanhPhans,
  });

  HeaderXemDiemMonHoc copyWith({
    List<DiemMonHocHeader>? diemMonHocs,
    List<DiemThanhPhanMonHocHeader>? diemThanhPhans,
  }) {
    return HeaderXemDiemMonHoc(
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

  factory HeaderXemDiemMonHoc.fromMap(Map<String, dynamic> map) {
    return HeaderXemDiemMonHoc(
      diemMonHocs: map['diemMonHocs'] != null
          ? List<DiemMonHocHeader>.from(
              (map['diemMonHocs'] as List).map(
                (x) => DiemMonHocHeader.fromMap(x as Map<String, dynamic>),
              ),
            )
          : null,
      diemThanhPhans: map['diemThanhPhans'] != null
          ? List<DiemThanhPhanMonHocHeader>.from(
              (map['diemThanhPhans'] as List).map(
                (x) => DiemThanhPhanMonHocHeader.fromMap(x as Map<String, dynamic>),
              ),
            )
          : null,
    );
  }

  String toJson() => json.encode(toMap());

  factory HeaderXemDiemMonHoc.fromJson(String source) =>
      HeaderXemDiemMonHoc.fromMap(json.decode(source) as Map<String, dynamic>);
}

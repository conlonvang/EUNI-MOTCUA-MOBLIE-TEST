import 'dart:convert';

import 'package:euni_core_ui/euni_core_ui.dart';

import 'diem_monhoc.entity.dart';
import 'tongket_diem.entity.dart';


class SourceXemDiem extends Equatable {
  final List<DiemMonHoc>? diemMonHocs;
  final List<TongKetDiem>? tongKetDiems;
  final String? title;

  const SourceXemDiem({
    this.diemMonHocs,
    this.tongKetDiems,
    this.title,
  });

  SourceXemDiem copyWith({
    List<DiemMonHoc>? diemMonHocs,
    List<TongKetDiem>? tongKetDiems,
    String? title,
  }) {
    return SourceXemDiem(
      diemMonHocs: diemMonHocs ?? this.diemMonHocs,
      tongKetDiems: tongKetDiems ?? this.tongKetDiems,
      title: title ?? this.title,
    );
  }

  @override
  List<Object?> get props => [
        diemMonHocs,
        tongKetDiems,
        title,
      ];

  Map<String, dynamic> toMap() {
    return {
      'diemMonHocs': diemMonHocs?.map((x) => x.toMap()).toList(),
      'tongKetDiems': tongKetDiems?.map((x) => x.toMap()).toList(),
      'title': title,
    };
  }

  factory SourceXemDiem.fromMap(Map<String, dynamic> map) {
    return SourceXemDiem(
      diemMonHocs: map['diemMonHocs'] != null
          ? List<DiemMonHoc>.from(
              (map['diemMonHocs'] as List).map(
                (x) => DiemMonHoc.fromMap(x as Map<String, dynamic>),
              ),
            )
          : null,
      tongKetDiems: map['tongKetDiems'] != null
          ? List<TongKetDiem>.from(
              (map['tongKetDiems'] as List).map(
                (x) => TongKetDiem.fromMap(x as Map<String, dynamic>),
              ),
            )
          : null,
      title: map['title'] != null ? map['title'] as String : null,
    );
  }

  String toJson() => json.encode(toMap());

  factory SourceXemDiem.fromJson(String source) =>
      SourceXemDiem.fromMap(json.decode(source) as Map<String, dynamic>);
}

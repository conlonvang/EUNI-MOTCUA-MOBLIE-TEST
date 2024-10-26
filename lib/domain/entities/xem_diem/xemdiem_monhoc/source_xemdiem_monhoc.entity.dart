// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

import 'package:euni_core_ui/euni_core_ui.dart';

import 'package:euni_daotao_mobile/domain/entities/xem_diem/xemdiem_monhoc/diem_monhoc.entity.dart';
import 'package:euni_daotao_mobile/domain/entities/xem_diem/xemdiem_monhoc/tongket_diem_monhoc.dart';

class SourceXemDiemMonHoc extends Equatable {
  final List<DiemMonHoc>? diemMonHocs;
  final List<TongKetDiemMonHoc>? tongKetDiems;
  final String? title;
   const SourceXemDiemMonHoc({
    this.diemMonHocs,
    this.tongKetDiems,
    this.title,
  });
   SourceXemDiemMonHoc copyWith({
    List<DiemMonHoc>? diemMonHocs,
    List<TongKetDiemMonHoc>? tongKetDiems,
    String? title,
  }) {
    return SourceXemDiemMonHoc(
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
    return <String, dynamic>{
      'diemMonHocs': diemMonHocs?.map((x) => x.toMap()).toList(),
      'tongKetDiems': tongKetDiems?.map((x) => x.toMap()).toList(),
      'title': title,
    };
  }

  factory SourceXemDiemMonHoc.fromMap(Map<String, dynamic> map) {
    return SourceXemDiemMonHoc(
      diemMonHocs: map['diemMonHocs'] != null ? List<DiemMonHoc>.from((map['diemMonHocs'] as List<dynamic>).map<DiemMonHoc?>((x) => DiemMonHoc.fromMap(x as Map<String,dynamic>),),) : null,
      tongKetDiems: map['tongKetDiems'] != null ? List<TongKetDiemMonHoc>.from((map['tongKetDiems'] as List<dynamic>).map<TongKetDiemMonHoc?>((x) => TongKetDiemMonHoc.fromMap(x as Map<String,dynamic>),),) : null,
      title: map['title'] != null ? map['title'] as String : null,
    );
  }

  String toJson() => json.encode(toMap());

  factory SourceXemDiemMonHoc.fromJson(String source) => SourceXemDiemMonHoc.fromMap(json.decode(source) as Map<String, dynamic>);
}

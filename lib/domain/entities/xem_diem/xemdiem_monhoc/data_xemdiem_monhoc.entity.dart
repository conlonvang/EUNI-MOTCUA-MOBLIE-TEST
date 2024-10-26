// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

import 'package:euni_core_ui/euni_core_ui.dart';

import 'package:euni_daotao_mobile/domain/entities/xem_diem/xemdiem_monhoc/header_xemdiem_monhoc.entity.dart';
import 'package:euni_daotao_mobile/domain/entities/xem_diem/xemdiem_monhoc/source_xemdiem_monhoc.entity.dart';

class DataXemDiemMonHoc extends Equatable {
  final SourceXemDiemMonHoc? source;
   final HeaderXemDiemMonHoc? header;
  const DataXemDiemMonHoc({
    this.source,
    this.header,
  });
  DataXemDiemMonHoc copyWith({
    SourceXemDiemMonHoc? source,
    HeaderXemDiemMonHoc? header,
  }) {
    return DataXemDiemMonHoc(
      source: source ?? this.source,
      header: header ?? this.header
    );
  }
   @override
  List<Object?> get props => [source,header];

  

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'source': source?.toMap(),
      'header': header?.toMap(),
    };
  }

  factory DataXemDiemMonHoc.fromMap(Map<String, dynamic> map) {
    return DataXemDiemMonHoc(
      source: map['source'] != null ? SourceXemDiemMonHoc.fromMap(map['source'] as Map<String,dynamic>) : null,
      header: map['header'] != null ? HeaderXemDiemMonHoc.fromMap(map['header'] as Map<String,dynamic>) : null,
    );
  }

  String toJson() => json.encode(toMap());

  factory DataXemDiemMonHoc.fromJson(String source) => DataXemDiemMonHoc.fromMap(json.decode(source) as Map<String, dynamic>);
}

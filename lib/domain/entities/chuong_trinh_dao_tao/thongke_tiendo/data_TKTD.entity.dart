import 'dart:convert';

import 'package:euni_core_ui/euni_core_ui.dart';

import 'header_TKTD.entity.dart';
import 'source_TKTD.entity.dart';

class DataThongKeTienDo extends Equatable {
  final SourceThongKeTienDo? source;
  final HeaderThongKeTienDo? header;
  const DataThongKeTienDo({
    this.source,
    this.header,
  });
  DataThongKeTienDo copyWith({
    SourceThongKeTienDo? source,
    HeaderThongKeTienDo? header,
  }) {
    return DataThongKeTienDo(
      source: source ?? this.source,
      header: header ?? this.header,
    );
  }

  @override
  List<Object?> get props => [
        source,
        header,
      ];

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'source': source?.toMap(),
      'header': header?.toMap(),
    };
  }

  factory DataThongKeTienDo.fromMap(Map<String, dynamic> map) {
    return DataThongKeTienDo(
      source: map['source'] != null ? SourceThongKeTienDo.fromMap(map['source'] as Map<String, dynamic>) : null,
      header: map['header'] != null ? HeaderThongKeTienDo.fromMap(map['header'] as Map<String, dynamic>) : null,
    );
  }

  String toJson() => json.encode(toMap());

  factory DataThongKeTienDo.fromJson(String source) => DataThongKeTienDo.fromMap(json.decode(source) as Map<String, dynamic>);
}
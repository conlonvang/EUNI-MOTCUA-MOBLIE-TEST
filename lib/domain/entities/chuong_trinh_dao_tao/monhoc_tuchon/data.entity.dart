import 'dart:convert';

import 'package:euni_core_ui/euni_core_ui.dart';

import 'header.entity.dart';
import 'source.entity.dart';

class DataMonHocTuChon extends Equatable {
  final HeaderMonHocTuChon? header;
  final SourceMonHocTuChon? source;

  const DataMonHocTuChon({
    this.source,
    this.header,
  });

  DataMonHocTuChon copyWith({
    HeaderMonHocTuChon? header,
    SourceMonHocTuChon? source,
  }) {
    return DataMonHocTuChon(
      header: header ?? this.header,
      source: source ?? this.source,
    );
  }

  @override
  List<Object?> get props => [
        source,
        header,
      ];

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'header': header?.toMap(),
      'source': source?.toMap(),
    };
  }

  factory DataMonHocTuChon.fromMap(Map<String, dynamic> map) {
    return DataMonHocTuChon(
      header: map['header'] != null ? HeaderMonHocTuChon.fromMap(map['header'] as Map<String, dynamic>) : null,
      source: map['source'] != null ? SourceMonHocTuChon.fromMap(map['source'] as Map<String, dynamic>) : null,
    );
  }

  String toJson() => json.encode(toMap());

  factory DataMonHocTuChon.fromJson(String source) => DataMonHocTuChon.fromMap(json.decode(source) as Map<String, dynamic>);
}
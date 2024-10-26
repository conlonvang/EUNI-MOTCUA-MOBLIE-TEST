import 'dart:convert';
import 'package:euni_core_ui/euni_core_ui.dart';

import 'header.entity.dart';
import 'source.entity.dart';

class DataChuongTrinhDaoTao extends Equatable {
  final HeaderChuongTrinhDaoTao? header;
  final SourceChuongTrinhDaoTao? source;
  const DataChuongTrinhDaoTao({
    this.header,
    this.source,
  });
  DataChuongTrinhDaoTao copyWith({
    HeaderChuongTrinhDaoTao? header,
    SourceChuongTrinhDaoTao? source,
  }) {
    return DataChuongTrinhDaoTao(
      header: header ?? this.header,
      source: source ?? this.source,
    );
  }

  @override
  List<Object?> get props => [
        header,
        source,
      ];

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'header': header?.toMap(),
      'source': source?.toMap(),
    };
  }

  factory DataChuongTrinhDaoTao.fromMap(Map<String, dynamic> map) {
    return DataChuongTrinhDaoTao(
      header: map['header'] != null ? HeaderChuongTrinhDaoTao.fromMap(map['header'] as Map<String, dynamic>) : null,
      source: map['source'] != null ? SourceChuongTrinhDaoTao.fromMap(map['source'] as Map<String, dynamic>) : null,
    );
  }

  String toJson() => json.encode(toMap());

  factory DataChuongTrinhDaoTao.fromJson(String source) => DataChuongTrinhDaoTao.fromMap(json.decode(source) as Map<String, dynamic>);
}
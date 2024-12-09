import 'dart:convert';
import 'package:euni_core_ui/euni_core_ui.dart';
import 'package:euni_daotao_mobile/domain/entities/thoi_khoa_bieu/source.entity.dart';

class DataThoiKhoaBieu extends Equatable {
  final SourceThoiKhoaBieu? source;
  const DataThoiKhoaBieu({
    this.source,
  });
  DataThoiKhoaBieu copyWith({
    SourceThoiKhoaBieu? source,
  }) {
    return DataThoiKhoaBieu(
      source: source ?? this.source,
    );
  
  }
  
  @override
  List<Object?> get props => [
    source,
  ];

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'source': source?.toMap(),
    };
  }

  factory DataThoiKhoaBieu.fromMap(Map<String, dynamic> map) {
    return DataThoiKhoaBieu(
      source: map['source'] != null ? SourceThoiKhoaBieu.fromMap(map['source'] as Map<String,dynamic>) : null,
    );
  }

  String toJson() => json.encode(toMap());

  factory DataThoiKhoaBieu.fromJson(String source) => DataThoiKhoaBieu.fromMap(json.decode(source) as Map<String, dynamic>);
}

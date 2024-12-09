import 'dart:convert';
import 'package:euni_core_ui/euni_core_ui.dart';
import 'source.entity.dart';

class DataThoiKhoaBieuHocKy extends Equatable {
  final SourceThoiKhoaBieuHocKy? source;
  const DataThoiKhoaBieuHocKy({
    this.source,
  });
  DataThoiKhoaBieuHocKy copyWith({
    SourceThoiKhoaBieuHocKy? source,
  }) {
    return DataThoiKhoaBieuHocKy(
      source: source ?? this.source,
    );
    
  }
  
  @override
  // TODO: implement props
  List<Object?> get props => [
    source,
  ];

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'source': source?.toMap(),
    };
  }

  factory DataThoiKhoaBieuHocKy.fromMap(Map<String, dynamic> map) {
    return DataThoiKhoaBieuHocKy(
      source: map['source'] != null ? SourceThoiKhoaBieuHocKy.fromMap(map['source'] as Map<String,dynamic>) : null,
    );
  }

  String toJson() => json.encode(toMap());

  factory DataThoiKhoaBieuHocKy.fromJson(String source) => DataThoiKhoaBieuHocKy.fromMap(json.decode(source) as Map<String, dynamic>);
}

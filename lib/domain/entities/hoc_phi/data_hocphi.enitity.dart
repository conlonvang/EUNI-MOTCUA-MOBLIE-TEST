import 'dart:convert';
import 'package:euni_core_ui/euni_core_ui.dart';
import 'source.entity.dart';

class DataHocPhi extends Equatable {
  final SourceHocPhi? source;
  const DataHocPhi({
    this.source,
  });
  DataHocPhi copyWith({
    SourceHocPhi? source,
  }) {
    return DataHocPhi(source: source ?? this.source);
  }
  
  @override
  List<Object?> get props => [
    source
  ];

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'source': source?.toMap(),
    };
  }

  factory DataHocPhi.fromMap(Map<String, dynamic> map) {
    return DataHocPhi(
      source: map['source'] != null ? SourceHocPhi.fromMap(map['source'] as Map<String,dynamic>) : null,
    );
  }

  String toJson() => json.encode(toMap());

  factory DataHocPhi.fromJson(String source) => DataHocPhi.fromMap(json.decode(source) as Map<String, dynamic>);
}

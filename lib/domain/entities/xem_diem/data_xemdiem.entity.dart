import 'dart:convert';

import 'package:euni_core_ui/euni_core_ui.dart';

import 'header.entity.dart';
import 'source.enity.dart';

class DataXemDiem extends Equatable {
  final List<SourceXemDiem>? sources;
  final HeaderXemDiem? header;
  const DataXemDiem({
    this.sources,
    this.header,
  });
    DataXemDiem copyWith({
   
    List<SourceXemDiem>? sources,
    HeaderXemDiem? header,
  }) {
    return DataXemDiem(
       sources: sources ?? this.sources,
      header: header ?? this.header,
     
    );
  }
  
  @override
  List<Object?> get props => [sources,header];

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
    'header': header?.toMap(),
    'sources': sources?.map((x) => x.toMap()).toList(),
    };
  }

  factory DataXemDiem.fromMap(Map<String, dynamic> map) {
    return DataXemDiem(
         sources: map['sources'] != null
          ? List<SourceXemDiem>.from(
              (map['sources'] as List).map(
                (x) => SourceXemDiem.fromMap(x as Map<String, dynamic>),
              ),
            )
          : null,
      header: map['header'] != null ? HeaderXemDiem.fromMap(map['header'] as Map<String, dynamic>) : null,
    );
  }

  String toJson() => json.encode(toMap());

  factory DataXemDiem.fromJson(String source) => DataXemDiem.fromMap(json.decode(source) as Map<String, dynamic>);
}

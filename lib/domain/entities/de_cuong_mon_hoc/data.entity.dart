import 'dart:convert';

import 'package:euni_core_ui/euni_core_ui.dart';

import 'results.entity.dart';

class DataDeCuongMonHoc extends Equatable {
  final List<ResultsDeCuongMonHoc>? results;
  final int? count;
  const DataDeCuongMonHoc({
    this.results,
    this.count,
  });
  DataDeCuongMonHoc copyWith({
    List<ResultsDeCuongMonHoc>? results,
    List? headers,
    int? count,
  }) {
    return DataDeCuongMonHoc(
      results: results ?? this.results,
      count: count ?? this.count,
    );
  }

  @override
  List<Object?> get props => [
        results,
        count,
      ];

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
     'results': results?.map((x) => x.toMap()).toList(),
      'count': count,
    };
  }

  factory DataDeCuongMonHoc.fromMap(Map<String, dynamic> map) {
    return DataDeCuongMonHoc(
      results: map['results'] != null
          ? List<ResultsDeCuongMonHoc>.from(
              (map['results'] as List).map<ResultsDeCuongMonHoc>(
                (x) => ResultsDeCuongMonHoc.fromMap(x as Map<String, dynamic>),
              ),
            )
          : null,
      count: map['count'] != null ? map['count'] as int : null,
    );
  }

  String toJson() => json.encode(toMap());

  factory DataDeCuongMonHoc.fromJson(String source) => DataDeCuongMonHoc.fromMap(json.decode(source) as Map<String, dynamic>);
}
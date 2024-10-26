import 'dart:convert';
import 'package:equatable/equatable.dart';

class ThongKeTienDoChart extends Equatable {
  final String? codeColor;
  final double? trongSo;
  final String? title;
  const ThongKeTienDoChart({
    this.codeColor,
    this.title,
    this.trongSo,
  });

  ThongKeTienDoChart copyWith({
    String? codeColor,
    double? trongSo,
    String? title,
  }) {
    return ThongKeTienDoChart(codeColor: codeColor ?? this.codeColor, trongSo: trongSo ?? this.trongSo, title: title ?? this.title);
  }

  @override
  List<Object?> get props => [
        codeColor,
        trongSo,
        title,
      ];

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'codeColor': codeColor,
      'trongSo': trongSo,
      'title': title,
    };
  }

  factory ThongKeTienDoChart.fromMap(Map<String, dynamic> map) {
    return ThongKeTienDoChart(
      codeColor: map['codeColor'] != null ? map['codeColor'] as String : null,
      trongSo: map['trongSo'] != null ? (map['trongSo'] is int ? (map['trongSo'] as int).toDouble() : map['trongSo'] as double) : null,
      title: map['title'] != null ? map['title'] as String : null,
    );
  }

  String toJson() => json.encode(toMap());

  factory ThongKeTienDoChart.fromJson(String source) => ThongKeTienDoChart.fromMap(json.decode(source) as Map<String, dynamic>);
}
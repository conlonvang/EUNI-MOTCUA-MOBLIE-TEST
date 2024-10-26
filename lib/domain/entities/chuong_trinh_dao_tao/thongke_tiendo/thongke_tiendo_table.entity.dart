import 'dart:convert';
import 'package:euni_core_ui/euni_core_ui.dart';

class ThongKeTienDoTable extends Equatable {
  final int? stt;
  final String? tenHocKy;
  final int? tongSoMonDaHoc;
  final double? trongSo;
  const ThongKeTienDoTable({
    this.stt,
    this.tenHocKy,
    this.tongSoMonDaHoc,
    this.trongSo,
  });

  ThongKeTienDoTable copyWith({
    int? stt,
    String? tenHocKy,
    int? tongSoMonDaHoc,
    double? trongSo,
  }) {
    return ThongKeTienDoTable(
      stt: stt ?? this.stt,
      tenHocKy: tenHocKy ?? this.tenHocKy,
      tongSoMonDaHoc: tongSoMonDaHoc ?? this.tongSoMonDaHoc,
      trongSo: trongSo ?? this.trongSo,
    );
  }

  @override
  List<Object?> get props => [
        stt,
        tenHocKy,
        tongSoMonDaHoc,
        trongSo,
      ];

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'stt': stt,
      'tenHocKy': tenHocKy,
      'tongSoMonDaHoc': tongSoMonDaHoc,
      'trongSo': trongSo,
    };
  }

  factory ThongKeTienDoTable.fromMap(Map<String, dynamic> map) {
    return ThongKeTienDoTable(
      stt: map['stt'] != null ? map['stt'] as int : null,
      tenHocKy: map['tenHocKy'] != null ? map['tenHocKy'] as String : null,
      tongSoMonDaHoc: map['tongSoMonDaHoc'] != null ? map['tongSoMonDaHoc'] as int : null,
      trongSo: map['trongSo'] != null ? (map['trongSo'] is int ? (map['trongSo'] as int).toDouble() : map['trongSo'] as double) : null,
    );
  }

  String toJson() => json.encode(toMap());

  factory ThongKeTienDoTable.fromJson(String source) => ThongKeTienDoTable.fromMap(json.decode(source) as Map<String, dynamic>);
}
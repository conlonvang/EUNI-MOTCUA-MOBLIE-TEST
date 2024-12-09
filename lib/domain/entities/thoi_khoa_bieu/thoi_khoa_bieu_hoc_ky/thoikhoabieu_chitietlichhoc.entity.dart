import 'dart:convert';
import 'package:euni_core_ui/euni_core_ui.dart';

class ChiTietLichHoc extends Equatable {
  final int? thu;
  final int? tietBatDau;
  final String? phong;
  final String? thoiGianHoc;
  const ChiTietLichHoc({
    this.thu,
    this.tietBatDau,
    this.phong,
    this.thoiGianHoc,
  });
  ChiTietLichHoc copyWith({
    int? thu,
    int? tietBatDau,
    String? phong,
    String? thoiGianHoc,
  }) {
    return ChiTietLichHoc(
      thu: thu ?? this.thu,
      tietBatDau: tietBatDau ?? this.tietBatDau,
      phong: phong ?? this.phong,
      thoiGianHoc: thoiGianHoc ?? this.thoiGianHoc,
    );
  }

  @override
  List<Object?> get props => [
        thu,
        tietBatDau,
        phong,
        thoiGianHoc,
      ];

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'thu': thu,
      'tietBatDau': tietBatDau,
      'phong': phong,
      'thoiGianHoc': thoiGianHoc,
    };
  }

  factory ChiTietLichHoc.fromMap(Map<String, dynamic> map) {
    return ChiTietLichHoc(
      thu: map['thu'] != null ? map['thu'] as int : null,
      tietBatDau: map['tietBatDau'] != null ? map['tietBatDau'] as int : null,
      phong: map['phong'] != null ? map['phong'] as String : null,
      thoiGianHoc: map['thoiGianHoc'] != null ? map['thoiGianHoc'] as String : null,
    );
  }

  String toJson() => json.encode(toMap());

  factory ChiTietLichHoc.fromJson(String source) => ChiTietLichHoc.fromMap(json.decode(source) as Map<String, dynamic>);
}

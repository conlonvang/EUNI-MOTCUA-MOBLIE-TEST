// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

import 'package:euni_core_ui/euni_core_ui.dart';

class ThoiKhoaBieuHocKies extends Equatable {
  final int? valueHocKy;
  final String? tenHocKy;
  final String? ngayBatDau;
  final String? ngayKetThuc;
  const ThoiKhoaBieuHocKies({
    this.tenHocKy,
    this.valueHocKy,
    this.ngayBatDau,
    this.ngayKetThuc,
  });
  ThoiKhoaBieuHocKies copyWith({
    int? value,
    String? tenHocKy,
    String? ngayBatDau,
    String? ngayKetThuc,
      }) {
    return ThoiKhoaBieuHocKies(
      tenHocKy: tenHocKy ?? this.tenHocKy,
      valueHocKy: valueHocKy ?? this.valueHocKy,
      ngayBatDau:  ngayBatDau ?? this.ngayBatDau,
      ngayKetThuc: ngayKetThuc ?? this.ngayKetThuc,
    );
  }

  @override
  List<Object?> get props => [
        valueHocKy,
        tenHocKy,
        ngayBatDau,
        ngayKetThuc,
      ];

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'valueHocKy': valueHocKy,
      'tenHocKy': tenHocKy,
      'ngayBatDau': ngayBatDau,
      'ngayKetThuc': ngayKetThuc,
    };
  }

  factory ThoiKhoaBieuHocKies.fromMap(Map<String, dynamic> map) {
    return ThoiKhoaBieuHocKies(
      valueHocKy: map['valueHocKy'] != null ? map['valueHocKy'] as int : null,
      tenHocKy: map['tenHocKy'] != null ? map['tenHocKy'] as String : null,
      ngayBatDau: map['ngayBatDau'] != null ? map['ngayBatDau'] as String : null,
      ngayKetThuc: map['ngayKetThuc'] != null ? map['ngayKetThuc'] as String : null,
    );
  }

  String toJson() => json.encode(toMap());

  factory ThoiKhoaBieuHocKies.fromJson(String source) => ThoiKhoaBieuHocKies.fromMap(json.decode(source) as Map<String, dynamic>);
}

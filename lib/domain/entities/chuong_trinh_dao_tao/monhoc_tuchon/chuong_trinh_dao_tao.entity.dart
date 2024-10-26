import 'dart:convert';

import 'package:euni_core_ui/euni_core_ui.dart';

import 'mon_hoc_tu_chon.entity.dart';

class ChuongTrinhDaoTaoMHTC extends Equatable {
  final int? value;
  final String? text;

  const ChuongTrinhDaoTaoMHTC({
    this.value,
    this.text,
  });

  ChuongTrinhDaoTaoMHTC copyWith({
    List<MonHocTuChonMHTC>? monHocTuChons,
    String? text,
  }) {
    return ChuongTrinhDaoTaoMHTC(
      value: value ?? this.value,
      text: text ?? this.text,
    );
  }

  @override
  List<Object?> get props => [
        value,
        text,
      ];

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'value': value,
      'text': text,
    };
  }

  factory ChuongTrinhDaoTaoMHTC.fromMap(Map<String, dynamic> map) {
    return ChuongTrinhDaoTaoMHTC(
      value: map['value'] != null ? map['value'] as int : null,
      text: map['text'] != null ? map['text'] as String : null,
    );
  }

  String toJson() => json.encode(toMap());

  factory ChuongTrinhDaoTaoMHTC.fromJson(String source) => ChuongTrinhDaoTaoMHTC.fromMap(json.decode(source) as Map<String, dynamic>);
}
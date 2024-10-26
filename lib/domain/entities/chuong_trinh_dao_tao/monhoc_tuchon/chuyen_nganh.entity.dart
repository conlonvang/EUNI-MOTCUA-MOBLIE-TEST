import 'dart:convert';

import 'package:euni_core_ui/euni_core_ui.dart';

class ChuyenNganhMHTC extends Equatable {
  final String? text;
  final String? value;

  const ChuyenNganhMHTC({this.text, this.value});

  ChuyenNganhMHTC copyWith({
    String? text,
    String? value,
  }) {
    return ChuyenNganhMHTC(
      value: value ?? this.value,
      text: text ?? this.text,
    );
  }

  @override
  List<Object?> get props => [
        text,
        value
      ];

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'text': text,
      'value': value,
    };
  }

  factory ChuyenNganhMHTC.fromMap(Map<String, dynamic> map) {
    return ChuyenNganhMHTC(
      text: map['text'] != null ? map['text'] as String : null,
      value: map['value'] != null ? map['value'] as String : null,
    );
  }

  String toJson() => json.encode(toMap());

  factory ChuyenNganhMHTC.fromJson(String source) => ChuyenNganhMHTC.fromMap(json.decode(source) as Map<String, dynamic>);
}
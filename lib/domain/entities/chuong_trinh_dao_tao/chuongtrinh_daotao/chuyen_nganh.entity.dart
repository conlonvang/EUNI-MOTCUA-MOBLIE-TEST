import 'dart:convert';
import 'package:euni_core_ui/euni_core_ui.dart';

class ChuyenNganhCTDT extends Equatable {
  final String? text;
  final String? value;
  ChuyenNganhCTDT({
    this.text,
    this.value,
  });
  ChuyenNganhCTDT copyWith({
    String? text,
    String? value,
  }) {
    return ChuyenNganhCTDT(
      text: text ?? this.text,
      value: value ?? this.value,
    );
  }

  @override
  List<Object?> get props => [
        text,
        value,
      ];

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'text': text,
      'value': value,
    };
  }

  factory ChuyenNganhCTDT.fromMap(Map<String, dynamic> map) {
    return ChuyenNganhCTDT(
      text: map['text'] != null ? map['text'] as String : null,
      value: map['value'] != null ? map['value'] as String : null,
    );
  }

  String toJson() => json.encode(toMap());

  factory ChuyenNganhCTDT.fromJson(String source) => ChuyenNganhCTDT.fromMap(json.decode(source) as Map<String, dynamic>);
}
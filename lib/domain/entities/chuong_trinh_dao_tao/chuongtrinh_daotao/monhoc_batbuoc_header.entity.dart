import 'dart:convert';
import 'package:euni_core_ui/euni_core_ui.dart';

class MonHocBatBuocHeaderCTDT extends Equatable {
  final String? text;
  final String? value;
  const MonHocBatBuocHeaderCTDT({
    this.text,
    this.value,
  });
  MonHocBatBuocHeaderCTDT copyWith({
    String? text,
    String? value,
  }) {
    return MonHocBatBuocHeaderCTDT(
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

  factory MonHocBatBuocHeaderCTDT.fromMap(Map<String, dynamic> map) {
    return MonHocBatBuocHeaderCTDT(
      text: map['text'] != null ? map['text'] as String : null,
      value: map['value'] != null ? map['value'] as String : null,
    );
  }

  String toJson() => json.encode(toMap());

  factory MonHocBatBuocHeaderCTDT.fromJson(String source) => MonHocBatBuocHeaderCTDT.fromMap(json.decode(source) as Map<String, dynamic>);
}
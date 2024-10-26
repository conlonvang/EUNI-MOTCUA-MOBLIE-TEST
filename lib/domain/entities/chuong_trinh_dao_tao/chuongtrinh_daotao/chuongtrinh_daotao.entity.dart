import 'dart:convert';
import 'package:euni_core_ui/euni_core_ui.dart';

class ChuongTrinhDaoTaoCTDT extends Equatable {
  final int? value;
  final String? text;
  const ChuongTrinhDaoTaoCTDT({
    this.text,
    this.value,
  });
  ChuongTrinhDaoTaoCTDT copyWith({
    int? value,
    String? text,
  }) {
    return ChuongTrinhDaoTaoCTDT(
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

  factory ChuongTrinhDaoTaoCTDT.fromMap(Map<String, dynamic> map) {
    return ChuongTrinhDaoTaoCTDT(
      value: map['value'] != null ? map['value'] as int : null,
      text: map['text'] != null ? map['text'] as String : null,
    );
  }

  String toJson() => json.encode(toMap());

  factory ChuongTrinhDaoTaoCTDT.fromJson(String source) => ChuongTrinhDaoTaoCTDT.fromMap(json.decode(source) as Map<String, dynamic>);
}
import 'dart:convert';
import 'package:euni_core_ui/euni_core_ui.dart';

class ThoiKhoaBieuTuans extends Equatable {
  final int? value;
  final String? text;
  const ThoiKhoaBieuTuans({
    this.text,
    this.value,
  });
  ThoiKhoaBieuTuans copyWith({
    int? value,
    String? text,
  }) {
    return ThoiKhoaBieuTuans(text: text ?? this.text, value: value ?? this.value);
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

  factory ThoiKhoaBieuTuans.fromMap(Map<String, dynamic> map) {
    return ThoiKhoaBieuTuans(
      value: map['value'] != null ? map['value'] as int : null,
      text: map['text'] != null ? map['text'] as String : null,
    );
  }

  String toJson() => json.encode(toMap());

  factory ThoiKhoaBieuTuans.fromJson(String source) => ThoiKhoaBieuTuans.fromMap(json.decode(source) as Map<String, dynamic>);
}

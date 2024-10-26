import 'dart:convert';
import 'package:euni_core_ui/euni_core_ui.dart';

class ThongKeTienDoTableHearder extends Equatable {
  final String? text;
  final String? value;
  const ThongKeTienDoTableHearder({
    this.text,
    this.value,
  });
    ThongKeTienDoTableHearder copyWith({
   String? text,
    String? value,
  }) {
    return ThongKeTienDoTableHearder(
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

  factory ThongKeTienDoTableHearder.fromMap(Map<String, dynamic> map) {
    return ThongKeTienDoTableHearder(
      text: map['text'] != null ? map['text'] as String : null,
      value: map['value'] != null ? map['value'] as String : null,
    );
  }

  String toJson() => json.encode(toMap());

  factory ThongKeTienDoTableHearder.fromJson(String source) => ThongKeTienDoTableHearder.fromMap(json.decode(source) as Map<String, dynamic>);
}
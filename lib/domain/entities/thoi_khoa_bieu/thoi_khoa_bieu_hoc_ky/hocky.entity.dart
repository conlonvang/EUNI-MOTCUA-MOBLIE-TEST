import 'dart:convert';

import 'package:euni_core_ui/euni_core_ui.dart';

class HocKy extends Equatable {
  final int? value;
  final String? text;
  const HocKy({
    this.value,
    this.text,
  });
  HocKy copyWith({
    int? value,
    String? text,
  }) {
   return  HocKy(
      text: text ?? this.text,
      value: value ?? this.value,
    );
  }
  
  @override
  // TODO: implement props
  List<Object?> get props => [
    text,
    value,
  ];

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'value': value,
      'text': text,
    };
  }

  factory HocKy.fromMap(Map<String, dynamic> map) {
    return HocKy(
      value: map['value'] != null ? map['value'] as int : null,
      text: map['text'] != null ? map['text'] as String : null,
    );
  }

  String toJson() => json.encode(toMap());

  factory HocKy.fromJson(String source) => HocKy.fromMap(json.decode(source) as Map<String, dynamic>);
}

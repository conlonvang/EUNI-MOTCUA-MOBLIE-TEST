import 'dart:convert';

import 'package:euni_core_ui/euni_core_ui.dart';

class DiemMonHocHeader extends Equatable {
  final String? text;
  final String? value;
  const DiemMonHocHeader({
    this.text,
    this.value,
  });
    DiemMonHocHeader copyWith({
   
    String? text,
    String? value,
  }) {
    return DiemMonHocHeader(
       text: text ?? this.text,
      value: value ?? this.value,
     
    );
  }
  
  @override
  List<Object?> get props => [
    text,value,
  ];

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'text': text,
      'value': value,
    };
  }

  factory DiemMonHocHeader.fromMap(Map<String, dynamic> map) {
    return DiemMonHocHeader(
      text: map['text'] != null ? map['text'] as String : null,
      value: map['value'] != null ? map['value'] as String : null,
    );
  }

  String toJson() => json.encode(toMap());

  factory DiemMonHocHeader.fromJson(String source) => DiemMonHocHeader.fromMap(json.decode(source) as Map<String, dynamic>);
}

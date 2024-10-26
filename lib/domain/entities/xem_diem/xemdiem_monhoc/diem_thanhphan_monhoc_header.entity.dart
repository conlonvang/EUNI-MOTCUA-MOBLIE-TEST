import 'dart:convert';
import 'package:euni_core_ui/euni_core_ui.dart';

class DiemThanhPhanMonHocHeader extends Equatable {
  final String? text;
  final String? value;
  const DiemThanhPhanMonHocHeader({
    this.text,
    this.value,
  });
   DiemThanhPhanMonHocHeader copyWith({
   
    String? text,
    String? value,
  }) {
    return DiemThanhPhanMonHocHeader(
       text: text ?? this.text,
      value: value ?? this.value,
     
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

  factory DiemThanhPhanMonHocHeader.fromMap(Map<String, dynamic> map) {
    return DiemThanhPhanMonHocHeader(
      text: map['text'] != null ? map['text'] as String : null,
      value: map['value'] != null ? map['value'] as String : null,
    );
  }

  String toJson() => json.encode(toMap());

  factory DiemThanhPhanMonHocHeader.fromJson(String source) => DiemThanhPhanMonHocHeader.fromMap(json.decode(source) as Map<String, dynamic>);
}

import 'dart:convert';
import 'package:euni_core_ui/euni_core_ui.dart';

class DiemThanhPhanHeader extends Equatable {
  final String? text;
  final String? value;
  const DiemThanhPhanHeader({
    this.text,
    this.value,
  });
   DiemThanhPhanHeader copyWith({
   
    String? text,
    String? value,
  }) {
    return DiemThanhPhanHeader(
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

  factory DiemThanhPhanHeader.fromMap(Map<String, dynamic> map) {
    return DiemThanhPhanHeader(
      text: map['text'] != null ? map['text'] as String : null,
      value: map['value'] != null ? map['value'] as String : null,
    );
  }

  String toJson() => json.encode(toMap());

  factory DiemThanhPhanHeader.fromJson(String source) => DiemThanhPhanHeader.fromMap(json.decode(source) as Map<String, dynamic>);
}

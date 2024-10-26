
import 'dart:convert';

import 'package:euni_core_ui/euni_core_ui.dart';

class TongKetDiem extends Equatable {
  final String? text;
  final String? value;
  const TongKetDiem({
    this.text,
    this.value,
  });
  TongKetDiem copyWith({
   
    String? text,
    String? value,
  }) {
    return TongKetDiem(
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

  factory TongKetDiem.fromMap(Map<String, dynamic> map) {
    return TongKetDiem(
      text: map['text'] != null ? map['text'] as String : null,
      value: map['value'] != null ? map['value'] as String : null,
    );
  }

  String toJson() => json.encode(toMap());

  factory TongKetDiem.fromJson(String source) => TongKetDiem.fromMap(json.decode(source) as Map<String, dynamic>);
}

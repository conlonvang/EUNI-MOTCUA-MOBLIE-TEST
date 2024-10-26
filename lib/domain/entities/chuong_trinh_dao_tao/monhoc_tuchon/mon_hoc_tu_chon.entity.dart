import 'dart:convert';

import 'package:euni_core_ui/euni_core_ui.dart';

class MonHocTuChonMHTC extends Equatable {
  final String? text;
  final String? value;

  const MonHocTuChonMHTC({this.text, this.value});

  MonHocTuChonMHTC copyWith({
    String? value,
    String? text,
  }) {
    return MonHocTuChonMHTC(
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
      'text': text,
      'value': value,
    };
  }

  factory MonHocTuChonMHTC.fromMap(Map<String, dynamic> map) {
    return MonHocTuChonMHTC(
      text: map['text'] != null ? map['text'] as String : null,
      value: map['value'] != null ? map['value'] as String : null,
    );
  }

  String toJson() => json.encode(toMap());

  factory MonHocTuChonMHTC.fromJson(String source) => MonHocTuChonMHTC.fromMap(json.decode(source) as Map<String, dynamic>);
}
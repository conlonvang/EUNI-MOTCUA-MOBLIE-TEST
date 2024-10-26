import 'dart:convert';
import 'package:euni_core_ui/euni_core_ui.dart';

class ResultsDeCuongMonHoc extends Equatable {
  final String? title;
  final String? value;
  final bool? isLink;
  final bool? isThongBao;
  const ResultsDeCuongMonHoc({
    this.title,
    this.value,
    this.isLink,
    this.isThongBao,
  });
  ResultsDeCuongMonHoc copyWith({
    String? title,
    String? value,
    bool? isLink,
    bool? isThongBao,
  }) {
    return ResultsDeCuongMonHoc(
      title: title ?? this.title,
      value: value ?? this.value,
      isLink: isLink ?? this.isLink,
      isThongBao: isThongBao ?? this.isThongBao,
    );
  }

  @override
  List<Object?> get props => [
        title,
        value,
        isLink,
        isThongBao,
      ];

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'title': title,
      'value': value,
      'isLink': isLink,
      'isThongBao': isThongBao,
    };
  }

  factory ResultsDeCuongMonHoc.fromMap(Map<String, dynamic> map) {
    return ResultsDeCuongMonHoc(
      title: map['title'] != null ? map['title'] as String : null,
      value: map['value'] != null ? map['value'] as String : null,
      isLink: map['isLink'] != null ? map['isLink'] as bool : null,
      isThongBao: map['isThongBao'] != null ? map['isThongBao'] as bool : null,
    );
  }

  String toJson() => json.encode(toMap());

  factory ResultsDeCuongMonHoc.fromJson(String source) => ResultsDeCuongMonHoc.fromMap(json.decode(source) as Map<String, dynamic>);
}
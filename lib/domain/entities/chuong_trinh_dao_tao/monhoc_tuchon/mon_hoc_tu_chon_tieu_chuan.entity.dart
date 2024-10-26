import 'dart:convert';

import 'package:euni_core_ui/euni_core_ui.dart';

import 'mon_hoc.entity.dart';

class MonHocTuChonTieuChuanMHTC extends Equatable {
  final List<MonHocMHTC>? monHocTuChons;
  final String? title;

  const MonHocTuChonTieuChuanMHTC({
    this.monHocTuChons,
    this.title,
  });

  MonHocTuChonTieuChuanMHTC copyWith({
    List<MonHocMHTC>? monHocTuChons,
    String? title,
  }) {
    return MonHocTuChonTieuChuanMHTC(
      monHocTuChons: monHocTuChons ?? this.monHocTuChons,
      title: title ?? this.title,
    );
  }

  @override
  List<Object?> get props => [
        monHocTuChons,
        title,
      ];

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'monHocTuChons': monHocTuChons?.map((x) => x.toMap()).toList(),
      'title': title,
    };
  }

  factory MonHocTuChonTieuChuanMHTC.fromMap(Map<String, dynamic> map) {
    return MonHocTuChonTieuChuanMHTC(
      monHocTuChons: map['monHocTuChons'] != null
          ? List<MonHocMHTC>.from(
              (map['monHocTuChons'] as List<dynamic>).map<MonHocMHTC>(
                (x) => MonHocMHTC.fromMap(x as Map<String, dynamic>),
              ),
            )
          : null,
      title: map['title'] != null ? map['title'] as String : null,
    );
  }

  String toJson() => json.encode(toMap());

  factory MonHocTuChonTieuChuanMHTC.fromJson(String source) => MonHocTuChonTieuChuanMHTC.fromMap(json.decode(source) as Map<String, dynamic>);
}

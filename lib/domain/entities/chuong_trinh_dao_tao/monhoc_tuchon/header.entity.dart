import 'dart:convert';

import 'package:euni_core_ui/euni_core_ui.dart';

import 'mon_hoc_tu_chon.entity.dart';

class HeaderMonHocTuChon extends Equatable {
  final List<MonHocTuChonMHTC>? monHocTuChons;

  const HeaderMonHocTuChon({this.monHocTuChons});

  HeaderMonHocTuChon copyWith({
    List<MonHocTuChonMHTC>? monHocTuChons,
  }) {
    return HeaderMonHocTuChon(
      monHocTuChons: monHocTuChons ?? this.monHocTuChons,
    );
  }

  @override
  List<Object?> get props => [
        monHocTuChons,
      ];

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'monHocTuChons': monHocTuChons?.map((x) => x.toMap()).toList(),
    };
  }

  factory HeaderMonHocTuChon.fromMap(Map<String, dynamic> map) {
    return HeaderMonHocTuChon(
      monHocTuChons: map['monHocTuChons'] != null
          ? List<MonHocTuChonMHTC>.from(
              (map['monHocTuChons'] as List<dynamic>).map<MonHocTuChonMHTC?>(
                (x) => MonHocTuChonMHTC.fromMap(x as Map<String, dynamic>),
              ),
            )
          : null,
    );
  }

  String toJson() => json.encode(toMap());

  factory HeaderMonHocTuChon.fromJson(String source) => HeaderMonHocTuChon.fromMap(json.decode(source) as Map<String, dynamic>);
}
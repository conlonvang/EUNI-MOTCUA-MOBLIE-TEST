import 'dart:convert';
import 'package:euni_core_ui/euni_core_ui.dart';

import 'monhoc_batbuoc.entity.dart';

class MonHocBatBuocHocKiCTDT extends Equatable {
  final int? tongSoTinChiHocKy;
  final List<MonHocBatBuocCTDT>? monHocBatBuocs;
  final String? title;
  const MonHocBatBuocHocKiCTDT({
    this.tongSoTinChiHocKy,
    this.monHocBatBuocs,
    this.title,
  });
  MonHocBatBuocHocKiCTDT copyWith({
    int? tongSoTinChiHocKy,
    List<MonHocBatBuocCTDT>? monHocBatBuocs,
    String? title,
  }) {
    return MonHocBatBuocHocKiCTDT(
      tongSoTinChiHocKy: tongSoTinChiHocKy ?? this.tongSoTinChiHocKy,
      monHocBatBuocs: monHocBatBuocs ?? this.monHocBatBuocs,
      title: title ?? this.title,
    );
  }

  @override
  List<Object?> get props => [
        tongSoTinChiHocKy,
        monHocBatBuocs,
        title,
      ];

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'tongSoTinChiHocKy': tongSoTinChiHocKy,
      'monHocBatBuocs': monHocBatBuocs?.map((x) => x.toMap()).toList(),
      'title': title,
    };
  }

  factory MonHocBatBuocHocKiCTDT.fromMap(Map<String, dynamic> map) {
    return MonHocBatBuocHocKiCTDT(
      tongSoTinChiHocKy: map['tongSoTinChiHocKy'] != null ? map['tongSoTinChiHocKy'] as int : null,
      monHocBatBuocs: map['monHocBatBuocs'] != null
          ? List<MonHocBatBuocCTDT>.from(
              (map['monHocBatBuocs'] as List<dynamic>).map<MonHocBatBuocCTDT?>(
                (x) => MonHocBatBuocCTDT.fromMap(x as Map<String, dynamic>),
              ),
            )
          : null,
      title: map['title'] != null ? map['title'] as String : null,
    );
  }

  String toJson() => json.encode(toMap());

  factory MonHocBatBuocHocKiCTDT.fromJson(String source) => MonHocBatBuocHocKiCTDT.fromMap(json.decode(source) as Map<String, dynamic>);
}
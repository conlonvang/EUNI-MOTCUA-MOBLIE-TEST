import 'dart:convert';
import 'package:euni_core_ui/euni_core_ui.dart';

import 'monhoc_batbuoc_header.entity.dart';

class HeaderChuongTrinhDaoTao extends Equatable {
  final List<MonHocBatBuocHeaderCTDT>? monHocBatBuocs;
  const HeaderChuongTrinhDaoTao({
    this.monHocBatBuocs,
  });
  HeaderChuongTrinhDaoTao copyWith({
    int? tongSoTinChiHocKy,
    List<MonHocBatBuocHeaderCTDT>? monHocBatBuocs,
    String? title,
  }) {
    return HeaderChuongTrinhDaoTao(
      monHocBatBuocs: monHocBatBuocs ?? this.monHocBatBuocs,
    );
  }

  @override
  List<Object?> get props => [
        monHocBatBuocs
      ];

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'monHocBatBuocs': monHocBatBuocs?.map((x) => x.toMap()).toList(),
    };
  }

  factory HeaderChuongTrinhDaoTao.fromMap(Map<String, dynamic> map) {
    return HeaderChuongTrinhDaoTao(
      monHocBatBuocs: map['monHocBatBuocs'] != null
          ? List<MonHocBatBuocHeaderCTDT>.from(
              (map['monHocBatBuocs'] as List<dynamic>).map<MonHocBatBuocHeaderCTDT?>(
                (x) => MonHocBatBuocHeaderCTDT.fromMap(x as Map<String, dynamic>),
              ),
            )
          : null,
    );
  }

  String toJson() => json.encode(toMap());

  factory HeaderChuongTrinhDaoTao.fromJson(String source) => HeaderChuongTrinhDaoTao.fromMap(json.decode(source) as Map<String, dynamic>);
}
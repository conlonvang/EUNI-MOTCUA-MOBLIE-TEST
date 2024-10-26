import 'dart:convert';

import 'package:euni_core_ui/euni_core_ui.dart';

import 'thongke_tiendo_chart.entity.dart';
import 'thongke_tiendo_table.entity.dart';

class SourceThongKeTienDo extends Equatable {
  final List<ThongKeTienDoChart>? thongKeTienDoCharts;
  final List<ThongKeTienDoTable>? thongKeTienDoTables;

  const SourceThongKeTienDo({
    this.thongKeTienDoCharts,
    this.thongKeTienDoTables,
  });

  @override
  List<Object?> get props => [
        thongKeTienDoCharts,
        thongKeTienDoTables,
      ];

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'thongKeTienDoCharts': thongKeTienDoCharts?.map((x) => x.toMap()).toList(),
      'thongKeTienDoTables': thongKeTienDoTables?.map((x) => x.toMap()).toList(),
    };
  }

  factory SourceThongKeTienDo.fromMap(Map<String, dynamic> map) {
    return SourceThongKeTienDo(
      thongKeTienDoCharts: map['thongKeTienDoCharts'] != null
          ? List<ThongKeTienDoChart>.from(
              (map['thongKeTienDoCharts'] as List<dynamic>).map<ThongKeTienDoChart?>(
                (x) => ThongKeTienDoChart.fromMap(x as Map<String, dynamic>),
              ),
            )
          : null,
      thongKeTienDoTables: map['thongKeTienDoTables'] != null
          ? List<ThongKeTienDoTable>.from(
              (map['thongKeTienDoTables'] as List<dynamic>).map<ThongKeTienDoTable?>(
                (x) => ThongKeTienDoTable.fromMap(x as Map<String, dynamic>),
              ),
            )
          : null,
    );
  }

  String toJson() => json.encode(toMap());

  factory SourceThongKeTienDo.fromJson(String source) => SourceThongKeTienDo.fromMap(json.decode(source) as Map<String, dynamic>);
}
import 'dart:convert';

import 'package:euni_core_ui/euni_core_ui.dart';

import 'thongke_tiendo_table_hearder.entity.dart';

class HeaderThongKeTienDo extends Equatable {
  final List<ThongKeTienDoTableHearder>? thongKeTienDoTables;
  const HeaderThongKeTienDo({
    this.thongKeTienDoTables,
  });
    HeaderThongKeTienDo copyWith({
    List<ThongKeTienDoTableHearder>? thongKeTienDoTables,
  }) {
    return HeaderThongKeTienDo(
      thongKeTienDoTables: thongKeTienDoTables ?? this.thongKeTienDoTables,
    );
  }


  @override
  List<Object?> get props => [thongKeTienDoTables];

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'thongKeTienDoTables': thongKeTienDoTables?.map((x) => x.toMap()).toList(),
    };
  }

  factory HeaderThongKeTienDo.fromMap(Map<String, dynamic> map) {
    return HeaderThongKeTienDo(
      thongKeTienDoTables: map['thongKeTienDoTables'] != null ? List<ThongKeTienDoTableHearder>.from((map['thongKeTienDoTables'] as List<dynamic>).map<ThongKeTienDoTableHearder?>((x) => ThongKeTienDoTableHearder.fromMap(x as Map<String,dynamic>),),) : null,
    );
  }

  String toJson() => json.encode(toMap());

  factory HeaderThongKeTienDo.fromJson(String source) => HeaderThongKeTienDo.fromMap(json.decode(source) as Map<String, dynamic>);
}
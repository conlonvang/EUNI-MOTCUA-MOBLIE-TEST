import 'dart:convert';
import 'package:euni_core_ui/euni_core_ui.dart';
import 'hocky.entity.dart';
import 'thoikhoabieu_monhochocky.entity.dart';

class SourceThoiKhoaBieuHocKy extends Equatable {
  final List<ThoiKhoaBieuMonHocHocKy>? thoiKhoaBieuMonHocsHocKy;
  final List<HocKy>? hocKies;
  const SourceThoiKhoaBieuHocKy({
    this.thoiKhoaBieuMonHocsHocKy,
    this.hocKies,
  });
  SourceThoiKhoaBieuHocKy copyWith({
    List<ThoiKhoaBieuMonHocHocKy>? thoiKhoaBieuMonHocsHocKy,
    List<HocKy>? hocKies,
  }) {
    return SourceThoiKhoaBieuHocKy(
      hocKies: hocKies ?? this.hocKies,
      thoiKhoaBieuMonHocsHocKy: thoiKhoaBieuMonHocsHocKy ?? this.thoiKhoaBieuMonHocsHocKy,
    );
    
  }
  
  @override
  // TODO: implement props
  List<Object?> get props => [
    hocKies,
    thoiKhoaBieuMonHocsHocKy,
  ];

 

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'thoiKhoaBieuMonHocsHocKy': thoiKhoaBieuMonHocsHocKy?.map((x) => x.toMap()).toList(),
      'hocKies': hocKies?.map((x) => x.toMap()).toList(),
    };
  }

  factory SourceThoiKhoaBieuHocKy.fromMap(Map<String, dynamic> map) {
    return SourceThoiKhoaBieuHocKy(
      thoiKhoaBieuMonHocsHocKy: map['thoiKhoaBieuMonHocsHocKy'] != null ? List<ThoiKhoaBieuMonHocHocKy>.from((map['thoiKhoaBieuMonHocsHocKy'] as List<dynamic>).map<ThoiKhoaBieuMonHocHocKy?>((x) => ThoiKhoaBieuMonHocHocKy.fromMap(x as Map<String,dynamic>),),) : null,
      hocKies: map['hocKies'] != null ? List<HocKy>.from((map['hocKies'] as List<dynamic>).map<HocKy?>((x) => HocKy.fromMap(x as Map<String,dynamic>),),) : null,
    );
  }

  String toJson() => json.encode(toMap());

  factory SourceThoiKhoaBieuHocKy.fromJson(String source) => SourceThoiKhoaBieuHocKy.fromMap(json.decode(source) as Map<String, dynamic>);
}

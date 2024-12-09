import 'dart:convert';
import 'package:euni_core_ui/euni_core_ui.dart';
import 'thoikhoabieu_chitietlichhoc.entity.dart';

class ThoiKhoaBieuMonHocHocKy extends Equatable {
  final int? stt;
  final String? maMon;
  final String? tenMon;
  final String? nhomTo;
  final String? soTinChi;
  final String? lop;
  final int? soTiet;
  final String? giangVien;
  final List<ChiTietLichHoc>? chiTietLichHocs;
  const ThoiKhoaBieuMonHocHocKy({
    this.stt,
    this.maMon,
    this.tenMon,
    this.nhomTo,
    this.soTinChi,
    this.lop,
    this.soTiet,
    this.giangVien,
    this.chiTietLichHocs,
  });
  ThoiKhoaBieuMonHocHocKy copyWith({
    int? stt,
    String? maMon,
    String? tenMon,
    String? nhomTo,
    String? soTinChi,
    String? lop,
    int? soTiet,
    String? giangVien,
    List<ChiTietLichHoc>? chiTietLichHocs,
  }) {
    return ThoiKhoaBieuMonHocHocKy(
      stt:  stt ?? this.stt,
      maMon: maMon?? this.maMon,
      tenMon: tenMon ?? this.tenMon,
      nhomTo: nhomTo ?? this.nhomTo,
      soTinChi: soTinChi ?? this.soTinChi,
      lop: lop ?? this.lop,
      soTiet: soTiet ?? this.soTiet,
      giangVien: giangVien ?? this.giangVien,
      chiTietLichHocs: chiTietLichHocs ?? this.chiTietLichHocs,
      
    );
  }
  
  @override

  List<Object?> get props => [
    stt,
    maMon,
    tenMon,
    nhomTo,
    soTinChi,
    lop,
    soTiet,
    giangVien,
    chiTietLichHocs
  ];

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'stt': stt,
      'maMon': maMon,
      'tenMon': tenMon,
      'nhomTo': nhomTo,
      'soTinChi': soTinChi,
      'lop': lop,
      'soTiet': soTiet,
      'giangVien': giangVien,
      'chiTietLichHocs': chiTietLichHocs?.map((x) => x.toMap()).toList(),
    };
  }

  factory ThoiKhoaBieuMonHocHocKy.fromMap(Map<String, dynamic> map) {
    return ThoiKhoaBieuMonHocHocKy(
      stt: map['stt'] != null ? map['stt'] as int : null,
      maMon: map['maMon'] != null ? map['maMon'] as String : null,
      tenMon: map['tenMon'] != null ? map['tenMon'] as String : null,
      nhomTo: map['nhomTo'] != null ? map['nhomTo'] as String : null,
      soTinChi: map['soTinChi'] != null ? map['soTinChi'] as String : null,
      lop: map['lop'] != null ? map['lop'] as String : null,
      soTiet: map['soTiet'] != null ? map['soTiet'] as int : null,
      giangVien: map['giangVien'] != null ? map['giangVien'] as String : null,
      chiTietLichHocs: map['chiTietLichHocs'] != null ? List<ChiTietLichHoc>.from((map['chiTietLichHocs'] as List<dynamic>).map<ChiTietLichHoc?>((x) => ChiTietLichHoc.fromMap(x as Map<String,dynamic>),),) : null,
    );
  }

  String toJson() => json.encode(toMap());

  factory ThoiKhoaBieuMonHocHocKy.fromJson(String source) => ThoiKhoaBieuMonHocHocKy.fromMap(json.decode(source) as Map<String, dynamic>);
}

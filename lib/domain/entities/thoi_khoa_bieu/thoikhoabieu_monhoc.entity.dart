import 'dart:convert';
import 'package:euni_core_ui/euni_core_ui.dart';

class ThoiKhoaBieuMonHoc extends Equatable {
  final String? maMon;
  final String? tenMon;
  final String? maNhom;
  final String? soTinChi;
  final String? maLop;
  final int? thu;
  final int? tietBatDau;
  final int? soTiet;
  final String? maPhong;
  final String? tenGiangVien;
  final String? ngayHoc;
  final String? gioBatDau;
  final String? gioKetThuc;
  final int? tuanHocKy;
  final String? thongTinTuan;
  const ThoiKhoaBieuMonHoc({
    this.maMon,
    this.tenMon,
    this.maNhom,
    this.soTinChi,
    this.maLop,
    this.thu,
    this.tietBatDau,
    this.soTiet,
    this.maPhong,
    this.tenGiangVien,
    this.ngayHoc,
    this.gioBatDau,
    this.gioKetThuc,
    this.tuanHocKy,
    this.thongTinTuan,
  });
  ThoiKhoaBieuMonHoc copyWith({
    String? maMon,
    String? tenMon,
    String? maNhom,
    String? soTinChi,
    String? maLop,
    int? thu,
    int? tietBatDau,
    int? soTiet,
    String? maPhong,
    String? tenGiangVien,
    String? ngayHoc,
    String? gioBatDau,
    String? gioKetThuc,
    int? tuanHocKy,
    String? thongTinTuan,
  }) {
    return ThoiKhoaBieuMonHoc(
      maMon: maMon ?? this.maMon,
      tenMon: tenMon ?? this.tenMon,
      maNhom: maNhom ?? this.maNhom,
      soTinChi: soTinChi ?? this.soTinChi,
      maLop: maLop ?? this.maLop,
      thu: thu ?? this.thu,
      tietBatDau: tietBatDau ?? this.tietBatDau,
      soTiet: soTiet ?? this.soTiet,
      maPhong: maPhong ?? this.maPhong,
      tenGiangVien: tenGiangVien ?? this.tenGiangVien,
      ngayHoc: ngayHoc ?? this.ngayHoc,
      gioBatDau: gioBatDau ?? this.gioBatDau,
      gioKetThuc: gioKetThuc ?? this.gioKetThuc,
      tuanHocKy: tuanHocKy ?? this.tuanHocKy,
      thongTinTuan: thongTinTuan ?? this.thongTinTuan,
    );
  }
  
  @override
  // TODO: implement props
  List<Object?> get props => [
     maMon,
     tenMon,
     maNhom,
     soTinChi,
     maLop,
     thu,
     tietBatDau,
     soTiet,
     maPhong,
     tenGiangVien,
     ngayHoc,
     gioBatDau,
     gioKetThuc,
     tuanHocKy,
     thongTinTuan,
  ];

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'maMon': maMon,
      'tenMon': tenMon,
      'maNhom': maNhom,
      'soTinChi': soTinChi,
      'maLop': maLop,
      'thu': thu,
      'tietBatDau': tietBatDau,
      'soTiet': soTiet,
      'maPhong': maPhong,
      'tenGiangVien': tenGiangVien,
      'ngayHoc': ngayHoc,
      'gioBatDau': gioBatDau,
      'gioKetThuc': gioKetThuc,
      'tuanHocKy': tuanHocKy,
      'thongTinTuan': thongTinTuan,
    };
  }

  factory ThoiKhoaBieuMonHoc.fromMap(Map<String, dynamic> map) {
    return ThoiKhoaBieuMonHoc(
      maMon: map['maMon'] != null ? map['maMon'] as String : null,
      tenMon: map['tenMon'] != null ? map['tenMon'] as String : null,
      maNhom: map['maNhom'] != null ? map['maNhom'] as String : null,
      soTinChi: map['soTinChi'] != null ? map['soTinChi'] as String : null,
      maLop: map['maLop'] != null ? map['maLop'] as String : null,
      thu: map['thu'] != null ? map['thu'] as int : null,
      tietBatDau: map['tietBatDau'] != null ? map['tietBatDau'] as int : null,
      soTiet: map['soTiet'] != null ? map['soTiet'] as int : null,
      maPhong: map['maPhong'] != null ? map['maPhong'] as String : null,
      tenGiangVien: map['tenGiangVien'] != null ? map['tenGiangVien'] as String : null,
      ngayHoc: map['ngayHoc'] != null ? map['ngayHoc'] as String : null,
      gioBatDau: map['gioBatDau'] != null ? map['gioBatDau'] as String : null,
      gioKetThuc: map['gioKetThuc'] != null ? map['gioKetThuc'] as String : null,
      tuanHocKy: map['tuanHocKy'] != null ? map['tuanHocKy'] as int : null,
      thongTinTuan: map['thongTinTuan'] != null ? map['thongTinTuan'] as String : null,
    );
  }

  String toJson() => json.encode(toMap());

  factory ThoiKhoaBieuMonHoc.fromJson(String source) => ThoiKhoaBieuMonHoc.fromMap(json.decode(source) as Map<String, dynamic>);
}

import 'package:euni_core_ui/euni_core_ui.dart';

class TaiKhoan extends Equatable {
  final String? accessToken;
  final String? code;
  final double? expiresIn;
  final String? name;
  final String? refreshToken;
  final String? result;
  final String? roles;
  final String? username;
  

  TaiKhoan copyWith({
    final String? accessToken,
    final String? code,
    final double? expiresIn,
    final String? name,
    final String? refreshToken,
    final String? result,
    final String? roles,
    final String? username,
  }) {
    return TaiKhoan(
      accessToken: accessToken ?? this.accessToken,
      code: code ?? this.code,
      expiresIn: expiresIn ?? this.expiresIn,
      name: name ?? this.name,
      refreshToken: refreshToken ?? this.refreshToken,
      result: result ?? this.result,
      roles: roles ?? this.roles,
      username: username ?? this.username,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'accessToken': accessToken,
      'code': code,
      'expiresIn': expiresIn,
      'name': name,
      'refreshToken': refreshToken,
      'result': result,
      'roles': roles,
      'username': username,
    };
  }

  factory TaiKhoan.fromMap(dynamic map) {
    var temp;
    return TaiKhoan(
      accessToken: map['accessToken']?.toString(),
      code: map['code']?.toString(),
      expiresIn: null == (temp = map['expiresIn']) ? null : (temp is num ? temp.toDouble() : double.tryParse(temp)),
      name: map['name']?.toString(),
      refreshToken: map['refreshToken']?.toString(),
      result: map['result']?.toString(),
      roles: map['roles']?.toString(),
      username: map['username']?.toString(),
    );
  }
  const TaiKhoan({
    this.accessToken,
    this.code,
    this.expiresIn,
    this.name,
    this.refreshToken,
    this.result,
    this.roles,
    this.username,
  });

  @override
  List<Object?> get props => [
        accessToken,
        code,
        expiresIn,
        name,
        refreshToken,
        result,
        roles,
        username,
      ];
}

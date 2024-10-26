import 'package:euni_core_ui/repositories/base_api_datasource.dart';
import 'package:euni_daotao_mobile/domain/entities/xem_diem/xemdiem_monhoc/data_xemdiem_monhoc.entity.dart';

import '../../domain/entities/entinal/message.dart';
import '../../domain/entities/xem_diem/data_xemdiem.entity.dart';

class XemDiemRepository {
  late final BaseApiDataSource _baseApi;
  XemDiemRepository() {
    _baseApi = BaseApiDataSource.instance(null);
  }
  Future<Message> getXemDiemHocKy() async {
    var _response = await _baseApi.get(url: 'http://srv01.hitgroup.vn:3001/api/edu-soft/Diem/hoc_kies?refresh=true');
    var _message = Message(result: false);
    var _data = _response.data;
    if (_response.statusCode == 200 && _data is Map) {
      var source = _data['data'];
      if (source != null && source is Map) {
        var dataXemDiemMap = Map<String, dynamic>.from(source);
        var dataXemDiem = DataXemDiem.fromMap(dataXemDiemMap);
        _message.result = true;
        _message.data = dataXemDiem;
      }
    }
    return _message;
  }

  Future<Message> getXemDiemMonHoc() async {
    var _response = await _baseApi.get(url: 'http://srv01.hitgroup.vn:3001/api/edu-soft/Diem/mon_hocs?refresh=true');
    var _message = Message(result: false);
    var _data = _response.data;
    if (_response.statusCode == 200 && _data is Map) {
      var source = _data['data'];
      if (source != null && source is Map) {
        var dataXemDiemMonHocMap = Map<String, dynamic>.from(source);
        var dataXemDiemMonHoc = DataXemDiemMonHoc.fromMap(dataXemDiemMonHocMap);
        _message.result = true;
        _message.data = dataXemDiemMonHoc;
      }
    }
    return _message;
  }
}

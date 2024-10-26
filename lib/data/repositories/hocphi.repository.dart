

import 'package:euni_core_ui/repositories/base_api_datasource.dart';
import 'package:euni_daotao_mobile/domain/entities/hoc_phi/data_hocphi.enitity.dart';

import '../../domain/entities/entinal/message.dart';

class HocPhiRepository {
   late final BaseApiDataSource _baseApi;
   HocPhiRepository (){
    _baseApi = BaseApiDataSource.instance(null);
   }
    Future<Message> getHocPhi() async {
    var _response = await _baseApi.get(url: 'http://srv01.hitgroup.vn:3001/api/edu-soft/HocPhi');
    var _message = Message(result: false);
    var _data = _response.data;
    if (_response.statusCode == 200 && _data is Map) {
      var source = _data['data'];
      if (source != null && source is Map) {
        var dataHocPhiMap = Map<String, dynamic>.from(source);
        var dataHocPhi = DataHocPhi.fromMap(dataHocPhiMap);
        _message.result = true;
        _message.data = dataHocPhi;
      }
    }
    return _message;
  }
}
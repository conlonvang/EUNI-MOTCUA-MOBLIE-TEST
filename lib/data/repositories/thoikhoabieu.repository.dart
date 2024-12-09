import 'package:euni_core_ui/repositories/base_api_datasource.dart';
import 'package:euni_daotao_mobile/domain/entities/thoi_khoa_bieu/data_thoikhoabieu.entity.dart';

import '../../domain/entities/entinal/message.dart';

class ThoiKhoaBieuRepository {
  late final BaseApiDataSource _baseApi;
  ThoiKhoaBieuRepository() {
    _baseApi = BaseApiDataSource.instance(null);
  }
  Future<Message> getXemThoiKhoaBieu(int? hocky) async {
  
  final url = hocky == null
      ? 'http://srv01.hitgroup.vn:3001/api/edu-soft/ThoiKhoaBieu?refresh=true'
      : 'http://srv01.hitgroup.vn:3001/api/edu-soft/ThoiKhoaBieu?refresh=true&hocKy=$hocky';

  var response = await _baseApi.get(url: url);
  var message = Message(result: false);
  var data = response.data;

  if (response.statusCode == 200 && data is Map) {
    var source = data['data'];
    if (source != null && source is Map) {
      var dataThoiKhoaBieuMap = Map<String, dynamic>.from(source);
      var dataThoiKhoaBieu = DataThoiKhoaBieu.fromMap(dataThoiKhoaBieuMap);
      message.result = true;
      message.data = dataThoiKhoaBieu;
    }
  }
  return message;
}

}

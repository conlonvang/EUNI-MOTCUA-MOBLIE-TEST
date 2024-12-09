import 'package:euni_core_ui/repositories/base_api_datasource.dart';
import 'package:euni_daotao_mobile/domain/entities/thoi_khoa_bieu/thoi_khoa_bieu_hoc_ky/data_thoikhoabieuhocky.entity.dart';

import '../../domain/entities/entinal/message.dart';

class ThoiKhoaBieuHocKyRepository {
  late final BaseApiDataSource _baseApi;
  ThoiKhoaBieuHocKyRepository() {
    _baseApi = BaseApiDataSource.instance(null);
  }
  Future<Message> getXemThoiKhoaBieuHocKy(int? hocky) async {
     final url = hocky == null
      ? 'http://srv01.hitgroup.vn:3001/api/edu-soft/ThoiKhoaBieu/hoc_ky'
      : 'http://srv01.hitgroup.vn:3001/api/edu-soft/ThoiKhoaBieu/hoc_ky?hocKy=$hocky&refresh=true';

  var response = await _baseApi.get(url: url);
  var message = Message(result: false);
  var data = response.data;

  if (response.statusCode == 200 && data is Map) {
    var source = data['data'];
    if (source != null && source is Map) {
      var dataThoiKhoaBieuHocKyMap = Map<String, dynamic>.from(source);
      var dataThoiKhoaBieuHocKy = DataThoiKhoaBieuHocKy.fromMap(dataThoiKhoaBieuHocKyMap);
      message.result = true;
      message.data = dataThoiKhoaBieuHocKy;
    }
  }
  return message;
  }
}

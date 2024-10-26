import 'package:euni_core_ui/repositories/base_api_datasource.dart';

import '../../domain/entities/de_cuong_mon_hoc/data.entity.dart';
import '../../domain/entities/entinal/message.dart';
import '../datasources/api/network/api.dart';

class DeCuongMonHocEuniApiDataSource {
  late final BaseApiDataSource _baseApi;

  DeCuongMonHocEuniApiDataSource() {
    _baseApi = BaseApiDataSource.instance(null);
  }

  Future<Message> getDeCuongMonHocEuni({required String maMonHoc}) async {
    var _response = await _baseApi.get(url: '${ApiEndpoint.DECUONG_MONHOC}/$maMonHoc/content');
    var _message = Message(result: false);
    var _data = _response.data;
    if (_response.statusCode == 200 && _data is Map) {
      var source = _data['data'];
      if (source != null && source is Map) {
        var dataDCMHMap = Map<String, dynamic>.from(source);
        var dataDCMH = DataDeCuongMonHoc.fromMap(dataDCMHMap);
        _message.result = true;
        _message.data = dataDCMH;
      }
    }
    return _message;
  }
}
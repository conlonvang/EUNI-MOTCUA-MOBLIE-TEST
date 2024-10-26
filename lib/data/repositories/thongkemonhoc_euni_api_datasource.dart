import 'package:euni_core_ui/repositories/base_api_datasource.dart';

import '../../domain/entities/chuong_trinh_dao_tao/thongke_tiendo/data_TKTD.entity.dart';
import '../../domain/entities/entinal/message.dart';
import '../datasources/api/network/api.dart';

class ThongKeMonHocEuniApiDataSource {
  late final BaseApiDataSource _baseApi;
  ThongKeMonHocEuniApiDataSource() {
    _baseApi = BaseApiDataSource.instance(null);
  }

  Future<Message> getThongKeTienDoEuni() async {
    var _response = await _baseApi.get(url: ApiEndpoint.TK_MOHHOC);

    var _message = Message(result: false);
    var _data = _response.data;

    if (_response.statusCode == 200 && _data is Map) {
      var source = _data['data'];

      if (source != null && source is Map) {

          var dataTKTDCMap = Map<String, dynamic>.from(source);
          var dataTKTD = DataThongKeTienDo.fromMap(dataTKTDCMap);
          _message.result = true;
          _message.data = dataTKTD;

      } 
    } 
    return _message;
  }
}
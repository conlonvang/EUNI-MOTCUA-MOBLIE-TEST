

import 'package:euni_core_ui/repositories/base_api_datasource.dart';

import '../../domain/entities/chuong_trinh_dao_tao/chuongtrinh_daotao/data.entity.dart';
import '../../domain/entities/entinal/message.dart';
import '../../domain/entities/chuong_trinh_dao_tao/monhoc_tuchon/data.entity.dart';
import '../datasources/api/network/api.dart';

class ChuongTrinhDaoTaoEuniApiDataSource {
  late final BaseApiDataSource _baseApi;

  ChuongTrinhDaoTaoEuniApiDataSource() {
    _baseApi = BaseApiDataSource.instance(null);
  }

  Future<Message> getChuongTrinhDaoTaoEuni({
    int? selectedCTDT,
    String? selectedCN,
  }) async {
    String url = ApiEndpoint.CT_DAOTAO;
    if (selectedCTDT != null && selectedCN != null) {
      url += "&loaiChuongTrinhDaoTao=$selectedCTDT&maChuyenNganh=$selectedCN";
    }

    var _response = await _baseApi.get(url: url);
    var _message = Message(result: false);
    var _data = _response.data;

    if (_response.statusCode == 200 && _data is Map) {
      var source = _data['data'];

      if (source != null && source is Map) {
        var dataCTDTMap = Map<String, dynamic>.from(source);
        var dataCTDT = DataChuongTrinhDaoTao.fromMap(dataCTDTMap);

        _message.result = true;
        _message.data = dataCTDT;
      }
    }
    return _message;
  }

  Future<Message> getMonHocTuChonEuni({
    int? selectedCTDT,
    String? selectedCN,
  }) async {
    String url = ApiEndpoint.MH_TUCHON;
    if (selectedCTDT != null && selectedCN != null) {
      url += "&loaiChuongTrinhDaoTao=$selectedCTDT&maChuyenNganh=$selectedCN";
    }

    var _response = await _baseApi.get(url: url);
    var _message = Message(result: false);
    var _data = _response.data;
    if (_response.statusCode == 200 && _data is Map) {
      var source = _data['data'];
      if (source != null && source is Map) {
        var dataMHTCMap = Map<String, dynamic>.from(source);
        var dataMHTC = DataMonHocTuChon.fromMap(dataMHTCMap);
        _message.result = true;
        _message.data = dataMHTC;
      }
    }
    return _message;
  }
}
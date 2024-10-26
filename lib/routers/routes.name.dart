class RouteConfigName {
  static const DEFAULT = "/";
  static const TRANGCHU = '/Trang-chu';
  static const DANGNHAP = '/Dang-nhap';
  static const CHONCHUCNANGCTDT = '/Chon-chuc-nang-CTDT';
  static const CHUONGTRINHDAOTAO = '/Chuong-trinh-dao-tao';
  static const THONG_KE_CTDT = '/thong-ke-ctdt';
  static const MON_HOC_TU_CHON = '/mon-hoc-tu-chon';
  static const DE_CUONG_MON_HOC = '/de-cuong-mon-hoc';
  static const XEM_DIEM = '/xem-diem';
  static const XEM_DIEM_CHI_TIET = '/xem-diem-chi-tiet';
  static const HOC_PHI = '/Hoc-phi';

  static String passParams(String routeName, Map<String, dynamic> params, {Map<String, dynamic>? appends}) {
    routeName = mapParamsToRoute(routeName, params);
    if (appends == null) return routeName;
    return appendParamsToRoute(routeName, appends);
  }

  static String mapParamsToRoute(String route, Map<String, dynamic> params) {
    params.forEach((key, value) {
      route = route.replaceAll(':$key', value);
    });
    return route;
  }

  static String appendParamsToRoute(String route, Map<String, dynamic> params) {
    List<MapEntry> list = params.entries.toList();
    String result = route;
    for (var i = 0; i < list.length; i++) {
      if (i == 0) {
        result += "?${list[i].key}=${list[i].value}";
      } else {
        result += "&${list[i].key}=${list[i].value}";
      }
    }
    return result;
  }
}

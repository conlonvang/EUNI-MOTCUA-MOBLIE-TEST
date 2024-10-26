
import 'package:euni_core_ui/euni_core_ui.dart';
import 'package:euni_core_ui/model/token_login_core.dart';
import 'package:euni_core_ui/repositories/interceptors_core.dart';
import 'package:euni_daotao_mobile/apps/constants/box_hive_local.const.dart';
import 'dart:developer';

import '../../apps/configs/injection.dart';
import '../../apps/configs/response_code.dart';
import '../../apps/configs/service_location.dart';
import '../../apps/store/authen/authen_cubit.dart';
import 'tai_khoan.repository.dart';
class HttpInterceptorsDaoTao extends HttpInterceptors {
  @override
  Future onRequest(RequestOptions options, RequestInterceptorHandler handler) async {
    final box = Hive.box(BoxHiveLocalDaoTao.dbHiveLocalDaoTao);

    TokenLoginCoreHiveModel token = box.get(BoxHiveLocalDaoTao.tokenDaoTao,
        defaultValue: TokenLoginCoreHiveModel(
          accessToken: '',
          refreshToken: '',
          dateEx: '',
        ));

    options.headers = {'Authorization': "Bearer ${token.accessToken}"};
    options.headers.addAll({
      "Content-Type": "application/json",
    });

   // addAcceptLanguageHeader(options, box);
    log("Path: ${options.path}", name: "API");

    return super.onRequest(options, handler);
  }

  @override
  Future onError(DioException err, ErrorInterceptorHandler handler) async {
    var response = err.response;
    if (response != null) {
      if (response.statusCode == ResponseCode.UNAUTHORIZED) {
        final box = Hive.box(BoxHiveLocalDaoTao.dbHiveLocalDaoTao);
        TokenLoginCoreHiveModel token = box.get(BoxHiveLocalDaoTao.tokenDaoTao,
            defaultValue: TokenLoginCoreHiveModel(
              accessToken: '',
              refreshToken: '',
              dateEx: '',
            ));
        RequestOptions options = err.requestOptions;
        final repository = TaiKhoanRepository();
        var result = await repository.getRefreshTokenAsync(token.refreshToken);

        return result.fold(
          (l) {
            return super.onError(err, handler); // Chuyển tiếp lỗi nếu không thể làm mới token
          },
          (r) async {
            final dio = Dio();
            dio.interceptors.add(HttpInterceptorsDaoTao());
            var response0 = await dio.request(
              options.path,
              options: Options(method: options.method),
              data: options.data,
              queryParameters: options.queryParameters,
            );
            return handler.resolve(response0); // Hoàn thành Future với kết quả mới
          },
        );
      } else if (response.statusCode == ResponseCode.FORBIDDEN) {
        final context = getIt<NavigationService>().navigatorKey.currentContext!;
        context.read<AuthenCubit>().logout();
        // Fluttertoast.showToast(
        //   backgroundColor: Colors.orange[400],
        //   msg: "Bạn đã hết phiên đăng nhập!",
        //   toastLength: Toast.LENGTH_LONG,
        //   gravity: ToastGravity.TOP,
        //   timeInSecForIosWeb: 2,
        //   textColor: Colors.white,
        //   fontSize: 16.0,
        // );
        return; 
      }
    }

   
    return super.onError(err, handler);
  }

//    void addAcceptLanguageHeader(RequestOptions options, Box box) {
//   String languageCode = box.get(BoxHiveLocalMotCua.selectedLanguage) == ELanguage.tiengAnh.value ? ELanguage.tiengAnh.name : ELanguage.tiengViet.name;
//   options.headers['Accept-Language'] = languageCode;
// }

}
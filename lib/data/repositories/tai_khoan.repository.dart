
import 'package:euni_core_ui/euni_core_ui.dart';
import 'package:euni_core_ui/model/token_login_core.dart';
import 'package:euni_daotao_mobile/apps/constants/box_hive_local.const.dart';
import 'package:dartz/dartz.dart';
import '../../apps/configs/endpoint.dart';
import '../../apps/configs/response_code.dart';
import '../../apps/core/error/failures.dart';
import 'base.repository.dart';

class TaiKhoanRepository extends BaseRepository {
  Future<Either<Failure, TokenLoginCoreHiveModel>> dangNhapAsync({required String username, required String password}) async {
    Map<String, dynamic> body = {
      "username": username,
      "password": password,
    };
    var result = await dataSource.post(url: "$baseApi${Endpoint.EDUSOFT}${Endpoint.AUTH}${Endpoint.LOGIN}", body: body);
    if (result.statusCode == 201) {
      var data = result.data["data"];
      var token = TokenLoginCoreHiveModel(
        accessToken: data['accessToken'] ?? '',
        dateEx: data['dateEx'] ?? '',
        refreshToken: data['refreshToken'] ?? '',
      );
     final box = Hive.box(BoxHiveLocalDaoTao.dbHiveLocalDaoTao);
     box.delete(BoxHiveLocalDaoTao.tokenDaoTao);
     box.put(BoxHiveLocalDaoTao.tokenDaoTao, token);
     var name = data["name"];
     box.put(BoxHiveLocalDaoTao.nameDaoTao, name);
      var userName = data["username"];
     box.put(BoxHiveLocalDaoTao.usernameDaoTao, userName);

  
      return Right(token);
    } else {
    return Left(SomeSpecificError(result.data["message"]));
    }
  }

  // refresh token
  Future<Either<SomeSpecificErrorWithTitle, TokenLoginCoreHiveModel>> getRefreshTokenAsync(String token) async {
    var result = await dataSource.post(
      url: '$baseApi${Endpoint.EDUSOFT}${Endpoint.AUTH}/token',
      body: {
        'refreshToken': token,
      },
    );
    if (result.statusCode == ResponseCode.CREATE_SUCCESS) {
      var data = result.data;
      var token = TokenLoginCoreHiveModel(
        accessToken: data['accessToken'] ?? '',
        dateEx: data['dateEx'] ?? '',
        refreshToken: data['refreshToken'] ?? '',
      );
      final box = Hive.box(BoxHiveLocalDaoTao.dbHiveLocalDaoTao);
      box.delete(BoxHiveLocalDaoTao.tokenDaoTao);
      box.put(BoxHiveLocalDaoTao.tokenDaoTao, token);
      return Right(token);
    }
    if (result.data is String) {
      return Left(SomeSpecificErrorWithTitle("Lỗi hệ thống", result.data));
      
    }
    return Left(SomeSpecificErrorWithTitle(result.data['title'], result.data['message'] ?? ''));
  }
}

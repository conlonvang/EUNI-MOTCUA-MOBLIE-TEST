import 'package:euni_core_ui/repositories/base_api_datasource.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';

class BaseRepository {
  late final BaseApiDataSource dataSource;
  late final baseApi = dotenv.env['BASE_DaoTao_API'] ?? 'http://srv01.hitgroup.vn:3001/api';

  BaseRepository() {
    dataSource = BaseApiDataSource.instance(null);
  }
}

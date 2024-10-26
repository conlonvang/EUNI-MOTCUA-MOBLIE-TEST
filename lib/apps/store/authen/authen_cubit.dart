
import 'package:euni_core_ui/euni_core_ui.dart';
import 'package:euni_core_ui/model/token_login_core.dart';
import 'package:euni_daotao_mobile/apps/constants/box_hive_local.const.dart';
import 'package:jwt_decoder/jwt_decoder.dart';

import '../../../data/repositories/tai_khoan.repository.dart';
import '../../../routers/factory_routes_singleton.dart';
import '../../../routers/routes.name.dart';
import '../../configs/injection.dart';
import '../../configs/service_location.dart';

part 'authen_state.dart';


class AuthenCubit extends Cubit<AuthenState> {
  AuthenCubit() : super(const AuthenState(isAuth: false));

  final repository = TaiKhoanRepository();

  init() async {
    final box = Hive.box(BoxHiveLocalDaoTao.dbHiveLocalDaoTao);
    TokenLoginCoreHiveModel token = box.get(BoxHiveLocalDaoTao.tokenDaoTao,
        defaultValue: TokenLoginCoreHiveModel(
          accessToken: '',
          refreshToken: '',
          dateEx: '',
        ));

    if (token.accessToken.isEmpty) {
      emit(state.copyWith(isAuth: false));
    } else {
      try {
        bool isExpiredAccess = JwtDecoder.isExpired(token.accessToken);

        if (isExpiredAccess == false) {
          emit(state.copyWith(isAuth: true));
        } else if (isExpiredAccess && token.refreshToken != "") {
          var result = await repository.getRefreshTokenAsync(token.refreshToken);
          result.fold(
            (l) {
              logout();
              emit(
                state.copyWith(isAuth: false),
              );
            },
            (r) => emit(state.copyWith(isAuth: true)),
          );
        } else {
          emit(state.copyWith(isAuth: false));
        }
      } catch (e) {
        logout();
      }
    }
  }

  void logout() {
    final context = getIt<NavigationService>().navigatorKey.currentContext!;
    final box = Hive.box(BoxHiveLocalDaoTao.dbHiveLocalDaoTao);
    box.delete(BoxHiveLocalDaoTao.tokenDaoTao);
    box.delete(BoxHiveLocalDaoTao.usernameDaoTao);
    box.delete(BoxHiveLocalDaoTao.nameDaoTao);
    FactoryNavRoutesSingleton().isMiniApp ? FactoryNavRoutesSingleton().goToRoot() : context.go(RouteConfigName.DANGNHAP);
    emit(state.copyWith(isAuth: false));
  }

  void updateAuth(bool isAuth) {
    emit(state.copyWith(isAuth: isAuth));
  }
}

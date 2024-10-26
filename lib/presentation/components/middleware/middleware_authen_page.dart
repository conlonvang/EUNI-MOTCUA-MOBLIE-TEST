
import 'package:euni_core_ui/euni_core_ui.dart';
import 'package:euni_core_ui/model/token_login_core.dart';
import 'package:euni_daotao_mobile/apps/constants/box_hive_local.const.dart';
import 'package:euni_daotao_mobile/routers/routes.name.dart';
import 'package:flutter/material.dart';

import '../../../apps/constants/colors.const.dart';

class MiddlewareAuthenPage<T> extends Page<T> {
  final Offset? anchorPoint;
  final Color? barrierColor;
  final bool barrierDismissible;
  final String? barrierLabel;
  final bool useSafeArea;
  final CapturedThemes? themes;
  final WidgetBuilder builder;

  const MiddlewareAuthenPage({
    required this.builder,
    this.anchorPoint,
    this.barrierColor = Colors.black87,
    this.barrierDismissible = true,
    this.barrierLabel,
    this.useSafeArea = true,
    this.themes,
    super.key,
    super.name,
    super.arguments,
    super.restorationId,
  });

  @override
  Route<T> createRoute(BuildContext context) {
    final box = Hive.box(BoxHiveLocalDaoTao.dbHiveLocalDaoTao);
    TokenLoginCoreHiveModel token = box.get(BoxHiveLocalDaoTao.tokenDaoTao,
        defaultValue: TokenLoginCoreHiveModel(
          accessToken: '',
          refreshToken: '',
          dateEx: '',
        ));
    return token.accessToken == ""
        ? DialogRoute<T>(
            context: context,
            settings: this,
            builder: (context) => Container(
              padding: const EdgeInsets.all(20),
              width: MediaQuery.of(context).size.width,
              child: AlertDialog(
                icon: const Icon(
                  Icons.error_outline_outlined,
                  size: 100,
                  color: Colors.amber,
                ),
                insetPadding: EdgeInsets.zero,
                //title:  Text('need_log_in'.tr()),
                  title:  const Text('need_log_in'),
                actions: <Widget>[
                  Center(
                    child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        backgroundColor: AppColors.blueShade300,
                        minimumSize: Size(MediaQuery.of(context).size.width * 0.9, 50),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(12),
                        ),
                      ),
                      onPressed: () {
                        Navigator.of(context).pop();
                        context.push(RouteConfigName.DANGNHAP);
                      },
                      child:  const Text(
                       // "log_in".tr(),
                       'Đăng nhập',
                        style: TextStyle(color: Colors.white),
                      ),
                    ),
                  )
                ],
              ),
            ),
            anchorPoint: anchorPoint,
            barrierColor: barrierColor,
            barrierDismissible: barrierDismissible,
            barrierLabel: barrierLabel,
            useSafeArea: useSafeArea,
            themes: themes,
          )
        : MaterialPageRoute(
            settings: this,
            builder: (context) => SizedBox(
              width: MediaQuery.of(context).size.width,
              child: builder(context),
            ),
          );
  }
}

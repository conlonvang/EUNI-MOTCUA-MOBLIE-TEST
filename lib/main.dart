import 'package:euni_core_ui/euni_core_ui.dart';
import 'package:euni_daotao_mobile/apps/configs/service_location.dart';
import 'package:euni_daotao_mobile/apps/constants/box_hive_local.const.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'apps/configs/config_loading.dart';
import 'apps/store/authen/authen_cubit.dart';
import 'data/repositories/interceptors.dart';
import 'routers/factory_routes_singleton.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  NavigationService().setupNavigator();
  if (kReleaseMode) {
    await dotenv.load(fileName: "assets/.env.production");
  } else {
    await dotenv.load(fileName: "assets/.env.development");
  }
  ConfigLoading().configLoading();
  await initApp(HttpInterceptorsDaoTao());
  await Hive.openBox(BoxHiveLocalDaoTao.dbHiveLocalDaoTao);

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    final router = FactoryNavRoutesSingleton().items;
    ScreenUtil.init(context);

    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => AuthenCubit()..init(),
          lazy: false,
        ),
      ],
      child: ScreenUtilInit(
        designSize: MediaQuery.of(context).size.width < 744 ? const Size(430, 932) : const Size(744, 1133),
        child: MaterialApp.router(
          builder: EasyLoading.init(),
          debugShowCheckedModeBanner: false,
          title: 'Flutter Demo',
          theme: ThemeData(
            visualDensity: VisualDensity.adaptivePlatformDensity,
            useMaterial3: true,
            colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple).copyWith(background: const Color(0xffF5F5F5)),
          ),
          routerConfig: router,
        ),
      ),
    );
  }
}

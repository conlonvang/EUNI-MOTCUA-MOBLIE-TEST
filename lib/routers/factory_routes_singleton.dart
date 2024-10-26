import 'package:euni_core_ui/euni_core_ui.dart';
import 'package:euni_daotao_mobile/routers/routes.package.dart';
import 'package:flutter/material.dart';

import '../apps/configs/injection.dart';
import '../apps/configs/service_location.dart';

class FactoryNavRoutesSingleton {
  static final FactoryNavRoutesSingleton _instance = FactoryNavRoutesSingleton._internal();
  BuildContext? _contextRoot;
  factory FactoryNavRoutesSingleton() {
    return _instance;
  }

  FactoryNavRoutesSingleton._internal();
  bool _isMiniApp = false;
  final GoRouter _items = routerGoRoutes;
  GoRouter get items => _items;
  bool get isMiniApp => _isMiniApp;
  void updateIsMiniApp(bool value) {
    _isMiniApp = value;
  }

  void goToRoot() {
    if (_contextRoot != null) {
      final context = getIt<NavigationService>().navigatorKey.currentContext!;
      while (GoRouter.of(context).canPop()) {
        GoRouter.of(context).pop();
      }
      _contextRoot!.go("/");
    }
  }

  void updateContextRoot(BuildContext? context) {
    _contextRoot = context;
  }

  void offAll() {}
}

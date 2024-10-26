import 'package:euni_core_ui/euni_core_ui.dart';
import 'package:flutter/material.dart';

import 'injection.dart';

class NavigationService {
  final GlobalKey<NavigatorState> navigatorKey = GlobalKey<NavigatorState>();
  final RouteObserver<PageRoute> routeObserver = RouteObserver<PageRoute>();
  final scaffoldMessengerKey = GlobalKey<ScaffoldMessengerState>();
  BuildContext get navigatorContext => navigatorKey.currentState!.context;

  void setupNavigator() {
    bool isRegistered = getIt.isRegistered<NavigationService>();
    if (!isRegistered) {
      getIt.registerLazySingleton(() => NavigationService());
    }
  }

  Future<void> toNamed(
    String page, {
    Map<String, String>? parameters,
  }) async {
    if (parameters != null) {
      final uri = Uri(path: page, queryParameters: parameters);
      page = uri.toString();
    }
    await Future.delayed(const Duration(seconds: 0), () => navigatorContext.push(page));
    // return global(id).currentState?.pushNamed<T>(
    //       page,
    //       arguments: arguments,
    //     );
  }

  Future<void> pushReplacementNamed(
    String page, {
    Map<String, String>? parameters,
  }) async {
    if (parameters != null) {
      final uri = Uri(path: page, queryParameters: parameters);
      page = uri.toString();
    }
    await Future.delayed(const Duration(seconds: 0), () => navigatorContext.pushReplacement(page));
  }
}

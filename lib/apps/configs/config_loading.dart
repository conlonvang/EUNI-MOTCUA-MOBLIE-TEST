
import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';

class ConfigLoading {
  void configLoading() {
    EasyLoading.instance
      ..displayDuration = const Duration(milliseconds: 2000)
      ..loadingStyle = EasyLoadingStyle.custom
      ..indicatorSize = 60
      ..textColor = Colors.black
      ..radius = 20
      ..backgroundColor = Colors.transparent
      ..maskColor = Colors.white
      ..indicatorColor = Colors.black54
      ..userInteractions = false
      ..dismissOnTap = false
      ..boxShadow = <BoxShadow>[]
      ..indicatorType = EasyLoadingIndicatorType.fadingCircle;
  }
}

class EasyLoadingCustom {
  EasyLoadingCustom._privateConstructor();

  static final EasyLoadingCustom _instance = EasyLoadingCustom._privateConstructor();

  static EasyLoadingCustom get instance => _instance;

  void configLoading() {
    EasyLoading.instance
      ..displayDuration = const Duration(milliseconds: 2000)
      ..loadingStyle = EasyLoadingStyle.custom
      ..indicatorSize = 60
      ..textColor = Colors.black
      ..radius = 20
      ..backgroundColor = Colors.transparent
      ..maskColor = Colors.white
      ..indicatorColor = Colors.black54
      ..userInteractions = false
      ..dismissOnTap = false
      ..boxShadow = <BoxShadow>[]
      ..indicatorType = EasyLoadingIndicatorType.fadingCircle;
  }

  void dismiss() {
    EasyLoading.dismiss();
    configLoading();
  }

  void loadingWithBackgroud(String message) {
    EasyLoading.instance
      ..backgroundColor = Colors.blue[800]
      ..indicatorColor = Colors.white
      ..textColor = Colors.white;
    EasyLoading.show(
      status: message,
      maskType: EasyLoadingMaskType.black,
    );
  }

  void loading(String message) {
    EasyLoading.show(
      status: message,
      maskType: EasyLoadingMaskType.none,
    );
  }
}

import 'package:package_info_plus/package_info_plus.dart';

class PageRouteInfoApi {
  static Future<String> getPackageName() async {
    PackageInfo packageInfo = await PackageInfo.fromPlatform();
    return packageInfo.packageName;
  }

  static Future<String> getAppVersion() async {
    PackageInfo packageInfo = await PackageInfo.fromPlatform();
    // return '${packageInfo.version} + ${packageInfo.buildNumber}';
    return packageInfo.version;
  }
}

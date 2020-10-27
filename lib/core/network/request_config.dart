import 'package:flutter_face/common/global.dart';
import 'package:flutter_face/model/user.dart';

class HttpConfig {
  /// https://httpbin.org
  static const String baseUrl = "https://pre-api.shixunbao.cn";
  static const int sendTimeout = 10000;
  static const int connectTimeout = 30000;
  static const int receiveTimeout = 10000;

  static Map<String, String> headersMap = {
    "imei": Global.appname,
    "device": Global.device,
    "appname": Global.appname,
    "versionname": Global.versionname,
    "versioncode": Global.versioncode
  };

  static Map<String, String> setParamsFormDB(){
    OPUser user = UserHandler.getDBUser();
    if (user != null){
     return user.toJson();
    }
    return null;
  }
}

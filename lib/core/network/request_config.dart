import 'package:flutter_face/common/global.dart';

class HttpConfig {
  // https://httpbin.org
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

  //设置uid token clazzId
  // static Map<String, String> setParamsFormDB(){
  //   Map<String, String> params = {};
  //   params["uid"] = CXUtil.getString("uid") ?? "";
  //   params["clazzId"] = CXUtil.getString("clazzId") ?? "";
  //   params["token"] = CXUtil.getString("token") ?? "";
  //   return params;
  // }
}

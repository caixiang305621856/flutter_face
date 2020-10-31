import 'package:flutter/material.dart';
import 'package:flutter_face/common/global.dart';
import 'package:flutter_face/model/user.dart';

class HttpConfig {

  static const String get = 'get';
  static const String post = 'post';
  static const int succeedCode = 200;
  static const int logOutCode = 700;
  static const String code = 'code';
  static const String dioMessage = 'dioMessage';
  static const String message = 'message';
  static const String status = 'status';
  static const String data = 'data';

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
      Map<String, String> params = {};
      params["uid"] = user.uid ?? "";
      params["clazzId"] = user.clazzId ?? "";
      params["token"] = user.token ?? "";
      return params;
    }
    return null;
  }
}

import 'dart:io';

import 'package:package_info/package_info.dart';
import 'package:device_info/device_info.dart';
import 'package:dio/dio.dart';
import 'package:flustars/flustars.dart';
import 'package:flutter/material.dart';

import 'package:flutter_face/core/utils/log.dart';
import 'package:flutter_face/core/utils/size_fit.dart';
import 'package:flutter_face/model/user.dart';

class Global{
  static String _device;
  static String _imei;
  static String _appname;
  static String _versionname;
  static String _versioncode;

  ///初始化全局信息
  Future init(VoidCallback callback) async{
    ///初始化 适配工具
    OPSizeFit.initialize();

    WidgetsFlutterBinding.ensureInitialized();
    ///初始化 基础工具
    await SpUtil.getInstance();
    ///获取设备唯一id
    _imei = await GlobalUnique.getUniqueId();

    if(Platform.isIOS){
      _device = "iOS";
    } else if(Platform.isAndroid){
      _device = "Android";
    }
    ///获取包的信息
    PackageInfo packageInfo = await PackageInfo.fromPlatform();
    _versionname = packageInfo.version;
    _versioncode = _versionname.replaceAll(".", "0");
    _appname = "ttManager";

    callback();

    Dlog.showLog({
      "imei":_imei,
      "device":_device,
      "versionname":_versionname,
      "versioncode":_versioncode,
      "appname":_appname
    },prefix: "请求头");

    OPUser user =  UserHandler.getDBUser();
    if(user != null){
      Dlog.showLog(UserHandler.getDBUser().toJson(),prefix: "公用请求体");
    }
  }

  static String get device => _device;

  static String get versioncode => _versioncode;

  static String get versionname => _versionname;

  static String get appname => _appname;

  static String get imei => _imei;

}

class GlobalUnique{
  static Future<String> getUniqueId() async{
    DeviceInfoPlugin deviceInfo = DeviceInfoPlugin();
    if (Platform.isIOS) {
      IosDeviceInfo iosDeviceInfo = await deviceInfo.iosInfo;
      return iosDeviceInfo.identifierForVendor; // unique ID on iOS
    } else {
      AndroidDeviceInfo androidDeviceInfo = await deviceInfo.androidInfo;
      return androidDeviceInfo.androidId; // unique ID on Android
    }
  }
}

class GlobalPackageInfo{
  static Future<String> getUniqueId() async{
    DeviceInfoPlugin deviceInfo = DeviceInfoPlugin();
    if (Platform.isIOS) {
      IosDeviceInfo iosDeviceInfo = await deviceInfo.iosInfo;
      return iosDeviceInfo.identifierForVendor; // unique ID on iOS
    } else {
      AndroidDeviceInfo androidDeviceInfo = await deviceInfo.androidInfo;
      return androidDeviceInfo.androidId; // unique ID on Android
    }
  }
}


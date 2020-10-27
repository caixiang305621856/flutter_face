import 'dart:io';
import 'package:flutter/material.dart';

import 'package:device_info/device_info.dart';
import 'package:dio/dio.dart';
import 'package:flustars/flustars.dart';
import 'package:flutter_face/core/utils/log.dart';
import 'package:package_info/package_info.dart';

import 'package:flutter_face/core/utils/size_fit.dart';

class Global{
  ///请求头数据
  static String _device;
  static String _imei;
  static String _appname;
  static String _versionname;
  static String _versioncode;

  ///初始化全局信息
  Future init(VoidCallback callback) async{
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

    Dlog.showLog("_imei:$_imei \n _device:$_device \n _versionname:$_versionname \n _versioncode:$_versioncode \n _appname:$_appname",stackTrace: StackTrace.current,prefix:"请求头信息");

    callback();
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
      // _imei = iosDeviceInfo.identifierForVendor;
      // _device = "iOS";
      return iosDeviceInfo.identifierForVendor; // unique ID on iOS
    } else {
      AndroidDeviceInfo androidDeviceInfo = await deviceInfo.androidInfo;
      // _imei = androidDeviceInfo.androidId;
      // _device = "Android";
      return androidDeviceInfo.androidId; // unique ID on Android
    }
  }
}


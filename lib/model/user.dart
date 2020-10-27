import 'package:flutter_face/common/event_bus.dart';
import 'package:sp_util/sp_util.dart';

class OPUser {
  String _token;
  String _uid;
  String _clazzId;

  String get token => _token;
  String get clazzId => _clazzId;
  String get uid => _uid;

  OPUser(this._token,this._uid,this._clazzId);

  set token(String value) {
    print("进来set方法了");
    if(value.isEmpty){
      print("发通知了，要退出登录了");
      //发出通知
      eventBus.fire(this);
    }
    _token = value;
  }

  Map toJson() {
    Map map = new Map();
    map["token"] = this._token;
    map["uid"] = this._uid;
    map["clazzId"] = this._clazzId;
    return map;
  }

  OPUser.fromJson(Map json) {
    _token = json['token'];
    _uid = json['uid'];
    _clazzId = json['clazzId'];
  }
}

class UserHandler{
  static bool isLogin (){
    OPUser user = getDBUser();
    if (user == null){
      return false;
    }
    return user.token.isNotEmpty;
  }

  static OPUser getDBUser(){
    return SpUtil.getObj("user_db",(v)=> OPUser.fromJson(v));
  }

  static Future<bool> saveDBUser(OPUser user){
    return SpUtil.putObject("user_db", user);
  }

  static Future<bool> removeDBUser(){
    return SpUtil.remove("user_db");
  }
}


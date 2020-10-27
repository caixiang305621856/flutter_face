import 'package:flutter_face/common/event_bus.dart';

class OPUser {
  String _token;
  String _uid;
  String _clazzId;

  String get token => _token;
  String get clazzId => _clazzId;
  String get uid => _uid;

  OPUser(this._token,this._uid,this._clazzId);

  set token(String value) {
    if(value.isEmpty){
      //发出通知
      eventBus.fire(this);
    }
    _token = value;
  }

  static fromJson(Map v) {

  }
}
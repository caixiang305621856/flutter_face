import 'package:flutter/material.dart';

import 'package:flutter_face/core/network/token_request.dart';
import 'package:flutter_face/core/utils/log.dart';
import 'package:flutter_face/model/login_user.dart';
import 'package:flutter_face/model/user.dart';
import 'package:flutter_face/router/router.dart';
import 'package:flutter_face/ui/pages/home/home_page.dart';

class OPSelectClazzPage extends StatelessWidget {

  static const String routerName = "/select";

  List<Clazzs> itmes = [];
  OPSelectClazzPage(this.itmes);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("选择班级"),
      ),
      body: _buildSelectClazzContent(),
    );
  }

  Widget _buildSelectClazzContent(){
    return ListView.builder(
      itemCount: itmes.length,
      itemBuilder: (context,index){
      return OPClazzItem(itmes[index]);
    });
  }
}

class OPClazzItem extends StatelessWidget {
  OPUser user;
  final Clazzs _clazzs;
  OPClazzItem(this._clazzs);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          GestureDetector(
            child: Container(
              alignment: Alignment.center,
              height: 60,
              width: double.infinity,
              color: Colors.red,
              child: Text(_clazzs.name,style: TextStyle(fontSize: 28),)
            ),
            onTap: (){
              ///选中班级
              OPToken.getToken(_clazzs.uid).then((value){
                Dlog.showLog("uid:${_clazzs.uid} \n clazzId:${_clazzs.identification} \n token:$value",prefix: "选班获取token成功");
                user = UserHandler.getDBUser();
                if(user == null){
                  user = OPUser(value, _clazzs.uid, _clazzs.identification.toString());
                } else{
                  user.token = value;
                }
                UserHandler.saveDBUser(user);
                OPRouter.navigatorKey.currentState.pushReplacementNamed(OPHomePage.routerName);
              }).whenComplete((){
                Dlog.showLog("选班完成、隐藏菊花");
              });
            },
          )
        ],
      ),
    );
  }
}


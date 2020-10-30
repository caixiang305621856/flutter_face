import 'package:flutter/material.dart';

import 'package:flutter_face/core/network/token_request.dart';
import 'package:flutter_face/model/login_user.dart';
import 'package:flutter_face/model/user.dart';
import 'package:flutter_face/router/router.dart';
import 'package:flutter_face/ui/pages/main/main.dart';
import 'package:flutter_face/utils.dart';

class OPSelectClazzPage extends StatelessWidget {

  static const String routerName = "/select";

  var classItmes = <Clazzs>[];
  OPSelectClazzPage(this.classItmes);

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
      itemCount: classItmes.length,
      itemBuilder: (context,index){
      return OPClazzItem(classItmes[index]);
    });
  }
}

class OPClazzItem extends StatelessWidget {
  final Clazzs _clazzs;
  OPClazzItem(this._clazzs);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: _selectClazzHandler,
      child: Container(
        decoration: BoxDecoration(
          color: OPAppTheme.kWhiteColor,
            gradient: LinearGradient(colors:[Colors.redAccent,Colors.orange[700]]), //背景渐变
            borderRadius : BorderRadius.circular(10),
          boxShadow:[
            BoxShadow(
                color:OPAppTheme.kTipsColor,
                offset: Offset(2.0,3.0),
                blurRadius: 5.0
            )
          ]
        ),
        margin: EdgeInsets.only(left: 13,top: 13,right: 13,bottom: 0),
        padding: EdgeInsets.only(left: 10,top: 16,right: 10,bottom: 16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Text(_clazzs.name,style: Theme.of(context).textTheme.headline6.copyWith(
              color: OPAppTheme.kWhiteColor
            ),),
            SizedBox(height: 7.px,),
            Row(
              children: [
                Row(
                  children: [
                    Icon(Icons.timer,size: 16,color: OPAppTheme.kWhiteColor,),
                    SizedBox(width: 5.px,),
                    Text(
                        "${_clazzs.trainingBeginDate} ~ ${_clazzs.trainingEndDate}",
                        style: Theme.of(context).textTheme.bodyText1.copyWith(
                          color: OPAppTheme.kWhiteColor
                        ))
                  ],
                ),
                SizedBox(width: 15.px,),
                Row(
                  children: [
                    Icon(Icons.people,size: 16,color: OPAppTheme.kWhiteColor,),
                    SizedBox(width: 5.px,),
                    Text(
                        "学员数: ${_clazzs.studentCount}",
                        style: Theme.of(context).textTheme.bodyText1.copyWith(
                            color: OPAppTheme.kWhiteColor
                        ))
                  ],
                ),
              ],
            ),
            SizedBox(height: 7.px,),
            Row(
              children: [
                Icon(Icons.view_week_sharp,size: 16,color: OPAppTheme.kWhiteColor,),
                SizedBox(width: 5.px,),
                Text("所属项目: ${_clazzs.projectName}",style: Theme.of(context).textTheme.bodyText1.copyWith(
                    color: OPAppTheme.kWhiteColor
                )),
              ],
            ),
          ],
        ),
      ),
    );
  }

  void _selectClazzHandler(){
    ///选中班级
    OPToken.getToken(_clazzs.uid).then((value){
      Dlog.showLog("uid:${_clazzs.uid} \n clazzId:${_clazzs.identification} \n token:$value",prefix: "选班获取token成功");
      OPUser user = UserHandler.getDBUser();
      if(user == null){
        user = OPUser(value, _clazzs.uid, _clazzs.identification.toString());
      } else{
        user.token = value;
      }
      UserHandler.saveDBUser(user);
      OPRouter.navigatorKey.currentState.pushReplacementNamed(OPMainPage.routerName);
    }).whenComplete((){
      Dlog.showLog("选班完成、隐藏菊花");
    });
  }
}


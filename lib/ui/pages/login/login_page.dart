import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_face/ui/utils/loading.dart';

import 'package:flutter_face/core/utils/extension/int_extension.dart';
import 'package:flutter_face/core/network/login_request.dart';
import 'package:flutter_face/model/login_user.dart';
import 'package:flutter_face/router/router.dart';
import 'package:flutter_face/ui/pages/clazz/selectclazz_page.dart';
import 'package:flutter_face/ui/widgets/loading_widget.dart';

class OPLoginPage extends StatelessWidget {
  static const String routerName = "/login";
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: OPLoginContent(),
      ),
    );
  }
}

class OPLoginContent extends StatefulWidget {
  @override
  _OPLoginContentState createState() => _OPLoginContentState();
}

class _OPLoginContentState extends State<OPLoginContent> {
  final usernameTextEditController = TextEditingController();
  final passwordTextEditController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(vertical: 100.px,horizontal: 50.px),
      child: Column(
        children: <Widget>[
          Row(children: <Widget>[
            Text("账号",style: TextStyle(fontSize: 28.px,fontWeight: FontWeight.bold),),
            SizedBox(width: 8.px),
            Image.asset("assets/images/login/img_sign_manager@2x.png",width: 72.px,height: 23.px,)
          ],),
          SizedBox(height: 8.px),
          _buildLoginTextField("用户名",usernameTextEditController),
          SizedBox(height: 20.px),
          Container(
            alignment: Alignment.centerLeft,
            child: Text("密码",style: TextStyle(fontSize: 30,fontWeight: FontWeight.bold),),
          ),
          SizedBox(height: 8.px),
          _buildLoginTextField("请输入密码",passwordTextEditController),
          SizedBox(height: 20.px),
          GestureDetector(
            onTap: (){
              OPLoading.show(context);
              ///获取用户名密码
              final username = usernameTextEditController.text;
              final password = passwordTextEditController.text;
              OPLogin.login(username, password).then((value){
                OPLoading.hide(context);
                List<Clazzs> clazzs = [];
                for (var list in value){
                  for (Clazzs cla in list.clazzs){
                    cla.uid = list.identification.toString();
                  }
                  clazzs.addAll(list.clazzs);
                }
                if(clazzs.length > 1){
                  OPRouter.navigatorKey.currentState.pushReplacementNamed(OPSelectClazzPage.routerName,arguments: clazzs);
                }
              }).whenComplete((){
              });
            },
            child: Container(
                height: 44.px,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(22.px),
                  color: Colors.orange,
                ),
                width: double.infinity,
                alignment: Alignment.center,
                child: Text("登录",style: TextStyle(fontSize: 18.px,color: Colors.white))
            ),
          )
        ],
      ),
    );
  }

  Widget _buildLoginTextField(String placeholder,TextEditingController textEditingController) {
    return Container(
      width: double.infinity,
      alignment: Alignment.bottomCenter,
      child: TextField(
        controller: textEditingController,
        cursorColor: Colors.orange,
        textAlign: TextAlign.start, //文本对齐方式
        style: TextStyle(
          fontSize: 16.px,
        ),
        decoration: InputDecoration(
          border:InputBorder.none,
          hintText: placeholder,
        ),
      ),
    );
  }
}
import 'package:flutter/material.dart';

import 'package:flutter_face/utils.dart';
import 'package:flutter_face/core/network/login_request.dart';
import 'package:flutter_face/model/login_user.dart';
import 'package:flutter_face/router/router.dart';
import 'package:flutter_face/ui/pages/clazz/clazz_select_page.dart';
import 'package:flutter_face/ui/utils/loading.dart';
import 'package:flutter_face/ui/utils/toast.dart';

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
  final usernameTextEditController = TextEditingController(text: "sxb");
  final passwordTextEditController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(left: 45.px,right: 50.px,top: 110.px),
      child: Column(
        children: <Widget>[
          _buildLoginTitleRow(),
          SizedBox(height: 8.px),
          _buildLoginTextField("用户名",usernameTextEditController),
          Divider(height: 1,color: OPAppTheme.kSeparatorLineColor,),
          SizedBox(height: 20.px),
          _buildLoginPasswordContainer(),
          SizedBox(height: 8.px),
          _buildLoginTextField("请输入密码",passwordTextEditController),
          Divider(height: 1,color: OPAppTheme.kSeparatorLineColor,),
          SizedBox(height: 30.px),
          OPLoginBtnWidget(usernameTextEditController: usernameTextEditController, passwordTextEditController: passwordTextEditController),
        ],
      ),
    );
  }

  Container _buildLoginPasswordContainer() {
    return Container(
          alignment: Alignment.centerLeft,
          child: Text("密码",style: TextStyle(fontSize: 30,fontWeight: FontWeight.bold),),
        );
  }

  Row _buildLoginTitleRow() {
    return Row(children: <Widget>[
          Text("账号",style: TextStyle(fontSize: 28.px,fontWeight: FontWeight.bold),),
          SizedBox(width: 8.px),
          Image.asset("assets/images/login/img_sign_manager@2x.png",width: 72.px,height: 23.px,)
        ],);
  }

  Widget _buildLoginTextField(String placeholder,TextEditingController textEditingController) {
    return Container(
      width: double.infinity,
      alignment: Alignment.bottomCenter,
      child: TextField(
        controller: textEditingController,
        obscureText: textEditingController == usernameTextEditController?false:true,
        autofocus: textEditingController == usernameTextEditController?true:false,
        cursorColor: OPAppTheme.kMainColor,
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

class OPLoginBtnWidget extends StatelessWidget {
  const OPLoginBtnWidget({
    Key key,
    @required this.usernameTextEditController,
    @required this.passwordTextEditController,
  }) : super(key: key);

  final TextEditingController usernameTextEditController;
  final TextEditingController passwordTextEditController;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 44,
      width: double.infinity,
      child: RaisedButton(
        color: OPAppTheme.kMainColor,
        highlightColor: OPAppTheme.kMainColor,
        disabledColor: OPAppTheme.kTipsColor,
        child: Text("登录",style: TextStyle(fontSize: 18.px,color: OPAppTheme.kWhiteColor),),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(22)),
        onPressed:()=>_login(context),
      ),
    );
  }

  _login(BuildContext context){
    ///获取用户名密码
    final username = usernameTextEditController.text.replaceAll(" ", "");
    final password = passwordTextEditController.text.replaceAll(" ", "");
    if(username.length == 0){
      OPToast.showToast("账号不能为空");
      return;
    }
    if(password.length == 0){
      OPToast.showToast("密码不能为空");
      return;
    }
    OPLoading.show(context);
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
        OPRouter.navigatorKey.currentState.pushReplacementNamed(
            OPSelectClazzPage.routerName,
            arguments: clazzs
        );
      }
    });
  }
}

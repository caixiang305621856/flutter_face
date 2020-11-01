
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_face/utils.dart';

class LoginRoute extends StatefulWidget {
  static const String routerName = "/login_test";
  @override
  _LoginRouteState createState() => _LoginRouteState();
}

class _LoginRouteState extends State<LoginRoute> {
  TextEditingController _unameController = new TextEditingController();
  TextEditingController _pwdController = new TextEditingController();
  bool pwdShow = false;
  GlobalKey _formKey = new GlobalKey<FormState>();
  bool _nameAutoFocus = true;

  @override
  void initState() {
    // 自动填充上次登录的用户名，填充后将焦点定位到密码输入框
    _unameController.text = 'sxb';
    if (_unameController.text != null) {
      _nameAutoFocus = false;
    }
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding:EdgeInsets.only(left: 40,top: 100,right: 40,bottom: 40),
        child: Form(
          key: _formKey,
          child: Column(
            children: <Widget>[
              Row(
                children: <Widget>[
                  Text("账号",style: TextStyle(fontSize: 30,fontWeight: FontWeight.bold),),
                  // SizedBox(width: 8.px),
                  // Image.asset("assets/images/login/img_sign_manager@2x.png",width: 72.px,height: 23.px,)
                ],
              ),
              TextFormField(
                autofocus: _nameAutoFocus,
                controller: _unameController,
                cursorColor: OPAppTheme.kMainColor,
                decoration: InputDecoration(
                  border:InputBorder.none,
                  hintText: "用户名",
                ),
                // 校验用户名（不能为空）
                validator: (v) {
                  return null;
                }),
              Divider(height: 1,color: OPAppTheme.kOtherFontColor,),
              SizedBox(height: 15.px),
              Row(
                children: [
                  Text("密码",style: TextStyle(fontSize: 30,fontWeight: FontWeight.bold)),
                ],
              ),
              TextFormField(
                controller: _pwdController,
                autofocus: !_nameAutoFocus,
                cursorColor: OPAppTheme.kMainColor,
                decoration: InputDecoration(
                  border:InputBorder.none,
                  hintText: "密码",
                ),
                //校验密码（不能为空）
                validator: (v) {
                  return null;
                },
              ),
              Divider(height: 1,color: OPAppTheme.kOtherFontColor,),
              Padding(
                padding: const EdgeInsets.only(top: 25),
                child: ConstrainedBox(
                  constraints: BoxConstraints.expand(height: 44.0),
                  child: RaisedButton(
                    color: Theme.of(context).primaryColor,
                    onPressed: _onLogin,
                    textColor: Colors.white,
                    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(22)),
                    child: Text('登录'),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  void _onLogin() async {
  }
}

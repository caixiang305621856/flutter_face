import 'package:flutter/material.dart';
import 'package:flutter_face/router/router.dart';

import 'login/login_page.dart';

class OPTransitionPage extends StatefulWidget {
  static const String routerName = "/tem";

  @override
  _OPTransitionPageState createState() => _OPTransitionPageState();
}

class _OPTransitionPageState extends State<OPTransitionPage> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    Future.delayed(Duration(seconds: 1),(){
      OPRouter.navigatorKey.currentState.pushNamedAndRemoveUntil(OPLoginPage.routerName, (Route<dynamic> route) => false);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
      ),
    );
  }
}
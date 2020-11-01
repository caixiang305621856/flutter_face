import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'package:flutter_face/common/event_bus.dart';
import 'package:flutter_face/common/global.dart';
import 'package:flutter_face/router/router.dart';
import 'package:flutter_face/ui/pages/login/login_page.dart';

import 'model/user.dart';

import 'utils.dart';

void main() {
  Global().init((){
    SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp])
        .then((_) {
      ///初始化 适配工具
      OPSizeFit.initialize();
      runApp( MyApp());
    });
  });
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    //监听
    eventBus.on<OPUser>().listen((event) {
      if(event.token.isEmpty){
        print("监听到需要退出登录");
        OPRouter.navigatorKey.currentState.pushNamedAndRemoveUntil(OPLoginPage.routerName, (Route<dynamic> route) => false);
      }
    });
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter',
      theme: OPAppTheme.norTheme,
      routes: OPRouter.routes,
      onGenerateRoute: OPRouter.generateRoute,
      onUnknownRoute: OPRouter.unknownRoute,
      initialRoute: OPRouter.initialRoute,
      navigatorKey: OPRouter.navigatorKey,
    );
  }
}










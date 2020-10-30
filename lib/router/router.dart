import 'package:flutter/material.dart';

import 'package:flutter_face/core/utils/log.dart';
import 'package:flutter_face/model/user.dart';
import 'package:flutter_face/ui/pages/clazz/clazz_select_page.dart';
import 'package:flutter_face/ui/pages/home/home_page.dart';
import 'package:flutter_face/ui/pages/login/login_page.dart';
import 'package:flutter_face/ui/pages/main/main.dart';
import 'package:flutter_face/ui/pages/setting/setting_page.dart';
import 'package:flutter_face/ui/pages/transition.dart';
import 'package:flutter_face/ui/pages/video_page.dart';

class OPRouter {

  static GlobalKey<NavigatorState> navigatorKey=GlobalKey();

  static final String initialRoute = UserHandler.isLogin()?OPMainPage.routerName:OPLoginPage.routerName;

  static final Map<String, WidgetBuilder> routes = {
    OPTransitionPage.routerName : (ctx) => OPTransitionPage(),
    OPHomePage.routerName : (ctx) => OPHomePage(),
    OPMainPage.routerName: (ctx) => OPMainPage(),
    OPSettingPage.routerName: (ctx) => OPSettingPage(),
  };

  static final RouteFactory generateRoute = (settings) {
    //处理带参数的路由
    if (settings.name == OPSelectClazzPage.routerName) {
      return MaterialPageRoute(
        builder: (ctx) {
          return OPSelectClazzPage(settings.arguments);
        },
        fullscreenDialog: true
      );
    } else if(settings.name == OPLoginPage.routerName){
      return MaterialPageRoute(
          builder: (ctx) {
            return OPLoginPage();
          },
          fullscreenDialog: true
      );
    } else if(settings.name == VideoApp.routerName){
      return MaterialPageRoute(
          builder: (ctx) {
            return VideoApp(settings.arguments);
          },
          fullscreenDialog: true
      );
    }
    return null;
  };

  static final RouteFactory unknownRoute = (settings) {
    Dlog.showLog(settings.name,prefix: "unknownRoute");
    return null;
  };
}


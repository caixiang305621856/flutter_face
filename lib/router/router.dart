import 'package:flutter/material.dart';
import 'package:flutter_face/core/utils/log.dart';

import 'package:flutter_face/model/user.dart';
import 'package:flutter_face/ui/pages/clazz/clazz_select_page.dart';
import 'package:flutter_face/ui/pages/home/home_page.dart';
import 'package:flutter_face/ui/pages/login/login_page.dart';
import 'package:flutter_face/ui/pages/main/main.dart';
import 'package:flutter_face/ui/pages/setting/setting_page.dart';

class OPRouter {

  static GlobalKey<NavigatorState> navigatorKey=GlobalKey();

  static final String initialRoute = UserHandler.isLogin()?OPMainPage.routerName:OPLoginPage.routerName;

  static final Map<String, WidgetBuilder> routes = {
    OPHomePage.routerName : (ctx) => OPHomePage(),
    OPSettingPage.routerName: (ctx) => OPSettingPage(),
    OPMainPage.routerName: (ctx) => OPMainPage(),
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
    }
    return null;
  };

  static final RouteFactory unknownRoute = (settings) {
    Dlog.showLog(settings.name,prefix: "unknownRoute");
    return null;
  };
}


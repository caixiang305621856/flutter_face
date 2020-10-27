import 'package:flutter/material.dart';
import 'package:flutter_face/ui/pages/clazz/selectclazz_page.dart';
import 'package:flutter_face/ui/pages/home_page.dart';
import 'package:flutter_face/ui/pages/login/login_page.dart';

class OPRouter {
  static final String initialRoute = OPLoginPage.routerName;

  static final Map<String, WidgetBuilder> routes = {
    OPHomePage.routerName : (ctx) => OPHomePage(),
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
    return null;
  };
}
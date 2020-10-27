import 'package:flutter/material.dart';

import 'package:flutter_face/common/global.dart';
import 'package:flutter_face/router/router.dart';
import 'package:flutter_face/common/event_bus.dart';
import 'package:flutter_face/ui/pages/login/login_page.dart';

import 'model/user.dart';

void main() {
  Global().init((){
    runApp(MyApp());
  });
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    eventBus.on<OPUser>().listen((event) {
      if(event.token.isEmpty){
        Navigator.of(context).pushNamedAndRemoveUntil(OPLoginPage.routerName, (Route<dynamic> route) => false);
      }
    });
    return MaterialApp(
      title: 'Flutter',
      theme: ThemeData(
        primarySwatch: Colors.orange,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      routes: OPRouter.routes,
      onGenerateRoute: OPRouter.generateRoute,
      onUnknownRoute: OPRouter.unknownRoute,
      initialRoute:OPRouter.initialRoute
    );
  }
}










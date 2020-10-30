import 'package:flutter/material.dart';
import 'package:flutter_face/router/router.dart';
import 'package:flutter_face/ui/pages/main/leading_btn.dart';
import 'package:flutter_face/ui/pages/setting/setting_page.dart';

import 'home_content.dart';

class OPHomePage extends StatelessWidget {
  static const String routerName = "/home";
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomPadding: false,
      appBar: AppBar(
        title: Text("首页"),
        leading: OpenLeading(),
        actions: [
          IconButton(
            icon: Icon(Icons.settings),
            onPressed: (){
              OPRouter.navigatorKey.currentState.pushNamed(OPSettingPage.routerName);
            })
        ],
      ),
      body: OPHomeContent(),
    );
  }
}




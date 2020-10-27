import 'package:flutter/material.dart';
import 'package:flutter_face/core/network/login_request.dart';

import 'login/login_page.dart';

class OPHomePage extends StatelessWidget {
  static const String routerName = "/home";
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("首页"),
        leading: GestureDetector(
          child: Icon(Icons.settings),
          onTap: (){

          },
        ),
      ),
      body: Center(child: Text("首页")),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:flutter_face/common/event_bus.dart';
import 'package:flutter_face/testData.dart';

import 'home_content.dart';

class OPHomePage extends StatelessWidget {
  static const String routerName = "/home";
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("首页"),
        leading: OpenLeading(),
      ),
      body: OPHomeContent(),
    );
  }
}

class OpenLeading extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      child:Container(
        padding: EdgeInsets.fromLTRB(14, 7, 0, 7),
        child: CircleAvatar(
            radius: 20,
            backgroundImage: NetworkImage(TestData.miniAvatar)
        ),
      ),
      onTap:(){
        eventBus.fire('openDrawer');
      },
    );
  }
}


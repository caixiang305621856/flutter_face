import 'package:flutter/material.dart';
import 'package:flutter_face/core/utils/log.dart';

import 'package:flutter_face/model/user.dart';

import 'home_drawer_page.dart';

class OPHomePage extends StatelessWidget {
  static const String routerName = "/home";
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: OPHomeDrawer(),
      appBar: AppBar(
        title: Text("首页"),
        leading: OpenLeading(),
      ),
      body: Center(child: Text("首页",style: Theme.of(context).textTheme.headline1.copyWith(
        fontWeight: FontWeight.bold
      ),)),
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
            backgroundImage: NetworkImage("https://opensxbtest.oss-cn-beijing.aliyuncs.com/testresource/rc/useravatar/1002602/images/E712EC99-B3B8-4452-BF91-D9C82272ACD1.jpg?x-oss-process=image/resize,m_fill,h_500,w_500"
            )
        ),
      ),
      onTap: (){
        Scaffold.of(context).openDrawer();
      },
    );
  }
}


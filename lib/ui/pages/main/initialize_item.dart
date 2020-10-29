import 'package:flutter/material.dart';
import 'package:flutter_face/ui/pages/home/home_page.dart';
import 'package:flutter_face/ui/pages/manager/manager.dart';
import 'package:flutter_face/ui/pages/message/msg.dart';
import 'package:flutter_face/ui/pages/resouce/resouce.dart';
import 'bottom_bar_item.dart';


List<OPBottomBarItem> items = [
  OPBottomBarItem("tabbar_home", "首页"),
  OPBottomBarItem("tabbar_task", "管理"),
  OPBottomBarItem("tabbar_community", "讨论"),
  OPBottomBarItem("tabbar_res", "资源"),
];

List<Widget> pages = [
  OPHomePage(),
  OPManagerPage(),
  OPMsgPage(),
  OPResoucePage()
];



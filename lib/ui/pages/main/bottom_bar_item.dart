import 'package:flutter/material.dart';

class OPBottomBarItem extends BottomNavigationBarItem {
  OPBottomBarItem(String iconName,String title):super(
    title:Text(title),
    icon:Image.asset('assets/images/tabbar/$iconName@2x.png',width: 23,gaplessPlayback: true,),
      activeIcon:Image.asset('assets/images/tabbar/${iconName}_sel@2x.png',width: 23,gaplessPlayback: true,)
  );
}
import 'package:flutter/material.dart';
import 'package:flutter_face/common/event_bus.dart';
import 'package:flutter_face/ui/pages/home/home_drawer_page.dart';
import 'package:flutter_face/ui/utils/theme.dart';

import 'initialize_item.dart';
class OPMainPage extends StatefulWidget {
  static const String routerName = "/main";
  @override
  _OPMainPageState createState() => _OPMainPageState();
}

class _OPMainPageState extends State<OPMainPage> {
  int _currentIndex = 0;
  BuildContext _context;
  @override
  void initState() {
    // TODO: implement initState
    eventBus.on().listen((event) {
      if (event == 'openDrawer'){
        Scaffold.of(_context).openDrawer();
      }
    });
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: OPHomeDrawer(),
      body: Builder(
        builder: (BuildContext context){
          _context = context;
          return IndexedStack(
            index: _currentIndex,
            children: pages,
          );
        }
      ),
      bottomNavigationBar: BottomNavigationBar(
        selectedFontSize: 14,
        unselectedFontSize: 14,
        unselectedItemColor:OPAppTheme.kNormalFontColor,
        selectedItemColor: OPAppTheme.kMainColor,
        currentIndex: _currentIndex,
        type: BottomNavigationBarType.fixed,
        items: items,
        onTap: (int index){
          setState(() {
            _currentIndex = index;
          });
        },
      ),
    );
  }
}

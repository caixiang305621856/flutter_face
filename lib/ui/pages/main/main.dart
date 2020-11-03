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

final GlobalKey<ScaffoldState> mainScaffoldKey = GlobalKey<ScaffoldState>();

class _OPMainPageState extends State<OPMainPage> with SingleTickerProviderStateMixin{
  int _currentIndex = 0;
  var _pageController = PageController(initialPage: 0);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: mainScaffoldKey,
      drawer: OPHomeDrawer(),
      body: PageView.builder(
        physics:NeverScrollableScrollPhysics(),
        itemBuilder: (BuildContext context, int index){
          return pages[index];
        },
        controller: _pageController,
        itemCount: pages.length,
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
          _pageController.jumpToPage(index);
        },
      ),
    );
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
  }
}

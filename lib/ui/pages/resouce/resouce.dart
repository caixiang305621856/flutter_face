import 'package:flutter/material.dart';
import 'package:flutter_face/ui/pages/main/leading_btn.dart';
import 'package:flutter_face/ui/utils/theme.dart';

class OPResoucePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 4,
      child: Scaffold(
        appBar: AppBar(
          title: Text("资源"),
          leading: OpenLeading(),
          actions: <Widget>[
            IconButton(
              icon: Icon(Icons.search),
              tooltip: 'Search',
              onPressed: () {

              },
            )
          ],
          bottom: TabBar(
            indicatorColor: OPAppTheme.kMainColor,
            indicatorSize: TabBarIndicatorSize.label,
            indicatorWeight: 3.0,
            tabs: <Widget>[
              Tab(icon: Icon(Icons.verified_user_sharp, color: OPAppTheme.kMainColor)),
              Tab(icon: Icon(Icons.vertical_align_bottom, color: OPAppTheme.kMainColor)),
              Tab(icon: Icon(Icons.view_week_sharp, color: OPAppTheme.kMainColor)),
              Tab(icon: Icon(Icons.vertical_align_top, color: OPAppTheme.kMainColor)),
            ],
          )
        ),
        body: TabBarView(
          children: <Widget>[
            Icon(Icons.verified_user_sharp, size: 128.0, color: OPAppTheme.kMainColor),
            Icon(Icons.vertical_align_bottom, size: 128.0, color: OPAppTheme.kMainColor),
            Icon(Icons.view_week_sharp, size: 128.0, color: OPAppTheme.kMainColor),
            Icon(Icons.vertical_align_top, size: 128.0, color: OPAppTheme.kMainColor),
          ],
        ),
      ),
    );
  }
}
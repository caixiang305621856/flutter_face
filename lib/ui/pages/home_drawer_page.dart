import 'package:flutter/material.dart';

import 'package:flutter_face/core/utils/extension/int_extension.dart';


class OPHomeDrawer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
        width: 250.px,
        child: Drawer(
          child: Column(
            children: <Widget>[
              buildHeaderView(context),
              buildListTile(context, Icon(Icons.restaurant), "进餐", () {
                Navigator.of(context).pop();
              }),
            ],
          ),
        )
    );
  }

  Widget buildHeaderView(BuildContext context) {
    return Container(
      width: double.infinity,
      height: 120.px,
      color: Colors.orange,
      margin: EdgeInsets.only(bottom: 20.px),
      alignment: Alignment(0, 0.5),
      child: Text("开始动手", style: Theme.of(context).textTheme.display4),
    );
  }

  Widget buildListTile(BuildContext context, Widget icon, String title, Function handler) {
    return ListTile(
      leading: icon,
      title: Text(title, style: Theme.of(context).textTheme.display2,),
      onTap: handler,
    );
  }
}

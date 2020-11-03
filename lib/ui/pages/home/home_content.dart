import 'package:flutter/material.dart';
import 'package:flutter_face/router/router.dart';
import 'package:flutter_face/ui/pages/demo/button_demo.dart';
import 'package:flutter_face/utils.dart';

class OPHomeContent extends StatefulWidget {
  @override
  _OPHomeContentState createState() => _OPHomeContentState();
}

class _OPHomeContentState extends State<OPHomeContent> with AutomaticKeepAliveClientMixin{
  @override
  Widget build(BuildContext context) {
    return ListView(
      children: [
        ListItem(title: "ButtonDemo", page: OPButtonDemo())
      ],
    );
  }

  @override
  // TODO: implement wantKeepAlive
  bool get wantKeepAlive => true;
}

class ListItem extends StatelessWidget {
  final String title;
  final Widget page;

  ListItem({
    this.title,
    this.page
  });

  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Text(title),
      onTap: (){
        OPRouter.navigatorKey.currentState.push(
          MaterialPageRoute(builder: (context){
            return page;
          })
        );
      },
    );
  }
}

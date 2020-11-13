import 'package:flutter/material.dart';
import 'package:flutter_face/ui/pages/main/leading_btn.dart';
import 'package:flutter_face/ui/pages/manager/photo_detail.dart';
import 'package:flutter_face/ui/pages/message/msg_list_item.dart';

class OPManagerPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("管理"),
        leading: OpenLeading(),
      ),
      body: OPMangerContentWidget(),
    );
  }
}

class OPMangerContentWidget extends StatefulWidget {
  const OPMangerContentWidget({
    Key key,
  }) : super(key: key);

  @override
  _OPMangerContentWidgetState createState() => _OPMangerContentWidgetState();
}

class _OPMangerContentWidgetState extends State<OPMangerContentWidget> with AutomaticKeepAliveClientMixin{
  @override
  Widget build(BuildContext context) {
    return GridView(
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        crossAxisSpacing: 8,
        childAspectRatio: 16/9,
        mainAxisSpacing: 8
      ),
      children: List.generate(100, (index){
        final url = "https://picsum.photos/400/600?random=$index}.webp";
        return ImageItemTapWidget(context: context, url: url);
      }),
    );
  }

  @override
  // TODO: implement wantKeepAlive
  bool get wantKeepAlive => true;
}
import 'package:flutter/material.dart';
import 'package:flutter_face/core/network/topic_request.dart';
import 'package:flutter_face/model/topic_model.dart';
import 'package:flutter_easyrefresh/easy_refresh.dart';
import 'package:flutter_face/ui/utils/theme.dart';

import 'msg_list_item.dart';

class OPMsgContent extends StatefulWidget {
  @override
  _OPMsgContentState createState() => _OPMsgContentState();
}

class _OPMsgContentState extends State<OPMsgContent> with AutomaticKeepAliveClientMixin{
  List<TopicModel> itmes = [];
  EasyRefreshController _controller = EasyRefreshController();

  @override
  void initState() {
    super.initState();
    Future.delayed(Duration(milliseconds: 500),(){
      _controller.callRefresh();
    });
  }

  @override
  Widget build(BuildContext context) {
    return EasyRefresh(
      controller: _controller,
      header: BezierCircleHeader(enableHapticFeedback:true, backgroundColor: OPAppTheme.kMainColor),
      footer: BezierBounceFooter(enableHapticFeedback:true, backgroundColor: OPAppTheme.kMainColor),
      onRefresh: () async {
        TopicRequest.requestItemList(0).then((res){
          itmes.clear();
          itmes.addAll(res);
          setState(() {
          });
        });
      },
      onLoad: () async {
        TopicRequest.requestItemList(1).then((res){
          itmes.addAll(res);
          setState(() {
          });
        });
      },

      child: ListView.builder(
        itemCount: itmes.length,
        itemBuilder: (ctx,index){
          return MSGItem(itmes[index]);
        }),
    );
  }

  @override
  // TODO: implement wantKeepAlive
  bool get wantKeepAlive => true;
}
import 'package:flutter/material.dart';
import 'package:flutter_face/core/network/topic_request.dart';
import 'package:flutter_face/model/topic_model.dart';
import 'package:flutter_easyrefresh/easy_refresh.dart';

import 'msg_list_item.dart';

class OPMsgContent extends StatefulWidget {
  @override
  _OPMsgContentState createState() => _OPMsgContentState();
}

class _OPMsgContentState extends State<OPMsgContent> {
  final List<TopicModel> itmes = [];

  @override
  void initState() {
    super.initState();
    TopicRequest.requestItemList(0).then((res){
      itmes.addAll(res);
      setState(() {
      });
    });
  }
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
        itemCount: itmes.length,
        itemBuilder: (ctx,index){
        return MSGItem(itmes[index]);
    });
  }
}
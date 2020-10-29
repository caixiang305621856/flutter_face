import 'package:flutter/material.dart';
import 'package:flutter_face/ui/pages/home/home_content.dart';
import 'package:flutter_face/ui/pages/message/msg_content.dart';

class OPMsgPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("讨论"),
        leading:Container(),
      ),
      body: Center(
        child: OPMsgContent(),
      ),
    );
  }
}
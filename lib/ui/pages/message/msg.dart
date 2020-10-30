import 'package:flutter/material.dart';
import 'package:flutter_face/ui/pages/main/leading_btn.dart';
import 'package:flutter_face/ui/pages/message/msg_content.dart';

class OPMsgPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("讨论"),
        leading: OpenLeading(),
      ),
      body: Center(
        child: OPMsgContent(),
      ),
    );
  }
}
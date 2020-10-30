import 'package:flutter/material.dart';
import 'package:flutter_face/testData.dart';

import 'main.dart';

class OpenLeading extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      child:Container(
        padding: EdgeInsets.fromLTRB(16, 8, 0, 8),
        child: CircleAvatar(
            radius: 18,
            backgroundImage: NetworkImage(TestData.miniAvatar)
        ),
      ),
      onTap:(){
        mainScaffoldKey.currentState.openDrawer();
      },
    );
  }
}
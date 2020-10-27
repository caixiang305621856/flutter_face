import 'package:flutter/material.dart';
import 'package:flutter_face/ui/widgets/loading_widget.dart';

class OPLoading{
  static show(BuildContext context){
    showDialog(
      context: context,
      builder: (context) {
        return LoadingDialog();
      });
  }

  static hide(BuildContext context){
    if(Navigator.canPop(context)){
      Navigator.pop(context);
    }
  }
}
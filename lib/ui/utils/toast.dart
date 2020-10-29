import 'package:flutter/material.dart';
import 'package:flutter_face/ui/utils/theme.dart';
import 'package:fluttertoast/fluttertoast.dart';

class OPToast{
  static showToast(String msg){
    Fluttertoast.showToast(
        msg: msg,
        toastLength: Toast.LENGTH_SHORT,
        gravity: ToastGravity.CENTER,
        backgroundColor: Colors.black87,
        textColor: OPAppTheme.kWhiteColor,
        fontSize: 14.0
    );
  }
}
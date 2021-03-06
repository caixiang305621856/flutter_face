import 'package:flutter/material.dart';

class LoadingDialog extends Dialog {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return new Material(
      type: MaterialType.transparency,
      child: new Center(
        child: new Container(
          decoration: new ShapeDecoration(
              color: Colors.white,
              shape: new RoundedRectangleBorder(
                  borderRadius: new BorderRadius.all(new Radius.circular(10)))),
          width: 100,
          height: 100,
          padding: EdgeInsets.all(9),
          child: new Column(children: <Widget>[
            CircularProgressIndicator(),
            new Text('正在加载...',style: TextStyle(fontSize: 15,color: Color(0xFF666666)),softWrap: false,)
          ],mainAxisAlignment: MainAxisAlignment.spaceEvenly,),
        ),
      ),
    );
  }
}


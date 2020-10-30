import 'package:flutter/material.dart';
import 'package:flutter_face/model/topic_model.dart';
import 'package:flutter_face/router/router.dart';
import 'package:flutter_face/ui/pages/video_page.dart';
import 'package:flutter_face/ui/utils/theme.dart';


class MSGItem extends StatefulWidget {
  final TopicModel model;
  MSGItem(this.model);
  @override
  _MSGItemState createState() => _MSGItemState();
}

class _MSGItemState extends State<MSGItem> {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(8),
      decoration: BoxDecoration(
        border: Border(
          bottom: BorderSide(
            width: 0.5,
            color: OPAppTheme.kSeparatorLineColor,
          )
        )
      ),
      child: Column(
        crossAxisAlignment:CrossAxisAlignment.start,
        children: <Widget>[
          _buildHead(),
          SizedBox(height: 5,),
          _buildContent(),
          SizedBox(height: 5,),
          _buildBottom()
        ],
      ),
    );
  }

  Widget _buildHead() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.start,
      children: <Widget>[
        ClipOval(
          child: Image.network(widget.model.user.miniAvatar,height: 38,width: 38,),
        ),
        SizedBox(width: 10,),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Text(widget.model.user.name,style: TextStyle(fontSize: 16,color: OPAppTheme.kMainFontColor),),
            SizedBox(height: 5,),
            Text(widget.model.content,style: TextStyle(fontSize: 14,color: OPAppTheme.kNormalFontColor),)
          ],
        )
      ],
    );
  }

  Widget _buildContent(){
    final w = widget.model.video.picTransWidth*0.57;
    final h = widget.model.video.picTransHeight*0.57;
    return Container(
      width: double.maxFinite,
      alignment: Alignment.centerLeft,
      margin: EdgeInsets.only(left: 48),
      child: GestureDetector(
        onTap: (){
          OPRouter.navigatorKey.currentState.pushNamed(VideoApp.routerName,arguments: widget.model.video.videoUrl);
        },
        child: Stack(
          alignment: Alignment.bottomRight,
          children: <Widget>[
            Image.network(
              widget.model.video.picUrl,
              width: w,
              height: h,
              fit:BoxFit.cover,
              frameBuilder: (BuildContext context, Widget child, int frame,
                  bool wasSynchronouslyLoaded){
                if (wasSynchronouslyLoaded) {
                  return child;
                }
                return AnimatedOpacity(
                  child: child,
                  opacity: frame == null ? 0 : 1,
                  duration: const Duration(seconds: 1),
                  curve: Curves.easeOut,
                );
              },
            ),
            Container(
                width: w,
                height: h,
                child: Icon(Icons.play_circle_outline,size: 40,color: Colors.orange,)
            ),
            Positioned(
              right: 5,
              bottom: 5,
              child: Container(
                child: Text(
                  widget.model.video.videoTimeString,
                  style: TextStyle(
                      fontSize: 12,
                      color: Colors.white
                  ),
                ),
                padding: EdgeInsets.symmetric(
                  horizontal: 8,
                  vertical: 1
                ),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.all(Radius.circular(8)),
                  color: Colors.black54
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildBottom(){
    return Row(
      children: <Widget>[
        Container(
            alignment: Alignment.center,
            margin: EdgeInsets.only(left: 48),
            child: Text(widget.model.video.createDate,style: (TextStyle(fontSize: 13,color: OPAppTheme.kOtherFontColor)),)
        ),
      ],
    );
  }
}



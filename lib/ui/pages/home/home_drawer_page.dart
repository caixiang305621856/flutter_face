import 'package:flutter/material.dart';

import 'package:flutter_face/core/utils/extension/int_extension.dart';
import 'package:flutter_face/router/router.dart';
import 'package:flutter_face/testData.dart';
import 'package:flutter_face/ui/pages/setting/setting_page.dart';
import 'package:flutter_face/ui/utils/theme.dart';


class OPHomeDrawer extends StatelessWidget {
  final List _datas = <String>["推送响铃","互动消息","我的帖子","注册新机构","二维码","推帮助中心","设置"];
  @override
  Widget build(BuildContext context) {
    return Container(
        width: 285.px,
        child: Drawer(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: <Widget>[
              _buildHeaderView(context),
              SizedBox(height: 10.px,),
              _buildListView(context),
            ],
          ),
        )
    );
  }

  MediaQuery _buildListView(BuildContext context) {
    return MediaQuery.removePadding(
      removeTop: true,
      context: context,
      child: Expanded(
        child: ListView.builder(
          shrinkWrap: true,
          itemCount: _datas.length,
          itemBuilder: (ctx,index){
          return GestureDetector(
            child: Container(
              height: 44.px,
              alignment: Alignment.center,
                child: Text(_datas[index],style: Theme.of(ctx).textTheme.headline2,)
            ),
            onTap: (){
              if(index == _datas.length - 1){
                OPRouter.navigatorKey.currentState.pushNamed(OPSettingPage.routerName);
              } else{
                Navigator.of(context).pop();
              }
            },
          );
        }),
      ),
    );
  }

  Widget _buildHeaderView(BuildContext context) {
    return Container(
      width: double.infinity,
      height: 210.px,
      // margin: EdgeInsets.only(bottom: 20.px),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          SizedBox(height: 30.px,),
          ClipOval(
            child: Image.network(
              TestData.miniAvatar,
              height: 75.px,
              width: 75.px,
              fit: BoxFit.cover,
            ),
          ),
          SizedBox(height: 10.px,),
          Text(
            "新班主任",
            style: Theme.of(context).textTheme.headline2.copyWith(
              fontWeight: FontWeight.bold,
              color: OPAppTheme.kMainFontColor,
              fontSize: OPAppTheme.kMainTitleSize
            ),
          )
        ],
      )
    );
  }
}
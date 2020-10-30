import 'package:flutter/material.dart';

import 'package:flutter_face/core/utils/extension/int_extension.dart';
import 'package:flutter_face/router/router.dart';
import 'package:flutter_face/testData.dart';
import 'package:flutter_face/ui/pages/setting/setting_page.dart';

import 'package:flutter_face/utils.dart';

class OPHomeDrawer extends StatelessWidget {
  final List _datas = <String>["推送响铃","互动消息","我的帖子","注册新机构","二维码","推帮助中心","设置"];
  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView.builder(
        itemCount: _datas.length + 1,
        itemBuilder: (ctx,index){
          if (index == 0){
            return UserAccountsDrawerHeader(
              accountName:
              Text('新班主任', style: Theme.of(context).textTheme.headline6,),
              accountEmail: Text('@shixunbao.com.cn'),
              currentAccountPicture: CircleAvatar(
                backgroundImage: NetworkImage(
                    TestData.miniAvatar),
              ),
              decoration: BoxDecoration(
                // color: OPAppTheme.kMainColor,
                gradient: LinearGradient(colors:[Colors.redAccent,Colors.orange[700]]), //背景渐变
                // image: DecorationImage(
                //   image: NetworkImage(
                //       'http://img5.mtime.cn/mg/2019/06/18/080407.34376988_120X90X8.jpg'),
                //   fit: BoxFit.cover,
                //   colorFilter: ColorFilter.mode(
                //       Colors.yellow[900].withOpacity(0.6), BlendMode.hardLight),
                // ),
              ),
            );
          }
          return ListTile(
            title: Text(
              _datas[index - 1],
              textAlign: TextAlign.center,
              style: Theme.of(ctx).textTheme.subtitle1,
            ),
            onTap: () => index == _datas.length?OPRouter.navigatorKey.currentState.pushNamed(OPSettingPage.routerName):Navigator.pop(context),
          );
        },
        padding: EdgeInsets.zero,
      ),
    );

    return Drawer(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: <Widget>[
          _buildHeaderView(context),
          SizedBox(height: 10.px,),
          _buildListView(context),
        ],
      ),
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
                child: Text(_datas[index],style: Theme.of(ctx).textTheme.subtitle1,)
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
            style: Theme.of(context).textTheme.headline6,
          )
        ],
      )
    );
  }
}

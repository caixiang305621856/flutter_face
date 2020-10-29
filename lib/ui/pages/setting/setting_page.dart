import 'package:flutter/material.dart';
import 'package:flutter_face/core/utils/log.dart';
import 'package:flutter_face/model/user.dart';
import 'package:flutter_face/ui/utils/theme.dart';

class OPSettingPage extends StatelessWidget {
  static const String routerName = "/setting";
  final List _datas = <String>["修改密码","关于我们","检查更新","隐私政策","清除缓存","退出登录"];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("设置"),
      ),
      body: ListView.builder(
          itemExtent: 50.0,
          itemBuilder: (ctx,index){
          if (index == _datas.length -1){
            return GestureDetector(
              child: Container(
                color: OPAppTheme.kWhiteColor,
                padding: EdgeInsets.symmetric(vertical: 13),
                alignment: Alignment.center,
                child: Text(_datas[index],style: Theme.of(ctx).textTheme.headline2,)
              ),
              onTap: (){
                UserHandler.getDBUser().token = "";
                UserHandler.removeDBUser();
              },
            );
          }
        return ListTile(
          title: Text(_datas[index],style: Theme.of(ctx).textTheme.headline2,),
          trailing: Icon(Icons.arrow_forward_ios,size: 18,),
        );
      },
        // separatorBuilder: (ctx,index){
        //   return Divider(
        //     color: OPAppTheme.kSeparatorLineColor,
        //   );
        // },
        itemCount: _datas.length
      ),
    );
  }
}

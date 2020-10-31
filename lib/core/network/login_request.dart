import 'dart:convert';

import 'package:flutter_face/core/http/http_error.dart';
import 'package:flutter_face/core/http/http_manager.dart';
import 'package:flutter_face/core/utils/log.dart';
import 'package:flutter_face/model/login_user.dart';
import 'package:flutter_face/ui/utils/toast.dart';

import 'http_request.dart';
import 'result_data.dart';

class OPLogin{
  static Future<List<OPLoginUserList>> login(String username,String passWord) async {
    // Future.delayed(Duration(seconds: 1), (){
    //   HttpManager().cancel("/V462/loginNew.json");
    // });

    //请求方式一(1)（推荐）
    List<OPLoginUserList> mapToItems(map){
      final subjects = map["userClazzList"];
      List<OPLoginUserList> items = [];
      for(var sub in subjects){
        items.add(OPLoginUserList.fromJson(sub));
      }
      return items;
    }

    return await HttpManager().postAsync(
        url: "/V462/loginNew.json",
        tag: "/V462/loginNew.json",
        params: {"username": username, "password": passWord},
        jsonParse: mapToItems,
        errorParse:(err){
        },
        show: true);

    //请求方式一(2)（推荐）
    // HttpManager()
    //     .postAsync(
    //     url: "/V462/loginNew.json",
    //     tag: "/V462/loginNew.json",
    //     params: {"username": username, "password": passWord},
    //     jsonParse: jsonParse,
    //     errorParse: (error){
    //     },
    //     show: true)
    //     .then((value){
    //       if(value != null){
    //         // 已解析好
    //         // 刷星UI
    //       }
    //     });

    //请求方式二
    // HttpManager().post(
    //     url: "V462/loginNew.json",
    //     tag: "/V462/loginNew.json",
    //     params: {"username": username, "password": passWord},
    //     successCallback:(res){
    //       Dlog.showLog(res, prefix: "successCallback");
    //       final subjects = res["userClazzList"];
    //       List<OPLoginUserList> itmes = [];
    //       for(var sub in subjects){
    //         itmes.add(OPLoginUserList.fromJson(sub));
    //       }
    //       return itmes;
    //     },
    //     errorCallback: (errorJson){
    //       OPToast.showToast(errorJson['message']);
    //     },
    //     completeCallback: (){
    //
    //     },
    //   );

    // final ResultData res = await HttpRequest.post("/V462/loginNew.json",
    //     params: {"username": username, "password": passWord});
    // if(res.requestSuccess){
    //   final subjects = res.data["data"]["userClazzList"];
    //   List<OPLoginUserList> itmes = [];
    //   for(var sub in subjects){
    //     itmes.add(OPLoginUserList.fromJson(sub));
    //   }
    //   return itmes;
    // } else{
    //   OPToast.showToast(res.message);
    //   return [];
    // }
  }
}
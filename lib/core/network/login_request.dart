import 'package:flutter_face/core/utils/log.dart';
import 'package:flutter_face/model/login_user.dart';
import 'package:flutter_face/ui/utils/toast.dart';

import 'http_request.dart';
import 'result_data.dart';

class OPLogin{
  static Future<List<OPLoginUserList>> login(String userNmae,String passWord) async {
    final ResultData res = await HttpRequest.post("/V462/loginNew.json",
        params: {"username": userNmae, "password": passWord});
    if(res.requestSuccess){
      final subjects = res.data["data"]["userClazzList"];
      List<OPLoginUserList> itmes = [];
      for(var sub in subjects){
        itmes.add(OPLoginUserList.fromJson(sub));
      }
      return itmes;
    } else{
      OPToast.showToast(res.message);
      return [];
    }
  }
}
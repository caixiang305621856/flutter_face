import 'http_request.dart';
import 'package:flutter_face/model/login_user.dart';

class OPLogin{
  static Future<List<OPLoginUserList>> login(String userNmae,String passWord) async {
    final res = await HttpRequest.post("/V462/loginNew.json",
        params: {"username": userNmae, "password": passWord});
    final subjects = res["userClazzList"];

    List<OPLoginUserList> itmes = [];
    for(var sub in subjects){
      itmes.add(OPLoginUserList.fromJson(sub));
    }
    return itmes;
  }
}
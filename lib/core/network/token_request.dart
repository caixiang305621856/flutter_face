import 'package:flutter_face/core/http/http_manager.dart';

class OPToken{
  static Future<String> getToken(String uid) async {
    return await HttpManager().postAsync(url: "/login/token.json",
        params: {"userId": uid},
        jsonParse: (json){
          return json;
        },
        errorParse: (err){
        },
        tag: "/login/token.json");
  }
}
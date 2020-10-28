import 'http_request.dart';
import 'result_data.dart';

class OPToken{
  static Future<String> getToken(String uid) async {
    final ResultData res = await HttpRequest.post("/login/token.json",
        params: {"userId": uid});
    if(res.requestSuccess){
      return res.data["data"];
    }
  }
}
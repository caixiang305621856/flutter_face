import 'http_request.dart';

class OPToken{
  static Future<String> getToken(String uid) async {
    final res = await HttpRequest.post("/login/token.json",
        params: {"userId": uid});
    return res;
  }
}
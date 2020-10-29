
import 'package:flutter_face/core/network/http_request.dart';
import 'package:flutter_face/core/network/result_data.dart';
import 'package:flutter_face/model/topic_model.dart';

class TopicRequest {
  static Future<List<TopicModel>> requestItemList(int page) async{
    final url = "/topic/page.json";
    final ResultData res = await HttpRequest.post(url,params: {"size":"20","page":page.toString()});
    if (res.requestSuccess){
      final subjects = res.data["data"]["content"];

      List<TopicModel> itmes = [];
      for (var sub in subjects){
        itmes.add(TopicModel.fromJson(sub));
      }
      return itmes;
    } else{
      return [];
    }

  }
}
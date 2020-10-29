import 'package:dio/dio.dart';
import 'package:flutter_face/core/network/result_data.dart';

import 'package:flutter_face/model/user.dart';
import 'package:flutter_face/core/utils/log.dart';

import 'request_config.dart';

class HttpRequest {
  static final BaseOptions baseOptions = BaseOptions(
      baseUrl: HttpConfig.baseUrl,
      sendTimeout: HttpConfig.sendTimeout,
      connectTimeout: HttpConfig.connectTimeout,
      receiveTimeout: HttpConfig.receiveTimeout,
      headers: HttpConfig.headersMap);

  static final Dio dio = Dio(baseOptions);

  static Future<T> request<T>(String url,
      {String method = "get",
      Map<String, dynamic> params,
      Interceptor inter}) async {
    final options = Options(method: method);

    //全局拦截器
    Interceptor dInter = InterceptorsWrapper(onRequest: (RequestOptions options) {
      //请求拦截
      return options;
    }, onResponse: (Response response) {
      RequestOptions option = response.request;
      try{
        if (response.statusCode == 200) {
            Dlog.showLog(response.request.queryParameters,stackTrace: StackTrace.current,prefix:response.request.path);
            Dlog.showLog(response.data,stackTrace: StackTrace.current,prefix:"返回内容");
            //响应拦截
            Map<String, dynamic> responseData = response.data;
            int status = responseData["status"];
            if(status == 200){
              return ResultData(responseData,true);
              return response.data["data"];
            } else if(status == 700){
              //清空部分用户数据
              UserHandler.getDBUser().token = "";
              UserHandler.removeDBUser();
              return ResultData(responseData,false,message: responseData["message"]);
            } else {
              return ResultData(responseData,false,message: responseData["message"]);
            }
          }
        } catch(e){
        Dlog.showLog(e.toString() + option.path,prefix: "catch");
      }
    }, onError: (DioError error) {
      Dlog.showLog(error.message,stackTrace: StackTrace.current,prefix:"DioError");
      //错误拦截
      return error;
    });
    List<Interceptor> inters = [dInter];

    //外界单独的拦截器
    if (inter != null) {
      inters.add(inter);
    }

    dio.interceptors.addAll(inters);
    try {
      ///追加请求体

      var requestParam = HttpConfig.setParamsFormDB();
      if (requestParam != null){
        params.addAll(requestParam);
      }
      Response response =
          await dio.request(url, queryParameters: params, options: options);
      return response.data;
    } on DioError catch (e) {
      return Future.error(e);
    }
  }

  static Future<T> get<T>(String url,{
    Map<String,dynamic> params,
    Interceptor inter}){
    return request(url,params: params,inter: inter);
  }

  static Future<T> post<T>(String url,{
    Map<String,dynamic> params,
    Interceptor inter}){
    return request(url,method: "post",params: params,inter: inter);
  }
}


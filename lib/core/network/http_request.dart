import 'package:dio/dio.dart';
import 'dart:convert';

import 'request_config.dart';
import 'package:flutter_face/core/utils/log.dart';

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
        if (response.statusCode == 200 || response.statusCode == 201) {
            Dlog.showLog(response.request.queryParameters,stackTrace: StackTrace.current,prefix:response.request.path);
            Dlog.showLog(response.data,stackTrace: StackTrace.current,prefix:"返回内容");
            //响应拦截
            Map<String, dynamic> responseData = response.data;
            int code = responseData["status"];
            if(code == 200){
              return response.data["data"];
            }
            if(responseData["status"] == 700){
              //跳登录页
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
      // params.addAll(HttpConfig.setParamsFormDB());
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


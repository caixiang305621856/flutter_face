import 'dart:async';

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_face/model/user.dart';

import 'http_config.dart';
import '../../utils.dart';
import 'http_error.dart';

///http 请求成功回调
/// 200成功
typedef HttpSuccessCallback<T> = void Function(dynamic data);
/// http 失败回调  包括业务回调 (205/204/700)
typedef HttpFailureCallback = void Function(dynamic data);
/// http 完成的回调
typedef HttpCompleteCallback = void Function();

/// 异步请求数据解析回调
typedef T JsonParse<T>(dynamic data);
/// 异步请求错误 解析回调(包含 http请求失败回调 和 自己业务请求失败回调)
typedef ErrorParse<T>(dynamic data);

class HttpManager {
  static bool showLog = true;

  Map<String, CancelToken> _cancelTokens =  Map<String, CancelToken>();

  Dio _client;

  Dio get client => _client;

  static final BaseOptions _baseOptions = BaseOptions(
      baseUrl: HttpConfig.baseUrl,
      sendTimeout: HttpConfig.sendTimeout,
      connectTimeout: HttpConfig.connectTimeout,
      receiveTimeout: HttpConfig.receiveTimeout,
      headers: HttpConfig.headersMap);

  static final HttpManager _instance = HttpManager._internal();

  factory HttpManager() => _instance;

  HttpManager._internal() {
    _client = Dio(_baseOptions);
  }

  ///post网络请求
  ///
  ///[url] 网络请求地址不包含域名
  ///[params] 请求参数
  ///[options] 请求配置
  ///[successCallback] 请求成功回调
  ///[businessErrorCallback]业务失败回调
  ///[errorCallback] http 请求失败回调
  ///[completeCallback] 完成回调
  ///[tag] 请求统一标识，用于取消网络请求
  void post({
    @required String url,
    Map<String,dynamic> params,
    Options options,
    @required HttpSuccessCallback successCallback,
    @required HttpFailureCallback errorCallback,
    @required HttpCompleteCallback completeCallback,
    @required String tag,
    bool show = false,
  }) async{
    _request(
      url: url,
      method: HttpConfig.post,
      params:params,
      options:options,
      successCallback:successCallback,
      errorCallback:errorCallback,
      completeCallback:completeCallback,
      tag: tag,
      show:show,
    );
  }

  ///get网络请求
  ///
  ///[url] 网络请求地址不包含域名
  ///[params] 请求参数
  ///[options] 请求配置
  ///[successCallback] 请求成功回调
  ///[businessErrorCallback]业务失败回调
  ///[errorCallback] http 请求失败回调
  ///[completeCallback] 完成回调
  ///[tag] 请求统一标识，用于取消网络请求
  void get({
    @required String url,
    Map<String,dynamic> params,
    Options options,
    @required HttpSuccessCallback successCallback,
    @required HttpFailureCallback errorCallback,
    @required HttpCompleteCallback completeCallback,
    @required String tag,
    bool show = false,
  }) async{
    _request(
        url: url,
        method: HttpConfig.get,
        params:params,
        options:options,
        successCallback:successCallback,
        errorCallback:errorCallback,
        completeCallback:completeCallback,
        tag: tag,
        show:show,
    );
  }

  ///POS异步网络请求
  ///
  ///[url] 网络请求地址不包含域名
  ///[params] url请求参数支持restful
  ///[options] 请求配置
  ///[jsonParse] json解析回调
  ///[errorParse] http 或 业务 请求失败回调
  ///[tag] 请求统一标识，用于取消网络请求
  ///[show] 自动弹出提示
  Future<T> postAsync<T>({
    @required String url,
    Map<String, dynamic> params,
    Options options,
    @required JsonParse<T> jsonParse,
    @required ErrorParse<T> errorParse,
    @required String tag,
    bool show = false,
  }) async {
    return _requestAaync(
      url: url,
      method: HttpConfig.post,
      params: params,
      options: options,
      jsonParse: jsonParse,
      errorParse: errorParse,
      tag: tag,
      show: show,
    );
  }

  ///GET异步网络请求
  ///
  ///[url] 网络请求地址不包含域名
  ///[params] url请求参数支持restful
  ///[options] 请求配置
  ///[jsonParse] json解析回调
  ///[errorParse] http 或 业务 请求失败回调
  ///[tag] 请求统一标识，用于取消网络请求
  ///[show] 自动弹出提示
  Future<T> getAsync<T>({
    @required String url,
    Map<String, dynamic> params,
    Options options,
    @required JsonParse<T> jsonParse,
    @required ErrorParse<T> errorParse,
    @required String tag,
    bool show = false,
  }) async {
    return _requestAaync(
      url: url,
      method: HttpConfig.get,
      options: options,
      params: params,
      jsonParse: jsonParse,
      errorParse: errorParse,
      tag: tag,
      show: show,
    );
  }

  ///取消请求
  void cancel(String tag) {
    if (_cancelTokens.containsKey(tag)) {
      if (!_cancelTokens[tag].isCancelled) {
        _cancelTokens[tag].cancel();
      }
      _cancelTokens.remove(tag);
    }
  }

  void _request({
    @required String url,
    String method,
    Map<String,dynamic> params,
    Options options,
    HttpSuccessCallback successCallback,
    HttpFailureCallback errorCallback,
    HttpCompleteCallback completeCallback,
    @required String tag,
    bool show,
  }) async{
    //检查是否设置缓存属性 检查是有缓存
    params = params ?? {};
    method = method ?? HttpConfig.get;
    options?.method = method;
    options = options ?? Options(
      method: method,
    );

    //配置全局的请求参数
    var requestParam = HttpConfig.setParamsFormDB();
    if (requestParam != null){
      params.addAll(requestParam);
    }

    url = (method == HttpConfig.get) ? _restfulUrl(url, params) : url;

    try {
      CancelToken cancelToken;
      if(tag != null){
        cancelToken = _cancelTokens[tag] == null ? CancelToken() : _cancelTokens[tag];
        _cancelTokens[tag] = cancelToken;
      }

      Response<Map<String, dynamic>> response =
      await _client.request(url, queryParameters: params, options: options,cancelToken: cancelToken);
      //请求成功
      if (response.statusCode == 200){
        if (showLog){
          _showResponse(response);
        }
        int status = response.data[HttpConfig.status];

        if(show && status != HttpConfig.succeedCode){
          OPToast.showToast(response.data[HttpConfig.message]);
        }
        if (status == HttpConfig.succeedCode) {
          if (successCallback != null) {
            successCallback(response.data[HttpConfig.data]);
          }
        } else if(status == HttpConfig.logOutCode) {
          UserHandler.getDBUser().token = "";
          UserHandler.removeDBUser();
          if (errorCallback != null) {
            errorCallback(response.data);
          }
        } else {
          if (errorCallback != null) {
            errorCallback(response.data);
          }
        }
      } else {
        //请求失败
        // response.statusCode != 200
        if (showLog) {
          Dlog.showLog("response.statusCode != 200");
        }
      }
      if (completeCallback != null) {
        completeCallback();
      }
    } on DioError catch (e,_){
      _dioErrorHandler(show, e, errorCallback);
      if (completeCallback != null) {
        completeCallback();
      }
    } catch(e,_) {
      _errorHandler(show, errorCallback);
      if (completeCallback != null) {
        completeCallback();
      }
    }
  }

  Future<T> _requestAaync<T>({
    @required String url,
    String method,
    Map<String, dynamic> params,
    Options options,
    JsonParse<T> jsonParse,
    @required ErrorParse<T> errorParse,
    @required String tag,
    bool show,
  }) async{
    params = params ?? {};
    method = method ?? HttpConfig.get;
    options?.method = method;
    options = options ?? Options(
      method: method,
    );

    //配置全局的请求参数
    var requestParam = HttpConfig.setParamsFormDB();
    if (requestParam != null){
      params.addAll(requestParam);
    }

    url = (method == HttpConfig.get) ? _restfulUrl(url, params) : url;

    try {
      CancelToken cancelToken;
      if(tag != null){
        cancelToken = _cancelTokens[tag] == null ? CancelToken() : _cancelTokens[tag];
        _cancelTokens[tag] = cancelToken;
      }

      Response<Map<String, dynamic>> response =
      await _client.request(url,
          queryParameters: params,
          options: options,
          cancelToken: cancelToken);
      //请求成功
      if (response.statusCode == 200){
        if (showLog) {
          _showResponse(response);
        }
        int status = response.data[HttpConfig.status];
        if(show && status != HttpConfig.succeedCode){
          OPToast.showToast(response.data[HttpConfig.message]);
        }
        if (status == HttpConfig.succeedCode) {
          if (jsonParse != null) {
            return jsonParse(response.data[HttpConfig.data]);
          } else{
            return response.data[HttpConfig.data];
          }
        } else if(status == HttpConfig.logOutCode) {
          UserHandler.getDBUser().token = "";
          UserHandler.removeDBUser();
          return errorParse(response.data);
        } else {
          return errorParse(response.data);
        }
      } else {
        //请求失败
        // response.statusCode != 200
        if (showLog) {
          Dlog.showLog("response.statusCode != 200");
        }
      }
    } on DioError catch(e, _){
      return _dioErrorHandler(show, e, errorParse);
    } catch(e, _){
      return _errorHandler(show,errorParse);
    }
  }

  _showResponse(response){
    Dlog.showLog(response.request.queryParameters,
        stackTrace: StackTrace.current,
        prefix:response.request.path);
    Dlog.showLog(response.data,stackTrace: StackTrace.current);
  }

  _showError(e,errorMap){
    Dlog.showLog(e.request.queryParameters,
        stackTrace: StackTrace.current,
        prefix:"dioError.Type = ${e.type} + ${e.request.path}");
    Dlog.showLog(errorMap);
  }

  T _dioErrorHandler<T>(show,e,errorParse){
    HttpError error = HttpError.dioError(e);
    Map errorMap = {
      HttpConfig.code:error.code,
      HttpConfig.dioMessage:e.message,
      HttpConfig.message:error.message
    };
    if (showLog){
      _showError(e, errorMap);
    }
    if (e.type == DioErrorType.CANCEL){
      return null;
    }
    if(show){
      OPToast.showToast(errorMap[HttpConfig.message]);
    }
    return errorParse(errorMap);
  }

  T _errorHandler<T>(show,errorParse){
    HttpError error = HttpError(HttpError.UNKNOWN, "网络异常，请稍后重试！");
    Map errorMap = {
      HttpConfig.code:error.code,
      HttpConfig.message:error.message
    };
    if(show){
      OPToast.showToast(errorMap[HttpConfig.message]);
    }
    return errorParse(errorMap);
  }

  String _restfulUrl(String url, Map<String, dynamic> params) {
    params.forEach((key, value) {
      if (url.indexOf(key) != -1) {
        url = url.replaceAll(':$key', value.toString());
      }
    });
    return url;
  }
}
import 'package:dio/dio.dart';

class HttpError {
  ///连接超时
  static const String CONNECT_TIMEOUT = "CONNECT_TIMEOUT";

  ///响应超时
  static const String RECEIVE_TIMEOUT = "RECEIVE_TIMEOUT";

  ///发送超时
  static const String SEND_TIMEOUT = "SEND_TIMEOUT";

  ///网络请求取消
  static const String CANCEL = "CANCEL";

  ///未知错误
  static const String UNKNOWN = "UNKNOWN";

  static const String DEFAULT = "DEFAULT";

  ///协议错误
  static const String RESPONSE = "RESPONSE";

  ///错误类型
  String errorType;
  ///错误code
  int code;
  /// 内部错误提示信息
  String message;

  HttpError(this.errorType,this.code,this.message);

  HttpError.dioError(DioError error) {
    message = error.message;
    switch (error.type) {
      case DioErrorType.CONNECT_TIMEOUT:
        errorType = CONNECT_TIMEOUT;
        code = -1;
        message = "网络连接超时，请检查网络设置";
        break;
      case DioErrorType.RECEIVE_TIMEOUT:
        errorType = RECEIVE_TIMEOUT;
        code = -1;
        message = "服务器异常，请稍后重试！";
        break;
      case DioErrorType.SEND_TIMEOUT:
        errorType = SEND_TIMEOUT;
        code = -1;
        message = "网络连接超时，请检查网络设置";
        break;
      case DioErrorType.CANCEL:
        errorType = CANCEL;
        code = -1;
        message = "请求已被取消，请重新请求";
        break;
      case DioErrorType.DEFAULT:
        errorType = DEFAULT;
        code = -1;
        message = "网络异常，请稍后重试！";
        break;
      case DioErrorType.RESPONSE:
        errorType = RESPONSE;
        try {
          int errCode = error.response.statusCode;
          code = errCode;
          switch (errCode) {
            case 400:
              {
                message = "请求语法错误";
              }
              break;
            case 401:
              {
                message = "没有权限";
              }
              break;
            case 403:
              {
                message = "服务器拒绝执行";
              }
              break;
            case 404:
              {
                message = "无法连接服务器";
              }
              break;
            case 405:
              {
                message = "请求方法被禁止";
              }
              break;
            case 500:
              {
                message = "服务器内部错误";
              }
              break;
            case 502:
              {
                message = "无效的请求";
              }
              break;
            case 503:
              {
                message = "服务器挂了";
              }
              break;
            case 505:
              {
                message = "不支持HTTP协议请求";
              }
              break;
            default: {
              message = "未知错误！";
            }
          }
        } on Exception catch(_) {
          code = -1;
          message = "未知错误！";
        }
        break;
    }
  }

  @override
  String toString() {
    return 'HttpError{code: $code, message: $message}';
  }
}
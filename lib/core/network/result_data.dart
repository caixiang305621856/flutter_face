
typedef ResultSucceedCallback = void Function(Map data);

typedef ResultFailCallback = void Function(String msg);

typedef ResultCompleteCallback = void Function();

class ResultData{
  final Map _data;
  final bool _requestSuccess;
  final String message;

  ResultData(
    this._data,
    this._requestSuccess, {
    this.message
    });

  Map get data => _data;

  bool get requestSuccess => _requestSuccess;
}


class TopicModel {
  String _content;
  int _orderList;
  String _createDate;
  int _istop;
  int _likeCount;
  int _identification;
  int _userId;
  int _collectCount;
  int _commentCount;
  int _clazzId;
  User _user;
  Video _video;

  TopicModel(
      {String content,
        int orderList,
        String createDate,
        int istop,
        int likeCount,
        int identification,
        int userId,
        int collectCount,
        int commentCount,
        int clazzId,
        User user,
        Video video}) {
    this._content = content;
    this._orderList = orderList;
    this._createDate = createDate;
    this._istop = istop;
    this._likeCount = likeCount;
    this._identification = identification;
    this._userId = userId;
    this._collectCount = collectCount;
    this._commentCount = commentCount;
    this._clazzId = clazzId;
    this._user = user;
    this._video = video;
  }

  String get content => _content;
  set content(String content) => _content = content;
  int get orderList => _orderList;
  set orderList(int orderList) => _orderList = orderList;
  String get createDate => _createDate;
  set createDate(String createDate) => _createDate = createDate;
  int get istop => _istop;
  set istop(int istop) => _istop = istop;
  int get likeCount => _likeCount;
  set likeCount(int likeCount) => _likeCount = likeCount;
  int get identification => _identification;
  set identification(int identification) => _identification = identification;
  int get userId => _userId;
  set userId(int userId) => _userId = userId;
  int get collectCount => _collectCount;
  set collectCount(int collectCount) => _collectCount = collectCount;
  int get commentCount => _commentCount;
  set commentCount(int commentCount) => _commentCount = commentCount;
  int get clazzId => _clazzId;
  set clazzId(int clazzId) => _clazzId = clazzId;
  User get user => _user;
  set user(User user) => _user = user;
  Video get video => _video;
  set video(Video video) => _video = video;

  TopicModel.fromJson(Map<String, dynamic> json) {
    _content = json['content'];
    _orderList = json['orderList'];
    _createDate = json['createDate'];
    _istop = json['istop'];
    _likeCount = json['likeCount'];
    _identification = json['identification'];
    _userId = json['userId'];
    _collectCount = json['collectCount'];
    _commentCount = json['commentCount'];
    _clazzId = json['clazzId'];
    _user = json['user'] != null ? new User.fromJson(json['user']) : null;
    _video = json['video'] != null ? new Video.fromJson(json['video']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['content'] = this._content;
    data['orderList'] = this._orderList;
    data['createDate'] = this._createDate;
    data['istop'] = this._istop;
    data['likeCount'] = this._likeCount;
    data['identification'] = this._identification;
    data['userId'] = this._userId;
    data['collectCount'] = this._collectCount;
    data['commentCount'] = this._commentCount;
    data['clazzId'] = this._clazzId;
    if (this._user != null) {
      data['user'] = this._user.toJson();
    }
    if (this._video != null) {
      data['video'] = this._video.toJson();
    }
    return data;
  }
}

class User {
  int _studentCount;
  int _clazzMangerCount;
  int _changeAvatorRewards;
  int _orderList;
  String _phone;
  String _sex;
  String _createDate;
  String _miniAvatar;
  int _clazzCount;
  int _appStatus;
  int _activityCount;
  int _identification;
  String _avatar;
  String _bindPhone;
  String _username;
  String _role;
  int _status;
  String _name;

  User(
      {int studentCount,
        int clazzMangerCount,
        int changeAvatorRewards,
        int orderList,
        String phone,
        String sex,
        String createDate,
        String miniAvatar,
        int clazzCount,
        int appStatus,
        int activityCount,
        int identification,
        String avatar,
        String bindPhone,
        String username,
        String role,
        int status,
        String name}) {
    this._studentCount = studentCount;
    this._clazzMangerCount = clazzMangerCount;
    this._changeAvatorRewards = changeAvatorRewards;
    this._orderList = orderList;
    this._phone = phone;
    this._sex = sex;
    this._createDate = createDate;
    this._miniAvatar = miniAvatar;
    this._clazzCount = clazzCount;
    this._appStatus = appStatus;
    this._activityCount = activityCount;
    this._identification = identification;
    this._avatar = avatar;
    this._bindPhone = bindPhone;
    this._username = username;
    this._role = role;
    this._status = status;
    this._name = name;
  }

  int get studentCount => _studentCount;
  set studentCount(int studentCount) => _studentCount = studentCount;
  int get clazzMangerCount => _clazzMangerCount;
  set clazzMangerCount(int clazzMangerCount) =>
      _clazzMangerCount = clazzMangerCount;
  int get changeAvatorRewards => _changeAvatorRewards;
  set changeAvatorRewards(int changeAvatorRewards) =>
      _changeAvatorRewards = changeAvatorRewards;
  int get orderList => _orderList;
  set orderList(int orderList) => _orderList = orderList;
  String get phone => _phone;
  set phone(String phone) => _phone = phone;
  String get sex => _sex;
  set sex(String sex) => _sex = sex;
  String get createDate => _createDate;
  set createDate(String createDate) => _createDate = createDate;
  String get miniAvatar => _miniAvatar;
  set miniAvatar(String miniAvatar) => _miniAvatar = miniAvatar;
  int get clazzCount => _clazzCount;
  set clazzCount(int clazzCount) => _clazzCount = clazzCount;
  int get appStatus => _appStatus;
  set appStatus(int appStatus) => _appStatus = appStatus;
  int get activityCount => _activityCount;
  set activityCount(int activityCount) => _activityCount = activityCount;
  int get identification => _identification;
  set identification(int identification) => _identification = identification;
  String get avatar => _avatar;
  set avatar(String avatar) => _avatar = avatar;
  String get bindPhone => _bindPhone;
  set bindPhone(String bindPhone) => _bindPhone = bindPhone;
  String get username => _username;
  set username(String username) => _username = username;
  String get role => _role;
  set role(String role) => _role = role;
  int get status => _status;
  set status(int status) => _status = status;
  String get name => _name;
  set name(String name) => _name = name;

  User.fromJson(Map<String, dynamic> json) {
    _studentCount = json['studentCount'];
    _clazzMangerCount = json['clazzMangerCount'];
    _changeAvatorRewards = json['changeAvatorRewards'];
    _orderList = json['orderList'];
    _phone = json['phone'];
    _sex = json['sex'];
    _createDate = json['createDate'];
    _miniAvatar = json['miniAvatar'];
    _clazzCount = json['clazzCount'];
    _appStatus = json['appStatus'];
    _activityCount = json['activityCount'];
    _identification = json['identification'];
    _avatar = json['avatar'];
    _bindPhone = json['bindPhone'];
    _username = json['username'];
    _role = json['role'];
    _status = json['status'];
    _name = json['name'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['studentCount'] = this._studentCount;
    data['clazzMangerCount'] = this._clazzMangerCount;
    data['changeAvatorRewards'] = this._changeAvatorRewards;
    data['orderList'] = this._orderList;
    data['phone'] = this._phone;
    data['sex'] = this._sex;
    data['createDate'] = this._createDate;
    data['miniAvatar'] = this._miniAvatar;
    data['clazzCount'] = this._clazzCount;
    data['appStatus'] = this._appStatus;
    data['activityCount'] = this._activityCount;
    data['identification'] = this._identification;
    data['avatar'] = this._avatar;
    data['bindPhone'] = this._bindPhone;
    data['username'] = this._username;
    data['role'] = this._role;
    data['status'] = this._status;
    data['name'] = this._name;
    return data;
  }
}

class Video {
  String _videoUrl;
  int _picHeight;
  int _picTransHeight;
  int _orderList;
  String _picUrl;
  String _createDate;
  int _identification;
  int _batchId;
  int _videoTime;
  String _picTransUrl;
  int _picTransWidth;
  int _picWidth;
  String _videoTimeString;

  Video(
      {String videoUrl,
        int picHeight,
        int picTransHeight,
        int orderList,
        String picUrl,
        String createDate,
        int identification,
        int batchId,
        int videoTime,
        String picTransUrl,
        int picTransWidth,
        int picWidth}) {
    this._videoUrl = videoUrl;
    this._picHeight = picHeight;
    this._picTransHeight = picTransHeight;
    this._orderList = orderList;
    this._picUrl = picUrl;
    this._createDate = createDate;
    this._identification = identification;
    this._batchId = batchId;
    this._videoTime = videoTime;
    this._picTransUrl = picTransUrl;
    this._picTransWidth = picTransWidth;
    this._picWidth = picWidth;
  }

  String get videoUrl => _videoUrl;
  set videoUrl(String videoUrl) => _videoUrl = videoUrl;
  int get picHeight => _picHeight;
  set picHeight(int picHeight) => _picHeight = picHeight;
  int get picTransHeight => _picTransHeight;
  set picTransHeight(int picTransHeight) => _picTransHeight = picTransHeight;
  int get orderList => _orderList;
  set orderList(int orderList) => _orderList = orderList;
  String get picUrl => _picUrl;
  set picUrl(String picUrl) => _picUrl = picUrl;
  String get createDate => _createDate;
  set createDate(String createDate) => _createDate = createDate;
  int get identification => _identification;
  set identification(int identification) => _identification = identification;
  int get batchId => _batchId;
  set batchId(int batchId) => _batchId = batchId;
  int get videoTime => _videoTime;
  set videoTime(int videoTime) => _videoTime = videoTime;
  String get picTransUrl => _picTransUrl;
  set picTransUrl(String picTransUrl) => _picTransUrl = picTransUrl;
  int get picTransWidth => _picTransWidth;
  set picTransWidth(int picTransWidth) => _picTransWidth = picTransWidth;
  int get picWidth => _picWidth;
  set picWidth(int picWidth) => _picWidth = picWidth;

  //loc
  String get videoTimeString => _videoTimeString;

  Video.fromJson(Map<String, dynamic> json) {
    _videoUrl = json['videoUrl'];
    _picHeight = json['picHeight'];
    _picTransHeight = json['picTransHeight'];
    _orderList = json['orderList'];
    _picUrl = json['picUrl'];
    _createDate = json['createDate'];
    _identification = json['identification'];
    _batchId = json['batchId'];
    _videoTime = json['videoTime'];
    _picTransUrl = json['picTransUrl'];
    _picTransWidth = json['picTransWidth'];
    _picWidth = json['picWidth'];

    //loc
    if(_videoTime < 60){
      _videoTimeString = "00:" + (_videoTime >= 10 ? _videoTime.toString():"0"+_videoTime.toString());
    } else if(_videoTime < 3600){
      int m = _videoTime ~/ 60;
      int s = _videoTime % 60;
      _videoTimeString = (m >= 10 ? m.toString():"0" + m.toString()) + ":" + (s >= 10 ? s.toString():"0" + s.toString());
    } else{
      int h = _videoTime ~/ 3600;
      int m = (_videoTime % 3600) ~/ 60;
      int s = _videoTime % 60;
      _videoTimeString = (h >= 10 ? h.toString():"0" + h.toString()) + ":" + (m >= 10 ? m.toString():"0" + m.toString()) + ":" + (s >= 10 ? s.toString():"0" + s.toString());
    }

  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['videoUrl'] = this._videoUrl;
    data['picHeight'] = this._picHeight;
    data['picTransHeight'] = this._picTransHeight;
    data['orderList'] = this._orderList;
    data['picUrl'] = this._picUrl;
    data['createDate'] = this._createDate;
    data['identification'] = this._identification;
    data['batchId'] = this._batchId;
    data['videoTime'] = this._videoTime;
    data['picTransUrl'] = this._picTransUrl;
    data['picTransWidth'] = this._picTransWidth;
    data['picWidth'] = this._picWidth;
    return data;
  }
}


class TopicModel {
  String createDate;
  int orderList;
  int clazzId;
  int userId;
  String content;
  int likeCount;
  int collectCount;
  int commentCount;
  User user;
  List<Pictures> pictures;
  Video video;
  int istop;
  int identification;

  TopicModel(
      {this.createDate,
        this.orderList,
        this.clazzId,
        this.userId,
        this.content,
        this.likeCount,
        this.collectCount,
        this.commentCount,
        this.user,
        this.pictures,
        this.video,
        this.istop,
        this.identification});

  TopicModel.fromJson(Map<String, dynamic> json) {
    createDate = json['createDate'];
    orderList = json['orderList'];
    clazzId = json['clazzId'];
    userId = json['userId'];
    content = json['content'];
    likeCount = json['likeCount'];
    collectCount = json['collectCount'];
    commentCount = json['commentCount'];
    user = json['user'] != null ? new User.fromJson(json['user']) : null;
    if (json['pictures'] != null) {
      pictures = new List<Pictures>();
      json['pictures'].forEach((v) {
        pictures.add(new Pictures.fromJson(v));
      });
    }
    video = json['video'] != null ? new Video.fromJson(json['video']) : null;
    istop = json['istop'];
    identification = json['identification'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['createDate'] = this.createDate;
    data['orderList'] = this.orderList;
    data['clazzId'] = this.clazzId;
    data['userId'] = this.userId;
    data['content'] = this.content;
    data['likeCount'] = this.likeCount;
    data['collectCount'] = this.collectCount;
    data['commentCount'] = this.commentCount;
    if (this.user != null) {
      data['user'] = this.user.toJson();
    }
    if (this.pictures != null) {
      data['pictures'] = this.pictures.map((v) => v.toJson()).toList();
    }
    if (this.video != null) {
      data['video'] = this.video.toJson();
    }
    data['istop'] = this.istop;
    data['identification'] = this.identification;
    return data;
  }
}

class User {
  String createDate;
  int orderList;
  String username;
  String role;
  String phone;
  String bindPhone;
  String name;
  String sex;
  String avatar;
  String miniAvatar;
  int status;
  int appStatus;
  int clazzCount;
  int studentCount;
  int activityCount;
  int clazzMangerCount;
  int identification;

  User(
      {this.createDate,
        this.orderList,
        this.username,
        this.role,
        this.phone,
        this.bindPhone,
        this.name,
        this.sex,
        this.avatar,
        this.miniAvatar,
        this.status,
        this.appStatus,
        this.clazzCount,
        this.studentCount,
        this.activityCount,
        this.clazzMangerCount,
        this.identification});

  User.fromJson(Map<String, dynamic> json) {
    createDate = json['createDate'];
    orderList = json['orderList'];
    username = json['username'];
    role = json['role'];
    phone = json['phone'];
    bindPhone = json['bindPhone'];
    name = json['name'];
    sex = json['sex'];
    avatar = json['avatar'];
    miniAvatar = json['miniAvatar'];
    status = json['status'];
    appStatus = json['appStatus'];
    clazzCount = json['clazzCount'];
    studentCount = json['studentCount'];
    activityCount = json['activityCount'];
    clazzMangerCount = json['clazzMangerCount'];
    identification = json['identification'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['createDate'] = this.createDate;
    data['orderList'] = this.orderList;
    data['username'] = this.username;
    data['role'] = this.role;
    data['phone'] = this.phone;
    data['bindPhone'] = this.bindPhone;
    data['name'] = this.name;
    data['sex'] = this.sex;
    data['avatar'] = this.avatar;
    data['miniAvatar'] = this.miniAvatar;
    data['status'] = this.status;
    data['appStatus'] = this.appStatus;
    data['clazzCount'] = this.clazzCount;
    data['studentCount'] = this.studentCount;
    data['activityCount'] = this.activityCount;
    data['clazzMangerCount'] = this.clazzMangerCount;
    data['identification'] = this.identification;
    return data;
  }
}

class Pictures {
  String createDate;
  int orderList;
  int batchId;
  String url;
  int width;
  int height;
  String transUrl;
  int transWidth;
  int transHeight;
  int identification;

  Pictures(
      {this.createDate,
        this.orderList,
        this.batchId,
        this.url,
        this.width,
        this.height,
        this.transUrl,
        this.transWidth,
        this.transHeight,
        this.identification});

  Pictures.fromJson(Map<String, dynamic> json) {
    createDate = json['createDate'];
    orderList = json['orderList'];
    batchId = json['batchId'];
    url = json['url'];
    width = json['width'];
    height = json['height'];
    transUrl = json['transUrl'];
    transWidth = json['transWidth'];
    transHeight = json['transHeight'];
    identification = json['identification'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['createDate'] = this.createDate;
    data['orderList'] = this.orderList;
    data['batchId'] = this.batchId;
    data['url'] = this.url;
    data['width'] = this.width;
    data['height'] = this.height;
    data['transUrl'] = this.transUrl;
    data['transWidth'] = this.transWidth;
    data['transHeight'] = this.transHeight;
    data['identification'] = this.identification;
    return data;
  }
}

class Video {
  String createDate;
  int orderList;
  int batchId;
  String videoUrl;
  int videoTime;
  String picUrl;
  int picWidth;
  int picHeight;
  String picTransUrl;
  int picTransWidth;
  int picTransHeight;
  int identification;
  ///loc
  String videoTimeString;

  Video(
      {this.createDate,
        this.orderList,
        this.batchId,
        this.videoUrl,
        this.videoTime,
        this.picUrl,
        this.picWidth,
        this.picHeight,
        this.picTransUrl,
        this.picTransWidth,
        this.picTransHeight,
        this.identification});

  Video.fromJson(Map<String, dynamic> json) {
    createDate = json['createDate'];
    orderList = json['orderList'];
    batchId = json['batchId'];
    videoUrl = json['videoUrl'];
    videoTime = json['videoTime'];
    picUrl = json['picUrl'];
    picWidth = json['picWidth'];
    picHeight = json['picHeight'];
    picTransUrl = json['picTransUrl'];
    picTransWidth = json['picTransWidth'];
    picTransHeight = json['picTransHeight'];
    identification = json['identification'];
    ///loc
    if(videoTime < 60){
      videoTimeString = "00:" + (videoTime >= 10 ? videoTime.toString():"0"+videoTime.toString());
    } else if(videoTime < 3600){
      int m = videoTime ~/ 60;
      int s = videoTime % 60;
      videoTimeString = (m >= 10 ? m.toString():"0" + m.toString()) + ":" + (s >= 10 ? s.toString():"0" + s.toString());
    } else{
      int h = videoTime ~/ 3600;
      int m = (videoTime % 3600) ~/ 60;
      int s = videoTime % 60;
      videoTimeString = (h >= 10 ? h.toString():"0" + h.toString()) + ":" + (m >= 10 ? m.toString():"0" + m.toString()) + ":" + (s >= 10 ? s.toString():"0" + s.toString());
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['createDate'] = this.createDate;
    data['orderList'] = this.orderList;
    data['batchId'] = this.batchId;
    data['videoUrl'] = this.videoUrl;
    data['videoTime'] = this.videoTime;
    data['picUrl'] = this.picUrl;
    data['picWidth'] = this.picWidth;
    data['picHeight'] = this.picHeight;
    data['picTransUrl'] = this.picTransUrl;
    data['picTransWidth'] = this.picTransWidth;
    data['picTransHeight'] = this.picTransHeight;
    data['identification'] = this.identification;
    return data;
  }
}

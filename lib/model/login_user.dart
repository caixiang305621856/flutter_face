
class OPLoginUserList {
  int identification;
  String username;
  String role;
  String phone;
  String name;
  String sex;
  int organizationId;
  String avatar;
  String miniAvatar;
  int canSpeak;
  List<Clazzs> clazzs;

  OPLoginUserList(
      {this.identification,
        this.username,
        this.role,
        this.phone,
        this.name,
        this.sex,
        this.organizationId,
        this.avatar,
        this.miniAvatar,
        this.canSpeak,
        this.clazzs});

  OPLoginUserList.fromJson(Map<String, dynamic> json) {
    identification = json['identification'];
    username = json['username'];
    role = json['role'];
    phone = json['phone'];
    name = json['name'];
    sex = json['sex'];
    organizationId = json['organizationId'];
    avatar = json['avatar'];
    miniAvatar = json['miniAvatar'];
    canSpeak = json['canSpeak'];
    if (json['clazzs'] != null) {
      clazzs =  List<Clazzs>();
      json['clazzs'].forEach((v) {
        clazzs.add(Clazzs.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['identification'] = this.identification;
    data['username'] = this.username;
    data['role'] = this.role;
    data['phone'] = this.phone;
    data['name'] = this.name;
    data['sex'] = this.sex;
    data['organizationId'] = this.organizationId;
    data['avatar'] = this.avatar;
    data['miniAvatar'] = this.miniAvatar;
    data['canSpeak'] = this.canSpeak;
    if (this.clazzs != null) {
      data['clazzs'] = this.clazzs.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Clazzs {
  int identification;
  int organizationId;
  String logo;
  String name;
  String description;
  int memberListVersion;
  int projectId;
  String projectName;
  String clazzGroupImid;
  String createDate;
  String trainingBeginDate;
  String trainingEndDate;
  int studentCount;
  String uid;
  Clazzs(
      {this.identification,
        this.organizationId,
        this.logo,
        this.name,
        this.description,
        this.memberListVersion,
        this.projectId,
        this.projectName,
        this.clazzGroupImid,
        this.createDate,
        this.trainingBeginDate,
        this.trainingEndDate,
        this.studentCount});

  Clazzs.fromJson(Map<String, dynamic> json) {
    identification = json['identification'];
    organizationId = json['organizationId'];
    logo = json['logo'];
    name = json['name'];
    description = json['description'];
    memberListVersion = json['memberListVersion'];
    projectId = json['projectId'];
    projectName = json['projectName'];
    clazzGroupImid = json['clazzGroupImid'];
    createDate = json['createDate'];
    trainingBeginDate = json['trainingBeginDate'];
    trainingEndDate = json['trainingEndDate'];
    studentCount = json['studentCount'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['identification'] = this.identification;
    data['organizationId'] = this.organizationId;
    data['logo'] = this.logo;
    data['name'] = this.name;
    data['description'] = this.description;
    data['memberListVersion'] = this.memberListVersion;
    data['projectId'] = this.projectId;
    data['projectName'] = this.projectName;
    data['clazzGroupImid'] = this.clazzGroupImid;
    data['createDate'] = this.createDate;
    data['trainingBeginDate'] = this.trainingBeginDate;
    data['trainingEndDate'] = this.trainingEndDate;
    data['studentCount'] = this.studentCount;
    return data;
  }
}


class BugModel {
  String? title;
  String? des;
  String? userName;
  String? createdDate;
  String? userEmail;

  BugModel({this.title, this.des, this.userName, this.createdDate, this.userEmail});

  BugModel.fromJson(Map<String, dynamic> json) {
    title = json["title"];
    des = json["des"];
    userName = json["userName"];
    createdDate = json["createdDate"];
    userEmail = json["userEmail"];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> _data = <String, dynamic>{};
    _data["title"] = title;
    _data["des"] = des;
    _data["userName"] = userName;
    _data["createdDate"] = createdDate;
    _data["userEmail"] = userEmail;
    return _data;
  }
}
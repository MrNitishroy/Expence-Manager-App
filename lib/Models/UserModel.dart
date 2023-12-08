
class UserModel {
  String? id;
  String? name;
  String? time;
  String? email;
  String? password;
  String? number;
  String? profile;
  String? dob;

  UserModel({this.id, this.name, this.time, this.email, this.password, this.number, this.profile, this.dob});

  UserModel.fromJson(Map<String, dynamic> json) {
    id = json["id"];
    name = json["name"];
    time = json["time"];
    email = json["email"];
    password = json["password"];
    number = json["number"];
    profile = json["profile"];
    dob = json["dob"];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> _data = <String, dynamic>{};
    _data["id"] = id;
    _data["name"] = name;
    _data["time"] = time;
    _data["email"] = email;
    _data["password"] = password;
    _data["number"] = number;
    _data["profile"] = profile;
    _data["dob"] = dob;
    return _data;
  }
}
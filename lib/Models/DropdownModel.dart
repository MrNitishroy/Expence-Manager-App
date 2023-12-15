
class DropDownModel {
  String? id;
  String? name;
  String? value;
  String? icon;

  DropDownModel({this.name, this.value,this.icon, this.id});

  DropDownModel.fromJson(Map<String, dynamic> json) {
    name = json["name"];
    icon = json["icon"];
    id = json["id"];
    value = json["value"];
  }



  Map<String, dynamic> toJson() {
    final Map<String, dynamic> _data = <String, dynamic>{};
    _data["name"] = name;
    _data["value"] = value;
    _data["id"] = id;
    _data["icon"] = icon;
    return _data;
  }
}

